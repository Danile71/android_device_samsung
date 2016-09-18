# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/full_serranove3gxx.mk)

# Setup device configuration
PRODUCT_DEVICE := serranove3gxx
PRODUCT_NAME := cm_serranove3gxx
