# Busybox
PRODUCT_PACKAGES += \
    Busybox

# SuperSu
PRODUCT_COPY_FILES += \
    vendor/cm/prebuilt/common/etc/supersu.zip:supersu/supersu.zip

# Google PinYin
PRODUCT_COPY_FILES += $(shell test -d vendor/sm/prebuilt/google/app/GooglePinYin && \
    find vendor/sm/prebuilt/google/app/GooglePinYin -name '*.apk' \
    -printf '%p:system/app/GooglePinYin/%f ')
PRODUCT_COPY_FILES += $(shell test -d vendor/sm/prebuilt/google/app/GooglePinYin && \
    find vendor/sm/prebuilt/google/app/GooglePinYin -name '*.so' \
    -printf '%p:system/app/GooglePinYin/lib/arm/%f ')

# Disable ADB authentication and set root access to Apps and ADB
ifeq ($(DISABLE_ADB_AUTH),true)
    ADDITIONAL_DEFAULT_PROPERTIES += \
        ro.adb.secure=3 \
        persist.sys.root_access=3
endif

# Enable ADB authentication
ADDITIONAL_DEFAULT_PROPERTIES += ro.adb.secure=0
