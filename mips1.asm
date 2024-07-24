.data	

n: .word 5
nl: .asciiz "\n"
tmaior: .asciiz  " É maior que 50"
tmenor: .asciiz " É menor que 50"
.text

inicio:
	move $t0, $zero
	lw  $t0, n
	li $t1, 50
	slt $t2,$t1,$t0  #f se < 3 =1 senao 0 
	li  $v0,1     
	add $a0, $zero, $t2          
	move $a0, $t2
	syscall	
	bgtz $t2, maior
	blez, $t2, menor
maior:
	li $v0,4       
	la $t2, nl	
	add $a0, $zero, $t2     
	syscall	
	li  $v0,1     
	add $a0, $zero, $t0          
	move $a0, $t0
	syscall	
	li $v0,4      
	la $t2, tmaior  
	add $a0, $zero, $t2  
	syscall	
	b fim

menor:
	li $v0,4       
	la $t2, nl	
	add $a0, $zero, $t2     
	syscall	
	li  $v0,1     
	add $a0, $zero, $t0          
	move $a0, $t0
	syscall
	li $v0,4       
	la $t2, tmenor	
	add $a0, $zero, $t2     
	syscall	
	b fim

fim:
