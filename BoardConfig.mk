#
# Copyright (C) 2018-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

BOARD_VENDOR := xiaomi

DEVICE_PATH := device/xiaomi/dipper

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT:= kryo385

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := kryo385

# Assert
TARGET_OTA_ASSERT_DEVICE := dipper

# Audio
TARGET_PROVIDES_AUDIO_EXTNS := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := sdm845
TARGET_NO_BOOTLOADER := true

# Broken rules
BUILD_BROKEN_DUP_RULES := true
BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Display
TARGET_SCREEN_DENSITY := 440

# Dolby
include vendor/dolby/ds/BoardConfigDolby.mk

# Filesystem
TARGET_FS_CONFIG_GEN := $(DEVICE_PATH)/configs/config.fs

# Graphics
TARGET_HAS_WIDE_COLOR_DISPLAY := true
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true
TARGET_USES_ION := true

# HIDL
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/hidl/manifest.xml
DEVICE_MANIFEST_FILE := $(DEVICE_PATH)/configs/nfc/manifest_nfc.xml
DEVICE_MATRIX_FILE := $(DEVICE_PATH)/configs/hidl/compatibility_matrix.xml

# Kernel
BOARD_BOOT_HEADER_VERSION := 1
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := \
	console=ttyMSM0,115200n8 \
	earlycon=msm_geni_serial,0xA84000 \
	androidboot.hardware=qcom \
	androidboot.console=ttyMSM0 \
	androidboot.usbcontroller=a600000.dwc3 \
	ehci-hcd.park=3 \
	lpm_levels.sleep_disabled=1 \
	msm_rtb.filter=0x237 \
	service_locator.enable=1 \
	swiotlb=2048 \
	loop.max_part=7 \
	androidboot.configfs=true \
	androidboot.boot_devices=soc/1d84000.ufshc \
	cgroup_disable=pressure
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS += --header_version $(BOARD_BOOT_HEADER_VERSION)

# Kernel - Config
TARGET_KERNEL_SOURCE := kernel/xiaomi/dipper
TARGET_KERNEL_CONFIG := dipper_defconfig

# Kernel - Clang
TARGET_KERNEL_CLANG_VERSION := prelude
KERNEL_TOOLCHAIN := $(shell pwd)/prebuilts/clang/host/linux-x86/clang-prelude/bin
KERNEL_SUPPORTS_LLVM_TOOLS := true

# LMKD
TARGET_LMKD_STATS_LOG := true

# Partitions - Flash Size
BOARD_FLASH_BLOCK_SIZE := 					262144 # (BOARD_KERNEL_PAGESIZE * 64)

# Partitions - Metadata
BOARD_USES_METADATA_PARTITION := true
TARGET_USES_LOGDUMP_AS_METADATA := true

# Partitions - Sizes
BOARD_BOOTIMAGE_PARTITION_SIZE := 			67092480
BOARD_CACHEIMAGE_PARTITION_SIZE := 			268435456
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 		67108864
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 		3221225472
BOARD_USERDATAIMAGE_PARTITION_SIZE := 		57453555712
BOARD_SYSTEM_EXTIMAGE_PARTITION_SIZE := 	872415232
BOARD_VENDORIMAGE_PARTITION_SIZE := 		1073741824

# Partitions - Type
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := 	  	ext4
BOARD_SYSTEM_EXTIMAGE_FILE_SYSTEM_TYPE := 	ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := 	  	ext4

# Partitions - Uses
TARGET_USERIMAGES_USE_EXT4 := 				true
TARGET_USERIMAGES_USE_F2FS := 				true
TARGET_USERIMAGES_SPARSE_EXT_DISABLED := 	false

# Partitions - Out
TARGET_COPY_OUT_SYSTEM_EXT := 				system_ext
TARGET_COPY_OUT_VENDOR := 					vendor

# Platform
BOARD_VENDOR := xiaomi
TARGET_BOARD_PLATFORM := sdm845

# Power
TARGET_POWERHAL_MODE_EXT := $(DEVICE_PATH)/power/power-mode.cpp

# Properties
TARGET_ODM_PROP += $(DEVICE_PATH)/props/odm.prop
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/props/product.prop
TARGET_SYSTEM_EXT_PROP += $(DEVICE_PATH)/props/system_ext.prop
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/props/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/props/vendor.prop

# QCOM
BOARD_USES_QCOM_HARDWARE := true
TARGET_FWK_SUPPORTS_FULL_VALUEADDS := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.qcom
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888

# Releasetools
TARGET_RECOVERY_UPDATER_LIBS := librecovery_updater_xiaomi
TARGET_RELEASETOOLS_EXTENSIONS := $(DEVICE_PATH)

# RIL
ENABLE_VENDOR_RIL_SERVICE := true

# Security patch level
VENDOR_SECURITY_PATCH := 2020-12-01

# SELinux
include device/qcom/sepolicy_vndr-legacy-um/SEPolicy.mk
SELINUX_IGNORE_NEVERALLOWS := true
BOARD_VENDOR_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/vendor
PRODUCT_PRIVATE_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/private
PRODUCT_PUBLIC_SEPOLICY_DIRS += $(DEVICE_PATH)/sepolicy/public

# Vendor
include vendor/xiaomi/dipper/BoardConfigVendor.mk

# Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --set_hashtree_disabled_flag
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flags 2
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1

# WiFi
BOARD_WLAN_DEVICE := qcwcn
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
WIFI_DRIVER_DEFAULT := qca_cld3
WIFI_DRIVER_STATE_CTRL_PARAM := "/dev/wlan"
WIFI_DRIVER_STATE_OFF := "OFF"
WIFI_DRIVER_STATE_ON := "ON"
WIFI_HIDL_FEATURE_DUAL_INTERFACE := true
WIFI_HIDL_UNIFIED_SUPPLICANT_SERVICE_RC_ENTRY := true
WPA_SUPPLICANT_VERSION := VER_0_8_X
