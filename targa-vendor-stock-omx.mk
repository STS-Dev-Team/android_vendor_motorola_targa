VENDOR_BLOB_FOLDER := vendor/motorola/targa/proprietary

# system/etc
PRODUCT_COPY_FILES += \
    $(VENDOR_BLOB_FOLDER)/lib/libdomx.so:/system/lib/libdomx.so \
    $(VENDOR_BLOB_FOLDER)/lib/libmm_osal.so:/system/lib/libmm_osal.so \
    $(VENDOR_BLOB_FOLDER)/lib/libOMX.TI.DUCATI1.MISC.SAMPLE.so:/system/lib/libOMX.TI.DUCATI1.MISC.SAMPLE.so \
    $(VENDOR_BLOB_FOLDER)/lib/libOMX.TI.DUCATI1.VIDEO.CAMERA.so:/system/lib/libOMX.TI.DUCATI1.VIDEO.CAMERA.so \
    $(VENDOR_BLOB_FOLDER)/lib/libOMX.TI.DUCATI1.VIDEO.DECODER.secure.so:/system/lib/libOMX.TI.DUCATI1.VIDEO.DECODER.secure.so \
    $(VENDOR_BLOB_FOLDER)/lib/libOMX.TI.DUCATI1.VIDEO.DECODER.so:/system/lib/libOMX.TI.DUCATI1.VIDEO.DECODER.so \
    $(VENDOR_BLOB_FOLDER)/lib/libOMX.TI.DUCATI1.VIDEO.H264E.so:/system/lib/libOMX.TI.DUCATI1.VIDEO.H264E.so \
    $(VENDOR_BLOB_FOLDER)/lib/libOMX.TI.DUCATI1.VIDEO.MPEG4E.so:/system/lib/libOMX.TI.DUCATI1.VIDEO.MPEG4E.so \
    $(VENDOR_BLOB_FOLDER)/lib/libOMX_Core.so:/system/lib/libOMX_Core.so 

