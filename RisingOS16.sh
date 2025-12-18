# 1. Source Initialization
repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs && \
/opt/crave/resync.sh && \

# 2. Dependency Cloning (Safe for Persistent Queues)
# If the folder exists, it pulls updates; otherwise, it clones fresh.
for repo in \
    "device/oneplus/larry:android_device_oneplus_larry" \
    "device/oneplus/sm6375-common:android_device_oneplus_sm6375-common" \
    "vendor/oneplus/larry:proprietary_vendor_oneplus_larry" \
    "vendor/oneplus/sm6375-common:proprietary_vendor_oneplus_sm6375-common" \
    "kernel/oneplus/sm6375:android_kernel_oneplus_sm6375" \
    "hardware/oplus:android_hardware_oplus"; 
do
    path=${repo%%:*}
    url="https://github.com/anshedu/${repo##*:}"
    if [ ! -d "$path" ]; then
        git clone "$url" -b lineage-23.0 "$path"
    else
        (cd "$path" && git pull)
    fi
done && \

# 3. The Multi-Stage Build Failsafe
. build/envsetup.sh && \
export ALLOW_MISSING_DEPENDENCIES=true && \

# Attempt 1: RisingOS Setup -> Attempt 2: Specific BP2A Lunch -> Attempt 3: Generic Lunch
(riseup larry user || lunch lineage_larry-bp2a-user || lunch lineage_larry-user) && \

# Attempt 1: RisingOS Build Tool -> Attempt 2: Standard Lineage Zip -> Attempt 3: Raw Target Files
(rise b || mka bacon || mka target-files-package)
