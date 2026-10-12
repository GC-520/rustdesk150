#!/usr/bin/env bash

MODE=${MODE:=release}
# 构建变体：standard（默认）/ zyt（卓易通兼容，applicationId 带 .zyt 后缀、全 ABI）
FLAVOR=${FLAVOR:=standard}
$ANDROID_NDK_HOME/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-strip android/app/src/main/jniLibs/arm64-v8a/*
flutter build apk --flavor ${FLAVOR} --target-platform android-arm64,android-arm --${MODE} --obfuscate --split-debug-info ./split-debug-info
flutter build apk --flavor ${FLAVOR} --split-per-abi --target-platform android-arm64,android-arm --${MODE} --obfuscate --split-debug-info ./split-debug-info
flutter build appbundle --flavor ${FLAVOR} --target-platform  android-arm64,android-arm --${MODE} --obfuscate --split-debug-info ./split-debug-info

# build in linux
# $ANDROID_NDK/toolchains/aarch64-linux-android-4.9/prebuilt/linux-x86_64/bin/aarch64-linux-android-strip android/app/src/main/jniLibs/arm64-v8a/*
