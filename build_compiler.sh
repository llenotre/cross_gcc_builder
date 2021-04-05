#!/bin/bash

export TARGET=i686-elf

tar xvf binutils-2.36.tar.xz
tar xvf gcc-10.2.0.tar.xz

mkdir binutils_build/

cd binutils_build
../binutils-2.36/configure --target=$TARGET --prefix=/usr --with-sysroot --disable-nls --disable-werror
make
make install

mkdir gcc_build/
../gcc-10.2.0/configure --target=$TARGET --prefix=/usr --disable-nls --without-headers
make all-gcc
make all-target-libgcc
make install-gcc
make install-target-libgcc
