# 需要安装的第三方工具包
```
sudo apt install build-essential uuid-dev iasl git nasm python-is-python3
sudo apt install gcc-aarch64-linux-gnu
sudo apt install libssl-dev

sudo apt install qemu-system-arm
apt-get install vgabios
ln -s /usr/share/vgabios/vgabios.stdvga.bin /usr/share/qemu/vgabios-stdvga.bin

sudo apt install gdb-multiarch
```
以上命令用于安装和配置在Linux系统中编译和调试UEFI固件所需的第三方工具包和软件。
# 详细作用

build-essential: 提供基本的编译工具链（如GCC编译器、make等），用于编译C/C++源码。

uuid-dev: 提供UUID开发库，支持与UEFI相关的UUID操作。

iasl: Intel ACPI编译器，用于处理ACPI源代码。

git: 分布式版本控制系统，用于源码管理和协作。

nasm: Netwide Assembler，一款流行的x86汇编器，用于编译UEFI相关的汇编代码。

python-is-python3: 确保Python命令指向Python 3版本，可能在某些系统中需要。

gcc-aarch64-linux-gnu: ARM 64位架构的交叉编译工具链，用于编译针对ARM平台的UEFI固件。

libssl-dev: OpenSSL开发库，提供SSL/TLS支持，可能在编译过程中涉及加密相关功能时需要。

qemu-system-arm: QEMU模拟器的ARM版本，用于在x86平台上模拟运行ARM架构的UEFI固件。

vgabios: VGA BIOS文件，提供图形显示支持。

gdb-multiarch: 多架构版本的GDB调试器，可用于调试不同架构（包括ARM）的程序。

最后，通过ln -s命令创建符号链接，将vgabios文件正确地关联到QEMU所需的路径，确保在使用QEMU模拟时能加载标准VGA BIOS。这些工具和库共同构成了一个完整的开发环境，支持UEFI固件的编译、调试及在QEMU虚拟机中进行硬件模拟测试。