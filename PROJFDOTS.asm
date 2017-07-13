	proc PrintDots
	push ax
	push bx
	push cx
	push dx
Dot1:
	cmp [DOT1Bool],0
	jne skipDOT1Print
	mov cx,2
checkLoop:
	push cx
	mov cx,2
innerCheckLoop:
	push cx
	mov cx,[DOT1X]
	mov dx,[DOT1Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,14
	jne notYellow
	inc [DOT1Bool]
	pop cx
	pop cx
	jmp skipDOT1Print
notYellow:
	inc [DOT1X]
	pop cx
	loop innerCheckLoop
	inc [DOT1Y]
	dec [DOT1X]
	pop cx
	loop checkLoop
	sub [DOT1Y],2
	push offset Dot
	push 2
	push 2
	push [DOT1Y]
	push [DOT1X]
	call Print_Anything
skipDOT1Print:
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	endp PrintDots
	
	