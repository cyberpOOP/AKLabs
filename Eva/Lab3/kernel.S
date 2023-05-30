.syntax unified
.cpu cortex-m4
//.fpu softvfp
.thumb

#define a #4
#define b #4
#define c #5

//global memory locations
.global vtable_kernel
.global __kernel_reset__

.type vtable_kernel, %object
.type __kernel_reset__, %function

.section .interrupt_vector
vtable_kernel:
  .word __stack_start
  .word __kernel_reset__+1
  .size vtable_kernel, .-vtable_kernel

.section .rodata
  start: .asciz "kernel start\n"
  finish: .asciz "value in reg #1: "

.section .text
__kernel_reset__:
  	ldr r0, =start
  	bl dbgput_line

  	//calculating
    push {lr} 
  	mov r0, a 
  	mov r1, b    
 	mov r2, c  

  	add r3, r0, r1
    mov r4, #2
  	sdiv r3, r3, r4

    mov r1, #1
    loop:
        mul r1, r1, r2
        subs r2, r2, #1
        cmp r2, #0
        bhi loop
    
    add r5, r3, r1
    
    ldr r0, =finish
  	bl dbgput
        mov r0, r5
        bl dbgput_num
        end:
    	b end  


  	
