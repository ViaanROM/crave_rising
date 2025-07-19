# RisingOS Revived for Nord CE 3 Lite 5G (larry)
# Install CCACHE
sudo apt update && sudo apt install ccache
# Enable ccache for faster builds
export USE_CCACHE=1
ccache -M 20G

# Clean up previous sources
rm -rf .repo/local_manifests
rm -rf device/oneplus
rm -rf vendor/oneplus
rm -rf kernel/oneplus
rm -rf hardware/oplus
rm -rf prebuilts/clang/host/linux-x86

# Initialize RisingOS repo (run only once)
repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs

# Sync all sources
/opt/crave/resync.sh
# Clone Local Manifest
git clone https://github.com/ViaanROM/local_manifests --depth 1 -b main .repo/local_manifests
# Setup environment and build
source build/envsetup.sh
lunch lineage_larry user
mka bacon
