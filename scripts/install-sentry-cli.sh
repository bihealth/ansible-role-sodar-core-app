#!/bin/bash
set -eu

SENTRY_DOWNLOAD_Linux_i686="https://downloads.sentry-cdn.com/sentry-cli/1.49.0/sentry-cli-Linux-i686"
SENTRY_DOWNLOAD_Windows_x86_64="https://downloads.sentry-cdn.com/sentry-cli/1.49.0/sentry-cli-Windows-x86_64.exe"
SENTRY_DOWNLOAD_Darwin_x86_64="https://downloads.sentry-cdn.com/sentry-cli/1.49.0/sentry-cli-Darwin-x86_64"
SENTRY_DOWNLOAD_Linux_x86_64="https://downloads.sentry-cdn.com/sentry-cli/1.49.0/sentry-cli-Linux-x86_64"
SENTRY_DOWNLOAD_Windows_i686="https://downloads.sentry-cdn.com/sentry-cli/1.49.0/sentry-cli-Windows-i686.exe"
VERSION="1.49.0"
PLATFORM=`uname -s`
ARCH=`uname -m`

# If the install directory is not set, set it to a default
if [ -z ${INSTALL_DIR+x} ]; then
  INSTALL_DIR=/usr/local/bin
fi
if [ -z ${INSTALL_PATH+x} ]; then
  INSTALL_PATH="${INSTALL_DIR}/sentry-cli"
fi

DOWNLOAD_URL_LOOKUP="SENTRY_DOWNLOAD_${PLATFORM}_${ARCH}"
DOWNLOAD_URL="${!DOWNLOAD_URL_LOOKUP:-}"

echo "This script will automatically install sentry-cli ${VERSION} for you."
echo "Installation path: ${INSTALL_PATH}"
if [ "x$(id -u)" == "x0" ]; then
  echo "Warning: this script is currently running as root. This is dangerous. "
  echo "         Instead run it as normal user. We will sudo as needed."
fi

if [ -f "$INSTALL_PATH" ]; then
  echo "error: sentry-cli is already installed."
  exit 1
fi

if [ x$DOWNLOAD_URL == x ]; then
  echo "error: your platform and architecture (${PLATFORM}-${ARCH}) is unsupported."
  exit 1
fi

if ! hash curl 2> /dev/null; then
  echo "error: you do not have 'curl' installed which is required for this script."
  exit 1
fi

TEMP_FILE=`mktemp "${TMPDIR:-/tmp}/.sentrycli.XXXXXXXX"`

cleanup() {
  rm -f "$TEMP_FILE"
}

trap cleanup EXIT
curl -SL --progress-bar "$DOWNLOAD_URL" > "$TEMP_FILE"
chmod 0755 "$TEMP_FILE"
if ! mv "$TEMP_FILE" "$INSTALL_PATH" 2> /dev/null; then
  sudo -k mv "$TEMP_FILE" "$INSTALL_PATH"
fi

echo 'Done!'

