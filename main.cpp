#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "sqlprocessor.h"
#include <QQuickView>
#include <QQmlContext>
//#include "tcpclass.h"

//#include "rpcprocessor.h"
#include "nextoclient.h"
#include "inventorysqlmodel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    //sqlProcessor sqlproc;
    //QSqlDatabase database = sqlproc.getDatabase();
    //qmlRegisterType<NextoPluginRemoteCommunicatorReplica>("custom",1,0,"Nexto");
    qmlRegisterType<InventorySqlModel>("custom",1,0,"InventoryModel");
    qmlRegisterType<sqlProcessor>("custom",1,0,"SqlProcessor");
    //qmlRegisterType<QSqlDatabase>("custom",1,0,"SqlDatabase");
    QSharedPointer<NextoPluginRemoteCommunicatorReplica> ptr;
    QRemoteObjectNode repNode;
    repNode.connectToNode(QUrl(QStringLiteral("local:nexto")));
    ptr.reset(repNode.acquire<NextoPluginRemoteCommunicatorReplica>());
    ptr->waitForSource();
    if(ptr->isReplicaValid()){
        qDebug()<<"Replica is valid";
    }
    /*QSqlDatabase database = QSqlDatabase::addDatabase("ODBC");
    database.setHostName("192.168.20.26\\SQLEXPRESS");
    database.setUserName("benchUser");
    database.setPassword("1111");
    database.setDatabaseName("LeyardPro01");
    */

    NextoClient nxt(ptr);

    QQmlApplicationEngine engine;
    QQmlContext *context = engine.rootContext();
    //context->setContextProperty("sqlproc",&sqlproc);
    context->setContextProperty("nexto",&nxt);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



    return app.exec();
}
