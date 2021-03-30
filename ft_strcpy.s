section.text:
	global _ft_strcpy

_ft_strcpy:
	mov		rax, 0
	cmp		rsi, 0
	je		_end

_copy:
	mov		cl, BYTE [rsi + rax]
	mov		BYTE [rdi + rax], cl
	cmp		cl, 0
	je		_end
	inc		rax
	jmp		_copy

_end:
	mov		rax, rdi
	ret

;char *ft_strcpy(char *dest, const char *src)
;{
;	int i = 0;
;
;	while (src[i] != 0)
;	{
;		dest[i] = src[i];
;		i++;
;	}
;	dest[i] = src[i];
;	return (dest);
;}
