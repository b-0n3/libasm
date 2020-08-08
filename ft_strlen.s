section .text
	global ft_strlen
ft_strlen :
	mov rax , 0x0
	jmp compare
increment:
	add rax , 1
compare:
	cmp BYTE[rdi + rax] , 0
	jne  increment
	ret
