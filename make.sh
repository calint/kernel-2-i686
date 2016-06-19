export PATH=$PATH:~/opt/cross/bin/ &&
rm -f *.o &&
rm -f *.bin &&
nasm -f elf32 multiboot_header.asm &&
nasm -f elf32 boot.asm &&
i686-elf-ld -n -o kernel.bin -T linker.ld multiboot_header.o boot.o &&
cp -a kernel.bin isofiles/boot &&
grub-mkrescue -o os.iso isofiles &&
qemu-system-i386 -cdrom os.iso
