#ifndef TCPCLASS_H
#define TCPCLASS_H

//Error in " Cpp.includeStatement('QObject', Util.preferredSuffix('text/x-c++hdr'), ['QObject', 'QWidget', 'QMainWindow', 'QQuickItem', 'QSharedData'], 'C:/Sources/MPMCheckerUtility')": TypeError: Property 'includeStatement' of object CppTools::Internal::CppToolsJsExtension(0x152b4ab0) is not a function#include <QObject>

#include <QTcpSocket>

  class tcpClass : public QTcpSocket
{
    Q_OBJECT
    public:
    explicit tcpClass(QObject *parent = nullptr);
      ~tcpClass();



    signals:

  public slots:
      bool doConnect(const QString,int);

};

#endif // TCPCLASS_H
