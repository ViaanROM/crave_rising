cd my-rising-os-repo
repo init -u https://github.com/RisingOS-Revived/android -b sixteen --git-lfs
/opt/crave/resync.sh
git clone https://github.com/anshedu/android_device_oneplus_larry -b lineage-23.0 device/oneplus/larry
git clone https://github.com/anshedu/android_device_oneplus_sm6375-common -b lineage-23.0 device/oneplus/sm6375-common
git clone https://github.com/anshedu/proprietary_vendor_oneplus_larry -b lineage-23.0 vendor/oneplus/larry
git clone https://github.com/anshedu/proprietary_vendor_oneplus_sm6375-common -b lineage-23.0 vendor/oneplus/sm6375-common
git clone https://github.com/anshedu/android_kernel_oneplus_sm6375 -b lineage-23.0 kernel/oneplus/sm6375
git clone https://github.com/anshedu/android_hardware_oplus -b lineage-23.0 hardware/oplus
lunch lineage_larry-user || lunch lineage_larry-bp2a-user
mka bacon
