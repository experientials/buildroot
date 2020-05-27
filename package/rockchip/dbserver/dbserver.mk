DBSERVER_SITE = $(TOPDIR)/../app/dbserver
DBSERVER_SITE_METHOD = local

DBSERVER_DEPENDENCIES = libgdbus librkdb

ifeq ($(BR2_PACKAGE_RK_OEM), y)
DBSERVER_INSTALL_TARGET_OPTS = DESTDIR=$(BR2_PACKAGE_RK_OEM_INSTALL_TARGET_DIR) install/fast
DBSERVER_DEPENDENCIES += rk_oem
endif

ifeq ($(BR2_PACKAGE_DBSERVER_SANITIZER_DYNAMIC), y)
DBSERVER_CONF_OPTS += -DSANITIZER_DYNAMIC=ON
else

ifeq ($(BR2_PACKAGE_DBSERVER_SANITIZER_STATIC), y)
DBSERVER_CONF_OPTS += -DSANITIZER_STATIC=ON
endif

endif

$(eval $(cmake-package))