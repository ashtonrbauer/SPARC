.section ".data"
prompt: .asciz "Sum of the array is : %d\n"
	.section ".text"

	.global main
main:
	save %sp, -96, %sp
	mov 12, %l0
	st %l0, [%sp - 4]
	mov 543, %l0
	st %l0, [%sp - 8]
	mov -142, %l0
	st %l0, [%sp - 12]
	mov -19, %l0
	st %l0, [%sp - 16]
	mov 100, %l0
	st %l0, [%sp - 20]
	call print_sum
	mov 5, %l1

	ret
	restore


	.global print_sum
print_sum:
	mov 0, %l2
	mov 0, %l3
	mov -4, %i0
loop:
	cmp %l2, %l1
	
	bge,a done		!If loop is over, move sum into %o1 for printing
	mov %l3, %o1
	
	ld [%sp + %i0], %l4
	sub %i0, 4, %i0
	add %l4, %l3, %l3
	ba loop
	add %l2, 1, %l2

done:
	set prompt, %o0
	call printf
	nop
	ret
	restore
	
	
