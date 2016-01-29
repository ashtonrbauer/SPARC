	.section ".data"
prompt: .asciz "Before Swap: x = %d, y = %d\n"
prompt2: .asciz "After Swap: x = %d, y = %d\n"
	.section ".text"

	.global main
main:
	save %sp, -64, %sp
	mov 3, %l0
	mov 6, %l1
	set prompt, %o0
	mov %l0, %o1
	mov %l1, %o2
	call printf
	nop
	st %l0, [%fp - 4]
	st %l1, [%fp - 8]
	sub %fp, 4, %o0
	call swap
	sub %fp, 8, %o1
	set prompt2, %o0
	ld [%fp - 4], %o1
	ld [%fp - 8], %o2
	call printf
	nop

	ret
	restore

	.global swap
swap:
	ld [%o0], %o2
	ld [%o1], %o3
	st %o2, [%o1]
	retl
	st %o3, [%o0]
	
