cmd_scripts/kconfig/confdata.o := gcc -Wp,-MMD,scripts/kconfig/.confdata.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89       -I ./scripts/kconfig -c -o scripts/kconfig/confdata.o /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/confdata.c

source_scripts/kconfig/confdata.o := /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/confdata.c

deps_scripts/kconfig/confdata.o := \
    $(wildcard include/config/FOO) \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc.h \
    $(wildcard include/config/prefix) \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/expr.h \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/list.h \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc_proto.h \

scripts/kconfig/confdata.o: $(deps_scripts/kconfig/confdata.o)

$(deps_scripts/kconfig/confdata.o):
