ifeq ($(BR2_PACKAGE_UVC_APP), y)
    UVC_APP_SITE = $(TOPDIR)/../external/uvc_app
    UVC_APP_SITE_METHOD = local
    UVC_APP_INSTALL_STAGING = YES
    UVC_APP_DEPENDENCIES = libdrm mpp shm-tools
ifeq ($(BR2_PACKAGE_CAMERA_ENGINE_RKISP),y)
    UVC_APP_DEPENDENCIES += camera_engine_rkisp
endif

ifeq ($(BR2_PACKAGE_UVC_APP_MINILOGGER), y)
    UVC_APP_CONF_OPTS += -DENABLE_MINILOGGER=ON
    UVC_APP_DEPENDENCIES += minilogger
else
    UVC_APP_CONF_OPTS += -DENABLE_MINILOGGER=OFF
endif

ifeq ($(BR2_PACKAGE_AISERVER), y)
    UVC_APP_CONF_OPTS += -DCOMPILES_CAMERA=ON -DENABLE_AISERVER=ON
endif

ifeq ($(BR2_PACKAGE_ROCKIT), y)
    UVC_APP_DEPENDENCIES += rockit
    UVC_APP_CONF_OPTS += -DCOMPILES_CAMERA=ON -DUSE_ROCKIT=ON
endif

ifeq ($(BR2_PACKAGE_ROCKX),y)
    UVC_APP_DEPENDENCIES += rockx linux-rga
    UVC_APP_CONF_OPTS += "-DEPTZ_SUPPORT=ON" "-DROCKX_HEADER_DIR=$(STAGING_DIR)/usr/include/rockx"
endif

ifeq ($(BR2_PACKAGE_DBSERVER),y)
    UVC_APP_DEPENDENCIES += libIPCProtocol
    UVC_APP_CONF_OPTS += "-DDBSERVER_SUPPORT=ON" "-DLIBIPCPROTOCOL_HEADER_DIR=$(STAGING_DIR)/usr/include/libIPCProtocol"
endif

ifeq ($(BR2_PACKAGE_RKMEDIA), y)
    UVC_APP_CONF_OPTS += -DINSTALL_LIBRKUVC=y
endif

    $(eval $(cmake-package))
endif
