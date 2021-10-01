QT += quick
QT += sql
QT += network
QT += xml

CONFIG += c++11
CONFIG += qtquickcompiler
REPC_REPLICA = NextoPluginRemoteComm.rep
QT += remoteobjects

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
    inventorysqlmodel.h \
    nextoclient.h \
    sqlprocessor.h

SOURCES += \
        inventorysqlmodel.cpp \
        main.cpp \
        nextoclient.cpp \
        sqlprocessor.cpp

RESOURCES += qml.qrc

TRANSLATIONS += \
    MPMCheckerUtility_sk_SK.ts

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH =

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target








#unix|win32: LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lRpcRT4


#unix|win32: LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lRpcns4










#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine/release/' -lPauseMachine
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine/debug/' -lPauseMachine
#else:unix: LIBS += -L$$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine/' -lPauseMachine

#INCLUDEPATH += $$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine'
#DEPENDPATH += $$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine'
