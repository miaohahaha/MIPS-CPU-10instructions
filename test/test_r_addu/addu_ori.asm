lui $1,1
lui $2,2
lui $3,3
lui $4,4
lui $5,5
lui $6,6
lui $7,7
lui $8,8
lui $9,9
lui $10,10
lui $11,11
lui $13,13
lui $14,14
lui $15,15
lui $16,16

ori $1, $2, 1
addu $4, $1, $2
ori $5, $6, 1
addu $7, $6, $5

ori $3, $8, 1
lui $9, 9
addu $10, $3, $8
ori $11, $8, 2
lui $9, 10
addu $10, $11, $8

ori $1, $2, 10
lui $2,12
lui $2,13
addu $4, $1, $2
ori $5, $6, 10
lui $6,14
lui $6,17
addu $7, $6, $5

ori $3, $8, 100
lui $9, 9
lui $2,12
lui $2,13
addu $10, $3, $8
ori $11, $8, 200
lui $9, 10
lui $2,12
lui $2,13
addu $10, $11, $8

ori $1, $2, 20
lui $2,12
lui $2,13
lui $6,14
lui $6,17
addu $4, $1, $2
ori $5, $6, 20
lui $6,14
lui $6,17
lui $2,12
lui $2,13
addu $7, $6, $5

