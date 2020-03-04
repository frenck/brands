#!/usr/bin/env bash

# Copy folder, without symlinks, but use actual files instead
rsync -aL --exclude '_homeassistant' src/ build

# Use icon as logo in case of a missing logo
find ./build -type f -name "icon.png" | while read icon; do
  dir=$(dirname "${icon}")
  if [[ ! -f "${dir}/logo.png" ]]; then
    cp "${icon}" "${dir}/logo.png"
    echo "Using ${icon} as logo"
  fi
done
