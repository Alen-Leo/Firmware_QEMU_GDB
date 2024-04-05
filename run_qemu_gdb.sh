#!/bin/bash

# Copyright (c) 2022 Alen. All rights reserved.
# This script is licensed under the terms of the MIT license.
# For a copy, see <https://opensource.org/licenses/MIT>.

# Check necessary files
echo "Checking necessary files..."
make all

# qemu-system-aarch64 -M virt -cpu cortex-a53 -nographic -smp 1 -m 256 -kernel build/linux-5.15.25/arch/arm64/boot/Image -append "console=ttyAMA0" -initrd build/initramfs.cpio.gz -monitor /dev/null -serial /dev/null -serial stdio -S -s
echo "Running QEMU with GDB..."
qemu-system-aarch64 -machine virt -cpu cortex-a53 -smp 1 -m 2G -kernel ./build/linux-5.15.10/arch/arm64/boot/Image -initrd ./build/busybox-1.36.1/_install/rootfs.img -append "nokaslr console=ttyAMA0" -nographic -S -s