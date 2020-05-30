_DATA SEGMENT
_DATA ENDS

_TEXT SEGMENT

	PUBLIC cycle_start
	PUBLIC cycle_end
	cycle_start PROC
		mfence
		lfence
		rdtsc
		shl     rdx, 20h
		or      rax, rdx
		ret
	cycle_start ENDP
	cycle_end PROC
		rdtscp
		lfence
		shl     rdx, 20h
		or      rax, rdx
		ret
	cycle_end ENDP

	PUBLIC read
	read PROC
		mov rax, 0
		forLoop:
				N = 16
				i = 0
				while i lt N
					prefetcht2 [rcx + rax * 4 + 000h + 200h * (i + 3)]
					vmovups ymm0 , ymmword ptr [rcx + rax * 4 + 000h + 200h * i]
					vmovups ymm1 , ymmword ptr [rcx + rax * 4 + 020h + 200h * i]
					vmovups ymm2 , ymmword ptr [rcx + rax * 4 + 040h + 200h * i]
					vmovups ymm3 , ymmword ptr [rcx + rax * 4 + 060h + 200h * i]
					vmovups ymm4 , ymmword ptr [rcx + rax * 4 + 080h + 200h * i]
					vmovups ymm5 , ymmword ptr [rcx + rax * 4 + 0a0h + 200h * i]
					vmovups ymm6 , ymmword ptr [rcx + rax * 4 + 0c0h + 200h * i]
					vmovups ymm7 , ymmword ptr [rcx + rax * 4 + 0e0h + 200h * i]
					vmovups ymm8 , ymmword ptr [rcx + rax * 4 + 100h + 200h * i]
					vmovups ymm9 , ymmword ptr [rcx + rax * 4 + 120h + 200h * i]
					vmovups ymm10, ymmword ptr [rcx + rax * 4 + 140h + 200h * i]
					vmovups ymm11, ymmword ptr [rcx + rax * 4 + 160h + 200h * i]
					vmovups ymm12, ymmword ptr [rcx + rax * 4 + 180h + 200h * i]
					vmovups ymm13, ymmword ptr [rcx + rax * 4 + 1a0h + 200h * i]
					vmovups ymm14, ymmword ptr [rcx + rax * 4 + 1c0h + 200h * i]
					vmovups ymm15, ymmword ptr [rcx + rax * 4 + 1e0h + 200h * i]
					i = i + 1
				endm

				add rax, 80h * N
				cmp rax, rdx
				jl forLoop
		endLoop:
		ret	
	read ENDP

	PUBLIC write
	write PROC
		forLoop:
				sub rdx, 8h

				vmovntps ymmword ptr [rcx + rdx * 4 + 000h], ymm0

				cmp rdx, 0
				jg forLoop
		endLoop:
		ret	
	write ENDP

_TEXT ENDS
END