#!/bin/sh
clear
ANDK_DIR=/Volumes/FastDisk/android-ndk-r20b/
SDK_DIR=/Volumes/FastDisk/android-sdk

export PATH=${ANDK_DIR}:$PATH
export PATH=${SDK_DIR}/platform-tools/:$PATH
# ------------------------------------------------------------
# sync
sync(){
    git submodule init && \
    git submodule update && \
    cd libexploit
    git submodule init && \
    git submodule update && \
    cd .. && \
    cd device_database
    git submodule init && \
    git submodule update && \
    cd ..
}
# ------------------------------------------------------------
# build
build(){
    ndk-build NDK_PROJECT_PATH=. APP_PLATFORM=android-28 APP_BUILD_SCRIPT=./Android.mk APP_ALLOW_MISSING_DEPS=true
}
# ------------------------------------------------------------
# >>> main
# ------------------------------------------------------------
sync;
build;
