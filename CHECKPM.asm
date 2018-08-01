	proc check_PM_up;checks if pacman can move up (if there aren't any walls)
	push ax
	push bx
	push cx
	push dx
	push [PACMAN_X]
	push [PACMAN_Y]
	dec [PACMAN_Y]
	mov cx,13
checkForBorders:;reads all the pixels in the row above pacman to check for walls (the colour 1,blue)
	push cx
	mov cx,[PACMAN_X]
	mov dx,[PACMAN_Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,1
	jne notBorder
	mov [moveBool],1
	pop cx
	jmp endUpCheck
notBorder:
	inc [PACMAN_X]
	pop cx
	loop checkForBorders
endUpCheck:	
	pop [PACMAN_Y]
	pop [PACMAN_X]
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	endp check_PM_up
	
	proc check_PM_left;same as the last procedure but for the left side
	push ax
	push bx
	push cx
	push dx
	push [PACMAN_X]
	push [PACMAN_Y]
	dec [PACMAN_X]
	mov cx,13
checkForBorders2:
	push cx
	mov cx,[PACMAN_X]
	mov dx,[PACMAN_Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,1
	jne notBorder2
	mov [moveBool],1
	pop cx
	jmp endLeftCheck
notBorder2:
	inc [PACMAN_Y]
	pop cx
	loop checkForBorders2
endLeftCheck:	
	pop [PACMAN_Y]
	pop [PACMAN_X]
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	endp check_PM_left
	
	proc check_PM_right;same as the last 2 but for the right side
	push ax
	push bx
	push cx
	push dx
	push [PACMAN_X]
	push [PACMAN_Y]
	add [PACMAN_X],13
	mov cx,13
checkForBorders3:
	push cx
	mov cx,[PACMAN_X]
	mov dx,[PACMAN_Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,1
	jne notBorder3
	mov [moveBool],1
	pop cx
	jmp endRightCheck
notBorder3:
	inc [PACMAN_Y]
	pop cx
	loop checkForBorders3
endRightCheck:	
	pop [PACMAN_Y]
	pop [PACMAN_X]
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	endp check_PM_right
	
	proc check_PM_down;same as the last 3 but for the bottom side
	push ax
	push bx
	push cx
	push dx
	push [PACMAN_X]
	push [PACMAN_Y]
	add [PACMAN_Y],13
	mov cx,13
checkForBorders4:
	push cx
	mov cx,[PACMAN_X]
	mov dx,[PACMAN_Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,1
	jne notBorder4
	mov [moveBool],1
	pop cx
	jmp endDownCheck
notBorder4:
	inc [PACMAN_X]
	pop cx
	loop checkForBorders4
endDownCheck:	
	pop [PACMAN_Y]
	pop [PACMAN_X]
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	endp check_PM_down