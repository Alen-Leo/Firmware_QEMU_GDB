cmd_scripts/kconfig/menu.o := gcc -Wp,-MMD,scripts/kconfig/.menu.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89       -I ./scripts/kconfig -c -o scripts/kconfig/menu.o /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/menu.c

source_scripts/kconfig/menu.o := /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/menu.c

deps_scripts/kconfig/menu.o := \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc.h \
    $(wildcard include/config/prefix) \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/expr.h \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/list.h \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc_proto.h \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/internal.h \

scripts/kconfig/menu.o: $(deps_scripts/kconfig/menu.o)

$(deps_scripts/kconfig/menu.o):
