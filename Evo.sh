repo init -u https://github.com/Evolution-X/manifest -b bka --depth=1 --git-lfs
/opt/crave/resync.sh
git clone https://github.com/anshedu/android_device_oneplus_larry -b lineage-22.2 device/oneplus/larry && \
git clone https://github.com/anshedu/android_device_oneplus_sm6375-common -b lineage-22.2 device/oneplus/sm6375-common && \
git clone https://github.com/anshedu/proprietary_vendor_oneplus_larry -b lineage-22.2 vendor/oneplus/larry && \
git clone https://github.com/anshedu/proprietary_vendor_oneplus_sm6375-common -b lineage-22.2 vendor/oneplus/sm6375-common && \
git clone https://github.com/anshedu/android_kernel_oneplus_sm6375 -b lineage-22.2 kernel/oneplus/sm6375 && \
git clone https://github.com/anshedu/android_hardware_oplus -b lineage-22.2 hardware/oplus
source build/envsetup.sh
lunch lineage_larry-bp2a-user
m evolution
