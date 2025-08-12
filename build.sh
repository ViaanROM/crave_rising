#!/bin/bash
# === RisingOS Revived Build Script for Nord CE 3 Lite (larry) ===

# --- Clean previous local sources ---
rm -rf .repo/local_manifests
rm -rf device/oneplus
rm -rf vendor/oneplus
rm -rf kernel/oneplus
rm -rf hardware/oplus
rm -rf prebuilts/clang/host/linux-x86

# --- Repo Init & Sync ---
repo init -u https://github.com/RisingOS-Revived/android -b sixteen --depth=1 --git-lfs
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

# --- Clone Trees and Blobs ---
git clone https://github.com/ViaanROM/android_device_oneplus_larry -b lineage-22.2 device/oneplus/larry
git clone https://github.com/anshedu/android_device_oneplus_sm6375-common -b lineage-22.2 device/oneplus/sm6375-common
git clone https://github.com/anshedu/proprietary_vendor_oneplus_larry -b lineage-22.2 vendor/oneplus/larry
git clone https://github.com/anshedu/proprietary_vendor_oneplus_sm6375-common -b lineage-22.2 vendor/oneplus/sm6375-common
git clone https://github.com/anshedu/android_kernel_oneplus_sm6375 -b lineage-22.2 kernel/oneplus/sm6375
git clone https://github.com/anshedu/android_hardware_oplus -b lineage-22.2 hardware/oplus

# --- Backup original mk file ---
cp device/oneplus/larry/lineage_larry.mk device/oneplus/larry/lineage_larry.mk.bak

# --- Vanilla Build ---
echo "=== Building Vanilla ==="
. build/envsetup.sh
riseup larry user
rise b
mv out/target/product/larry out/target/product/vanilla

# --- Gapps Build ---
echo "=== Building Gapps ==="
cp device/oneplus/larry/gapps.txt device/oneplus/larry/lineage_larry.mk
. build/envsetup.sh
riseup larry user
rise b
mv out/target/product/larry out/target/product/gapps

# --- Restore original mk file ---
mv device/oneplus/larry/lineage_larry.mk.bak device/oneplus/larry/lineage_larry.mk
echo "=== Build process completed successfully! ==="
