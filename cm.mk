## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common google stuff.
# $(call inherit-product, vendor/google/gapps.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/cooper/full_cooper.mk)

PRODUCT_NAME := cm_cooper

# Release name and versioning
PRODUCT_RELEASE_NAME := GalaxyAce
PRODUCT_VERSION_DEVICE_SPECIFIC := -GT-S5830
-include vendor/cm/config/common_versions.mk

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := cooper

