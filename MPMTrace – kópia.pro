QT += quick
QT += sql
QT += network

CONFIG += c++11
CONFIG += qtquickcompiler

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

DISTFILES += \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/WTypes.Idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/WTypesbase.Idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/common.ver \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_2.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_3.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_4.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_5.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_6.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgicommon.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgiformat.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgitype.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fwpmtypes.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fwpstypes.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fwptypes.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/iketypes.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ipsectypes.idl \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksamd64.inc \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksamd64_stub.inc \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/kxamd64.inc \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/kxamd64_stub.inc \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/macamd64.inc \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntverp.ver


HEADERS += \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/GenericUsbFnIoctl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/Iprtrmib.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/IssPer16.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/Math3DHelper.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/TraceLoggingActivity.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/TraceLoggingProvider.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/WTypesbase.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/afunix.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/apdevpkey.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/apiset.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/apisetcconv.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/atsmedia.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/basetsd.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/basetyps.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/batclass.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/bcrypt.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/bdamedia.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/bdatypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/bthdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/bthioctl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/bthsdpdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/bugcodes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/cderr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/cfg.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/clfs.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/clfslsn.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/concurrencysal.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/d3d9.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/d3d9caps.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/d3d9types.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/d3dkmdt.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/d3dkmthk.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/d3dukmdt.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dciddi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dcomptypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/devguid.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/devioctl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/devpkey.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/devpropdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dinputd.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/diskguid.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dls1.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dls2.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dmdls.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dmerror.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dmusbuff.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dontuse.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dpfilter.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/driverspecs.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/drivinit.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_2.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_3.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_4.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_5.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgi1_6.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgicommon.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgiformat.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/dxgitype.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ehstorbandmgmt.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ehstorioctl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/emi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/evntprov.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/evntrace.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/exposeenums2managed.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fltUserStructures.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fttypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fwpmtypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fwpstypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fwptypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/fwpvi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/gnssdriver.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/gpio.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/guiddef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/hbaapi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/hidclass.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/hidpi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/hidsdi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/hidusage.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/hvsocket.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/hwn.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ifdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ifmib.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/iketypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/in6addr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/inaddr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/infstr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/initguid.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/intsafe.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ioevent.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ip2string.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ipifcons.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ipmib.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ipsectypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ipv6prefast.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/iscsierr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/kernelspecs.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ks.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksarm.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksarm64.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksguid.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksmedia.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksproxy.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ksuuids.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ktmtypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/kxarm.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/kxarm64.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/kxarm64unw.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/kxarmunw.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/lamp.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/lmcons.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/lmerr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/minwindef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/mmreg.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/mprapidef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/msapofxproxy.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/mstcpip.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/mswsockdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ndis/version.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ndisguid.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ndkinfo.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/checksum.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/checksumtypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/extension.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/fragment.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/logicaladdress.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/logicaladdresstypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/lso.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/lsotypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/mdl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/mdltypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/packet.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/returncontext.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/returncontexttypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/ring.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/ringcollection.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/rsc.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/rsctypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/virtualaddress.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netcx/shared/1.0/net/virtualaddresstypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netevent.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netioapi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/netiodef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/nettypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/nfcdtadev.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/nfcradiodev.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/nfcsedev.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/nfpdev.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/nldef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/no_sal2.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntdd1394.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddbeep.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddcdrm.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddcdvd.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddchgr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntdddisk.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddkbd.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddmmc.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddmodm.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddmou.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddndis.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddpar.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddscm.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddscsi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddser.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddstor.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddtape.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddtdi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddvdeo.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntddvol.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntdskreg.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntiologc.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntstatus.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ntverp.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/nvme.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/packoff.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/packon.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/pciprop.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/poclass.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/poppack.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/pshpack1.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/pshpack2.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/pshpack4.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/pshpack8.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/pshpck16.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/pwm.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/qos.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/qosobjs.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/qossp.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/reshub.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/rpc.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/rpcasync.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/rpcdce.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/rpcdcep.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/rpcndr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/rpcnterr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/rpcsal.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sal.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/scsi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/scsiscan.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sddl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sdkddkver.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sdv_driverspecs.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/secext.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/security.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sensorsdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sensorsstructures.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sensorsutils.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/spb.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/specstrings.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/specstrings_strict.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/specstrings_undef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/srb.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/sspi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/stralign.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/strsafe.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/suppress.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/tbs.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/tcpestats.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/tcpmib.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/tdi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/tdiinfo.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/traffic.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/transportsettingcommon.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/tvout.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/udpmib.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/unexposeenums2managed.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usb.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usb100.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usb200.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usbdi.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usbfnbase.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usbioctl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usbiodef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usbprint.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usbscan.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/usbspec.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/uuids.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/vhf.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/vmgenerationcounter.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/warning.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/wdmguid.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winapifamily.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winbio_err.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winbio_ioctl.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winbio_types.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/windef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/windot11.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/windowsx.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winerror.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winpackagefamily.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winsmcrd.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/winusbio.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/wlantypes.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/wmistr.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/wnnc.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ws2def.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/ws2ipdef.h \
    ../../Program Files (x86)/Windows Kits/10/Include/10.0.19041.0/shared/wtypes.h \
    sqlprocessor.h

SOURCES += \
        main.cpp \
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




win32:CONFIG(release, debug|release): LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lrpcutil -lRpcRT4 -lnetapi32
else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lrpcutil -lRpcRT4 -lnetapi32
else:unix: LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lrpcutil -lRpcRT4 -lnetapi32



#unix|win32: LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lRpcRT4


#unix|win32: LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lRpcns4


unix|win32: LIBS += -L$$PWD/'../../Program Files (x86)/Windows Kits/10/Lib/10.0.19041.0/um/x86/' -lrpcproxy -lrpcexts -lrtutils -lRTWorkQ -lruntimeobject -lRpcns4








#win32:CONFIG(release, debug|release): LIBS += -L$$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine/release/' -lPauseMachine
#else:win32:CONFIG(debug, debug|release): LIBS += -L$$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine/debug/' -lPauseMachine
#else:unix: LIBS += -L$$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine/' -lPauseMachine

#INCLUDEPATH += $$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine'
#DEPENDPATH += $$PWD/'../OpenApps/1020249-01E (Development Kit)/Example/PauseMachine'
