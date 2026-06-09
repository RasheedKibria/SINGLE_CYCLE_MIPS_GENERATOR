addi $s0,$zero,6
addi $s1,$zer0,3
add $a0,$zero,$s0
add $a1,$zero,$s1
jal NCR
mul $s2,$v0,$s2
div $s2,$s2,$s0
j EXIT1

NCR:
	addi $t0,$zero,1
	addi $t1,$zero,1
	add $t2,$ra,$zero
	
cond:
	ble $t0,$a1,LOOP
	j EXIT

LOOP:
	mul $t1,$t1,$a0
	addi $a0,$a0,-1
	addi $t0,$t0,1
	j cond

EXIT:
	add $a0,$zero,$a1
	jal fact
	div $v0,$t1,$v0
	add $ra,$zero,$t2
	jr $ra

fact: 
	addi $sp,$sp,-2
	sw $ra,0($sp)
	sw $a0,1($sp)

base:
	addi $t3,$zero,1
	bgt $a0,$t3,recursive
	addi $v0,$zero,1
	lw $ra,0($sp)
	lw $a0,1($sp)
	jr $ra

recursive:
		addi $a0,$a0,-1
		jal fact
		lw $ra,0($sp)
		lw $a0,1($sp)
		addi $sp,$sp,2
		mul $v0,$a0,$v0
		jr $ra		
EXIT1: