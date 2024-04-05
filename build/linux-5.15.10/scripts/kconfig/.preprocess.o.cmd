cmd_scripts/kconfig/preprocess.o := gcc -Wp,-MMD,scripts/kconfig/.preprocess.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89       -I ./scripts/kconfig -c -o scripts/kconfig/preprocess.o /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/preprocess.c

source_scripts/kconfig/preprocess.o := /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/preprocess.c

deps_scripts/kconfig/preprocess.o := \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/list.h \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc.h \
    $(wildcard include/config/prefix) \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/expr.h \
  /home/alen/Code/test/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc_proto.h \

scripts/kconfig/preprocess.o: $(deps_scripts/kconfig/preprocess.o)

$(deps_scripts/kconfig/preprocess.o):
