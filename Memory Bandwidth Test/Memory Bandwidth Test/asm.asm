_DATA SEGMENT
_DATA ENDS

_TEXT SEGMENT

	PUBLIC read
	read PROC
		forLoop:
				sub rdx, 80h

				vmovups ymm0 , ymmword ptr [rcx + rdx * 4 + 000h]
				vmovups ymm1 , ymmword ptr [rcx + rdx * 4 + 020h]
				vmovups ymm2 , ymmword ptr [rcx + rdx * 4 + 040h]
				vmovups ymm3 , ymmword ptr [rcx + rdx * 4 + 060h]

				vmovups ymm4 , ymmword ptr [rcx + rdx * 4 + 080h]
				vmovups ymm5 , ymmword ptr [rcx + rdx * 4 + 0a0h]
				vmovups ymm6 , ymmword ptr [rcx + rdx * 4 + 0c0h]
				vmovups ymm7 , ymmword ptr [rcx + rdx * 4 + 0e0h]


				vmovups ymm8 , ymmword ptr [rcx + rdx * 4 + 100h]
				vmovups ymm9 , ymmword ptr [rcx + rdx * 4 + 120h]
				vmovups ymm10, ymmword ptr [rcx + rdx * 4 + 140h]
				vmovups ymm11, ymmword ptr [rcx + rdx * 4 + 160h]

				vmovups ymm12, ymmword ptr [rcx + rdx * 4 + 180h]
				vmovups ymm13, ymmword ptr [rcx + rdx * 4 + 1a0h]
				vmovups ymm14, ymmword ptr [rcx + rdx * 4 + 1c0h]
				vmovups ymm15, ymmword ptr [rcx + rdx * 4 + 1e0h]

				cmp rdx, 0
				jg forLoop
		endLoop:
		ret	
	read ENDP

	PUBLIC write
	write PROC
		forLoop:
				sub rdx, 80h

				vmovups ymmword ptr [rcx + rdx * 4 + 000h], ymm0
				vmovups ymmword ptr [rcx + rdx * 4 + 020h], ymm1
				vmovups ymmword ptr [rcx + rdx * 4 + 040h], ymm2
				vmovups ymmword ptr [rcx + rdx * 4 + 060h], ymm3

				vmovups ymmword ptr [rcx + rdx * 4 + 080h], ymm4
				vmovups ymmword ptr [rcx + rdx * 4 + 0a0h], ymm5
				vmovups ymmword ptr [rcx + rdx * 4 + 0c0h], ymm6
				vmovups ymmword ptr [rcx + rdx * 4 + 0e0h], ymm7

				
				vmovups ymmword ptr [rcx + rdx * 4 + 100h], ymm8
				vmovups ymmword ptr [rcx + rdx * 4 + 120h], ymm9
				vmovups ymmword ptr [rcx + rdx * 4 + 140h], ymm10
				vmovups ymmword ptr [rcx + rdx * 4 + 160h], ymm11

				vmovups ymmword ptr [rcx + rdx * 4 + 180h], ymm12
				vmovups ymmword ptr [rcx + rdx * 4 + 1a0h], ymm13
				vmovups ymmword ptr [rcx + rdx * 4 + 1c0h], ymm14
				vmovups ymmword ptr [rcx + rdx * 4 + 1e0h], ymm15

				cmp rdx, 0
				jg forLoop
		endLoop:
		ret	
	write ENDP

_TEXT ENDS
END