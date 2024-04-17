.arch armv8-a
.text
.type main, %function
.global main
.p2align 2
main:
//Prologue
sub sp, sp, #112
stp x29, x30, [sp]
mov x29, sp
str sp, #72, [sp, #48]
.size main,(.-main)
