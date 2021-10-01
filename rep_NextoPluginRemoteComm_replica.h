#ifndef REP_NEXTOPLUGINREMOTECOMM_REPLICA_H
#define REP_NEXTOPLUGINREMOTECOMM_REPLICA_H

// This is an autogenerated file.
// Do not edit this file, any changes made will be lost the next time it is generated.

#include <QtCore/qobject.h>
#include <QtCore/qdatastream.h>
#include <QtCore/qvariant.h>
#include <QtCore/qmetatype.h>

#include <QtRemoteObjects/qremoteobjectnode.h>
#include <QtRemoteObjects/qremoteobjectpendingcall.h>
#include <QtRemoteObjects/qremoteobjectreplica.h>


class NextoPluginRemoteCommunicatorReplica : public QRemoteObjectReplica
{
    Q_OBJECT
    Q_CLASSINFO(QCLASSINFO_REMOTEOBJECT_TYPE, "NextoPluginRemoteCommunicator")
    Q_CLASSINFO(QCLASSINFO_REMOTEOBJECT_SIGNATURE, "4ba5acb5e8b600e30df068400af1f9ec9ff19ab8")
    Q_PROPERTY(bool currState READ currState NOTIFY currStateChanged)

public:
    NextoPluginRemoteCommunicatorReplica() : QRemoteObjectReplica() { initialize(); }
    static void registerMetatypes()
    {
        static bool initialized = false;
        if (initialized)
            return;
        initialized = true;
        qRegisterMetaType<QRemoteObjectPendingCall>();
        qRegisterMetaType<QRemoteObjectPendingReply<void>>();
        if (!QMetaType::hasRegisteredConverterFunction<QRemoteObjectPendingReply<void>, QRemoteObjectPendingCall>())
            QMetaType::registerConverter<QRemoteObjectPendingReply<void>, QRemoteObjectPendingCall>();

    }

private:
    NextoPluginRemoteCommunicatorReplica(QRemoteObjectNode *node, const QString &name = QString())
        : QRemoteObjectReplica(ConstructWithNode)
    {
        initializeNode(node, name);
    }

    void initialize() override
    {
        NextoPluginRemoteCommunicatorReplica::registerMetatypes();
        QVariantList properties;
        properties.reserve(1);
        properties << QVariant::fromValue(bool(false));
        setProperties(properties);
    }

public:
    ~NextoPluginRemoteCommunicatorReplica() override = default;

    bool currState() const
    {
        const QVariant variant = propAsVariant(0);
        if (!variant.canConvert<bool>()) {
            qWarning() << "QtRO cannot convert the property currState to type bool";
        }
        return variant.value<bool >();
    }


Q_SIGNALS:
    void currStateChanged(bool currState);
    void programChanged(QString name);

public Q_SLOTS:
    void pushCurrState(bool currState)
    {
        static int __repc_index = NextoPluginRemoteCommunicatorReplica::staticMetaObject.indexOfSlot("pushCurrState(bool)");
        QVariantList __repc_args;
        __repc_args << QVariant::fromValue(currState);
        send(QMetaObject::InvokeMetaMethod, __repc_index, __repc_args);
    }
    void server_slot(bool clientState)
    {
        static int __repc_index = NextoPluginRemoteCommunicatorReplica::staticMetaObject.indexOfSlot("server_slot(bool)");
        QVariantList __repc_args;
        __repc_args
            << QVariant::fromValue(clientState)
        ;
        send(QMetaObject::InvokeMetaMethod, __repc_index, __repc_args);
    }
    void requestForPrgName()
    {
        static int __repc_index = NextoPluginRemoteCommunicatorReplica::staticMetaObject.indexOfSlot("requestForPrgName()");
        QVariantList __repc_args;
        send(QMetaObject::InvokeMetaMethod, __repc_index, __repc_args);
    }

private:
    friend class QT_PREPEND_NAMESPACE(QRemoteObjectNode);
};


QT_BEGIN_NAMESPACE
QT_END_NAMESPACE


#endif // REP_NEXTOPLUGINREMOTECOMM_REPLICA_H
