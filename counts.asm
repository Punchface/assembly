.586
.model flat,stdcall
option casemap:none

include     c:\masm32\include\windows.inc
include     c:\masm32\include\kernel32.inc
include		c:\masm32\include\user32.inc
include		c:\masm32\include\msvcrt.inc
include		c:\masm32\include\ca296.inc

includelib c:\masm32\lib\ca296.lib
includelib kernel32.lib
includelib user32.lib
includelib msvcrt.lib

EXTERNDEF		count:near

.data
zeroes		DWORD	0
negatives	DWORD	0
positives	DWORD	0    
mylist		DWORD	0
.code
	count:
		
		push ebp
		mov ebp, esp
		mov eax, [ebp + 8]
		mov edx, 0
		mov ecx, 0

	loopy:
		add eax, 4
		cmp ecx, [ebp + 12]
		je exity
		mov ebx, 0
		cmp [eax], ebx
		je zers
		jg poss
		jl negs
		
		jmp loopy

	poss:
		
		inc positives
		inc ecx
		jmp loopy

	negs:

		inc negatives
		inc ecx
		jmp loopy

	zers:

		inc zeroes
		inc ecx
		jmp loopy


	exity:
		mov eax, negatives
		mov [mylist], eax
		mov eax, zeroes
		mov [mylist + 4], eax
		mov eax, positives
		mov [mylist + 8], eax
		mov eax, offset mylist
		pop ebp
		ret 8

end