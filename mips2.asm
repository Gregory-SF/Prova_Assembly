.data	

n: .word 6
nl: .asciiz  " x "
result: .asciiz " = " "\nResultado: "
.text

inicio:
	move $t0, $zero # n
	li $t1, 1 # soma
	lw $t2, n # i =0
	lw  $t0, n
	
loop:

	mul $t1, $t1, $t0
	li  $v0,1     
	add $a0, $zero, $t0        
	move $a0, $t0
	syscall	
	sub $t0, $t0, 1
	blez $t0,fim
	li $v0,4       
	la $t2, nl	
	add $a0, $zero, $t2     
	syscall	
	b loop

	
fim: 
	li $v0,4       
	la $t2, result	
	add $a0, $zero, $t2     
	syscall	
	li  $v0,1     
	add $a0, $zero, $t1        
	move $a0, $t1  
	syscall	
	li $v0,4       
	la $t2, result
	add $t2, $t2, 4	
	add $a0, $zero, $t2     
	syscall	
	li  $v0,1     
	add $a0, $zero, $t1        
	move $a0, $t1  
	syscall	
