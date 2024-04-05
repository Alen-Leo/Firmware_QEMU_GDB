#!/bin/bash

# Copyright (c) 2022 Alen. All rights reserved.
# This script is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

# Store the current directory
current_dir=$(pwd)

# Change to the "linux-5.15.10" directory
cd linux-5.15.10

# Check if ".config" file exists in the "linux-5.15.10" directory
if [ -f ".config" ]; then
  # Check the value of CONFIG_DEBUG_INFO
  if grep -q "^CONFIG_DEBUG_INFO=y$" .config; then
    # Compile make command based on the number of available processors
    make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- -j$(nproc)
    # Check the make exit code
    if [ $? -eq 0 ]; then
      echo "Linux kernel compiled successfully."
    else
      echo "Error: Failed to compile Linux kernel."
      exit 1
    fi
  else
    echo "Error: 'CONFIG_DEBUG_INFO' is not set to 'y' in the '.config' file."
    exit 1
  fi
else
  echo "Error: '.config' file not found in the 'linux-5.15.10' directory."
  echo "Try to run 'make ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu- menuconfig' to generate the '.config' file."
  exit 1
fi

# Change back to the original directory
cd "$current_dir"
