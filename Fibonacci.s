

        .section ".data"
prompt2: .asciz "Fib[%d] = %d\n"
        .section ".text"

        .global main
main:
        save %sp, -96, %sp
        mov 1, %l0              !x = 1
        sth %l0, [%sp - 2]       !fib[0] = 1
	set prompt2, %o0
	mov 0, %o1
	lduh [%sp - 2], %o2
	call printf
	nop
	sth %l0, [%sp - 4]	!fib[1] = 1
	set prompt2, %o0
	mov 1, %o1
	lduh [%sp - 4], %o2
	call printf
	nop
	call fibonacci
	nop

        ret
        restore

        .global fibonacci
fibonacci:
	save %sp, -64, %sp
        lduh [%fp - 2], %l0
	lduh [%fp - 4], %l1
	mov 2, %l3		!index 
        mov -6, %i0		!location starting at f[2]
loop:
        add %l0, %l1, %l2
	sth %l2, [%fp + %i0]
        set prompt2, %o0
        mov %l3, %o1
        mov %l2, %o2
        call printf
        nop
	mov %l1, %l0
	mov %l2, %l1

        sub %l2, 2, %l2
        add %l3, 1, %l3
        cmp %l3, 15
        bl loop
        nop

	ret
	restore
