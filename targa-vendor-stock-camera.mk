VENDOR_BLOB_FOLDER := vendor/motorola/targa/proprietary

# system/vendor
#PRODUCT_COPY_FILES += \
#$(VENDOR_BLOB_FOLDER)/lib/libpostcapimgproc_intf.so:/system/lib/libpostcapimgproc_intf.so \
#$(VENDOR_BLOB_FOLDER)/lib/hw/camera.omap4.so:/system/lib/hw/camera.omap4.so

# system/etc/omapcam
PRODUCT_COPY_FILES += \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/SEN2.cfg:system/etc/omapcam/SEN2.cfg \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/SEN2_EE.cfg:system/etc/omapcam/SEN2_EE.cfg \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN002_DCCID1039.cfg:system/etc/omapcam/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN002_DCCID1039.cfg \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN002_DCCID1039_CAL.cfg:system/etc/omapcam/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN002_DCCID1039_CAL.cfg \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN002_DCCID1039_EE.cfg:system/etc/omapcam/R8_MVEN002_LD2_ND0_IR0_SH0_FL1_SVEN002_DCCID1039_EE.cfg

# system/etc/omapcam/module1_bak
PRODUCT_COPY_FILES += \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_ae_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_ae_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_ae_supp3_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_ae_supp3_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_ae_ti2_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_ae_ti2_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_affw_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_affw_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_affw_dcc_tuning.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_affw_dcc_tuning.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_caf_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_caf_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_caf_dcc_tuning.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_caf_dcc_tuning.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_hllc_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_hllc_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_hllc_dcc_tuning.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_hllc_dcc_tuning.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_saf_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_saf_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_saf_dcc_tuning.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_3a_af_saf_dcc_tuning.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_alg_adjust_rgb2rgb_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_alg_adjust_rgb2rgb_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_awb_alg_ti3_gains_adjust.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_awb_alg_ti3_gains_adjust.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_awb_alg_ti3_tuning.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_awb_alg_ti3_tuning.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_capabilities.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_capabilities.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ducati_eff_tun.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ducati_eff_tun.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ducati_lsc_2d.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ducati_lsc_2d.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_face_detect_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_face_detect_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_face_tracking_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_face_tracking_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_golden_module_calibration_180rotation.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_golden_module_calibration_180rotation.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_h3a_aewb_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_h3a_aewb_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_3d_lut_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_3d_lut_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_car_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_car_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_cfai_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_cfai_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_cgs_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_cgs_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_dpc_lut_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_dpc_lut_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_dpc_otf.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_dpc_otf.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_gbce_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_gbce_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_gic_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_gic_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_lsc_poly_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_lsc_poly_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_nf1_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_nf1_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_nf2_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_nf2_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rgb2rgb_1_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rgb2rgb_1_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rgb2rgb_2_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rgb2rgb_2_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rgb2yuv_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rgb2yuv_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rsz_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_rsz_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_yuv444_to_yuv422_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ipipe_yuv444_to_yuv422_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_isif_csc_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_isif_csc_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_iss_glbce3_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_iss_glbce3_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_iss_lbce_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_iss_lbce_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_iss_scene_modes_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_iss_scene_modes_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_iss_vstab_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_iss_vstab_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ldc_cac_cfg_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ldc_cac_cfg_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_ldc_cfg_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_ldc_cfg_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1.bak/cid1039_ov8820_vnf_cfg_dcc.bin:system/etc/omapcam/module1.bak/cid1039_ov8820_vnf_cfg_dcc.bin

# system/etc/omapcam/module1_cal
PRODUCT_COPY_FILES += \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1_cal/cid1039_ov8820_alg_3a_ae_supp3_dcc.bin:system/etc/omapcam/module1_cal/cid1039_ov8820_alg_3a_ae_supp3_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1_cal/cid1039_ov8820_isif_clamp_dcc.bin:system/etc/omapcam/module1_cal/cid1039_ov8820_isif_clamp_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1_cal/cid1039_ov8820_lsc_interp.bin:system/etc/omapcam/module1_cal/cid1039_ov8820_lsc_interp.bin

# system/etc/omapcam/module1_ee
PRODUCT_COPY_FILES += \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1_ee/cid1039_ov8820_ducati_gamma.bin:system/etc/omapcam/module1_ee/cid1039_ov8820_ducati_gamma.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1_ee/cid1039_ov8820_ipipe_ee_dcc.bin:system/etc/omapcam/module1_ee/cid1039_ov8820_ipipe_ee_dcc.bin \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module1_ee/cid1039_ov8820_ducati_nsf_ldc.bin:system/etc/omapcam/module1_ee/cid1039_ov8820_ducati_nsf_ldc.bin

# system/etc/omapcam/module2
PRODUCT_COPY_FILES += \
    $(VENDOR_BLOB_FOLDER)/etc/omapcam/module2/cid1040_ov7739_sensor_config_dcc.bin:system/etc/omapcam/module2/cid1040_ov7739_sensor_config_dcc.bin
