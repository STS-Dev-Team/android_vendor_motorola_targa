#!/system/bin/sh
#==============================================================================
#
#   File Name: install-recovery.sh
#
#   General Description: This script is used to install software update for
#                        recovery mode after OTA update. This is modified
#                        from original Google code to split the code into
#                        a fixed program while putting the dynamic data
#                        into a config file.
#
#==============================================================================
#
#               Motorola Mobility Confidential Proprietary
#        (c) Copyright Motorola Mobility 2011, All Rights Reserved
#
#==============================================================================

echoDebug()
{
    echo "boot_size:       |${boot_size}|"
    echo "boot_sha1:       |${boot_sha1}|"
    echo "recovery_size:   |${recovery_size}|"
    echo "recovery_sha1:   |${recovery_sha1}|"
    echo "boot_type:       |${boot_type}|"
    echo "boot_device:     |${boot_device}|"
    echo "recovery_type:   |${recovery_type}|"
    echo "recovery_device: |${recovery_device}|"
    echo ""
    echo "    if ! applypatch -c ${recovery_type}:${recovery_device}:${recovery_size}:${recovery_sha1}; then"
    echo "        log -t recovery \"Installing new recovery image\""
    echo "        applypatch ${boot_type}:${boot_device}:${boot_size}:${boot_sha1} ${recovery_type}:${recovery_device} ${recovery_sha1} ${recovery_size} ${boot_sha1}:/system/recovery-from-boot.p"
    echo "    else"
    echo "        log -t recovery \"Recovery image already installed\""
    echo "    fi"
    echo ""
}

readCfg()
{
    while read line; do
        param=${line%=*}
        value=${line#*=}
        export ${param}=${value}
    done < ${CONF_FILE}
}

CONF_FILE="/system/etc/install-recovery.cfg"

DEBUG="off"
#DEBUG="on"

if [ -f ${CONF_FILE} ]; then
    readCfg
    if [ "${DEBUG}" = "on" ]; then
        echoDebug
    fi
    if ! applypatch -c ${recovery_type}:${recovery_device}:${recovery_size}:${recovery_sha1}; then
        log -t recovery "Installing new recovery image"
        applypatch ${boot_type}:${boot_device}:${boot_size}:${boot_sha1} ${recovery_type}:${recovery_device} ${recovery_sha1} ${recovery_size} ${boot_sha1}:/system/recovery-from-boot.p
    else
        log -t recovery "Recovery image already installed"
    fi
else
    log -t recovery "Recovery image config file ${CONF_FILE} not found"
fi
