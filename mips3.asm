.data	

n: .word 7
nl: .asciiz  ", "
fib: .word 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0
.text

inicio:
	move $t0, $zero # n
	lw  $t0, n
	li $t1, 1 # soma
	li $t2, 0 #  n-2
	li $t3, 1 #  n-1
	li  $t4, 2 # i =0
	la $s0, fib
	li  $v0,1     
	move $a0, $t2
	syscall
	sw $t2, ($s0)
	add $s0, $s0, 4
	li $v0,4       
	la $t5, nl	
	move $a0, $t5     
	syscall	
	sw $t3, ($s0)
	add $s0, $s0, 4
	li  $v0,1     
	move $a0, $t3
	syscall
	li $v0,4       
	la $t5, nl	
	move $a0, $t5     
	syscall	
	
loop:
	move $t3, $t1
	add $t1, $t2, $t3
	add $t4, $t4, 1
	move $t2, $t3
	li  $v0,1     
	move $a0, $t1
	syscall	
	sw $t1, ($s0)
	add $s0, $s0, 4
	bgt $t4,$t0, fim
	li $v0,4       
	la $t5, nl	
	move $a0, $t5     
	syscall	
	b loop

	
fim: 
