;jellyfish.asm
;August 2020

bits 32			;nasm directive to operate in 32-bit mode
section .text

global start
extern kmain		;locate kmain from c file

start:
  cli			;block interrupts
  mov esp, stack_space  ;set stack pointer
  call kmain
  hlt			;halt cpu

section .bss
resb 8192		;reserve 8KB of memory for stack pointer(esp) and stack
stack_space:
