.data	

n: .word 100
nl: .asciiz "\n"
tmaior: .asciiz  " É maior que 50"
tmenor: .asciiz " É menor que 50"
r: .word 0
.text

inicio:
	move $t0, $zero
	lw  $t0, n
	li $t1, 50
	slt $t2,$t1,$t0  #f se < 3 =1 senao 0 
	la $s0, r
	sw $t2, ($s0)
	li  $v0,1     
	move $a0, $t2
	syscall	
	bgtz $t2, maior
	blez, $t2, menor
maior:
	li $v0,4       
	la $t3, nl	
	move $a0, $t3    
	syscall	
	li $v0,1     
	move $a0, $t0
	syscall	
	li $v0,4      
	la $t3, tmaior  
	move $a0, $t3  
	syscall	
	b fim

menor:
	li $v0,4       
	la $t3, nl	
	move $a0, $t3  
	syscall	
	li  $v0,1     
	move $a0, $t0
	syscall
	li $v0,4       
	la $t3, tmenor	
	move $a0, $t3     
	syscall	
	b fim

fim:
