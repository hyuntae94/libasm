section.text:
	global _ft_strlen

_ft_strlen:
	mov		rax, 0;int i = 0
	jmp		_count

_count:
	cmp		BYTE[rdi + rax], 0;null인지 아닌지
	je		_exit
	inc		rax
	jmp		_count;다시 반복문 실행

_exit:
	ret

;int	ft_strlen(const char *s)
;{
;	int i = 0;
;
;	while(s[i])
;		i++;
;	return i;
;}
