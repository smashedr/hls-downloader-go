#!/usr/bin/env bash

set -e

APP_NAME="org.cssnr.hls.downloader"
PKG_NAME="hls-downloader-client"
SOURCE="dist"
VERSION="0.0.1"

echo "CMD: ${0}"
echo "PWD: ${PWD}"
echo "::group::SOURCE: ${SOURCE}"
tree "${SOURCE}" || ls -lAhR "${SOURCE}"
echo "::endgroup::"

if [ "${GITHUB_EVENT_NAME}" == "release" ];then
    VERSION="${GITHUB_REF_NAME}"
fi
echo "VERSION: ${VERSION}"

mkdir -p out

declare -A ARCHS=(
    [client_linux_amd64_v1]="amd64"
    [client_linux_386_sse2]="i386"
    [client_linux_arm64_v8.0]="arm64"
)

#for ARCH_INFO in "amd64:client_linux_amd64_v1" "i386:client_linux_386_sse2" "arm64:client_linux_arm64_v8.0"; do
#    ARCH="${ARCH_INFO%%:*}"
#    CLIENT_DIR="${ARCH_INFO#*:}"
for CLIENT_DIR in "${!ARCHS[@]}"; do
    echo "----- ${CLIENT_DIR} -----"
    ARCH="${ARCHS[$CLIENT_DIR]}"
    echo "ARCH: ${ARCH}"

    PACKAGE="${PKG_NAME}_${VERSION}_${ARCH}"
    echo "PACKAGE: ${PACKAGE}"

    chrome="${PACKAGE}/etc/opt/chrome/native-messaging-hosts"
    chromium="${PACKAGE}/etc/chromium/native-messaging-hosts"
    firefox="${PACKAGE}/usr/lib/mozilla/native-messaging-hosts"

    mkdir -p "${PACKAGE}/DEBIAN"
    mkdir -p "${PACKAGE}/opt/${APP_NAME}"
    mkdir -p "${chrome}"
    mkdir -p "${chromium}"
    mkdir -p "${firefox}"

    cp -f "dist/client/${CLIENT_DIR}/client" "${PACKAGE}/opt/${APP_NAME}/client"
    chmod +x "${PACKAGE}/opt/${APP_NAME}/client"
    touch "${PACKAGE}/opt/${APP_NAME}/log.txt" "${PACKAGE}/opt/${APP_NAME}/log-1.txt"
    chmod g+w "${PACKAGE}/opt/${APP_NAME}/log.txt" "${PACKAGE}/opt/${APP_NAME}/log-1.txt"

    cp -f "${SOURCE}/manifest-chrome.json" "${chrome}/${APP_NAME}.json"
    cp -f "${SOURCE}/manifest-chrome.json" "${chromium}/${APP_NAME}.json"
    cp -f "${SOURCE}/manifest-firefox.json" "${firefox}/${APP_NAME}.json"

cat <<-EOF > "${PACKAGE}/DEBIAN/control"
Package: ${PKG_NAME}
Version: ${VERSION}
Section: base
Priority: optional
Architecture: ${ARCH}
Maintainer: CSSNR
Description: HLS Video Downloader Native Client
EOF

    echo "::group::cat ${PACKAGE}/DEBIAN/control"
    cat -n "${PACKAGE}/DEBIAN/control"
    echo "::endgroup::"

    echo "Building: ${PACKAGE}"
    dpkg-deb --build "${PACKAGE}"
    echo "Moving: out/linux-installer-${ARCH}.deb"
    mv "${PACKAGE}.deb" "out/linux-installer-${ARCH}.deb"
done

echo "All Done."
