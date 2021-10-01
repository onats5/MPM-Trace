#ifndef RPCPROCESSOR_H
#define RPCPROCESSOR_H

#include <QObject>
#define _AFXDLL 1
#include "PauseMachine.h"

class rpcProcessor : public QObject
{
    Q_OBJECT
public:
    explicit rpcProcessor(QObject *parent = nullptr);
    ~rpcProcessor();

signals:
    void initializedSignal();
private:
    CPauseMachineApp *rpcApp;

};

#endif // RPCPROCESSOR_H
