#!/bin/bash

export TARGET=i686-elf

mkdir binutils_build/
cd binutils_build
../binutils-2.36/configure --target=$TARGET --prefix=/usr --with-sysroot --disable-nls --disable-werror
make -j$(nproc)
sudo make install
cd ..

cd gcc-10.2.0/
./contrib/download_prerequisites
cd ..

mkdir gcc_build/
cd gcc_build
../gcc-10.2.0/configure --target=$TARGET --prefix=/usr --disable-nls --enable-languages=c --without-headers
make all-gcc -j$(nproc)
make all-target-libgcc -j$(nproc)
sudo make install-gcc
sudo make install-target-libgcc
cd ..
