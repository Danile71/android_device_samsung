# Release name
PRODUCT_RELEASE_NAME := I9192I

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/serranove3gxx/device_serranove3gxx.mk)

## Device identifier. This must come after all inclusions
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_DEVICE := serranove3gxx
PRODUCT_NAME := cm_serranove3gxx
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
PRODUCT_MODEL := I9192I
