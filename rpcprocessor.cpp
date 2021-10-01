#include "rpcprocessor.h"

rpcProcessor::rpcProcessor(QObject *parent) : QObject(parent)
{
    rpcApp = new CPauseMachineApp;
    rpcApp->InitRpc();
    emit initializedSignal();
}
rpcProcessor::~rpcProcessor()
{
    //delete rpcApp;
}
