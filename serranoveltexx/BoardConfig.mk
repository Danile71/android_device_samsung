# Copyright (C) 2015 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# Inherit from common fortuna-common
-include device/samsung/serranovexx-common/BoardConfigCommon.mk

LOCAL_PATH := device/samsung/serranoveltexx
SAMSUNG_TARGETS := serranoveltexx

# Assert
TARGET_OTA_ASSERT_DEVICE := samsung_sm_I9195I

# Misc.
TARGET_SYSTEM_PROP                              := device/samsung/serranoveltexx/system.prop

# Kernel
TARGET_KERNEL_SOURCE         := kernel/samsung/serranovexx
TARGET_KERNEL_CONFIG := msm8916_sec_defconfig
TARGET_KERNEL_VARIANT_CONFIG := msm8916_sec_serranovelte_eur_defconfig


# Vendor Init
TARGET_UNIFIED_DEVICE                := true
TARGET_INIT_VENDOR_LIB               := libinit_serranoveltexx
TARGET_RECOVERY_DEVICE_MODULES       := libinit_serranoveltexx

