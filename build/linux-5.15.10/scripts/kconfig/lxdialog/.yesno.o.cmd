cmd_scripts/kconfig/lxdialog/yesno.o := gcc -Wp,-MMD,scripts/kconfig/lxdialog/.yesno.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89      -D_DEFAULT_SOURCE -D_XOPEN_SOURCE=600 -I ./scripts/kconfig -c -o scripts/kconfig/lxdialog/yesno.o /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lxdialog/yesno.c

source_scripts/kconfig/lxdialog/yesno.o := /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lxdialog/yesno.c

deps_scripts/kconfig/lxdialog/yesno.o := \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lxdialog/dialog.h \

scripts/kconfig/lxdialog/yesno.o: $(deps_scripts/kconfig/lxdialog/yesno.o)

$(deps_scripts/kconfig/lxdialog/yesno.o):
