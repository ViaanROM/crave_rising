# Black Iron Project ROM for OnePlus Nord CE 3 Lite 5G (larry)
rm -rf .repo/local_manifests; \
rm -rf {device,vendor,kernel,hardware}/oneplus; \
rm -rf prebuilts/clang/host/linux-x86 ; \
repo init -u https://github.com/Black-Iron-Project/manifest -b v15_QPR2 --git-lfs; \
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all); \
git clone https://github.com/ViaanROM/android_device_oneplus_larry -b lineage-22.2 device/oneplus/larry && \
git clone https://github.com/ViaanROM/android_device_oneplus_sm6375-common -b lineage-22.2 device/oneplus/sm6375-common && \
git clone https://github.com/ViaanROM/proprietary_vendor_oneplus_larry -b lineage-22.2 vendor/oneplus/larry && \
git clone https://github.com/ViaanROM/proprietary_vendor_oneplus_sm6375-common -b lineage-22.2 vendor/oneplus/sm6375-common && \
git clone https://github.com/ViaanROM/android_kernel_oneplus_sm6375 -b lineage-22.2 kernel/oneplus/sm6375 && \
git clone https://github.com/ViaanROM/android_hardware_oplus -b lineage-22.2 hardware/oplus; \
source build/envsetup.sh
lunch lineage_larry-user
m bacon
