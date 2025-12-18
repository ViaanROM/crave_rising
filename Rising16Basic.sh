#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# 1. Initialize and Sync Source
repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs
/opt/crave/resync.sh

# 2. Clone Device Trees (Handle folder existence for repeat runs)
REPOS=(
    "device/oneplus/larry:android_device_oneplus_larry"
    "device/oneplus/sm6375-common:android_device_oneplus_sm6375-common"
    "vendor/oneplus/larry:proprietary_vendor_oneplus_larry"
    "vendor/oneplus/sm6375-common:proprietary_vendor_oneplus_sm6375-common"
    "kernel/oneplus/sm6375:android_kernel_oneplus_sm6375"
    "hardware/oplus:android_hardware_oplus"
)

for entry in "${REPOS[@]}"; do
    path="${entry%%:*}"
    repo_name="${entry##*:}"
    if [ ! -d "$path" ]; then
        git clone https://github.com/anshedu/"$repo_name" -b lineage-23.0 "$path"
    else
        echo "Updating $path..."
        (cd "$path" && git pull)
    fi
done

# 3. Setup Build Environment
export ALLOW_MISSING_DEPENDENCIES=true
source build/envsetup.sh

# 4. Configure Target and Build (Grouped Failsafes)
(riseup larry user || lunch lineage_larry-bp2a-user || lunch lineage_larry-user) && \
(rise b || mka bacon || mka target-files-package)
