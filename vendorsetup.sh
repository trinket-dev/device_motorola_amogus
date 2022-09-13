CLANGDIR=$PWD/prebuilts/clang/host/linux-x86
if [ ! -d "${CLANGDIR}/clang-r416183b1" ]
then
    GREEN='\033[0;32m'
    NC='\033[0m'
    echo -e "${GREEN}Downloading clang 12${NC}"
    mkdir ${CLANGDIR}/clang-r416183b1
    wget https://android.googlesource.com/platform/prebuilts/clang/host/linux-x86/+archive/refs/tags/android-12.1.0_r1/clang-r416183b1.tar.gz -P ${CLANGDIR}
    tar -C "${CLANGDIR}"/clang-r416183b1/ -zxf "${CLANGDIR}"/clang-r416183b1.tar.gz
    rm ${CLANGDIR}/clang-r416183b1.tar.gz
fi

# Device tree and dependencies.
git clone https://github.com/moto-common/android_device_motorola_common.git -b 13 device/motorola/common && \
rm -rf vendor/qcom/opensource/interfaces && \
git clone https://github.com/moto-common/android_device_qcom_common.git -b 13 device/qcom/common && \
git clone https://github.com/moto-common/android_vendor_motorola_amogus -b 13 vendor/motorola/amogus && \
git clone https://github.com/moto-common/android_vendor_motorola_common -b 13 vendor/motorola/common && \
git clone https://github.com/moto-common/android_vendor_qcom_common -b 13 vendor/qcom/common && \
git clone https://github.com/moto-common/android_kernel_motorola_msm-4.14 -b 13 kernel/motorola/trinket && \
git clone https://github.com/moto-common/platform_vendor_qcom_opensource_interfaces -b 13 vendor/qcom/opensource/interfaces && \
git clone https://github.com/moto-common/android_device_sony_sepolicy device/sony/sepolicy && \
git clone https://github.com/moto-common/android_vendor_sony_timekeep vendor/sony/timekeep && \
git clone https://github.com/moto-common/android_device_motorola_amogus-kernel -b 13 device/motorola/amogus-kernel && \
git clone https://github.com/moto-common/platform_vendor_qcom_opensource_display_sm8150.git -b 13 vendor/qcom/opensource/display/sm8150 && \
git clone https://github.com/moto-common/platform_vendor_qcom_opensource_media_sm8150.git -b 13 vendor/qcom/opensource/media/sm8150 && \
git clone https://github.com/moto-common/platform_vendor_qcom_opensource_audio_sm8150.git -b 13 vendor/qcom/opensource/audio/sm8150 && \
git clone https://github.com/JarlPenguin/platform_hardware_motorola hardware/motorola && \
rm -rf device/qcom/common/vendor/embmssl/Android.bp && \
rm -rf hardware/qcom-caf/wlan && \
rm -rf vendor/qcom/opensource/audio/st-hal && \
rm -rf vendor/qcom/opensource/audio-hal/st-hal && \
rm -rf vendor/qcom/opensource/dataservices && \
git clone https://github.com/moto-common/platform_vendor_qcom_opensource_dataservices vendor/qcom/opensource/dataservices
git clone https://github.com/moto-common/platform_vendor_qcom_opensource_audio_st-hal vendor/qcom/opensource/audio/st-hal
git clone https://github.com/moto-common/platform_vendor_qcom_opensource_display-commonsys-intf vendor/qcom/opensource/display-commonsys-intf && \
git clone https://github.com/moto-common/platform_hardware_qcom-caf_wlan hardware/qcom-caf/wlan && \
cd hardware/qcom/wlan && git fetch https://github.com/ProtonAOSP-NS/hardware_qcom_wlan && git cherry-pick e348c0c238dcd09223e5847d9f86ccf16594b735 && \
cd ../../..

