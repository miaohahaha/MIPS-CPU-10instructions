lui $2,1
lui $3,3
lui $4,4
lui $5,5
lui $7,7
sw $3,0($0)
sw $4,4($0)
sw $5,8($0)
sw $2,12($0)

lw $6,0($1)
ori $6,$6,0xf
 
lw $10,8($1)
lui $17,17
ori $11,$10,0xff

lw $5,0($1)
lui $17,19
lui $17,20
ori $6,$5,0xfff

lw $10,0($1)
lui $17,17
lui $17,19
lui $17,20
ori $11,$10,0x122


lw $5,0($1)
lui $17,19
lui $17,20
lui $17,19
lui $17,20
ori $6,$5,0x103








