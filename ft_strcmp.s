section .text
	global ft_strcmp

; cmp two bytes and and choose 
%macro compare 2
	cmp %1, 0x0
	je _checkstr1
	cmp %2 ,0x0
	je _checkstr2
	mov r8b , %1
	sub r8b , %2
	cmp r8b , 0x0
	jne check_and_ret
%endmacro 

%macro return 1
	mov rax , %1
	ret
%endmacro

_checkstr1:
	cmp BYTE[rsi + rax],0x0
	je equal
	return -1

_checkstr2:
	cmp BYTE[rdi + rax] , 0x0
	je equal
	return 1
equal:
	return 0

increment:
	add rax , 0x1
	jmp loop

ft_strcmp:
	xor rax ,rax
	xor r8b , r8b

loop:
	compare BYTE[rdi + rax] , BYTE[rsi + rax]
	jmp increment 
check_and_ret:
	cmp r8b , 0x0
	jl _less	
	return 1
_less:
	return -1
