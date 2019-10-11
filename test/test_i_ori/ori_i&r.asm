lui $1,1
lui $2,2
lui $3,3
lui $4,4
lui $5,5
lui $6,6
lui $7,7
lui $8,8

ori $2,$1,1
ori $3,$2,1300


ori $4,$5,100
lui $9,9
ori $5,$6,0x1ff

addu $1,$6,$2
ori $7,$1,0xfff

subu $2,$3,$1
lui $9,10
ori $4,$9,0xfff


ori $6,$3,10111
lui $1,1
lui $2,2
ori $7,$6,11

addu $3,$2,$7
lui $1,1
lui $2,2
ori $8,$3,111

ori $6,$3,1023
lui $1,1
lui $2,2
lui $5,5
ori $7,$6,11

addu $3,$2,$8
lui $1,1
lui $2,2
lui $6,6
ori $8,$3,111

ori $6,$4,1011
lui $1,1
lui $2,2
lui $5,5
lui $4,4
ori $7,$6,11

subu $3,$2,$8
lui $5,5
lui $1,1
lui $2,2
lui $6,6
ori $8,$3,111
