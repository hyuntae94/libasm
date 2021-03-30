;ssize_t		ft_write(int fildes, const void *buf, size_t nbyte);

section .text
	global _ft_write
	extern ___error

_ft_write:
	mov		rax, 0x2000004	; Mac systemcall table No.4 : write
	syscall					; syscall의 write가 rax으로 return
	jc		_err			; jump carry, carry flag가 1이 되면 jump
	ret

_err:
	push	rax				; jump carry 된 rax의 메모리주소 값이 스택 메모리 저장
	call	___error		; ___error(rdi, rsi, rdx)
	pop		qword[rax]		; ___error의 return 값의 메모리 주소를 jump carry 메모리 주소로 변경
	mov		rax, -0x1		; return (-1)
	ret
