section .text
	extern _malloc
	extern _ft_strlen
	extern _ft_strcpy
	global _ft_strdup

_ft_strdup:
	push	rdi			; strdup의 인자 *str, rdi 값 스택 포인터에 넣기
	cmp		rdi, 0		; if(*str == 0)
	je		_exit
	call	_ft_strlen	; ft_strlen(rdi), return value = rax
	inc		rax			; rax = *str의 길이 + null= len + 1
	mov		rdi, rax	; rdi = len 으로 덮어 씌우기
	call	_malloc		; malloc(str의 길이 만큼 메모리 할당)
	cmp		rax, 0		; if(malloc == 0), 이때 malloc로 return값 rax는 str 크기만큼 할당된 문자열 첫 번째 메모리 주소
	je		_exit
	pop		rsi			; 맨 처음 *str의 메모리 주소 rsi에 저장
	mov		rdi, rax	; rdi에 malloc를 통해 할당된 메모리 주소 입력
	call	_ft_strcpy	; ft_strcpy(rdi, rsi) = ft_strcpy(메모리할당, 복사할 src)
	ret					; ft_strcpy를 통해 복사한 rdi의 첫 번째 주소가 rax에 들어있고 이 함수를 사용한 함수에 return

_exit:
	ret


;char *ft_strdup(const char *str)
;{
;	char *ret;
;
;	ret = malloc(ft_strlen(str) + 1);
;	if (!ret)
;		return (0);
;	ft_strcpy(ret, str);
;	return (ret);
;}
