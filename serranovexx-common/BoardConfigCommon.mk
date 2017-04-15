# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Inherit from the proprietary version
-include vendor/samsung/serranovexx-common/BoardConfigVendor.mk
# setup config fo prebuilts
-include vendor/qcom/proprietary/common/config/device-vendor.mk
-include vendor/qcom/proprietary/common/msm8916/BoardConfigVendor.mk

#overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/serranovexx-common/overlay

LOCAL_PATH                           := device/samsung/serranovexx-common

# Platform
TARGET_BOARD_PLATFORM                := msm8916
TARGET_BOARD_PLATFORM_GPU            := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME         := MSM8916
BLOCK_BASED_OTA 		     := false

# Arch
TARGET_CPU_VARIANT                   := cortex-a53
TARGET_CPU_CORTEX_A53                := true
ARCH_ARM_HAVE_TLS_REGISTER           := true
TARGET_BOARD_SUFFIX                  := _32
TARGET_USES_NEW_ION_API              :=true

# Qcom
BOARD_USES_QC_TIME_SERVICES          := true
TARGET_USES_QCOM_BSP                 := true
TARGET_PLATFORM_DEVICE_BASE          := /devices/soc.0/
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE   := true
TARGET_SPECIFIC_HEADER_PATH          := $(LOCAL_PATH)/include
BOARD_VENDOR                         := samsung
AUDIO_FEATURE_ENABLED_EXTN_FORMATS   := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK              := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE                    := 0x80000000
BOARD_KERNEL_CMDLINE                 := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive
BOARD_KERNEL_TAGS_OFFSET             := 0x01E00000
BOARD_RAMDISK_OFFSET                 := 0x02000000
BOARD_KERNEL_PAGESIZE                := 2048
BOARD_KERNEL_SEPARATED_DT            := true
TARGET_KERNEL_SELINUX_CONFIG         := selinux_defconfig

# Partition sizes
TARGET_USERIMAGES_USE_EXT4           := true
BOARD_BOOTIMAGE_PARTITION_SIZE       := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE   := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE     := 1568669696
BOARD_CACHEIMAGE_PARTITION_SIZE      := 314572800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE    := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE    := 8388608
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE  := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE   := 5731479552
BOARD_FLASH_BLOCK_SIZE               := 131072

# Wifi
BOARD_HAS_QCOM_WLAN                  := true
BOARD_HAS_QCOM_WLAN_SDK              := true
BOARD_WLAN_DEVICE                    := qcwcn
BOARD_HOSTAPD_DRIVER                 := NL80211
BOARD_HOSTAPD_PRIVATE_LIB            := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER          := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB     := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI            := true
TARGET_USES_QCOM_WCNSS_QMI           := true
TARGET_USES_WCNSS_CTRL               := true
WPA_SUPPLICANT_VERSION               := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA              := "sta"
WIFI_DRIVER_FW_PATH_AP               := "ap"
WIFI_DRIVER_MODULE_PATH              := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME              := "wlan"

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH                 := true
BOARD_HAVE_BLUETOOTH_QCOM            := true
BLUETOOTH_HCI_USE_MCT                := true

# Custom RIL class
BOARD_RIL_CLASS                      := ../../../device/samsung/serranovexx-common/ril/
PROTOBUF_SUPPORTED                   := true

# Fonts
EXTENDED_FONT_FOOTPRINT              := true

# Audio
TARGET_QCOM_AUDIO_VARIANT            := caf
BOARD_HAVE_QCOM_FM                   := true
BOARD_USES_ALSA_AUDIO                := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS := true
USE_CUSTOM_AUDIO_POLICY              := 1
TARGET_USES_QCOM_MM_AUDIO            := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK     := true
BOARD_CHARGER_SHOW_PERCENTAGE        := true
BOARD_CHARGER_ENABLE_SUSPEND         := true
BOARD_CHARGING_MODE_BOOTING_LPM      := /sys/class/power_supply/battery/batt_lp_charging
BOARD_USES_OPENSSL_SYMBOLS           := true
BACKLIGHT_PATH                       := "/sys/class/leds/lcd-backlight/brightness"
CHARGING_ENABLED_PATH                := /sys/class/power_supply/battery/batt_lp_charging



# Enable QCOM FM feature
AUDIO_FEATURE_ENABLED_FM             := true
TARGET_SKIP_PRODUCT_DEVICE           := true

# Build our own PowerHAL
TARGET_POWERHAL_VARIANT              := qcom
TARGET_POWERHAL_SET_INTERACTIVE_EXT  := $(LOCAL_PATH)/power/power_ext.c

TARGET_QCOM_MEDIA_VARIANT            := caf


TARGET_KERNEL_CROSS_COMPILE_PREFIX   := arm-eabi-
KERNEL_TOOLCHAIN                     := $(ANDROID_BUILD_TOP)/prebuilts/gcc/linux-x86/arm/arm-eabi-4.8/bin
TARGET_SYSTEM_PROP                   := $(LOCAL_PATH)/system.prop
TARGET_KERNEL_SOURCE                 := kernel/samsung/serranovexx
TARGET_KERNEL_CONFIG                 := msm8916_sec_defconfig


TARGET_UNIFIED_DEVICE                := true

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH      := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS  := true
BOARD_VOLD_MAX_PARTITIONS 	     := 65
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR     := true
BOARD_SUPPRESS_EMMC_WIPE 	     := true

# Camera
TARGET_PROVIDES_CAMERA_HAL           := true
USE_DEVICE_SPECIFIC_CAMERA           := true
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true
TARGET_HAS_LEGACY_CAMERA_HAL1        := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS     := true

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED     := true
TARGET_USES_OVERLAY 		     := true
TARGET_HARDWARE_3D                   := false
TARGET_HAVE_HDMI_OUT 		     := false
USE_OPENGL_RENDERER                  := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS      := 3
MAX_EGL_CACHE_KEY_SIZE               := 12*1024
MAX_EGL_CACHE_SIZE                   := 2048*1024
OVERRIDE_RS_DRIVER                   := libRSDriver_adreno.so
TARGET_RECOVERY_QCOM_RTC_FIX         := true

RECOVERY_GRAPHICS_USE_LINELENGTH     := true
TARGET_RECOVERY_PIXEL_FORMAT         := "RGB_565"

# Boot animation
TARGET_SCREEN_WIDTH                  := 540
TARGET_SCREEN_HEIGHT                 := 960

# Recovery
TARGET_RECOVERY_FSTAB 		     := $(LOCAL_PATH)/rootdir/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 	     := true
BOARD_HAS_LARGE_FILESYSTEM	     := true
TARGET_RECOVERY_DENSITY 	     := hdpi
BOARD_HAS_NO_MISC_PARTITION          := true
BOARD_HAS_NO_SELECT_BUTTON 	     := true
BOARD_RECOVERY_SWIPE 		     := true
BOARD_USE_CUSTOM_RECOVERY_FONT 	     := \"roboto_23x41.h\"
BOARD_USES_MMCUTILS 		     := true
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY :=true
RECOVERY_GRAPHICS_USE_LINELENGTH     := true
BOARD_HAS_DOWNLOAD_MODE              := true
TARGET_RECOVERY_DEVICE_DIRS          += device/samsung/qcom-common

# GPS
TARGET_GPS_HAL_PATH                  := $(LOCAL_PATH)/gps
BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true

# CMHW
BOARD_HARDWARE_CLASS += $(LOCAL_PATH)/cmhw
BOARD_USES_CYANOGEN_HARDWARE := true

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS       := $(LOCAL_PATH)

#NFC
BOARD_NFC_CHIPSET                    := pn547
BOARD_NFC_LPM_LOSES_CONFIG           := true
BOARD_NFC_DEVICE                     := "/dev/pn547"

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
   $(LOCAL_PATH)/sepolicy
