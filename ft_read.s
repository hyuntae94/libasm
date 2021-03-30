;ssize_t		ft_read(int fildes, void *buf, size_t nbyte)

section .text
	global _ft_read
	extern ___error

_ft_read:
	mov rax, 0x2000003
	syscall
	jc _err;jc는 syscall반환값을 받아서 음수이면 에러함수로 넘어간다.
	ret

_err:
	push rax
	call ___error
	pop rdx
	mov [rax], rdx
	mov rax, -1
	ret
