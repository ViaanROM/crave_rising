sudo apt install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git git-lfs gnupg gperf imagemagick protobuf-compiler python3-protobuf lib32readline-dev lib32z1-dev libdw-dev libelf-dev lz4 libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/RisingOS-Revived/android -b sixteen -g default,-mips,-darwin,-notdefault
repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)
git clone https://github.com/anshedu/android_device_oneplus_larry -b lineage-22.2 device/oneplus/larry
git clone https://github.com/anshedu/android_device_oneplus_sm6375-common -b lineage-22.2 device/oneplus/sm6375-common
git clone https://github.com/anshedu/proprietary_vendor_oneplus_larry -b lineage-22.2 vendor/oneplus/larry
git clone https://github.com/anshedu/proprietary_vendor_oneplus_sm6375-common -b lineage-22.2 vendor/oneplus/sm6375-common
git clone https://github.com/anshedu/android_kernel_oneplus_sm6375 -b lineage-22.2 kernel/oneplus/sm6375
git clone https://github.com/anshedu/android_hardware_oplus -b lineage-22.2 hardware/oplus
riseup larry user
rise b
