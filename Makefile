.PHONY: all

ROOTFS_IMG  := build/busybox-1.36.1/_install/rootfs.img
BUSYBOX_SRC := busybox-1.36.1

KERNEL_IMG := build/linux-5.15.10/arch/arm64/boot/Image
KERNEL_VM  := build/linux-5.15.10/vmlinux
KERNEL_SRC := linux-5.15.10

all: $(ROOTFS_IMG) $(KERNEL_IMG) $(KERNEL_VM)

$(ROOTFS_IMG): $(BUSYBOX_SRC)
	echo "Building rootfs.img..."
	./build_busybox_1_32_1.sh

$(KERNEL_IMG) $(KERNEL_VM): $(KERNEL_SRC)
	echo "Building kernel..."
	./build_linux_5_15_10_kernel.sh
