cmd_scripts/kconfig/mconf.o := gcc -Wp,-MMD,scripts/kconfig/.mconf.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89      -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -I ./scripts/kconfig -c -o scripts/kconfig/mconf.o /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/mconf.c

source_scripts/kconfig/mconf.o := /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/mconf.c

deps_scripts/kconfig/mconf.o := \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc.h \
    $(wildcard include/config/prefix) \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/expr.h \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/list.h \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc_proto.h \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lxdialog/dialog.h \

scripts/kconfig/mconf.o: $(deps_scripts/kconfig/mconf.o)

$(deps_scripts/kconfig/mconf.o):
