#ifndef SQLPROCESSOR_H
#define SQLPROCESSOR_H
#include <QObject>
#include <QtSql/QSqlDatabase>
//Error in " Cpp.includeStatement('', Util.preferredSuffix('text/x-c++hdr'), ['QObject', 'QWidget', 'QMainWindow', 'QQuickItem', 'QSharedData'], 'C:/Sources/MPMCheckerUtility')": TypeError: Property 'includeStatement' of object CppTools::Internal::CppToolsJsExtension(0x2aafb368) is not a function#include <QObject>

struct ProgSet{

  QString prgname;
  QString stencilName;
  QString squeegeeFrontName;
  QString squeegeeRearName;
  QString supportName;
  QString pasteName;


};

struct CodeSet{
    QString name;
    QString separator; //separator to section string
    QString startWith; //define start characters of string to find matching pattern if does not use lenght
    int lenght; // lenght of code
    int pnPos; //part number
    int snPos; // serial number
    int lotPos; //lot
    int mfgPos; // manufacturing date
    int expPos; // expiration date
    int quantityPos; //quantity
};

struct PartInfo{
    QString partNumber;
    QString serialNumber;
    QString lot;
    QString mfg;
    QString exp;
    QString quantity;
};
#include <QHostAddress>

  class sqlProcessor :public QObject
{
    Q_OBJECT
    public:
    sqlProcessor(QObject *parent=nullptr);
    ~sqlProcessor();
    void setProgSet(ProgSet){};
    Q_INVOKABLE void initializeObject();
    Q_INVOKABLE const QSqlDatabase& getDatabase();
    Q_INVOKABLE void setDatabase(const QSqlDatabase&db){database=db;}
  signals:
    void answerFromDatabase(int ans,int actualCycles,int presetCycles,int totalCycles,int totalLimit,const QString &answerText);
    void answerFromDatabaseProgramSet(const QString& stencilName,const QString& frontSqueegeeName,const QString& rearSqueegeeName,const QString& supportName,const QString& solderPasteName);
    void emitError(const QString& text);
    void answerFromDatabaseUserPass(bool pwd);
public slots:
    void checkPartInDatabase(const QString& text,const QString& prgName);
    void checkProgramSetInDatabase(const QString& text);
    void checkPass(const QString& text);
  private:
    ProgSet prgset;
    QSqlDatabase database;

    void makeDatabaseConnection();
    //const static char* SQL_SELECT;
    void loadSetting();
    const CodeSet getCodeSet(const QString& scannedCode);
    const PartInfo getPartInfo(const CodeSet& cs,const QString &scannedCode);
    QString hostName;
    QString userName;
    QString pwd;
    QString databaseName;

    QList<CodeSet> listOfCodesSet;
    QString ipAddress;
    static const QString localHostName;
    static const QString operator_scanned;
};

#endif // SQLPROCESSOR_H
