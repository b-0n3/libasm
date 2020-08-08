section .text
	global ft_strcpy

ft_strcpy:
	xor rax , rax
	cmp rsi , 0x0
	jne copy
	jmp return
increment:
	add rax , 0x1
copy: 
	mov r9b , BYTE [rsi + rax]
	mov BYTE  [rdi + rax] , r9b
	cmp BYTE [rsi + rax] , 0x0
	jne increment
return:
	mov rax ,rdi
	ret
