.global lab1
.syntax unified

@(a | b)*c, (a * b)≥ 10, (a & b)*c, (a * b) < 10

#define a #2
#define b #3
#define c #4
lab1:

    mov r0, a   
    mov r1, b   
    mov r2, c   
    mov r3, #0
    mov r4, #0
    mov r5, #0
    mov r6, #0
    mov r7, #0

    bl calculate 
    bx lr

calculate:
    push {lr}
    
    @Calculate (a|b)*c

    orr r7, r0, r1
    mul r3, r7, r2
    
    @Calculate (a&b)*c

    and r7, r0, r1
    mul r4, r7, r2

    @Calculate (a*b)>=10
    
    mul r7, r0, r1
    cmp     r7, #10
    bpl greaterten


    @Calculate (a*b)<10
    
    cmp r7, #10
    blt lessten

    b end

greaterten:
    mov r5, r7

lessten:
    mov r6, r7
    pop {pc}

end:
    pop {pc}
    	
             
    
