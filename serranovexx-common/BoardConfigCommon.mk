# inherit from qcom-common
-include device/samsung/qcom-common/BoardConfigCommon.mk

# Inherit from the proprietary version
-include vendor/samsung/serranovexx-common/BoardConfigVendor.mk

LOCAL_PATH := device/samsung/serranovexx-common


# Platform
TARGET_BOARD_PLATFORM           := msm8916
TARGET_BOARD_PLATFORM_GPU       := qcom-adreno306
TARGET_BOOTLOADER_BOARD_NAME    := MSM8916
BLOCK_BASED_OTA 		:= false

# Arch
TARGET_GLOBAL_CFLAGS            += -mfpu=neon -mfloat-abi=softfp
TARGET_GLOBAL_CPPFLAGS          += -mfpu=neon -mfloat-abi=softfp
TARGET_CPU_VARIANT              := cortex-a53
TARGET_CPU_CORTEX_A53           := true
ARCH_ARM_HAVE_TLS_REGISTER      := true
TARGET_BOARD_SUFFIX             := _32
TARGET_USES_NEW_ION_API         :=true


# Qcom
BOARD_USES_QC_TIME_SERVICES        := true
TARGET_USES_QCOM_BSP               := true
TARGET_PLATFORM_DEVICE_BASE        := /devices/soc.0/
HAVE_SYNAPTICS_I2C_RMI4_FW_UPGRADE := true
COMMON_GLOBAL_CFLAGS               += -DQCOM_BSP

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include

AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
#BOARD_VENDOR_QCOM_GPS_LOC_API_HARDWARE := $(TARGET_BOARD_PLATFORM)
#BOARD_VENDOR_QCOM_LOC_PDK_FEATURE_SET := true
#TARGET_NO_RPC := true

# Kernel
BOARD_CUSTOM_BOOTIMG_MK      := $(LOCAL_PATH)/mkbootimg.mk
BOARD_KERNEL_BASE            := 0x80000000
BOARD_KERNEL_CMDLINE         := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x3F ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci androidboot.selinux=permissive

BOARD_KERNEL_TAGS_OFFSET     := 0x01E00000
BOARD_RAMDISK_OFFSET         := 0x02000000
BOARD_KERNEL_PAGESIZE        := 2048
BOARD_KERNEL_SEPARATED_DT    := true
TARGET_KERNEL_SOURCE         := kernel/samsung/serranovexx

TARGET_KERNEL_SELINUX_CONFIG        := selinux_defconfig

# Partition sizes
TARGET_USERIMAGES_USE_EXT4          := true
BOARD_BOOTIMAGE_PARTITION_SIZE      := 13631488
BOARD_RECOVERYIMAGE_PARTITION_SIZE  := 15728640
BOARD_SYSTEMIMAGE_PARTITION_SIZE    := 1568669696
BOARD_CACHEIMAGE_PARTITION_SIZE     := 314572800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE   := ext4
BOARD_PERSISTIMAGE_PARTITION_SIZE   := 8388608
BOARD_PERSISTIMAGE_FILE_SYSTEM_TYPE := ext4
# (5731495936 - 16384)
BOARD_USERDATAIMAGE_PARTITION_SIZE  := 5731479552
BOARD_FLASH_BLOCK_SIZE              := 131072

# Wifi
BOARD_HAS_QCOM_WLAN              := true
BOARD_HAS_QCOM_WLAN_SDK          := true
BOARD_WLAN_DEVICE                := qcwcn
BOARD_HOSTAPD_DRIVER             := NL80211
BOARD_HOSTAPD_PRIVATE_LIB        := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER      := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI        := true
TARGET_USES_QCOM_WCNSS_QMI       := true
TARGET_USES_WCNSS_CTRL           := true
WPA_SUPPLICANT_VERSION           := VER_0_8_X
WIFI_DRIVER_FW_PATH_STA          := "sta"
WIFI_DRIVER_FW_PATH_AP           := "ap"
WIFI_DRIVER_MODULE_PATH          := "/system/lib/modules/wlan.ko"
WIFI_DRIVER_MODULE_NAME          := "wlan"



# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth
BOARD_HAVE_BLUETOOTH          := true
BOARD_HAVE_BLUETOOTH_QCOM     := true
BLUETOOTH_HCI_USE_MCT         := true

# Custom RIL class
BOARD_RIL_CLASS                     := ../../../device/samsung/serranovexx-common/ril/
PROTOBUF_SUPPORTED                  := true

# Fonts
EXTENDED_FONT_FOOTPRINT             := true

# malloc implementation
MALLOC_IMPL                         := dlmalloc


# Audio
TARGET_QCOM_AUDIO_VARIANT                    := caf
BOARD_USES_ALSA_AUDIO                         := true
AUDIO_FEATURE_ENABLED_MULTI_VOICE_SESSIONS    := true
USE_CUSTOM_AUDIO_POLICY              := 1
TARGET_USES_QCOM_MM_AUDIO            := true

# Charger
BOARD_CHARGER_DISABLE_INIT_BLANK	     := true
BOARD_CHARGER_SHOW_PERCENTAGE        := true
BOARD_CHARGER_ENABLE_SUSPEND         := true
BOARD_CHARGING_MODE_BOOTING_LPM      := /sys/class/power_supply/battery/batt_lp_charging
BOARD_USES_OPENSSL_SYMBOLS := true
BACKLIGHT_PATH                       := "/sys/class/leds/lcd-backlight/brightness"




# Enable QCOM FM feature
AUDIO_FEATURE_ENABLED_FM             := true

# Enable HW based full disk encryption
TARGET_HW_DISK_ENCRYPTION            := true

# Build our own PowerHAL
TARGET_POWERHAL_VARIANT              := qcom
CM_POWERHAL_EXTENSION                := qcom

TARGET_QCOM_MEDIA_VARIANT           := caf

# Vold
TARGET_USE_CUSTOM_LUN_FILE_PATH      := /sys/devices/platform/msm_hsusb/gadget/lun%d/file
BOARD_VOLD_DISC_HAS_MULTIPLE_MAJORS  := true
BOARD_VOLD_MAX_PARTITIONS 	     := 65
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR     := true
BOARD_SUPPRESS_EMMC_WIPE 	     := true

# Camera
TARGET_PROVIDES_CAMERA_HAL           := true
USE_DEVICE_SPECIFIC_CAMERA           := true

# Media
TARGET_ENABLE_QC_AV_ENHANCEMENTS    := true

# Display
TARGET_CONTINUOUS_SPLASH_ENABLED    := true
TARGET_USES_OVERLAY 		    := true
TARGET_HARDWARE_3D                  := false
TARGET_HAVE_HDMI_OUT 		    := false
USE_OPENGL_RENDERER                 := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS     := 3
MAX_EGL_CACHE_KEY_SIZE              := 12*1024
MAX_EGL_CACHE_SIZE                  := 2048*1024
OVERRIDE_RS_DRIVER                  := libRSDriver_adreno.so
TARGET_RECOVERY_QCOM_RTC_FIX := true

RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGB_565"
WITH_DEXPREOPT := true

# Boot animation
TARGET_SCREEN_WIDTH                 := 540
TARGET_SCREEN_HEIGHT                := 960

# Recovery
TARGET_RECOVERY_FSTAB 				:= $(LOCAL_PATH)/rootdir/fstab.qcom
TARGET_USERIMAGES_USE_EXT4 			:= true
BOARD_HAS_LARGE_FILESYSTEM			:= true
TARGET_RECOVERY_DENSITY 			:= hdpi
BOARD_HAS_NO_MISC_PARTITION 		        := true
BOARD_HAS_NO_SELECT_BUTTON 			:= true
BOARD_RECOVERY_SWIPE 				:= true
BOARD_USE_CUSTOM_RECOVERY_FONT 	        	:= \"roboto_23x41.h\"
BOARD_USES_MMCUTILS 				:= true
BOARD_RECOVERY_NEEDS_FBIOPAN_DISPLAY:=true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
TARGET_RECOVERY_DEVICE_DIRS += device/samsung/qcom-common
BOARD_HAS_DOWNLOAD_MODE := true
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
	

# Releasetools
TARGET_RELEASETOOLS_EXTENSIONS                  := $(LOCAL_PATH)

# Dex
ifeq ($(HOST_OS),linux)
  ifeq ($(TARGET_BUILD_VARIANT),user)
    ifeq ($(WITH_DEXPREOPT),)
      WITH_DEXPREOPT := true
    endif
  endif
endif



TARGET_SPECIFIC_HEADER_PATH :=  device/samsung/serranovexx-common/include

BOARD_NFC_CHIPSET := pn547
BOARD_NFC_LPM_LOSES_CONFIG := true
BOARD_NFC_DEVICE := "/dev/pn547"

# SELinux
include device/qcom/sepolicy/sepolicy.mk

BOARD_SEPOLICY_DIRS += \
   device/samsung/serranovexx-common/sepolicy
