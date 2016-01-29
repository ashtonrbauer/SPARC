	.section ".data"
prompt: .asciz "X: %d , Y: %d, Z: %d.\n"
prompt2: .asciz "Y + X = %#010x\n"
prompt3: .asciz "Z - Y = %#010x\n"
prompt4: .asciz "(Z - Y) - (Y + X) = %#010x\n"
test: .asciz " %d\n"
	.section ".text"

	.global main
main:
	save %sp, -64, %sp
        call subro1
        nop
        .word 340, 412, 1522
	ld [%sp - 4], %l1
	ld [%sp - 8], %l2
	ld [%sp - 12], %l3
	set prompt2, %o0
	mov %l1, %o1
	call printf
	nop
	set prompt3, %o0
	mov %l2, %o1
	call printf
	nop
	set prompt4, %o0
	mov %l3, %o1
	call printf
	nop

        ret
        restore


        .global subro1
subro1:
        save %sp, -64, %sp
        ld [%i7 + 8], %l0
        ld [%i7 + 12], %l1
        ld [%i7 + 16], %l2
        set prompt, %o0
        mov %l0, %o1
        mov %l1, %o2
        mov %l2, %o3
        call printf
        nop
	add %l1, %l0, %i0
	sub %l2, %l1, %i1
	sub %i1, %i0, %i2
	st %i0, [%fp - 4]
	st %i1, [%fp - 8]
	st %i2, [%fp - 12]
	
        jmpl %i7 + 20, %g0
        restore

