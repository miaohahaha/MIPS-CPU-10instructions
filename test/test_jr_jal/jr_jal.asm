ori $1,$0,1
jal label1
lui $2,1
addu $4,$1,$3

jal label2
lui $5,5
subu $8,$7,$2

jal label3
lui $9,9
ori $12,$0,12
j end
nop


label1:
jr $31
lui $3,3

label2:
lui $6,6
jr $31
lui $7,7

label3:
lui $10,10
lui $11,11
jr $31
lui $12,12

end:
lui $13,13


