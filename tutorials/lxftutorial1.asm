section .text				; Executable code here.
	global _start			; For the linker (ld).

_start:					; Where execution begins
	mov eax, 4			; Kernel call no.: write.
	mov ebx, 1			; Where to write: stdout.
	mov ecx, message		; Location of string
	mov edx, message_length		; No. of chars to write.
	int 0x80			; Call the kernel!

	mov eax, 1			; Kernel call no.: exit.
	int 0x80			; Call the kernel!

section .data
	message db "Assembly rules!", 10
	message_length equ $ - message
