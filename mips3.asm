.data	

n: .word 7
nl: .asciiz  ", "
.text

inicio:
	move $t0, $zero # n
	lw  $t0, n
	li $t1, 1 # soma
	li $t2, 0 #  n-2
	li $t3, 1 #  n-1
	li  $t4, 2 # i =0
	li  $v0,1     
	add $a0, $zero, $t2        
	move $a0, $t2
	syscall
	li $v0,4       
	la $t5, nl	
	add $a0, $zero, $t5     
	syscall	
	li  $v0,1     
	add $a0, $zero, $t3        
	move $a0, $t3
	syscall
	li $v0,4       
	la $t5, nl	
	add $a0, $zero, $t5     
	syscall	
	
loop:
	move $t3, $t1
	add $t1, $t2, $t3
	add $t4, $t4, 1
	move $t2, $t3
	li  $v0,1     
	add $a0, $zero, $t1        
	move $a0, $t1
	syscall	
	bgt $t4,$t0, fim
	li $v0,4       
	la $t5, nl	
	add $a0, $zero, $t5     
	syscall	
	b loop

	
fim: 
