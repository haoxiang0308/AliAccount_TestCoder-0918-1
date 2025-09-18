#!/bin/bash
nasm -f elf32 hello_program.asm -o hello_program.o
ld -m elf_i386 hello_program.o -o hello_program
./hello_program