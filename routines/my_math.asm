; ============================================================================

; LIBRARY OF MATH ROUTINES FOR x86 LINUX ASSEMBLY LANGUAGE
; Compiled by Tommi Helander (tommi.helander@outlook.com), public domain
;
; * math_exp - Performs exponentation of base in EAX and exponent in EBX.
;              Results in EAX.


; ----------------------------------------------------------------------------

section .text

math_exp:
	pusha
	
	mov ecx, eax		; Location of base value
.loop:
	mul ecx			; Multiply value in EAX with base value
	dec ebx			; Decrease exponent after multiplication
	cmp ebx, 1		; Check if exponent is zero...
	jne .loop		; If not, loop again

	mov [.tmp], eax		; Get EAX back after popa 
	popa
	mov eax, [.tmp]
	ret

section .bss
	.tmp resb 4 
