#!/system/bin/sh
#==============================================================================
#
#   File Name: bugtogo.sh
#
#   General Description: This file is used to collect logs for Bug2Go app
#
#==============================================================================
#               Motorola Mobility Confidential Proprietary
#        (c) Copyright Motorola Mobility 2011, All Rights Reserved

init(){
    timeout_pm=10
    timeout_am=10
    timeout_dumpstate=120
    timeout_df=10
    timeout_screencap=10
    fileExists "/system/bin/timedexec"
    useTimedexec=$?
}

#Description:
# $1 : log level.
# $2 : log message
b2glog(){
    log -p $1 -t Bug2Go $2
}

#Description:
# $1 : The elapsed time limit in seconds after which the command is terminated.
# $2 : the command to be executed
runTimedCommand(){
    case $useTimedexec in
        1)
            output=$(timedexec $1 $2)
            ;;
        0)
            output=$($2)
            ;;
    esac
}

#$1 : options and arguments
b2gpm(){
    runTimedCommand $timeout_pm "/system/bin/pm $1"
}

#$1 : am command and args
b2gam(){
    runTimedCommand $timeout_am "/system/bin/am $1"
}

#$1 : options
b2gdumpstate(){
    runTimedCommand $timeout_dumpstate "/system/bin/dumpstate $1"
}

#$1 : path
b2gdf(){
    runTimedCommand $timeout_df "/system/bin/df $1"
}

#$1 : path
b2gscreencap(){
    runTimedCommand $timeout_screencap "/system/bin/screencap $1"
}

#check if a package is installed on the device.
isPackageInstalled(){
    b2glog v "isPackageInstalled() $1"
    b2gpm "list packages $1"
    case $? in
        0) ;;
        *) b2glog e "b2gpm list packages $1 failed; status=$?"; return 0;;
    esac
    for package in $output
    do
        case "$package" in "package:$1")
            return 1
            ;;
        esac
    done
    return 0
}

getSystemProperties(){
    b2glog v "getSystemProperties()"
    timestamp=`date +'%Y-%m-%d_%H-%M-%S'`
    product=$(/system/bin/getprop ro.build.product)
    device=$(/system/bin/getprop ro.product.device)
    buildType=$(/system/bin/getprop ro.build.type)
    serialNum=$(/system/bin/getprop ro.serialno)
    apVersion=$(/system/bin/getprop ro.build.display.id)
    bpVersion=$(/system/bin/getprop gsm.version.baseband)
    model=$(/system/bin/getprop ro.product.model)
    board=$(/system/bin/getprop ro.product.board)
    brand=$(/system/bin/getprop ro.product.brand)
    case $apVersion in "")
        apVersion=$(/system/bin/getprop ro.build.id)
        ;;
    esac
}

#A shell function checking if a file exists
fileExists(){
    for line in $(/system/bin/ls -l $1)
    do
        return 1
    done
    return 0
}

#parse the configuration file of the Bug2Go app, use default if the
#configuration file is not present
getRequiredSize(){
    b2glog v "getRequiredSize()"
    fileExists "/data/data/com.motorola.bug2go/files/conf.xml"
    # read the required size from the configuration file if file exists
    case $? in
        "1")
            while read line
            do
                case "$line" in
                    *minimum_memory_size*)
                        line=${line%</*};
                        requiresize_conf=${line#*>};
                ;;
                esac
            done < "/data/data/com.motorola.bug2go/files/conf.xml"
            ;;
        "0")
            b2glog d  "No req size config, use 40M default"
            requiresize_conf=40
            ;;
    esac
    return $requiresize_conf
}

#returns the available size of a directory in Mb
getAvailableSize(){
    b2glog v "getAvailableSize() $1"
    b2gdf $1
    case $? in
        0) ;;
        *) b2glog e "b2gdf $1 failed; status=$?"; return 0;;
    esac
    dflines=$output
    count=0
    for line in $dflines
    do
        count=$(($count + 1))
        case "$count" in
            #if the first line starts with /data/data, then the available size
            #info should also be in this line.
            "1")
                case "$line" in "$1:")
                    dfline=${dflines% available*}
                    availsize=${dfline#* used, }
                    break;
                ;;
                esac
            ;;
            #if the first line doesn't start with /data/data, then the
            #available size info should be the 4th column in the second line
            "9")
                availsize=$line
                break;
            ;;
        esac
    done

    case "$availsize" in
        *G) availsize=${availsize%G}
            availsize=$(($availsize * 1024))
            ;;
        *M) availsize=${availsize%M};;
        *K) availsize=${availsize%K}
            availsize=$(($availsize / 1024))
            ;;
    esac
    return $availsize
}

isSpaceEnough(){
    b2glog v "isSpaceEnough() $1 $2"
    getAvailableSize $1
    availsize=$?

    b2glog d "required: $2 M, available: $availsize M in $1"
    result=$(($availsize - $2))
    case "$result" in
        -*) return 0
        ;;
    esac

    return 1
}

getStoragePath(){
    b2glog v "getStoragePath() $1"
    isSpaceEnough "/sdcard-ext" $1
    case $? in
    "0")
        isSpaceEnough "/sdcard" $1
        case $? in
        "0")
            isSpaceEnough "/data/data/com.motorola.bug2go" $1
            case $? in
            "0")
                b2glog e "No available storage"
            ;;
            "1")
                storagePath="/data/data/com.motorola.bug2go/files"
            ;;
            esac
        ;;
        "1")
            storagePath="/sdcard/bug2go"
        ;;
        esac
    ;;
    "1")
        storagePath="/sdcard-ext/bug2go"
    ;;
    esac
}

#Parameter description:
# $1 : the full path of the source file, can not be empty
# $2 : the destination file name containing no full path, can be empty.
copyFileIfExists(){
    fileExists $1
    case $? in
        "1")
            /system/bin/cp $1 $logFilePath/$2
        ;;
    esac
}

collectLogs(){
    b2glog v "collectLogs()"
    # Capture the dumpstate (AP state snapshot + log buffers)
    b2gdumpstate "-o $logFilePath/bugreport_$timestamp"

    #Grab the AOL log files.  Make sure to grab the last two sets of overflow
    #logs too.  After the logs rotate, the most recent always goes to index 0,
    #and all others are shifted up by 1.  So, the last two sets of overflow are
    #always at 0 and 1.
    local aolFiles="\
        log.radio.txt  backup.0.log.radio.txt.gz  backup.1.log.radio.txt.gz\
        log.events.txt backup.0.log.events.txt.gz backup.1.log.events.txt.gz\
        log.system.txt backup.0.log.system.txt.gz backup.1.log.system.txt.gz\
        log.kernel.txt backup.0.log.kernel.txt.gz backup.1.log.kernel.txt.gz\
        log.main.txt   backup.0.log.main.txt.gz   backup.1.log.main.txt.gz"

    #The AOL logs can move around, depending on the USB Mass Storage state and
    #whether the user has an external SD Card inserted or not.  Make sure we
    #look everywhere.
    for file in $aolFiles; do
        copyFileIfExists "/sdcard-ext/logger/${file}" "sdcard-ext_logger_${file}"
        copyFileIfExists "/sdcard/logger/${file}" "sdcard_logger_${file}"
        copyFileIfExists "/data/logger/${file}" "data_logger_${file}"
    done

    #Grab the Battery Tracer log files.  Make sure to grab the last set of
    #backup logs, too.  On user builds, we will also grab the system logs that
    #Battery Tracer captures, because aplogd will not be running.  The logic
    #below assumes only one file exists in each directory with the suffix shown.
    local battTracerLocs="\
        /sdcard/batterytracer/databases/current\
        /sdcard/batterytracer/databases/backup0"
    for loc in $battTracerLocs; do
        for file in $(/system/bin/ls $loc/*.btd); do
            copyFileIfExists $file
        done
        case $(/system/bin/getprop ro.build.type) in
        user)
            for file in $(/system/bin/ls $loc/*.log); do
                copyFileIfExists $file
            done
        ;;
        esac
    done

    #AP panic log fils
    for file in $(/system/bin/ls /data/dontpanic/)
    do
        copyFileIfExists "/data/dontpanic/$file"
    done

    #SBCM log files
    copyFileIfExists "/data/battd/SBCM_logfile.bin"
    copyFileIfExists "/data/battd/SBCM_logfile_old.bin"
}

mkdirIfNotExist(){
    b2glog v "mkdirIfNotExist() $1"
    fileExists $1
    case $? in
        "0")
            /system/bin/mkdir $1
        ;;
    esac
}

startBug2Go(){
    b2glog v "startBug2Go()"

    getRequiredSize
    requiredsize=$?

    getStoragePath $requiredsize
    case $storagePath in
        "")
            b2glog e "Not enough space"
            #Show error info
            b2gam "start -a motorola.intent.action.BUG2GO.ERR -t text/plain -e errortype nostorage -e id $timestamp"
            return 1
        ;;
    esac

    logFilePath="$storagePath/$timestamp"
    b2glog d "Storage path: $logFilePath"
    mkdirIfNotExist $storagePath
    /system/bin/mkdir $logFilePath

    #put the attachments in a separated folder so that Bug2Go can handle it separately.
    attachmentPath="$storagePath/screenshots"
    b2glog d "Attachment path: $attachmentPath"
    mkdirIfNotExist $attachmentPath

    #capture the current screenshot
    b2gscreencap "-p $attachmentPath/screenshot-$timestamp.png"

    #Start the Bug2Go App
    b2gam "start -a motorola.intent.action.BUG2GO.START -t text/plain -e id $timestamp"

    collectLogs

    #Save the report info into a temporary file so that the APK can create
    #report with the info in the file at any time it detects this file. The
    #APK should remove this file once it creates a report for it.
    #Parameters:
    #save_path : the directory where to save the compressed log files
    #files : the log files that should be included into this report, can be
    #        directories. separated by space if there are 2 or more files
    #files_to_remove : the files that should be removed after the report is
    #        created, can be directories, separated by space if there are 2
    #        or more files
    info="save_path=$storagePath\n"
    info="$info""files=$logFilePath\n"
    info="$info""screenshot=$attachmentPath/screenshot-$timestamp.png\n"
    info="$info""files_to_remove=$storagePath/bugreport_$timestamp.info\n"
    info="$info""serial=$serialNum\n"
    info="$info""timestamp=$timestamp\n"
    info="$info""ap_version=$apVersion\n"
    info="$info""bp_version=$bpVersion\n"
    info="$info""product=$product\n"
    info="$info""device=$device\n"
    info="$info""build_type=$buildType"
    echo -e "$info" > $storagePath/bugreport_$timestamp.info
    b2glog d "Saved info to $storagePath/bugreport_$timestamp.info"

    #Forward info to the Bug2Go app
    b2gam "start -a motorola.intent.action.BUG2GO.END -t text/plain -e report_info $storagePath/bugreport_$timestamp.info -e id $timestamp"
}

startBug2GoLite(){
    b2glog d "startBug2GoLite()"
    # Start Bug2Go App
    b2gam "start -a motorola.intent.action.BUG2GOLITE.START -t text/plain"

    isSpaceEnough "/sdcard" 10
    case $? in
        0)
            b2glog e "SDcard not present or full, nowhere to store output"
            b2gam "start -a motorola.intent.action.BUG2GOLITE.ERR -t text/plain"
            return 1
        ;;
        1)
            storagePath="/sdcard/bug2go"
            b2glog d "Storage path: $storagePath"
            mkdirIfNotExist $storagePath
        ;;
    esac

    # Capture the dumpstate (AP state snapshot + log buffers)
    /system/bin/dumpstate > $storagePath/bugreport_$timestamp.txt
    /system/bin/gzip $storagePath/bugreport_$timestamp.txt

    # Forward info to the Bug2Go app
    b2gam "start -a motorola.intent.action.BUG2GOLITE.END -t application/gzip \
        -e path $storagePath/bugreport_$timestamp.txt.gz \
        -e serial $serialNum \
        -e timestamp $timestamp \
        -e ap_version $apVersion \
        -e bp_version $bpVersion \
        -e product $product \
        -e device $device \
        -e build_type $buildType"
}

main(){
    init
    b2glog d "bugtogo.sh started"
    getSystemProperties
    echo bug2go-native > /sys/power/wake_lock
    isPackageInstalled "com.motorola.bug2go"
    case $? in
        0)
            isPackageInstalled "com.motorola.bug2golite"
            case $? in
                0)
                    case $buildType in
                        user)
                            case $(/system/bin/getprop init.svc.adbd) in
                                running)
                                    b2glog v "Bug2Go.apk=N; Bug2GoLite.apk=N; UserBuild=Y; USBDebug=Y"
                                    startBug2GoLite
                                ;;
                                *)
                                    b2glog v "Bug2Go.apk=N; Bug2GoLite.apk=N; UserBuild=Y; USBDebug=N"
                                ;;
                            esac
                        ;;
                        *)
                            b2glog v "Bug2Go.apk=N; Bug2GoLite.apk=N; UserBuild=N"
                            startBug2GoLite
                        ;;
                    esac
                ;;
                1)
                    b2glog v "Bug2Go.apk=N; Bug2GoLite.apk=Y"
                    startBug2GoLite
                ;;
            esac
        ;;
        1)
            b2glog v "Bug2Go.apk=Y"
            startBug2Go
        ;;
    esac
    echo bug2go-native > /sys/power/wake_unlock
    b2glog d "bugtogo.sh exited"
}

main
