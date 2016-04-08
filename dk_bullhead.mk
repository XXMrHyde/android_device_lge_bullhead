#
# Copyright 2015 The Android Open Source Project
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

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)

# Get the long list of APNs
PRODUCT_COPY_FILES := device/lge/bullhead/apns-full-conf.xml:system/etc/apns-conf.xml

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base_telephony.mk)

# Inherit from the darkkat vendor common configuration
$(call inherit-product, vendor/dk/config/common.mk)

PRODUCT_NAME := dk_bullhead
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := Android
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="google/bullhead/bullhead:6.0.1/MHC19Q/2705526:user/release-keys" \
    PRIVATE_BUILD_DESC="bullhead-user 6.0.1 MHC19Q 2705526 release-keys"

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/msm/bullhead
TARGET_KERNEL_CONFIG := bullhead_defconfig
TARGET_VARIANT_CONFIG := bullhead_defconfig
TARGET_SELINUX_CONFIG := bullhead_defconfig
BOARD_KERNEL_IMAGE_NAME  := Image.gz-dtb

TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_HEADER_ARCH := arm64
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-
TARGET_USES_UNCOMPRESSED_KERNEL := true

# Enable vendor image symlink
BOARD_NEEDS_VENDORIMAGE_SYMLINK := true

# Bootanimation
PRODUCT_COPY_FILES += \
  device/lge/hammerhead/bootanimation/bootanimation.zip:system/media/bootanimation.zip

$(call inherit-product, device/lge/bullhead/device.mk)
$(call inherit-product-if-exists, vendor/lge/bullhead/device-vendor.mk)

PRODUCT_PACKAGES += \
    Launcher3

