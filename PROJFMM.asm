	proc mainMenu;prints all of the main menu screen in the according locations and colours
	push ax
	push bx
	push cx
	push dx
	push bp
	push es
	mov ah,2Ch;get system time
	int 21h;dl is in 1/100 seconds
	cmp dl,20;this area checks in which part of the second the time is and changes the colour of the text that is printed in the main menu accordingly
	jbe PrintC
	cmp dl,40
	jbe IncreaseColorBy1
	cmp dl,60
	jbe IncreaseColorBy2
	cmp dl,80
	jbe IncreaseColorBy3
IncreaseColorBy4:
	mov [ColorValueIncrease],4;ColorValueIncrease will increase the colour value of the text in the main menu so the text will change colour
	jmp PrintC
IncreaseColorBy3:
	mov [ColorValueIncrease],3
	jmp PrintC
IncreaseColorBy2:
	mov [ColorValueIncrease],2
	jmp PrintC
IncreaseColorBy1:
	mov [ColorValueIncrease],1
printC:;this area prints all the letters in "Crennui's Legends" on the screen
	push offset PixelatedC
	push 16
	push 22
	push [PixelatedC_Y]
	push [PixelatedC_X]
	call Print_Anything2
PrintR:	
	push offset PixelatedR
	push 16
	push 22
	push [PixelatedR_Y]
	push [PixelatedR_X]
	call Print_Anything2
PrintE1:
	push offset PixelatedE
	push 16
	push 22
	push [PixelatedE_Y]
	push [PixelatedE_X]
	call Print_Anything2
PrintN1:
	push offset PixelatedN
	push 18
	push 22
	push [PixelatedN_Y]
	push [PixelatedN_X]
	call Print_Anything2
PrintN2:
	push offset PixelatedN
	push 18
	push 22
	push [PixelatedN2_Y]
	push [PixelatedN2_X]
	call Print_Anything2
PrintU:
	push offset PixelatedU
	push 16
	push 22
	push [PixelatedU_Y]
	push [PixelatedU_X]
	call Print_Anything2
PrintI:
	push offset PixelatedI
	push 8
	push 22
	push [PixelatedI_Y]
	push [PixelatedI_X]
	call Print_Anything2
PrintApostrophe:
	push offset PixelatedApostrophe
	push 8
	push 10
	push [PixelatedApostrophe_Y]
	push [PixelatedApostrophe_X]
	call Print_Anything2
PrintS:
	push offset PixelatedS
	push 16
	push 22
	push [PixelatedS_Y]
	push [PixelatedS_X]
	call Print_Anything2
PrintL:
	push offset PixelatedL
	push 14
	push 22
	push [PixelatedL_Y]
	push [PixelatedL_X]
	call Print_Anything2
PrintE2:
	push offset PixelatedE
	push 16
	push 22
	push [PixelatedE2_Y]
	push [PixelatedE2_X]
	call Print_Anything2
PrintG:
	push offset PixelatedG
	push 16
	push 22
	push [PixelatedG_Y]
	push [PixelatedG_X]
	call Print_Anything2
PrintE3:
	push offset PixelatedE
	push 16
	push 22
	push [PixelatedE3_Y]
	push [PixelatedE3_X]
	call Print_Anything2
PrintN3:
	push offset PixelatedN
	push 18
	push 22
	push [PixelatedN3_Y]
	push [PixelatedN3_X]
	call Print_Anything2
PrintD:
	push offset PixelatedD
	push 16
	push 22
	push [PixelatedD_Y]      
	push [PixelatedD_X]
	call Print_Anything2  
PrintMessages:;this part prints the 3 messages on the main menu screen
	push ax
	push bx
	push cx
	push dx
	push es
	push ds
	push bp
	mov ah,13h
	mov bh,0;page number
	mov bl,11110011b;attribute 
	mov cx,15;amount of characters
	mov dl,13;starting columns and rows
	mov dh,13
	mov al,0
	push ds
	pop es
	mov bp,offset MMMessage1;the message gets printed at es:bp
	int 10h
	pop bp
	pop ds
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	push ax
	push bx
	push cx
	push dx
	push es
	push ds
	push bp
	mov ah,13h
	mov bh,0
	mov bl,11110011b
	mov cx,17
	mov dl,13
	mov dh,15
	mov al,0
	push ds
	pop es
	mov bp,offset MMMessage2;same as before but for the second message
	int 10h
	pop bp
	pop ds
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
	push ax
	push bx
	push cx
	push dx
	push es
	push ds
	push bp
	mov ah,13h
	mov bh,0
	mov bl,11110011b
	mov cx,14
	mov dl,13
	mov dh,17
	mov al,0
	push ds
	pop es
	mov bp,offset MMMessage3;same as before but for the third message
	int 10h
	pop bp
	pop ds
	pop es
	pop dx
	pop cx
	pop bx
	pop ax
checkUserInputInMM:;checks to see where the user wants to go to: the game itself,the instructions and lore or to exit the game
	mov ah,0Bh;checks to see if a key is pressed
	int 21h
	cmp al,0
	je noStart
	mov ah,07h
	int 21h
	cmp al,31h
	jne noStart
	mov [StartGameBool],1
	jmp endUserInputInMMCheck
noStart:
	cmp al,32h
	jne noInstructions
	mov [StartInstructionsBool],1
	jmp endUserInputInMMCheck
noInstructions:	
	cmp al,33h
	jne endUserInputInMMCheck
	mov [EndGameBool],1
endUserInputInMMCheck:	
	pop es
	pop bp
	pop dx
	pop cx
	pop bx
	pop ax
	ret
	endp mainMenu
	
	proc Print_Anything2;According to the parameters given it prints any character. This is like Print_Anything but is used for the main menu's letters' colour change system
	pop [PAReturnAddress]
	pop [x];pops the pushed parameters
	pop [y]
	pop [RowLoop]
	pop [ColumnLoop]
	pop [offsetStart]
	push ax
	push bx
	push cx
	push dx
	mov bx,[offsetStart];moves the offset where the color array values start at
	mov cx,[RowLoop];big loop
Print3:
	push cx
	mov cx,[ColumnLoop];small loop
Print4:
	push cx
	mov cx,[x];x
	mov dx,[y];y
	mov al,[byte ptr bx];color
	cmp al,0 
	je skipAdd
	add ax,[ColorValueIncrease];adds the colour to change the previous colour,heres the difference between the 2 methods
skipAdd:	
	mov ah,0Ch
	int 10h
	pop cx
	inc [x]
	inc bx
	loop Print4;small loop loop.
	inc [y];increases the y by 1 to start at a new row in the big loop
	push ax
	mov ax,[ColumnLoop]
	sub [x],ax;returns x back to the starting value to start printing the new row
	pop ax
	pop cx
	loop Print3;big loop loop
	pop dx
	pop cx
	pop bx
	pop ax
	push [PAReturnAddress]
	ret
	endp Print_Anything2
	
	proc Print_Instructions;simply print the story of the game
	push ax
	push dx
	mov ax,03
	int 10h
	mov dx,offset Lore1
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov dx,offset Lore2
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov dx,offset Lore3
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov dx,offset Lore4
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov dx,offset Lore5
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov dx,offset Lore6
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov dx,offset Lore7
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov dx,offset Lore8
	mov ah,09h
	int 21h
	mov dl,0Ah
	mov ah,2h
	int 21h
	mov ah,01h
	int 21h
	pop dx
	pop ax
	ret
	endp Print_Instructions
	
	
	
	
	
	