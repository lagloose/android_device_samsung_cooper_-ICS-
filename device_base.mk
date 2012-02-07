# Copyright (C) 2009 The Android Open Source Project
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
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.

$(call inherit-product, device/common/gps/gps_eu_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/cooper/overlay

ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := device/samsung/cooper/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Live wallpaper packages
PRODUCT_PACKAGES += \
    make_ext4fs \
    brcm_patchram_plus \
    copybit.cooper \
    gralloc.cooper \
    sensors.cooper \
    lights.cooper \
    audio_policy.default \
    hwcomposer.default \
    bdaddr_read \
    setup_fs 

## Vold config
PRODUCT_COPY_FILES += \
    device/samsung/cooper/vold.fstab:system/etc/vold.fstab

## Hardware properties 
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.location.xml:system/etc/permissions/android.hardware.location.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml \
    frameworks/base/data/etc/android.software.sip.xml:system/etc/permissions/android.software.sip.xml \
    frameworks/base/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

## Board-specific init
PRODUCT_COPY_FILES += \
    device/samsung/cooper/ueventd.gt-s5830.rc:root/ueventd.gt-s5830.rc \
    device/samsung/cooper/default.prop:root/default.prop \
    device/samsung/cooper/prebuilt/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/cooper/prebuilt/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/cooper/prebuilt/rfs_fat.ko:root/lib/modules/rfs_fat.ko \
    device/samsung/cooper/prebuilt/rfs_glue.ko:root/lib/modules/rfs_glue.ko \
    device/samsung/cooper/prebuilt/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/cooper/prebuilt/lzo_compress.ko:system/lib/modules/lzo_compress.ko \
    device/samsung/cooper/prebuilt/lzo_decompress.ko:system/lib/modules/lzo_decompress.ko \
    device/samsung/cooper/COOPER.rle:root/COOPER.rle \
    device/samsung/cooper/init.gt-s5830.rc:root/init.gt-s5830.rc \
    device/samsung/cooper/prebuilt/ramzswap.ko:system/lib/modules/ramzswap.ko 

## wifi module
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/ar6000.ko:system/wifi/ar6000.ko \
    device/samsung/cooper/prebuilt/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/cooper/prebuilt/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/cooper/prebuilt/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/cooper/prebuilt/bdata.SD31.bin.01:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.01 \
    device/samsung/cooper/prebuilt/bdata.SD31.bin.02:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.02 \
    device/samsung/cooper/prebuilt/bdata.SD31.bin.03:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.03 \
    device/samsung/cooper/prebuilt/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/cooper/prebuilt/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77 \
    device/samsung/cooper/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/cooper/prebuilt/wlan_mac:system/bin/wlan_mac \
    device/samsung/cooper/prebuilt/wlan_tool:system/bin/wlan_tool \
    device/samsung/cooper/prebuilt/wmiconfig:system/bin/wmiconfig 

## Wifi Stuff
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/cooper/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf \
    device/samsung/cooper/prebuilt/dhcpcd.conf:system/etc/wifi/dhcpcd.conf \
    device/samsung/cooper/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf 

## Media
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/audio.primary.cooper.so:system/lib/hw/audio.primary.cooper.so\
#    device/samsung/cooper/prebuilt/audio_policy.cooper.so:system/lib/hw/audio_policy.cooper.so\
    device/samsung/cooper/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/samsung/cooper/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/cooper/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/cooper/prebuilt/apns-conf.xml:system/etc/apns-conf.xml \
    device/samsung/cooper/prebuilt/hosts:system/etc/hosts \
    device/samsung/cooper/prebuilt/init.local.rc:system/etc/init.local.rc \
    device/samsung/cooper/prebuilt/sysctl.conf:system/etc/sysctl.conf \
    device/samsung/cooper/prebuilt/media_profiles.xml:system/etc/media_profiles.xml 

## keymap
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/cooper/prebuilt/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/cooper/prebuilt/Generic.kl:system/usr/keylayout/Generic.kl \
    device/samsung/cooper/prebuilt/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/samsung/cooper/prebuilt/sec_key.kl:system/usr/keylayout/sec_key.kl 

## keychar
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/qwerty.kcm:system/usr/keylayout/qwerty.kcm \
    device/samsung/cooper/prebuilt/qwerty2.kcm:system/usr/keylayout/qwerty2.kcm \
    device/samsung/cooper/prebuilt/Virtual.kcm:system/usr/keylayout/Virtual.kcm \
    device/samsung/cooper/prebuilt/Generic.kcm:system/usr/keylayout/Generic.kcm

## Touchscreen
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/sec_touchscreen.idc:system/usr/idc/sec_touchscreen.idc

## Bluetooth
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/BCM2049C0_003.001.031.0088.0094.hcd:system/bin/BCM2049C0_003.001.031.0088.0094.hcd \
    device/samsung/cooper/prebuilt/BCM2049C0_003.001.031.0088.0094.hcd:system/etc/firmware/BCM2049C0_003.001.031.0088.0094.hcd

## Sensor
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/gpsd:system/bin/gpsd \
    device/samsung/cooper/prebuilt/qmuxd:system/bin/qmuxd \
    device/samsung/cooper/prebuilt/gps.msm7k.so:system/vendor/lib/hw/gps.msm7k.so \
    device/samsung/cooper/prebuilt/gps.msm7k.so:system/lib/hw/gps.msm7k.so \
    device/samsung/cooper/prebuilt/gps.cooper.so:system/lib/hw/gps.cooper.so \
    device/samsung/cooper/prebuilt/lights.msm7k.so:system/lib/hw/lights.msm7k.so \
    device/samsung/cooper/prebuilt/sensors.default.so:system/lib/hw/sensors.default.so \
    device/samsung/cooper/prebuilt/gpsd:system/vendor/bin/gpsd \
    device/samsung/cooper/prebuilt/memsicd:system/bin/memsicd 

## 3D
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
    device/samsung/cooper/prebuilt/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
    device/samsung/cooper/prebuilt/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
    device/samsung/cooper/prebuilt/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
    device/samsung/cooper/prebuilt/libgsl.so:system/lib/libgsl.so \
    device/samsung/cooper/prebuilt/egl.cfg:system/lib/egl/egl.cfg 

## GPU firmware
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/cooper/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw

## other media
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/get_macaddrs:system/bin/get_macaddrs

## ril
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/libdiag.so:system/lib/libdiag.so \
    device/samsung/cooper/prebuilt/libsec-ril.so:system/lib/libsec-ril.so \
    device/samsung/cooper/prebuilt/libsecril-client.so:system/lib/libsecril-client.so \
    device/samsung/cooper/prebuilt/libril.so:system/lib/libril.so 

## script
PRODUCT_COPY_FILES += \
    device/samsung/cooper/prebuilt/01sysctl:system/etc/init.d/01sysctl \
    device/samsung/cooper/prebuilt/04modules:system/etc/init.d/04modules \
    device/samsung/cooper/prebuilt/20userinit:system/etc/init.d/20userinit \
    device/samsung/cooper/prebuilt/99complete:system/etc/init.d/99complete 

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.com.android.dateformat=dd-MM-yyyy \

# LDPI assets
PRODUCT_LOCALES += en
PRODUCT_AAPT_CONFIG := normal ldpi mdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi
$(call inherit-product, build/target/product/full_base.mk)
