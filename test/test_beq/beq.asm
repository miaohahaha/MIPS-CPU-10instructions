label0:
lui $1,1
ori $2,$1,0
beq $2,$1,label1
nop
label2:
ori $3,$1,0
nop
beq $3,$1,label3
nop
label1:
addu $4,$1,$0
beq $4,$1,label2
nop
label3:
subu $4,$1,$3
nop
beq $4,$0,label4
nop
label5:
addu $5,$1,$0
beq $1,$5,label6
nop
label4:
ori $4,$1,0
beq $1,$4,label5
nop
label6:
ori $7,$1,0
nop
beq $1,$7,label7
nop
label8:
lw $7,0($0)
beq $7,$0,label9
nop
label7:
addu $8,$1,$0
nop
beq $1,$8,label8
nop
label9:
lw $8,0($0)
beq $0,$8,label10
nop
label11:
lw $4,0($0)
nop
beq $0,$4,label12
nop
label10:
lw $5,0($0)
nop
beq $5,$0,label11
nop
label12:
lui $12,12
