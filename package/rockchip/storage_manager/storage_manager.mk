STORAGE_MANAGER_SITE = $(TOPDIR)/../app/storage_manager
STORAGE_MANAGER_SITE_METHOD = local

STORAGE_MANAGER_DEPENDENCIES = libgdbus librkdb

ifeq ($(BR2_PACKAGE_RK_OEM), y)
STORAGE_MANAGER_INSTALL_TARGET_OPTS = DESTDIR=$(BR2_PACKAGE_RK_OEM_INSTALL_TARGET_DIR) install/fast
STORAGE_MANAGER_DEPENDENCIES += rk_oem
endif

ifeq ($(BR2_PACKAGE_STORAGE_MANAGER_SANITIZER_DYNAMIC), y)
STORAGE_MANAGER_CONF_OPTS += -DSANITIZER_DYNAMIC=ON
else

ifeq ($(BR2_PACKAGE_STORAGE_MANAGER_SANITIZER_STATIC), y)
STORAGE_MANAGER_CONF_OPTS += -DSANITIZER_STATIC=ON
endif
endif

$(eval $(cmake-package))