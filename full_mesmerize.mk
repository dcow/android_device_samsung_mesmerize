#
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

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#
$(call inherit-product, device/samsung/common/galaxys.mk)

# use libs from nexus s
$(call inherit-product, device/samsung/common/galaxys.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

## (1) First, the most specific values, i.e. the aspects that are specific to GSM
PRODUCT_COPY_FILES += \
    device/samsung/mesmerize/apns-conf.xml:system/etc/apns-conf.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/mesmerize/mesmerize-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libsec-ril40.so \
    rild.libargs=-d[SPACE]/dev/ttyS0 \
    wifi.interface=eth0 \
    wifi.supplicant_scan_interval=15 \
    ro.wifi.channels=11

#verizon cdma stuff
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.clientidbase=android-samsung \
	ro.com.google.clientidbase.yt=android-samsung \
	ro.com.google.clientidbase.am=android-samsung \
	ro.com.google.clientidbase.vs=android-samsung \
	ro.com.google.clientidbase.gmm=android-samsung \
	ro.cdma.home.operator.numeric=310730 \
	ro.cdma.home.operator.alpha=USCellular \
  	net.cdma.pppd.authtype=require-chap \
	net.cdma.pppd.user=user[SPACE]USCellular \
	net.cdma.datalinkinterface=/dev/ttyCDMA0 \
	net.interfaces.defaultroute=cdma \
	net.cdma.ppp.interface=ppp0 \
	net.connectivity.type=CDMA1 \
	gsm.operator.alpha=USCC \
	gsm.operator.numeric=310730 \
	gsm.operator.iso-country=us \
	gsm.operator.isroaming=false \
	gsm.current.phone-type=2 \
	ro.csc.sales_code=USCC \
	ril.sales_code=USCC \
	ro.carrier=U.S.[SPACE]Cellular \
	net.dns1=8.8.8.8 \
	net.dns2=8.8.4.4 \
	mobiledata.interfaces=eth0,ppp0

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.startheapsize=8m \
    dalvik.vm.heapsize=48m

# For mobiledatainterfaces
PRODUCT_PROPERTY_OVERRIDES += \
    mobiledata.interfaces=eth0,ppp0

# Fascinate uses high-density artwork where available
PRODUCT_LOCALES := hdpi

DEVICE_PACKAGE_OVERLAYS += device/samsung/mesmerize/overlay

# media profiles and capabilities spec
$(call inherit-product, device/samsung/mesmerize/media_a1026.mk)
# media config xml file
PRODUCT_COPY_FILES += \
    device/samsung/mesmerize/media_profiles.xml:system/etc/media_profiles.xml

# asound.conf
PRODUCT_COPY_FILES += \
    device/samsung/mesmerize/prebuilt/asound.conf:system/etc/asound.conf

# vold
PRODUCT_COPY_FILES += \
    device/samsung/mesmerize/prebuilt/vold.fstab:system/etc/vold.fstab

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/handheld_core_hardware.xml

# Keylayout / Keychars
PRODUCT_COPY_FILES += \
     device/samsung/mesmerize/prebuilt/keylayout/s3c-keypad.kl:system/usr/keylayout/s3c-keypad.kl \
     device/samsung/mesmerize/prebuilt/keylayout/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
     device/samsung/mesmerize/prebuilt/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
     device/samsung/mesmerize/prebuilt/keylayout/melfas-touchkey.kl:system/usr/keylayout/melfas-touchkey.kl \
     device/samsung/mesmerize/prebuilt/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
     device/samsung/mesmerize/prebuilt/keychars/s3c-keypad.kcm.bin:system/usr/keychars/s3c-keypad.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/sec_jack.kcm.bin:system/usr/keychars/sec_jack.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/melfas-touchkey.kcm.bin:system/usr/keychars/melfas-touchkey.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/s3c-keypad-rev0050.kcm.bin:system/usr/keychars/s3c-keypad-rev0050.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/s3c-keypad-rev0040.kcm.bin:system/usr/keychars/s3c-keypad-rev0040.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/s3c-keypad-rev0030.kcm.bin:system/usr/keychars/s3c-keypad-rev0030.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/s3c-keypad-rev0000.kcm.bin:system/usr/keychars/s3c-keypad-rev0000.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/melfas_ts_input.kcm.bin:system/usr/keychars/melfas_ts_input.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/optjoy_device.kcm.bin:system/usr/keychars/optjoy_device.kcm.bin \
     device/samsung/mesmerize/prebuilt/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin  

# Dict stuff
PRODUCT_COPY_FILES += \
     device/samsung/mesmerize/prebuilt/config/en.us/baseline.par:system/usr/config/en.us/baseline.par \
     device/samsung/mesmerize/prebuilt/config/en.us/baseline8k.par:system/usr/config/en.us/baseline8k.par \
     device/samsung/mesmerize/prebuilt/config/en.us/baseline11k.par:system/usr/config/en.us/baseline11k.par \
     device/samsung/mesmerize/prebuilt/config/en.us/dictionary/basic.ok:system/usr/config/en.us/dictionary/basic.ok \
     device/samsung/mesmerize/prebuilt/config/en.us/dictionary/cmu6plus.ok.zip:system/usr/config/en.us/dictionary/cmu6plus.ok.zip \
     device/samsung/mesmerize/prebuilt/config/en.us/dictionary/enroll.ok:system/usr/config/en.us/dictionary/enroll.ok \
     device/samsung/mesmerize/prebuilt/config/en.us/g2p/en-US-ttp.data:system/usr/config/en.us/g2p/en-US-ttp.data \
     device/samsung/mesmerize/prebuilt/config/en.us/grammars/boolean.g2g:system/usr/config/en.us/grammars/boolean.g2g \
     device/samsung/mesmerize/prebuilt/config/en.us/grammars/phone_type_choice.g2g:system/usr/config/en.us/grammars/phone_type_choice.g2g \
     device/samsung/mesmerize/prebuilt/config/en.us/grammars/VoiceDialer.g2g:system/usr/config/en.us/grammars/VoiceDialer.g2g \
     device/samsung/mesmerize/prebuilt/config/en.us/models/generic.swiarb:system/usr/config/en.us/models/generic.swiarb \
     device/samsung/mesmerize/prebuilt/config/en.us/models/generic8.lda:system/usr/config/en.us/models/generic8.lda \
     device/samsung/mesmerize/prebuilt/config/en.us/models/generic8_f.swimdl:system/usr/config/en.us/models/generic8_f.swimdl \
     device/samsung/mesmerize/prebuilt/config/en.us/models/generic8_m.swimdl:system/usr/config/en.us/models/generic8_m.swimdl \
     device/samsung/mesmerize/prebuilt/config/en.us/models/generic11.lda:system/usr/config/en.us/models/generic11.lda \
     device/samsung/mesmerize/prebuilt/config/en.us/models/generic11_f.swimdl:system/usr/config/en.us/models/generic11_f.swimdl \
     device/samsung/mesmerize/prebuilt/config/en.us/models/generic11_m.swimdl:system/usr/config/en.us/models/generic11_m.swimdl

# Kernel
ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/samsung/mesmerize/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, build/target/product/full.mk)

PRODUCT_NAME := full_mesmerize
PRODUCT_DEVICE := mesmerize
PRODUCT_MODEL := Mesmerize
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := Samsung
PRODUCT_POLICY := android.policy_phone

PRODUCT_BUILD_PROP_OVERRIDES := PRODUCT_NAME=SCH-I500 PRODUCT_DEVICE=SCH-I500 PRODUCT_MODEL=SCH-I500 BUILD_FINGERPRINT=google/passion/passion/mahimahi:2.2.1/FRG83/60505:user/release-keys PRIVATE_BUILD_DESC="passion-user 2.2.1 FRG83 60505 release-keys"

PRODUCT_PROPERTY_OVERRIDES += \
        ro.modversion=Vanilla_FroYo-$(shell date +%m%d-%R)

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.execution-mode=int:jit \
	ro.kernel.android.checkjni=0


