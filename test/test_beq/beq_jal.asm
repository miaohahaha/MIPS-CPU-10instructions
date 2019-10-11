ori $1,$0,1
ori $4,0x3014
ori $9,0x302c
jal label1
lui $2,2
addu $3,$2,$1

label1:
beq $31,$4,label2
lui $5,5
lui $6,6

label2:
jal label3
lui $7,7
lui $8,8

label3:
beq $9,$31,label4
lui $9,9
lui $10,10

label4:
jal label5
ori $13,$0,0x3044
lui $12,12

label5:
lui $14,1
beq $13,$31,label6
lui $15,2
lui $16,3

label6:
jal label7
ori $17,$0,0x3060
lui $18,4

label7:
lui $19,5
beq $31,$17,label8
lui $20,6
lui $31,7

label8:
jal label9
ori $22,$0,0x307c
lui $21,7

label9:
lui $24,8
lui $23,9
beq $31,$22,label10
addu $1,$2,$3
subu $4,$2,$3  

label10:
jal label11
ori $23,$0,0x309c
ori $5,5

label11:
ori $6,6
ori $7,7
beq $23,$31,label12
ori $8,8
ori $9,9

label12:
ori $10,10


