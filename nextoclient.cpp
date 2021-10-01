#include "nextoclient.h"
#include <QDebug>
#include <QTimer>

NextoClient::NextoClient(QSharedPointer<NextoPluginRemoteCommunicatorReplica> ptr) :
    QObject(nullptr),reptr(ptr)
{
    /*initConnections();
    QTimer::singleShot(1000,this,SLOT(initTimerOn()));*/
}

NextoClient::~NextoClient()
{

}

void NextoClient::initializeObject()
{
    initConnections();
    QTimer::singleShot(1000,this,SLOT(initTimerOn()));
}
void NextoClient::initTimerOn()
{
    if(reptr->state()==QRemoteObjectReplica::Valid){
            qDebug()<<"Valid";
            Q_EMIT state_signal("Connected");
            requestForPrgName();
        }
}

void NextoClient::initConnections()
{
    QObject::connect(reptr.data(),&NextoPluginRemoteCommunicatorReplica::currStateChanged,this,&NextoClient::recSwitchState_slot);
    QObject::connect(this,&NextoClient::echoSwitchState,reptr.data(),&NextoPluginRemoteCommunicatorReplica::server_slot);
    QObject::connect(reptr.data(),&NextoPluginRemoteCommunicatorReplica::programChanged,this,&NextoClient::programNameChanged_signal);
    QObject::connect(this,&NextoClient::requestForSendPrgName,reptr.data(),&NextoPluginRemoteCommunicatorReplica::requestForPrgName);
    QObject::connect(reptr.data(),&NextoPluginRemoteCommunicatorReplica::stateChanged,this,&NextoClient::stateChng);
}

void NextoClient::recSwitchState_slot()
{
    qDebug()<<"Received source state "<<reptr.data()->currState();
    clientSwitchState = reptr.data()->currState();
    Q_EMIT echoSwitchState(clientSwitchState);
}
/*
void NextoClient::programNameChanged_slot(const QString name)
{
    Q_EMIT programNameChanged_signal(name);
}
*/

void NextoClient::requestForPrgName()
{
    qDebug()<<"Request for program name";
    Q_EMIT requestForSendPrgName();
}

void NextoClient::stateChng(QRemoteObjectReplica::State state,QRemoteObjectReplica::State oldState)
{
    qDebug()<<"Old state "<<oldState <<", new state "<<state;
    switch (state) {
    case QRemoteObjectReplica::Suspect :{
        Q_EMIT state_signal("Disconnected");

    }
        break;
    case QRemoteObjectReplica::Valid :{
        Q_EMIT state_signal("Connected");

    }
        break;
    case QRemoteObjectReplica::Uninitialized :{
        Q_EMIT state_signal("Uninitialized");

    }
    break;
    case QRemoteObjectReplica::SignatureMismatch :{
        Q_EMIT state_signal("SignatureMismatch");
    }
        break;
    case QRemoteObjectReplica::Default :{

    }
        break;
    default:{

    }
        break;

    }
}

bool NextoClient::isReplicaValid()
{
    //qDebug()<<" Replica valid state: "<<reptr->isReplicaValid();
    return reptr->isReplicaValid();
}
