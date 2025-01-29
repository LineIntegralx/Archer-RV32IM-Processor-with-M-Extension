li x1, 0xFFFFFFFF
li x2, 0x80000000
li x3, 0x7FFFFFFF
li x4, 0x04
li x5, 0x02
li x6, 0xFFFFFFFE

#Testing MUL
#Test 1: 2 positive
mul x7, x4, x5
#Test 2: 1 positive, 1 negative
mul x8, x4, x6
#Test 3: 2 negative
mul x9, x6, x6
#Test 4: 1 zero
mul x10, x4, x0

#Testing MULH
#Test 1: 2 positive
mulh x11, x3, x5
#Test 2: 1 positive, 1 negative
mulh x12, x3, x6
#Test 3: 2 negative
mulh x13, x6, x2
#Test 4: 1 zero
mulh x14, x3, x0

#Testing MULHSU
#Test 1: 2 positive
mulhsu x15, x3, x5
#Test 2: 1 positive, 1 negative
mulhsu x16, x6, x3
#Test 3: 1 zero
mulhsu x17, x3, x0

#Testing MULHU
#Test 1: 2 numbers
mulhu x18, x3, x5
#Test 4: 1 zero
mulhu x19, x3, x0

#Testing DIV
#Test 1: 2 positive
div x20, x3, x5
#Test 2: 1 positive, 1 negative
div x21, x3, x6
#Test 3: 2 negative
div x22, x6, x2
#Test 4: 1 zero
div x23, x3, x0
#Test 5: Overflow
div x24, x2, x1

#Testing DIVU
#Test 1: 2 numbers
divu x25, x3, x5
#Test 4: 1 zero
divu x26, x3, x0

#Testing REM
#Test 1: 2 positive
rem x27, x3, x5
#Test 2: 1 positive, 1 negative
rem x28, x3, x6
#Test 3: 2 negative
rem x29, x6, x2
#Test 4: 1 zero
rem x30, x3, x0 
#Test 5: Overflow
rem x31, x2, x1

#Testing REMU
#Test 1: 2 numbers
remu x12, x3, x5
#Test 4: 1 zero
remu x13, x3, x0
ecall
