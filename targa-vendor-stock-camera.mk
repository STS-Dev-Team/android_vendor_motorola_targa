VENDOR_BLOB_FOLDER := vendor/motorola/targa/proprietary

# system/vendor
PRODUCT_COPY_FILES += \
$(VENDOR_BLOB_FOLDER)/lib/libpostcapimgproc_intf.so:/system/lib/libpostcapimgproc_intf.so \
$(VENDOR_BLOB_FOLDER)/lib/hw/camera.omap4.so:/system/lib/hw/camera.omap4.so \

