#!/bin/bash
set -e  # Exit if any command fails

# ------------------------------
# VoltageOS 15-QPR2 Build Script
# Device: Xiaomi Poco F3 / Redmi K40 / Mi 11X (apollo)
# ------------------------------

# Clean old manifests
echo "Removing old local manifests..."
rm -rf .repo/local_manifests

# Initialize VoltageOS 15-QPR2 repo
echo "Initializing VoltageOS repo..."
repo init -u https://github.com/VoltageOS/manifest.git -b 15-qpr2 --git-lfs

# Sync source
echo "Syncing source (repo sync)..."
/opt/crave/resync.sh

# Clone device tree
echo "Cloning device tree..."
rm -rf device/xiaomi
git clone https://github.com/MurtazaKolachi/android_device_xiaomi_apollo -b voltage16 device/xiaomi/apollo

# Clone vendor tree
echo "Cloning vendor tree..."
rm -rf vendor/xiaomi
git clone https://github.com/MurtazaKolachi/android_vendor_xiaomi_apollo -b evo vendor/xiaomi/apollo

# Clone kernel
echo "Cloning kernel source..."
rm -rf kernel/xiaomi
git clone https://github.com/MurtazaKolachi/kernel_xiaomi_apollo -b main kernel/xiaomi/apollo

# Clone hardware tree
echo "Cloning hardware tree..."
rm -rf hardware/xiaomi
git clone https://github.com/VoltageOS-staging/hardware_xiaomi -b 15 hardware/xiaomi

# Clone device settings
echo "Cloning device settings..."
rm -rf packages/resources/devicesettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings -b aosp-15 packages/resources/devicesettings

# Set up build environment
echo "Setting up for building the ROM"
source build/envsetup.sh
brunch apollo-user

echo "Output is in out/target/product/vanilla"
echo "Finished the build successfully"
