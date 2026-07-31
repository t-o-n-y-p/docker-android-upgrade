#!/bin/bash
#pass Appium version as a parameter, e.g. 3.5.2
declare -A android_api_versions=(
    ["15.0"]="35"
    ["16.0"]="36"
    ["17.0"]="37.0"
)
set -x
for android_version in "${!android_api_versions[@]}"; do
    api_version="${android_api_versions[$android_version]}"
    docker build \
    -f docker/upgrade \
    --build-arg DOCKER_ANDROID_VERSION=v$1-p0 \
    --build-arg EMULATOR_ANDROID_VERSION=$android_version \
    --build-arg EMULATOR_API_LEVEL=$api_version \
    -t budtmo/docker-android:emulator_"$android_version"_v$1-p0 .
done
