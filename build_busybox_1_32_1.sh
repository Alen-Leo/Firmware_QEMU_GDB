#!/bin/bash

# Copyright (c) 2022 Alen. All rights reserved.
# This script is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

# Store the absolute path of the current directory
current_dir=$(pwd)

# Check if ".config" file exists in the "busybox-1.32.1" directory
if [ -f "$current_dir/busybox-1.32.1/.config" ]; then
  # Check the value of CONFIG_STATIC
  if grep -q "^CONFIG_STATIC=y$" "$current_dir/busybox-1.32.1/.config"; then
    # Compile make command based on the number of available processors
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc) -C "$current_dir/busybox-1.32.1"
    # Check the make exit code
    if [ $? -eq 0 ]; then
      echo "busybox compiled successfully."
    else
      echo "Error: Failed to compile busybox."
      exit 1
    fi
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -C "$current_dir/busybox-1.32.1" install
    # Check the make exit code
    if [ $? -eq 0 ]; then
      echo "busybox compiled successfully."
    else
      echo "Error: Failed to compile busybox."
      exit 1
    fi
  else
    echo "Error: 'CONFIG_STATIC' is not set to 'y' in the '.config' file."
    exit 1
  fi
else
  echo "Error: '.config' file not found in the 'busybox-1.32.1' directory."
  echo "Try to run 'make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig' to generate the '.config' file."
  exit 1
fi

# Change directory to "_install"
cd "$current_dir/busybox-1.32.1/_install"

# Execute commands in "_install" directory

mkdir -pv {proc,sys}
find . | cpio -o --format=newc > ./rootfs.img

# Return to the original directory
cd "$current_dir"
