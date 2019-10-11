lui $1,1
lui $2,2
lui $3,3
lui $4,4
jal label1
nop
addu $2,$1,$0

jal label2
nop
addu $3,$2,$1

jal label3
nop
ori $4,$0,100

jal label31
nop
ori $18,1

jal label4
nop
lui $5,5

jal label5
nop
lui $6,6

jal label6
nop
lui $7,7

jal label7
nop 
lui $8,8

jal label8
nop
lui $9,9
j end

label1:
ori $4,$31,0
jr $4 
nop

label2:
addu $5,$31,$0
jr $5
nop

label3:
ori $6,$31,0
nop
jr $6
nop

label31:
subu $12,$31,$0
nop
jr $12
nop

label4:
sw $31,0($0)
lw $7,0($0)
jr $7
nop

label5:
sw $31,4($0)
lw $8,4($0)
nop
jr $8
nop

label6:
ori $9,$31,0
nop
nop
jr $9
nop

label7:
subu $10,$31,$0
nop
nop
jr $10 
nop

label8:
sw $31,8($0)
lw $11,8($0)
nop
nop
jr $11
nop

end:
ori $31,$0,0






