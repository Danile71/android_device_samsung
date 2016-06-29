# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, $(LOCAL_PATH)/full_serranoveltexx.mk)

# Setup device configuration
PRODUCT_DEVICE := serranoveltexx
PRODUCT_NAME := cm_serranoveltexx
