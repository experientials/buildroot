ifeq ($(BR2_PACKAGE_UVC_APP), y)
    UVC_APP_SITE = $(TOPDIR)/../external/uvc_app
    UVC_APP_SITE_METHOD = local
    UVC_APP_INSTALL_STAGING = YES
    UVC_APP_DEPENDENCIES = libdrm mpp
ifeq ($(BR2_PACKAGE_CAMERA_ENGINE_RKISP),y)
    UVC_APP_DEPENDENCIES += camera_engine_rkisp
endif
ifneq ($(BR2_PACKAGE_RKMEDIA_UVC), y)
    UVC_APP_DEPENDENCIES = rkmedia
    UVC_APP_CONF_OPTS = -DCOMPILES_CAMERA=ON
endif
    $(eval $(cmake-package))
endif