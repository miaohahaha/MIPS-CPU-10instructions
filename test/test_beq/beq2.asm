lui $1,1
ori $2,$1,0
nop
nop
beq $2,$1,label1
nop

label2:
sw $1,0($0)
lw $4,0($0)
nop
nop
beq $4,$1,label3
nop

label1:
addu $3,$0,$1
nop
nop
beq $3,$1,label2
nop

label3:
ori $5,$1,0
nop
nop
beq $1,$5,label4
nop

label5:
sw $1,4($0)
lw $7,4($0)
nop
nop
beq $1,$7,end
nop

label4:
subu $6,$1,$0
nop
nop
beq $1,$6,label5
nop

end:
lui $8,8