section .text
	extern malloc
	global ft_strdup
%macro __len 1
%%loop:

	cmp BYTE[%1 + rax], 0x0
	je %%end
	add rax , 0x1
	jmp %%loop

%%end:
	nop
%endmacro

%macro copy 2
%%loop:
	mov r8b , BYTE[%2 + rax]
	mov BYTE[%1 + rax] , r8b	
	cmp BYTE[%2 + rax] , 0x0
	je %%end
	add rax , 0x1
	jmp %%loop
%%end:
	nop
%endmacro
ft_strdup:
	xor rax,rax
	xor rsi , rsi 
	cmp rdi ,0x0
	je return
	__len rdi
	push rdi
	add rax , 0x1
	mov rdi, rax
	call malloc
	cmp rax , 0x0
	je return
	mov rsi, rax
	pop rdi
	xor rax, rax
	copy rsi ,rdi
return :
	mov rax , rsi
	ret
