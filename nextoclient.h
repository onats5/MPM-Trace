#ifndef NEXTOCLIENT_H
#define NEXTOCLIENT_H

#include <QObject>
#include <QSharedPointer>
#include "rep_NextoPluginRemoteComm_replica.h"

class NextoClient : public QObject
{
    Q_OBJECT
public:
    NextoClient(QSharedPointer<NextoPluginRemoteCommunicatorReplica> ptr);
    ~NextoClient();
    void initConnections();
    Q_INVOKABLE bool isReplicaValid();
    Q_INVOKABLE void initializeObject();

Q_SIGNALS:
    void echoSwitchState(bool switchState);
    void programNameChanged_signal(QString name);
    void requestForSendPrgName();
    void state_signal(const QString& text);

public Q_SLOTS:
    void recSwitchState_slot();
    void requestForPrgName();
    //void programNameChanged_slot(const QString name);
private:
    bool clientSwitchState;
    QSharedPointer<NextoPluginRemoteCommunicatorReplica> reptr;
private slots:
    void stateChng(QRemoteObjectReplica::State state,QRemoteObjectReplica::State oldState);
    void initTimerOn();
};

#endif // NEXTOCLIENT_H
