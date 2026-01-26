
SOURCE=""
TARGET="/opt/org.cssnr.hls.downloader"

# Messaging Hosts
chrome="/etc/opt/chrome/native-messaging-hosts"
chromium="etc/chromium/native-messaging-hosts"
firefox="/usr/lib/mozilla/native-messaging-hosts"
mkdir -p "${chrome}" "${chromium}" "${firefox}"

# Manifests
cp -f "${SOURCE}/manifest-chrome.json" "${chrome}/${APP_NAME}.json"
cp -f "${SOURCE}/manifest-chrome.json" "${chromium}/${APP_NAME}.json"
cp -f "${SOURCE}/manifest-firefox.json" "${firefox}/${APP_NAME}.json"

# Client
cp -f "${SOURCE}/client" "${TARGET}/client"
chmod +x "${TARGET}/client"

# FFmpeg
cp -f "${SOURCE}/ffmpeg" "${TARGET}/ffmpeg"
chmod +x "${TARGET}/ffmpeg"
