%include 'in_out.asm'
SECTION .data
msg_x db 'Введите значение переменной x: ', 0    
msg_a db 'Введите значение переменной a: ', 0     
msg_result db 'Результат: ', 0                   
SECTION .bss
x resb 10                                          
a resb 10                                      
result resd 1                                     
SECTION .text
GLOBAL _start
_start:
mov eax, msg_x                                    
call sprint                                      
mov ecx, x                                      
mov edx, 10                                      
call sread                                       
mov eax, x                                     
call atoi                                       
mov edi, eax                                      
mov eax, msg_a                                   
call sprint                                      
mov ecx, a                                      
mov edx, 10                                      
call sread                                       
mov eax, a                                       
call atoi                                        
mov esi, eax                                      
cmp edi, esi                                      
jge computeFunction                                
mov eax, 5                                       
jmp storeResult                                   
computeFunction:
sub edi, esi                                      
mov eax, edi                                      
storeResult:
mov [result], eax                                
mov eax, msg_result                               
call sprint                                      
mov eax, [result]                                 
call iprintLF                                     
call quit