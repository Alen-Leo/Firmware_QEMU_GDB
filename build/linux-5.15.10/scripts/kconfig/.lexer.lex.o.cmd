cmd_scripts/kconfig/lexer.lex.o := gcc -Wp,-MMD,scripts/kconfig/.lexer.lex.o.d -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 -fomit-frame-pointer -std=gnu89      -I /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig -I ./scripts/kconfig -c -o scripts/kconfig/lexer.lex.o scripts/kconfig/lexer.lex.c

source_scripts/kconfig/lexer.lex.o := scripts/kconfig/lexer.lex.c

deps_scripts/kconfig/lexer.lex.o := \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc.h \
    $(wildcard include/config/prefix) \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/expr.h \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/list.h \
  /home/alen/Code/Firmware_QEMU_GDB/linux-5.15.10/scripts/kconfig/lkc_proto.h \
  scripts/kconfig/parser.tab.h \

scripts/kconfig/lexer.lex.o: $(deps_scripts/kconfig/lexer.lex.o)

$(deps_scripts/kconfig/lexer.lex.o):
