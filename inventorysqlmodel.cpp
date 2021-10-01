#include "inventorysqlmodel.h"
#include <QSqlRecord>
#include <QSqlField>
#include <QDebug>
#include <QSqlError>

InventorySqlModel::InventorySqlModel(QObject *parent) : QSqlQueryModel(parent)
{

}

void InventorySqlModel::setQuery(const QString &query, const QSqlDatabase &db)
{
    dbase = QSqlDatabase::addDatabase("QODBC","invmodel");
    dbase.setDatabaseName("LeyardPro01");
    dbase.setHostName("192.168.20.26\\SQLEXPRESS");
    dbase.setUserName("benchUser");
    dbase.setPassword("1111");
    dbase.open();
    qDebug()<<"set query" <<dbase;

    QSqlQueryModel::setQuery(query,dbase);
    if (lastError().isValid())
         qDebug() << lastError();
    generateRoleNames();
}

void InventorySqlModel::setQuery(const QSqlQuery &query)
{
    QSqlQueryModel::setQuery(query);
    generateRoleNames();
}

void InventorySqlModel::generateRoleNames()
{
    m_roleNames.clear();
    for(int i=0;i<record().count();i++){
        m_roleNames.insert(Qt::UserRole + i + 1,record().fieldName(i).toUtf8());
    }
}

QVariant InventorySqlModel::data(const QModelIndex &index, int role) const
{
    QVariant value;
    if(role< Qt::UserRole){
        value = QSqlQueryModel::data(index,role);
    }else{
        int columnIdx = role - Qt::UserRole -1;
        QModelIndex modelIndex = this->index(index.row(),columnIdx);
        value = QSqlQueryModel::data(modelIndex,Qt::DisplayRole);
    }
    return value;
}
