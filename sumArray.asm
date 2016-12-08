.586
.model flat,stdcall
.stack 4096
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

EXTERNDEF		sumArray:near
.data
one		DWORD	1
vari	DWORD	0

.code
	sumArray:

		push ebp
		mov ebp, esp
		mov eax, [ebp + 8]
		mov edx, 0
		mov ecx, 0
	
	loopy:
		cmp ecx, [ebp + 12]
		je exity
		add edx, [eax]
		add eax, 4
		inc ecx
		jmp loopy

	exity:
		mov eax, edx
		pop ebp
		ret 8
		

	end sumArray