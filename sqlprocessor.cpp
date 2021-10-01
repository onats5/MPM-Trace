#include "sqlprocessor.h"
#include <QSqlQuery>
#include <QDebug>
#include <QFile>
#include <QSqlError>
#include <QDomDocument>
#include <QHostInfo>
#include <QNetworkInterface>

const QString sqlProcessor::operator_scanned="Operator scanned: ";
const QString sqlProcessor::localHostName = QHostInfo::localHostName();

sqlProcessor::sqlProcessor(QObject *parent):QObject(parent)
{
    qDebug()<<Q_FUNC_INFO<<" address "<<this;
}
sqlProcessor::~sqlProcessor()
{
    database.close();
}
void sqlProcessor::initializeObject()
{
    loadSetting();
    makeDatabaseConnection();
}

void sqlProcessor::makeDatabaseConnection()
{
    /*database = QSqlDatabase::addDatabase("QMYSQL");
    database.setHostName("127.0.0.1");
    database.setUserName("SH");
    database.setPassword("CannondaleF29");
    database.setDatabaseName("complex");
    if(!database.open()){
        qDebug()<<"SQL error";
    }*/

    database = QSqlDatabase::addDatabase("QODBC");
    database.setHostName("192.168.20.26\\SQLEXPRESS");
    //database.setHostName(hostName);
    database.setUserName("benchUser");
    //database.setUserName(userName);
    database.setPassword("1111");
    //database.setPassword(pwd);
    database.setDatabaseName("LeyardPro01");
    //database.setDatabaseName(databaseName);
    if(!database.open()){
        qDebug()<<"SQL error";
        emit emitError(database.lastError().text());
    }
}
void sqlProcessor::checkPartInDatabase(const QString &text, const QString &prgName)
{
    int ans(0);
    int actual(0);
    int presetStop(0);
    int total(0);
    int totalStop(0);
    QString name;
    PartInfo pInfo;
    pInfo.partNumber = text;

    QSqlQuery query;
    CodeSet cs = getCodeSet(text);
    if(!cs.name.isEmpty()){
        pInfo = getPartInfo(cs,text);
    }
    if(!query.exec(QString("select *from tbl_for_production_parts where part_id='%1'").arg(pInfo.partNumber))){
        emit answerFromDatabase(-1,0,0,0,0,pInfo.partNumber);
        QString err = "Error with query:"+query.lastQuery()+",ERROR:"+query.lastError().text();
        emit emitError(err);
        return;
    }else{
        if(query.first()){
            if(query.value("isEnabled").toInt()){
                name = query.value("part_name").toString();
                ans = query.value("part_type").toInt();
                total = query.value("total_cycles").toInt();
                actual = query.value("actual_cycles").toInt();
                totalStop = query.value("max_cycles").toInt();
                presetStop = query.value("preset_cycles_stop").toInt();
            }else{
                ans=9;
            }

        }else{
            ans=0;
        }

    }
    switch (ans) {
    case 1:{
        if(name!=prgset.stencilName){
            ans=99;
        }
    }
        break;
    case 2:{
        if(name!=prgset.squeegeeFrontName){
            ans=98;
        }
    }
        break;
    case 3:{
        if(name!=prgset.squeegeeRearName){
            ans=97;
        }
    }
        break;
    case 4:{
        if(name!=prgset.supportName){
                ans=96;
        }
    }
        break;
    case 5:{
        if(name!=prgset.pasteName){
            ans=95;
        }
    }
        break;
    default:
        break;

    }
    emit answerFromDatabase(ans,actual,presetStop,total,totalStop,pInfo.partNumber);

    if(!query.exec(QString("insert into tbl_operator_trace (eventTime,machineId,machineName,machineIP,operatorName,eventCode,eventText) values(DATEDIFF(SECOND,'1970-01-01', GETUTCDATE()),0,'%1','%2','operator','%3','%4')")
               .arg(localHostName)
               .arg("0")
               .arg(ans)
               .arg(operator_scanned+text))){
        QString err = "Error with query:"+query.lastQuery()+",ERROR:"+query.lastError().text();
        emit emitError(err);
    }

}

void sqlProcessor::checkProgramSetInDatabase(const QString &text)
{
    QSqlQuery query;
    if(!query.exec(QString("select *from tbl_mpm_program_set where program_name='%1'").arg(text))){
        return;
    }else {
        if(query.first()){
            prgset.prgname=text;
            prgset.stencilName=query.value("stencil_name").toString();
            prgset.squeegeeFrontName=query.value("squeegee_front_name").toString();
            prgset.squeegeeRearName=query.value("squeegee_rear_name").toString();
            prgset.supportName=query.value("support_name").toString();
            prgset.pasteName=query.value("solder_paste_name").toString();
            emit answerFromDatabaseProgramSet(query.value("stencil_name").toString(),query.value("squeegee_front_name").toString(),query.value("squeegee_rear_name").toString(),query.value("support_name").toString(),query.value("solder_paste_name").toString());
        }else{
            prgset.prgname.clear();
            prgset.pasteName.clear();
            prgset.stencilName.clear();
            prgset.supportName.clear();
            prgset.squeegeeRearName.clear();
            prgset.squeegeeFrontName.clear();
            emit answerFromDatabaseProgramSet("Not exists","Not exists","Not exists","Not exists","Not exists");
        }
    }
}

void sqlProcessor::loadSetting()
{
    QFile file("databaseSetting.txt");
    if(!file.open(QIODevice::ReadOnly)){
        emit emitError("Could not load setting");
        return;
    }
    while (!file.atEnd()) {
        QString line = file.readLine();
        if(line.startsWith("[Host]")){
            hostName = line.section('=',1,1);
            hostName = hostName.trimmed();
        }else if(line.startsWith("[User]")){
            userName = line.section('=',1,1);
            userName = userName.trimmed();
        }else if(line.startsWith("[Pwd]")){
            pwd = pwd.trimmed();
            pwd = line.section('=',1,1);
        }else if(line.startsWith("[Database]")){
            databaseName = databaseName.trimmed();
            databaseName = line.section('=',1,1);
        }else {
            break;
        }
    }
    file.close();

    file.setFileName("codeSettings.xml");
    if(!file.open(QIODevice::ReadOnly)){
        emit emitError("Could not load code setting");
        return;
    }
    QDomDocument doc;
    if(!doc.setContent(&file)){
        file.close();
        emit emitError("Could not process xml content");
        return;
    }
    QDomNodeList nodeList = doc.elementsByTagName("code");
    QDomNode node;
    QDomElement element;
    for(int i=0;i<nodeList.size();i++){
        node = nodeList.at(i);
        element = node.toElement();
        CodeSet c;
        c.name = element.attribute("name");
        c.lenght = element.firstChildElement("lenght").text().toInt();
        c.startWith = element.firstChildElement("startWith").text();
        c.separator = element.firstChildElement("separator").text();
        c.pnPos = element.firstChildElement("pn").attribute("position").toInt()-1;
        c.snPos = element.firstChildElement("sn").attribute("position").toInt()-1;
        c.lotPos = element.firstChildElement("lot").attribute("position").toInt()-1;
        c.mfgPos = element.firstChildElement("mfg").attribute("position").toInt()-1;
        c.expPos = element.firstChildElement("exp").attribute("position").toInt()-1;
        c.quantityPos = element.firstChildElement("quantity").attribute("position").toInt()-1;
        listOfCodesSet.push_back(c);
    }
    file.close();
    //qDebug()<<hostName<<","<<userName<<","<<pwd<<","<<databaseName;

    /*const QHostAddress &localhost = QHostAddress(QHostAddress::LocalHost);
    for (const QHostAddress &address: QNetworkInterface::allAddresses()) {
        if (address.protocol() == QAbstractSocket::IPv4Protocol && address != localhost )
             qDebug() << address.toString();
             ipAddress = address.toString();
    }*/
}

void sqlProcessor::checkPass(const QString &text)
{
    QSqlQuery query;
    if(!query.exec(QString("select password from tbl_clients where name='MPM Trace'"))){
        qDebug()<<"Error whit query "<<query.lastError().text();
        return;
    }
    bool ans = false;
    if(query.first()){
        if(query.value("password").toString()==text){
            ans = true;

        }
    }

    emit answerFromDatabaseUserPass(ans);
}

const CodeSet sqlProcessor::getCodeSet(const QString &scannedCode)
{
    //int siz = scannedCode.size();
    for(QList<CodeSet>::iterator it=listOfCodesSet.begin();it!=listOfCodesSet.end();it++){
        if(scannedCode.startsWith(it->startWith)){
            qDebug()<<"scanned code start with: "<<it->startWith;
            return *it;
        }
    }
    return CodeSet();
}

const PartInfo sqlProcessor::getPartInfo(const CodeSet &cs, const QString &scannedCode)
{
    PartInfo pInfo;
    QStringList list = scannedCode.split(cs.separator);
    int m = qMax(cs.pnPos,cs.snPos);
    m = qMax(m,cs.lotPos);
    m = qMax(m,cs.mfgPos);
    m = qMax(m,cs.expPos);
    m = qMax(m,cs.quantityPos);
    if(list.size()<m){
        qDebug()<<"size is less than required";
        return pInfo;
    }
    if(cs.pnPos>-1)
        pInfo.partNumber = list[cs.pnPos];
    if(cs.snPos>-1)
        pInfo.serialNumber = list[cs.snPos];
    if(cs.lotPos>-1)
        pInfo.lot = list[cs.lotPos];
    if(cs.mfgPos>-1)
        pInfo.mfg = list[cs.mfgPos];
    if(cs.expPos>-1)
        pInfo.exp = list[cs.expPos];
    if(cs.quantityPos>-1)
        pInfo.quantity = list[cs.quantityPos];

    qDebug()<<"part info: "<<pInfo.partNumber;
    return pInfo;
}


const QSqlDatabase& sqlProcessor::getDatabase()
{
    qDebug()<<Q_FUNC_INFO<<" database is "<<database<<" adddress "<<this;
    return database;
}
