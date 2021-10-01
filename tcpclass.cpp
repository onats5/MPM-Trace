#include "tcpclass.h"
#include <QHostAddress>
#include <iostream>
tcpClass::tcpClass(QObject *parent) : QTcpSocket(parent)
{

}

tcpClass::~tcpClass()
{
    disconnectFromHost();
}

bool tcpClass::doConnect(const QString host, int p)
{
    connectToHost(QHostAddress(host),p);
    if(!waitForConnected(5000)){
       //qStdOut()<< "Error: " << errorString();
        std::cout<< "Error: PanaTcpSocket: " << errorString().toStdString()<<std::endl;
        return false;
    }
    return true;
}
