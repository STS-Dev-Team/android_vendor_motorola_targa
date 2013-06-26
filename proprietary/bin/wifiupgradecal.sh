#! /system/bin/sh

TARGET_FW_DIR=/data/misc/wifi/firmware
TARGET_FW_FILE=$TARGET_FW_DIR/wl12xx-nvs.bin
TARGET_NVS_FILE=/system/etc/wifi/wlan_fem.ini

# Set MAC address from old PDS file to new file
calibrator set upd_nvs $TARGET_NVS_FILE /pds/wifi/nvs_map.bin $TARGET_FW_FILE

echo " ******************************"
echo " * Finished Wi-Fi MAC calibration *"
echo " ******************************"
