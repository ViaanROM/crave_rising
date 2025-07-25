# === RisingOS Revived Build Script for Nord CE 3 Lite (larry) ===

# Clean previous local sources
rm -rf .repo/local_manifests \
       device/oneplus \
       vendor/oneplus \
       kernel/oneplus \
       hardware/oplus \
       prebuilts/clang/host/linux-x86

# Repo Init & Sync
repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --depth=1 --git-lfs
/opt/crave/resync.sh

# Clone Trees and Blobs
git clone https://github.com/ViaanROM/android_device_oneplus_larry -b lineage-22.2 device/oneplus/larry
git clone https://github.com/ViaanROM/android_device_oneplus_sm6375-common -b lineage-22.2 device/oneplus/sm6375-common
git clone https://github.com/ViaanROM/proprietary_vendor_oneplus_larry -b lineage-22.2 vendor/oneplus/larry
git clone https://github.com/ViaanROM/proprietary_vendor_oneplus_sm6375-common -b lineage-22.2 vendor/oneplus/sm6375-common
git clone https://github.com/ViaanROM/android_kernel_oneplus_sm6375 -b lineage-22.2 kernel/oneplus/sm6375
git clone https://github.com/ViaanROM/android_hardware_oplus -b lineage-22.2 hardware/oplus

# ============================
#       VANILLA BUILD
# ============================

source build/envsetup.sh
make installclean
brunch larry-user

# Save Vanilla Build Output
rm -rf out/target/product/vanilla
mv out/target/product/larry out/target/product/vanilla

# ============================
#       GAPPS BUILD
# ============================

# Swap makefile
cd device/oneplus/larry
rm -f larry.mk
mv gapps.txt larry.mk
cd ../../..

# Re-source and build
source build/envsetup.sh
make installclean
brunch larry-user

# Save GApps Build Output
rm -rf out/target/product/gapps
mv out/target/product/larry out/target/product/gapps
