%include 'in_out.asm'

SECTION .data
msgX db 'Enter x: ', 0            
msgA db 'Enter a: ', 0           
resultMsg db 'f(x) = ', 0         
  
            
SECTION .bss
x resd 1                         
a resd 1                         
result resd 1                     

SECTION .text
GLOBAL _start

_start:
    mov eax, msgX                
    call sprint
    mov ecx, x                    
    mov edx, 10                  
    call sread
    mov eax, x
    call atoi                  
    mov [x], eax                
    
    mov eax, msgA               
    call sprint
    mov ecx, a                 
    mov edx, 10               
    call sread
    mov eax, a
    call atoi                     
    mov [a], eax                

    mov eax, [x]                
    cmp eax, 3                   
    je compute_3x                 

    mov eax, [a]             
    add eax, 1                  
    jmp display_result         

compute_3x:
    mov eax, [x]               
    imul eax, 3                   

display_result:
    mov [result], eax             
    mov eax, resultMsg           
    call sprint
    mov eax, [result]            
    call iprintLF               
    call quit                 

