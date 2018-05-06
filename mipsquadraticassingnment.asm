.data
num1: .asciiz "THIS PROGRAM WILL SOLVE YOUR QUADRAIC PROBLEMS "
NUM2: .asciiz "enter value of A "
num3: .asciiz "enter value of B "
NUM4: .asciiz "enter value of C "
NUM5: .asciiz "this equation is complex "
num6: .asciiz "VALUE FOR X1  "
num7: .asciiz "  VALUE FOR X2  "
num8: .float   2.0


.text
li $v0,4
la $a0,num1
syscall

li $v0,4
la $a0,NUM2
syscall

li $v0,5
syscall
move $t2,$v0

li $v0,4
la $a0,num3
syscall

li $v0,5
syscall
move $t3,$v0

li $v0,4
la $a0,NUM4
syscall

li $v0,5
syscall
move $t4,$v0

li $t7,4

mtc1 $t7,$f7
cvt.s.w $f7,$f7

mtc1 $t2,$f2
cvt.s.w $f2,$f2

mtc1 $t3,$f3
cvt.s.w $f3,$f3

mtc1 $t4,$f4
cvt.s.w $f4,$f4

li $t6,-1
mtc1 $t6,$f6
cvt.s.w $f6,$f6

li $t0,2
mtc1 $t0,$f15
cvt.s.w $f15,$f15


mul.s $f8, $f3,$f3 #the value for b^2
mul.s $f9, $f2,$f4 # the value for ac
mul.s $f9, $f7,$f9 # vale 4ac
sub.s $f11,$f8,$f9 # b^2-4ac

sqrt.s $f13,$f11 #squreroot of b^2-4ac

mul.s $f6,$f3,$f6
mul.s $f15,$f2,$f15

#VALUE FOR X1
add.s $f16,$f6,$f13
div.s $f16,$f16,$f15

li $v0,4
la $a0,num6
syscall

li $v0,2
mov.s $f12,$f16
syscall


#VALUE FOR X2
sub.s $f17,$f6,$f13
div.s $f17,$f17,$f15


li $v0,4
la $a0,num7
syscall

li $v0,2
mov.s $f12,$f17
syscall


exit:










