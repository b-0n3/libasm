section .text
	global _start

%macro search 2 ; arg1 charachter arg2 pointer to array
%%init:
	xor r15 , r15

%%loop:
	cmp BYTE[%2 + r15], %2
	jne inc_check
	mov r15 , 0x1
	jmp end		
	
%%inc_check:
	add r15 , 0x1
	cmp BYTE[%2 + r15], 0x0
	jne loop
	mov r15 , 0x0	
%%end:
	nop
%endmacro


%macro skipWhiteSpace 2 ; it takes  pointer to  adress and pointer to the array that holds whitespaces to skip
%%init:
	xor rax, rax
%%loop:
	search BYTE [%1 + rax] ,%2
	cmp r15 , 0x0
	jne inc_and_check
	jmp end
%%inc_and_check:
	add rax , 0x1
	cmp BYTE [%1 + rax] , 0x0
	jne loop	
%%end:
	nop
%endmacro

ft_atoi_base:
	push rbp
	mov rbp , rsp
	sub rsp, 0x20
	mov qword[rsp - 0x10] , 0x0708090A
	skipWiteSpace rsp , rdi
	
	mov rsi , rsp
	sub rsi , 0x5
	mov rdi , 0x0
	mov rdx , 0x5
	mov rax , 1
	
	syscall
	leave
	ret
_start:
	call	ft_atoi_base
	mov rax , 60
	mov rdi ,0
	syscall 

	ret			
