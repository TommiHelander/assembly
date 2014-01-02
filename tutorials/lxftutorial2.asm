section .text			; Executable code here
	global _start		; For the linker (ld)

_start:
	mov ecx, message	; Location of string
	call print_string	; Jump to routine

	mov eax, 1		; Kernel call no.: exit.
	int 0x080		; Call the kernel!

print_string:			; ROUTINE
	pusha
	push ecx		; Save location for later
	mov edx, 0		; Counter for characters

.loop:
	cmp byte [ecx], 0	; Is character in string zero?
	je .finish		; Skip ahead if so
	inc edx			; If not, increment char counter.
	inc ecx			; And location in string
	jmp .loop		; And keep on checking.

.finish:
	mov eax, 4		; Kernel call no.: write.
	mov ebx, 1		; Where to write: stdout
	pop ecx			; Get string location back
		
	int 0x80		; Call the kernel!
	popa
	ret			; Back to the calling code.

section .data
	message db "Assembly rules!", 10, 0
