section .data
	prompt_base_string db "Enter base number:", 0
	prompt_exponent_string db "Enter exponent:", 0
	result_string db "The result is:", 0

section .text
	global _start

_start:
	mov esi, prompt_base_string
	call lib_print_string
	call lib_input_number
	mov ecx, eax
	
	mov esi, prompt_exponent_string
	call lib_print_string
	call lib_input_number
	mov ebx, eax
	mov eax, ecx

	call math_exp
	mov esi, result_string
	call lib_print_string
	call lib_print_number

	call lib_exit

	%include "library.asm"
	%include "my_math.asm"
