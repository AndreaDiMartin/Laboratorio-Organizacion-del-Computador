.data
n:	.byte	'#'
s:	.byte	' '

shipU:	.byte 	'A'
shipD:	.byte 	'V'
shipL:	.byte	'<'
shipR:	.byte 	'>'


field:	.word 	n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,shipU,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word	n,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,n
	.word 	n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n,n
