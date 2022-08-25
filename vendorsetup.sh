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
rm -rf vendor/qcom/opensource/interfaces; git clone https://github.com/trinket-dev/device_motorola_common -b 13 device/motorola/common; git clone https://github.com/trinket-dev/device_qcom_common -b 13 device/qcom/common; git clone https://github.com/moto-common/android_vendor_motorola_amogus -b 13 vendor/motorola/amogus; git clone https://github.com/moto-common/android_vendor_motorola_common -b 13 vendor/motorola/common; git clone https://github.com/moto-common/android_vendor_qcom_common -b 13 vendor/qcom/common; git clone https://github.com/moto-common/android_kernel_motorola_msm-4.14 -b 12-tmp-2 kernel/motorola/trinket; git clone https://github.com/moto-common/platform_vendor_qcom_opensource_interfaces -b 13 vendor/qcom/opensource/interfaces; git clone https://github.com/moto-common/android_device_sony_sepolicy device/sony/sepolicy; git clone https://github.com/moto-common/android_vendor_sony_timekeep vendor/sony/timekeep; rm -rf hardware/qcom-caf/sm8150/audio; rm -rf hardware/qcom-caf/sm8150/display; git clone https://github.com/trinket-dev/android_hardware_qcom_audio hardware/qcom-caf/sm8150/audio; git clone https://github.com/trinket-dev/android_hardware_qcom_display hardware/qcom-caf/sm8150/display; cd hardware/qcom-caf/sm8150/audio; sed -i "s|vendor/qcom/opensource/audio-hal/primary-hal|hardware/qcom-caf/sm8150/audio|" configs/trinket/trinket.mk; cd ../../../..; git clone https://github.com/moto-common/android_device_motorola_amogus-kernel -b 13 device/motorola/amogus-kernel
