#!/bin/bash

# Copyright (c) 2022 Alen. All rights reserved.
# This script is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

# Check if ".config" file exists in the "build/busybox-1.32.1" directory
if [ -f "build/busybox-1.32.1/.config" ]; then
  # Check the value of CONFIG_STATIC
  if grep -q "^CONFIG_STATIC=y$" build/busybox-1.32.1/.config; then
    # Compile make command based on the number of available processors
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc) -C busybox-1.32.1 O=../build/busybox-1.32.1
    # Check the make exit code
    if [ $? -eq 0 ]; then
      echo "busybox compiled successfully."
    else
      echo "Error: Failed to compile busybox."
      exit 1
    fi
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc) -C busybox-1.32.1 install O=../build/busybox-1.32.1
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
  echo "Error: '.config' file not found in the 'build/busybox-1.32.1' directory."
  echo "Try to run 'make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig -C busybox-1.32.1 O=../build/busybox-1.32.1' to generate the '.config' file."
  exit 1
fi