# === RisingOS Revived Build Script for Nord CE 3 Lite (larry) ===

# Clean previous local sources
rm -rf .repo/local_manifests
rm -rf device/oneplus
rm -rf vendor/oneplus
rm -rf kernel/oneplus
rm -rf hardware/oplus
rm -rf prebuilts/clang/host/linux-x86

# Repo Init & Sync
repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --depth=1 --git-lfs
# Sync Repos
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

# Clone Trees and Blobs
git clone https://github.com/ViaanROM/android_device_oneplus_larry -b lineage-22.2 device/oneplus/larry
git clone https://github.com/ViaanROM/android_device_oneplus_sm6375-common -b lineage-22.2 device/oneplus/sm6375-common
git clone https://github.com/ViaanROM/proprietary_vendor_oneplus_larry -b lineage-22.2 vendor/oneplus/larry
git clone https://github.com/ViaanROM/proprietary_vendor_oneplus_sm6375-common -b lineage-22.2 vendor/oneplus/sm6375-common
git clone https://github.com/ViaanROM/android_kernel_oneplus_sm6375 -b lineage-22.2 kernel/oneplus/sm6375
git clone https://github.com/ViaanROM/android_hardware_oplus -b lineage-22.2 hardware/oplus

# Build the ROM
source build/envsetup.sh
riseup larry user
rise b


