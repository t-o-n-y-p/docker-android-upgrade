#!/bin/bash
#pass Appium version as a parameter, e.g. 3.7.0
declare -A android_api_versions=(
    ["15.0"]="35"
    ["16.0"]="36"
)
set -x
for android_version in "${!android_api_versions[@]}"; do
    api_version="${android_api_versions[$android_version]}"
    docker build \
    -f docker/upgrade \
    --build-arg APPIUM_VERSION=$1 \
    --build-arg ANDROID_VERSION=$android_version \
    --build-arg API_LEVEL=$api_version \
    -t budtmo/docker-android:emulator_"$android_version"_v$1-p0 .
done
