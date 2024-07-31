.data	

n: .word 5
result: .asciiz " x "" = " "\nResultado: "
r: .word 0
.text

inicio:
	move $t0, $zero # n
	li $t1, 1 # soma
	lw $t2, n # i =0
	lw $t0, n
	la $s0, r
	
	
loop:

	mul $t1, $t1, $t0
	li  $v0,1     
	move $a0, $t0
	syscall	
	sub $t0, $t0, 1
	blez $t0,fim
	li $v0,4       
	la $t4, result	
	move $a0, $t4     
	syscall	
	b loop

	
fim: 
	li $v0,4       
	la $t4, result	
	add $a0, $t4, 4     
	syscall	
	li  $v0,1     
	move $a0, $t1  
	syscall	
	li $v0,4     
	la $t4, result
	add $t4, $t4, 8
	move $a0, $t4   
	syscall	
	li  $v0,1     
	move $a0, $t1  
	syscall
	sw $t1, ($s0)

