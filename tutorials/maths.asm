; Build with "nasm -f elf maths.asm && ld -s -o maths maths.o"
; Note that library.asm must be in the same directory!


section .data
	prompt_string db 'Enter a number: ', 0
	result_string db 'Factorial is: ', 0


section	.text
	global _start


_start:
	mov esi, prompt_string
	call lib_print_string
	call lib_input_number

	mov ebx, eax
	mov eax, 1
.loop:
	mul ebx
	dec ebx
	cmp ebx, 0
	jne .loop

	mov esi, result_string	
	call lib_print_string
	call lib_print_number

	call lib_exit


	%include "library.asm"

