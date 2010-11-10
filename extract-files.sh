#!/bin/sh

# Copyright (C) 2010 The Android Open Source Project
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

DEVICE=SCH-I500

rm -rf ../../../vendor/samsung/$DEVICE
mkdir -p ../../../vendor/samsung/$DEVICE/proprietary

DIRS="
app
bin
bin/gpsd
etc/dhcpcd/dhcpcd-hooks
etc/ppp
etc/wifi
lib/egl
lib/hw
lib/SCH-I500
tts/lang_pico
xbin
"

for DIR in $DIRS; do
	mkdir -p ../../../vendor/samsung/$DEVICE/proprietary/$DIR
done

FILES="
app/Swype.apk
bin/dhcpcd
bin/drexe
bin/pppd
bin/pppd_runner
bin/rild
bin/rilclient-test
bin/vold
bin/wlservice
bin/wpa_supplicant
bin/wpa_cli
bin/pvrsrvinit
bin/sensorcalibutil_yamaha
bin/sensorstatutil_yamaha
bin/sensorserver_yamaha
bin/gpsd/glgps_samsungJupiter
bin/pv2way_omx_engine_test
bin/hciattach
bin/npsmobex
bin/btld
bin/dbus-daemon
bin/BCM4329B1_002.002.023.0417.0464.hcd

etc/asound.conf
etc/ppp/chap-secrets
etc/ppp/ip-down
etc/ppp/ip-up
etc/ppp/ip-up-vpn
etc/ppp/options
etc/ppp/pap-secrets
etc/vold.conf
etc/wifi/nvram_net.txt
etc/wifi/nvram_mfg.txt
etc/wifi/bcm4329_aps.bin
etc/wifi/bcm4329_mfg.bin
etc/wifi/bcm4329_sta.bin
etc/wifi/wifi.conf
etc/wifi/wpa_supplicant.conf
etc/apns-conf.xml
etc/cdma-carriers-conf.xml
etc/dhcpcd/dhcpcd-hooks/01-test
etc/dhcpcd/dhcpcd-hooks/20-dns.conf
etc/dhcpcd/dhcpcd-hooks/95-configured
etc/dhcpcd/dhcpcd.conf
etc/dhcpcd/dhcpcd-run-hooks
etc/gps.conf
etc/jupiter.xml
etc/pvOMXcfg.ini

lib/libgps.so
lib/libsecgps.so
lib/libril.so
lib/libsec-ril40.so
lib/libreference-ril.so
lib/libsecril-client.so
lib/libwlservice.so

lib/libarccamera.so
lib/libcamerafirmwarejni.so
lib/libcamera.so
lib/libseccameraadaptor.so
lib/libseccamera.so
lib/libs3cjpeg.so

lib/libspeech.so
lib/libgtalk_jni.so
lib/libhardware.so
lib/libhardware_legacy.so
lib/libSwypeCore.so

lib/libs263domxoc.so
lib/libs263eomxoc.so
lib/libs264domxoc.so
lib/libs264eomxoc.so
lib/libsaacdomxoc.so
lib/libsaaceomxoc.so
lib/libsac3domxoc.so
lib/libsamrdomxoc.so
lib/libsamreomxoc.so
lib/libsdiv3domxoc.so
lib/libsflacdomxoc.so
lib/libsmp3domxoc.so
lib/libsmp4fmocn.so
lib/libsmp4vdomxoc.so
lib/libsmp4veomxoc.so
lib/libsvc1domxoc.so
lib/libswmadomxoc.so
lib/libswmv7domxoc.so
lib/libswmv8domxoc.so
lib/libSecOMXCore.so
lib/libsoloomx_wmadec_sharedlibrary.so
lib/libsoloomx_wmvdec_sharedlibrary.so
lib/libomx_evrcdec_sharedlibrary.so
lib/libomx_evrcenc_sharedlibrary.so
lib/libomx_qcelpdec_sharedlibrary.so
lib/libomx_qcelpenc_sharedlibrary.so
lib/libsoloomx_sharedlibrary.so
lib/libsoloomx_wrapper_sharedlibrary.so

lib/egl/libEGL_POWERVR_SGX540_120.so
lib/egl/libGLES_android.so
lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so
lib/egl/libGLESv2_POWERVR_SGX540_120.so
lib/libsrv_um.so
lib/libsrv_init.so
lib/libIMGegl.so
lib/libpvr2d.so
lib/libpvrANDROID_WSEGL.so
lib/libglslcompiler.so

lib/libsensor_yamaha.so
lib/libsensor_yamaha_test.so
lib/libms3c_yamaha.so
lib/hw/copybit.s5pc110.so
lib/hw/lights.default.so
lib/hw/sensors.SCH-I500.so
lib/hw/gralloc.s5pc110.so

tts/lang_pico/de-DE_gl0_sg.bin
tts/lang_pico/de-DE_ta.bin
tts/lang_pico/en-GB_kh0_sg.bin
tts/lang_pico/en-GB_ta.bin
tts/lang_pico/en-US_lh0_sg.bin
tts/lang_pico/en-US_ta.bin
tts/lang_pico/es-ES_zl0_sg.bin
tts/lang_pico/es-ES_ta.bin
tts/lang_pico/fr-FR_nk0_sg.bin
tts/lang_pico/fr-FR_ta.bin
tts/lang_pico/it-IT_cm0_sg.bin
tts/lang_pico/it-IT_ta.bin

xbin/ipctool
xbin/ipcdump
"

for FILE in $FILES; do
	adb pull system/$FILE ../../../vendor/samsung/$DEVICE/proprietary/$FILE
done

(cat << EOF) | sed s/__DEVICE__/$DEVICE/g > ../../../vendor/samsung/$DEVICE/$DEVICE-vendor-blobs.mk
# Copyright (C) 2010 The Android Open Source Project
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

# This file is generated by device/samsung/__DEVICE__/extract-files.sh

# Prebuilt libraries that are needed to build open-source libraries
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:obj/lib/libsecril-client.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libgps.so:obj/lib/libgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:obj/lib/libsecgps.so
#    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:obj/lib/libcamera.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libseccameraadaptor.so:obj/lib/libseccameraadaptor.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libseccamera.so:obj/lib/libseccamera.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libs3cjpeg.so:obj/lib/libs3cjpeg.so
#    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril40.so:obj/lib/libsec-ril40.so \\

# vold
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/vold:system/bin/vold \\
    vendor/samsung/__DEVICE__/proprietary/etc/vold.conf:system/etc/vold.conf

#
# Wifi
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libwlservice.so:system/lib/libwlservice.so \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_net.txt:system/etc/wifi/nvram_net.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/nvram_mfg.txt:system/etc/wifi/nvram_mfg.txt \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_aps.bin:system/etc/wifi/bcm4329_aps.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_mfg.bin:system/etc/wifi/bcm4329_mfg.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/bcm4329_sta.bin:system/etc/wifi/bcm4329_sta.bin \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wifi.conf:system/etc/wifi/wifi.conf \\
    vendor/samsung/__DEVICE__/proprietary/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \\
    vendor/samsung/__DEVICE__/proprietary/bin/wlservice:system/bin/wlservice \\
    vendor/samsung/__DEVICE__/proprietary/bin/wpa_supplicant:system/bin/wpa_supplicant \\
    vendor/samsung/__DEVICE__/proprietary/bin/wpa_cli:system/bin/wpa_cli

#
# Display (3D)
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/pvrsrvinit:system/bin/pvrsrvinit \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libEGL_POWERVR_SGX540_120.so:system/lib/egl/libEGL_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so:system/lib/egl/libGLESv1_CM_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/egl/libGLESv2_POWERVR_SGX540_120.so:system/lib/egl/libGLESv2_POWERVR_SGX540_120.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsrv_um.so:system/lib/libsrv_um.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsrv_init.so:system/lib/libsrv_init.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libIMGegl.so:system/lib/libIMGegl.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libpvr2d.so:system/lib/libpvr2d.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libpvrANDROID_WSEGL.so:system/lib/libpvrANDROID_WSEGL.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libglslcompiler.so:system/lib/libglslcompiler.so

#
# Sensors, Lights etc
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/copybit.s5pc110.so:system/lib/hw/copybit.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/lights.default.so:system/lib/hw/lights.default.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/sensors.SCH-I500.so:system/lib/hw/sensors.SCH-I500.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/hw/gralloc.s5pc110.so:system/lib/hw/gralloc.s5pc110.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha.so:system/lib/libsensor_yamaha.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsensor_yamaha_test.so:system/lib/libsensor_yamaha_test.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libms3c_yamaha.so:system/lib/libms3c_yamaha.so \\
    vendor/samsung/__DEVICE__/proprietary/bin/sensorcalibutil_yamaha:system/bin/sensorcalibutil_yamaha \\
    vendor/samsung/__DEVICE__/proprietary/bin/sensorserver_yamaha:system/bin/sensorserver_yamaha \\
    vendor/samsung/__DEVICE__/proprietary/bin/sensorstatutil_yamaha:system/bin/sensorstatutil_yamaha

#
# Camera
#
#PRODUCT_COPY_FILES += \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libarccamera.so:system/lib/libarccamera.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libcamerafirmwarejni.so:system/lib/libcamerafirmwarejni.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libcamera.so:system/lib/libcamera.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libseccameraadaptor.so:system/lib/libseccameraadaptor.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libseccamera.so:system/lib/libseccamera.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libs3cjpeg.so:system/lib/libs3cjpeg.so

#
# RIL
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsec-ril40.so:system/lib/libsec-ril40.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecril-client.so:system/lib/libsecril-client.so \\
    vendor/samsung/__DEVICE__/proprietary/etc/apns-conf.xml:system/etc/apns-conf.xml \\
    vendor/samsung/__DEVICE__/proprietary/etc/cdma-carriers-conf.xml:system/etc/cdma-carriers-conf.xml \\
    vendor/samsung/__DEVICE__/proprietary/xbin/ipctool:system/xbin/ipctool \\
    vendor/samsung/__DEVICE__/proprietary/xbin/ipcdump:system/xbin/ipcdump \\
    vendor/samsung/__DEVICE__/proprietary/bin/dhcpcd:system/bin/dhcpcd \\
    vendor/samsung/__DEVICE__/proprietary/bin/drexe:system/bin/drexe \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/01-test:system/etc/dhcpcd/dhcpcd-hooks/01-test \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/20-dns.conf:system/etc/dhcpcd/dhcpcd-hooks/20-dns.conf \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-hooks/95-configured:system/etc/dhcpcd/dhcpcd-hooks/95-configured \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd-run-hooks:system/etc/dhcpcd/dhcpcd-run-hooks \\
    vendor/samsung/__DEVICE__/proprietary/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \\
    vendor/samsung/__DEVICE__/proprietary/bin/rilclient-test:system/bin/rilclient-test \\
    vendor/samsung/__DEVICE__/proprietary/bin/rild:system/bin/rild \\
    vendor/samsung/__DEVICE__/proprietary/lib/libril.so:system/lib/libril.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libreference-ril.so:system/lib/libreference-ril.so

#
# GPS
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libgps.so:system/lib/libgps.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsecgps.so:system/lib/libsecgps.so \\
    vendor/samsung/__DEVICE__/proprietary/bin/gpsd/glgps_samsungJupiter:system/bin/gpsd/glgps_samsungJupiter \\
    vendor/samsung/__DEVICE__/proprietary/etc/gps.conf:system/etc/gps.conf \\
    vendor/samsung/__DEVICE__/proprietary/etc/jupiter.xml:system/etc/jupiter.xml

#
# OMX
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs263domxoc.so:system/lib/libs263domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs263eomxoc.so:system/lib/libs263eomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs264domxoc.so:system/lib/libs264domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libs264eomxoc.so:system/lib/libs264eomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsaacdomxoc.so:system/lib/libsaacdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsaaceomxoc.so:system/lib/libsaaceomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsac3domxoc.so:system/lib/libsac3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsamrdomxoc.so:system/lib/libsamrdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsamreomxoc.so:system/lib/libsamreomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsdiv3domxoc.so:system/lib/libsdiv3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsflacdomxoc.so:system/lib/libsflacdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp3domxoc.so:system/lib/libsmp3domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4fmocn.so:system/lib/libsmp4fmocn.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4vdomxoc.so:system/lib/libsmp4vdomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsmp4veomxoc.so:system/lib/libsmp4veomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsvc1domxoc.so:system/lib/libsvc1domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmadomxoc.so:system/lib/libswmadomxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmv7domxoc.so:system/lib/libswmv7domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libswmv8domxoc.so:system/lib/libswmv8domxoc.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libSecOMXCore.so:system/lib/libSecOMXCore.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsoloomx_wmadec_sharedlibrary.so:system/lib/libsoloomx_wmadec_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsoloomx_wmvdec_sharedlibrary.so:system/lib/libsoloomx_wmvdec_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libomx_evrcdec_sharedlibrary.so:system/lib/libomx_evrcdec_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libomx_evrcenc_sharedlibrary.so:system/lib/libomx_evrcenc_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libomx_qcelpdec_sharedlibrary.so:system/lib/libomx_qcelpdec_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libomx_qcelpenc_sharedlibrary.so:system/lib/libomx_qcelpenc_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsoloomx_sharedlibrary.so:system/lib/libsoloomx_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libsoloomx_wrapper_sharedlibrary.so:system/lib/libsoloomx_wrapper_sharedlibrary.so \\
    vendor/samsung/__DEVICE__/proprietary/etc/pvOMXcfg.ini:system/etc/pvOMXcfg.ini \\
    vendor/samsung/__DEVICE__/proprietary/bin/pv2way_omx_engine_test:system/bin/pv2way_omx_engine_test

#
# Audio
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/etc/asound.conf:system/etc/asound.conf

#
# Voice Search
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/lib/libgtalk_jni.so:system/lib/libgtalk_jni.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libspeech.so:system/lib/libspeech.so \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/de-DE_gl0_sg.bin:system/tts/lang_pico/de-DE_gl0_sg.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/de-DE_ta.bin:system/tts/lang_pico/de-DE_ta.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/en-GB_kh0_sg.bin:system/tts/lang_pico/en-GB_kh0_sg.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/en-GB_ta.bin:system/tts/lang_pico/en-GB_ta.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/en-US_lh0_sg.bin:system/tts/lang_pico/en-US_lh0_sg.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/en-US_ta.bin:system/tts/lang_pico/en-US_ta.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/es-ES_zl0_sg.bin:system/tts/lang_pico/es-ES_zl0_sg.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/es-ES_ta.bin:system/tts/lang_pico/es-ES_ta.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/fr-FR_nk0_sg.bin:system/tts/lang_pico/fr-FR_nk0_sg.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/fr-FR_ta.bin:system/tts/lang_pico/fr-FR_ta.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/it-IT_cm0_sg.bin:system/tts/lang_pico/it-IT_cm0_sg.bin \\
    vendor/samsung/__DEVICE__/proprietary/tts/lang_pico/it-IT_ta.bin:system/tts/lang_pico/it-IT_ta.bin

#
# Other stuff
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/bin/hciattach:system/bin/hciattach \\
    vendor/samsung/__DEVICE__/proprietary/bin/npsmobex:system/bin/npsmobex \\
    vendor/samsung/__DEVICE__/proprietary/bin/BCM4329B1_002.002.023.0417.0464.hcd:system/bin/BCM4329B1_002.002.023.0417.0464.hcd \\
    vendor/samsung/__DEVICE__/proprietary/bin/btld:system/bin/btld \\
    vendor/samsung/__DEVICE__/proprietary/bin/dbus-daemon:system/bin/dbus-daemon
#    vendor/samsung/__DEVICE__/proprietary/lib/libhardware.so:system/lib/libhardware.so \\
#    vendor/samsung/__DEVICE__/proprietary/lib/libhardware_legacy.so:system/lib/libhardware_legacy.so

#
# Swype (cuz it works :P)
#
PRODUCT_COPY_FILES += \\
    vendor/samsung/__DEVICE__/proprietary/app/Swype.apk:system/app/Swype.apk \\
    vendor/samsung/__DEVICE__/proprietary/lib/libSwypeCore.so:system/lib/SCH-I500/libSwypeCore.so \\
    vendor/samsung/__DEVICE__/proprietary/lib/libSwypeCore.so:system/lib/libSwypeCore.so

EOF

./setup-makefiles.sh