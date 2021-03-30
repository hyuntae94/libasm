;ssize_t		ft_read(int fildes, void *buf, size_t nbyte)

section .text
	global _ft_read
	extern ___error

_ft_read:
	mov rax, 0x2000003
	syscall
	jc _err		;에러가 발생하면 carry flag =1, rax = error number
	ret

_err:
	push rax ;jump carry 된 rax를 스택에 저장
	call ___error;error를 호출하면 rax의 에러넘버를 보고 에러주소를 리턴.(rax = errno address)
	pop rdx
	mov [rax], rdx;rax가 가진 주소값에 rdx에 담긴 에러넘버를 넣어준다.
	mov rax, -1;-1리턴
	ret
