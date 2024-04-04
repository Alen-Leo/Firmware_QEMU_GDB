#!/bin/bash
set -e
# 设置当前工作目录为全局变量
export WORKSPACE=$(pwd)

# 设置包路径
export PACKAGES_PATH="${WORKSPACE}/edk2:${WORKSPACE}/edk2-platforms:${WORKSPACE}/edk2-non-osi"
export CONF_PATH="${WORKSPACE}/edk2/BaseTools/Conf"

# UEFI构建函数
function build_uefi() {
  cd "${WORKSPACE}"

  # 编译edk2/BaseTools
  if ! make -C edk2/BaseTools; then
    echo "Failed to build BaseTools"
    return 1
  fi

  # 加载环境设置脚本
  if ! . edk2/edksetup.sh; then
    echo "Failed to load environment setup script"
    return 1
  fi

  # 根据系统架构设置GCC5_AARCH64_PREFIX
  case "$(arch)" in
    x86_64)
      export GCC5_AARCH64_PREFIX="aarch64-linux-gnu-"
      ;;
    aarch64)
      ;;
    *)
      ;;
  esac

  # 执行构建命令
  build -b DEBUG -a AARCH64 -t GCC5 -p edk2-platforms/Platform/Qemu/SbsaQemu/SbsaQemu.dsc
}

declare -a cleanup_items=(
  "${WORKSPACE}/Build/SbsaQemu"
  "${WORKSPACE}/arm-trusted-firmware/build"
  "${WORKSPACE}/SBSA_FLASH0.fd"
  "${WORKSPACE}/SBSA_FLASH1.fd"
)

# 清理函数
function clean_sbsaqemu_build() {
  # 遍历待清理的文件和目录列表
  for item in "${cleanup_items[@]}"; do
    # 检查目录或文件是否存在
    if [[ -e "$item" ]]; then
      # 清理目录或文件
      rm -rf "$item" && echo "Successfully cleaned up: $item"
    else
      echo "Item does not exist: $item"
    fi
  done
}

function build_atf() {
  cd "${WORKSPACE}/arm-trusted-firmware"
  export CROSS_COMPILE=aarch64-linux-gnu-
  export ARCH=arm64

  CFLAGS='-O0 -gdwarf-2'
  # 编译ATF并生成FIP
  make PLAT=qemu_sbsa all fip DEBUG=1 V=1 CFLAGS='-O0 -gdwarf-2'

  # 复制编译产出到指定目录
  cp -f "build/qemu_sbsa/debug/bl1.bin" "${WORKSPACE}/edk2-non-osi/Platform/Qemu/Sbsa/"
  cp -f "build/qemu_sbsa/debug/fip.bin" "${WORKSPACE}/edk2-non-osi/Platform/Qemu/Sbsa/"
}

function generate_sbsaqemu_bios() {
  cd "${WORKSPACE}"

  # 复制UEFI固件文件并调整大小
  cp -f "${WORKSPACE}/Build/SbsaQemu/DEBUG_GCC5/FV/SBSA_FLASH0.fd" ./
  cp -f "${WORKSPACE}/Build/SbsaQemu/DEBUG_GCC5/FV/SBSA_FLASH1.fd" ./

  truncate -s 256M SBSA_FLASH0.fd
  truncate -s 256M SBSA_FLASH1.fd
}

function run_qemu() {
  qemu-system-aarch64 -m 1024 -M sbsa-ref \
  -pflash SBSA_FLASH0.fd -pflash SBSA_FLASH1.fd \
  -device usb-mouse -device usb-kbd \
  -serial file:./qemu_serial.log -s -S
}

function build_qemu() {
  export INSTALL_PATH=/usr/local 
  cd $WORKSPACE/qemu
  mkdir -p build-native
  cd build-native
  ../configure --target-list=aarch64-softmmu --prefix=$INSTALL_PATH --enable-sdl
  sudo make install
}

function BuildCode() {
  # 执行UEFI构建流程之前先清理
  clean_sbsaqemu_build
  
  # 编译并生成ATF
  build_atf
  
  # 执行UEFI构建
  build_uefi
  
  # 生成适用于QEMU SBSA的BIOS映像
  generate_sbsaqemu_bios
}

if [ "$1" == "run" ]; then
  run_qemu
elif [ "$1" == "clean" ]; then
  clean_sbsaqemu_build
elif [ "$1" == "build" ]; then
  BuildCode
else
  echo "Usage: $0 [run|clean|build]"
fi
