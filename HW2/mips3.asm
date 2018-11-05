# take number 3 from string

        .text
main:
    li $v0, 4       
    la $a0, prompt
    syscall

    li $v0, 8       
    la $a0, input
    li $a1, 100
    syscall

    move $s0, $a0

loop:
    lb $a0, 0($s0)
    addi $s0, $s0, 1
    beq $a0, 'Z', loop
    beq $a0, $zero, done    

    li $v0, 11
    syscall

    j loop

done:
    jr $ra

    .data
prompt: .asciiz "Enter a string: "

input: .space 100
