#!/bin/bash

# A script to perform incremental backups using rsync. Save last 5 copys

set -o errexit
set -o nounset
set -o pipefail

readonly SOURCE_DIR="/home/sadmin/src"
readonly BACKUP_DIR="/home/sadmin/backups"
readonly DATETIME="$(date '+%Y-%m-%d_%H:%M:%S')"
readonly BACKUP_PATH="${BACKUP_DIR}/${DATETIME}"
readonly LATEST_LINK="${BACKUP_DIR}/latest"

mkdir -p "${BACKUP_DIR}"

rsync -av --delete \
  sadmin@client1:"${SOURCE_DIR}/" \
  --link-dest  "${LATEST_LINK}" \
  "${BACKUP_PATH}"

rm -rf "${LATEST_LINK}"
ln -s "${BACKUP_PATH}" "${LATEST_LINK}"

find "${BACKUP_DIR}" -mindepth 1 -maxdepth 1 -type d -printf '%p\n' | sort -r | tail +6 | xargs rm -rf