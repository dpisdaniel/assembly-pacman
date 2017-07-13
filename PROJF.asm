IDEAL
MODEL small
STACK 100h
screen_RAM_graphics equ 0A000h
RIGHT_KEY equ 77
LEFT_KEY  equ 75
UP_KEY    equ 72
DOWN_KEY  equ 80
ESCAPE equ 1
DATASEG
PAReturnAddress dw 0   ;Return addresses variables
PMAReturnAddress dw 0
CHK4PMRA dw 0
PACMANRA dw 0
DLTRA dw 0
RowLoop dw 0    ;variables for procedure uses (so the values inside the important variables wont be changed)
ColumnLoop dw 0
offsetStart dw 0
Color dw 0
checkDotsRA dw 0
DLTDOTRA dw 0
Direction dw 0
;Xs and Ys for procedures
X dw 0
Y dw 0
Y2 dw 0
X2 dw 0
X3 dw 0
Y3 dw 0
Bool dw 0
DotCounter dw 0  ;counts the amount of dots that were eaten by pacman
WinBool dw 0     ;boolean if user won
finalBool dw 0   ;boolean for procedures
moveBool dw 0    ;another boolean for procedures
StartGameBool dw 0 ;boolean to check if the game should start
EndGameBool dw 0 ;boolean to see if the game needs to be ended
StartInstructionsBool dw 0
TouchedPMBool dw 0
;PacMan XY and others:
PACMAN_X dw 153
PACMAN_Y dw 95
PMRightCounter dw 0
PMLeftCounter dw 0
PMUpCounter dw 0
PMDownCounter dw 0
;Ghost1 XY:
GHOST1_X dw 100
GHOST1_Y dw 11
GHOST1RIGHT1ST dw 107 ;These variables contain the amount of steps the ghost moves in each direction
GHOST1DOWN1ST  dw 30
GHOST1LEFT1ST  dw 108
GHOST1DOWN2ND  dw 55
GHOST1RIGHT2ND dw 108
GHOST1DOWN3RD  dw 50
GHOST1LEFT2ND  dw 108
GHOST1DOWN4TH  dw 30
GHOST1RIGHT3RD dw 108
GHOST1UP1ST    dw 30
GHOST1LEFT3RD  dw 108
GHOST1UP2ND    dw 50
GHOST1RIGHT4TH dw 108
GHOST1UP3RD    dw 55
GHOST1LEFT4TH  dw 108
GHOST1UP4TH    dw 30
;Ghost2 XY:
GHOST2_X dw 12
GHOST2_Y dw 11
GHOST2RIGHT1ST dw 58
GHOST2DOWN1ST  dw 30
GHOST2RIGHT2ND dw 14
GHOST2LEFT1ST  dw 42
GHOST2DOWN2ND  dw 50
GHOST2RIGHT3RD dw 42
GHOST2LEFT2ND  dw 72
GHOST2UP1ST    dw 80
;Ghost3 XY:
GHOST3_X dw 12
GHOST3_Y dw 175
GHOST3UP1ST    dw 80
GHOST3RIGHT1ST dw 72
GHOST3LEFT1ST  dw 42
GHOST3DOWN1ST  dw 50
GHOST3RIGHT2ND dw 42
GHOST3LEFT2ND  dw 13
GHOST3DOWN2ND  dw 30
GHOST3LEFT3RD  dw 58
;Ghost4 XY:
GHOST4_X dw 295
GHOST4_Y dw 11
GHOST4DOWN1ST  dw 80
GHOST4LEFT1ST  dw 72
GHOST4RIGHT1ST dw 42
GHOST4UP1ST    dw 50
GHOST4LEFT2ND  dw 42
GHOST4RIGHT2ND dw 13 
GHOST4UP2ND    dw 30
GHOST4RIGHT3RD dw 58
;Ghost5 XY:
GHOST5_X dw 295
GHOST5_Y dw 175
GHOST5LEFT1ST  dw 59
GHOST5UP1ST    dw 30
GHOST5LEFT2ND  dw 14
GHOST5RIGHT1ST dw 43
GHOST5UP2ND    dw 50
GHOST5LEFT3RD  dw 42
GHOST5RIGHT2ND dw 72
GHOST5DOWN1ST  dw 80
;Xs and Ys for procedure uses
CHK4PM_X dw 0
CHK4PM_Y dw 0
;Main Menu's Letters' Xs and Ys
PixelatedC_X dw 70
PixelatedC_Y dw 40
PixelatedR_X dw 96
PixelatedR_Y dw 40
PixelatedE_Y dw 40
PixelatedE_X dw 122
PixelatedN_Y dw 40
PixelatedN_X dw 148
PixelatedN2_Y dw 40 
PixelatedN2_X dw 176
PixelatedU_Y dw 40
PixelatedU_X dw 202
PixelatedI_Y dw 40
PixelatedI_X dw 228
PixelatedS_Y dw 40
PixelatedS_X dw 254
PixelatedApostrophe_Y dw 35
PixelatedApostrophe_X dw 241
PixelatedL_Y dw 72
PixelatedL_X dw 105
PixelatedE2_Y dw 72
PixelatedE2_X dw 129
PixelatedG_Y dw 72
PixelatedG_X dw 155
PixelatedE3_Y dw 72
PixelatedE3_X dw 181
PixelatedN3_Y dw 72
PixelatedN3_X dw 207
PixelatedD_Y dw 72
PixelatedD_X dw 235
MMMessage1 db "1 - Start Game "
MMMessage2 db "2 - Instructions "
MMMessage3 db "3 - Exit Game "
Lore1 db "When Tamir was a little boy, he wanted to be called Barak.$"
Lore2 db "If you type barak mammon in Hebrew when the keyboard is set to English,$"
Lore3 db "You get crennui! Our little Tamir is very fat and his goal is to eat all$"
Lore4 db "the food in the world, but many skinny people want to stop him!$" 
Lore5 db "Help little Tamir eat all the food in the world!$"
Lore6 db "Use the arrow keys to move little Tamir around,$"
Lore7 db "and make sure you avoid all the skinny people,which look like ghosts$"
Lore8 db "Press any key to go back to the main menu . . .$"
ColorValueIncrease dw 0

include 'PROJFC.asm'  
 
CODESEG                        ;This program is a pacman based game. first of all it brings the user to the main menu, where he can choose to exit the game, go to the instructions and story of the game and start the game.
start:                         ;If the user decides to go to the game, it begins the game loop of the pacman game and the user needs to go over all the dots in the map without touching the ghosts.
	mov ax, @data              ;if the user touches a ghost, he looses. If the user eats all the dots he wins. 
	mov ds, ax                 
	mov ax,13h
	int 10h
mainMenuLoop:;loop that keeps changing the colors of the main menu text while the user is at the main menu	
	call mainMenu
	cmp [StartGameBool],1;checks to see where the user wants to go according to the booleans
	je StartGame
	cmp [EndGameBool],1
	je exit
	cmp [StartInstructionsBool],1
	je StartInstructions
	jmp mainMenuLoop
StartGame:	
	call Clear_Screen
	call Print_Starting_Locs
	call Print_Map
gameLoop:;the game loop that keeps re printing everything that needs to be reprinted	
	call PacMan_Move
	call Ghost1_Move
	call Ghost2_Move
	call Ghost3_Move
	call Ghost4_Move
	call Ghost5_Move
	cmp [TouchedPMBool],0
	jne exit
	call PrintDots
	cmp [WinBool],1
	je exit
	jmp gameLoop
StartInstructions:;prints the instructions
	call Clear_Screen
	call Print_Instructions
	call Clear_Screen
	mov [StartInstructionsBool],0
	mov ax,13h
	int 10h
	jmp mainMenuLoop
exit:
	mov ax,03h
	int 10h
	mov ax, 4c00h
	int 21h
	
	proc Clear_Screen;clears the screen
	push es
	push cx
	push di
	push ax
	mov ax,13h
	int 10h
	mov ax,screen_RAM_graphics
	mov es,ax          ; es:di - video memory
	xor di,di
	mov cx,320*200/2
	xor ax,ax ;color   
	rep stosw		; mov es:[di],ax     add di,2
	pop ax
	pop di
	pop cx
	pop es
	ret
	endp Clear_Screen
	
	proc Print_Anything;According to the parameters given it prints any character.
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
Print1:
	push cx
	mov cx,[ColumnLoop];small loop
Print2:
	push cx
	mov cx,[x];x
	mov dx,[y];y
	mov al,[byte ptr bx];color
	mov ah,0Ch
	int 10h
	pop cx
	inc [x]
	inc bx
	loop Print2;small loop loop.
	inc [y];increases the y by 1 to start at a new row in the big loop
	push ax
	mov ax,[ColumnLoop]
	sub [x],ax;returns x back to the starting value to start printing the new row
	pop ax
	pop cx
	loop Print1;big loop loop
	pop dx
	pop cx
	pop bx
	pop ax
	push [PAReturnAddress]
	ret
	endp Print_Anything
	
	proc Print_Map_Anything;Same as Print_Anything but meant to print the map since there is only one color and not an array of colors.
	pop [PMAReturnAddress]
	pop [x]
	pop [y]
	pop [RowLoop]
	pop [ColumnLoop]
	pop [Color]
	push ax
	push bx
	push cx
	push dx
	mov cx,[RowLoop]
Print1_1:
	push cx
	mov cx,[ColumnLoop]
Print2_1:
	push cx
	mov cx,[x]
	mov dx,[y]
	mov ax,[color]
	mov ah,0Ch
	int 10h
	pop cx
	inc [x]
	loop Print2_1
	inc [y]
	push ax
	mov ax,[ColumnLoop]
	sub [x],ax
	pop ax
	pop cx
	loop Print1_1
	pop dx
	pop cx
	pop bx
	pop ax
	push [PMAReturnAddress]
	ret
	endp Print_Map_Anything
	
	proc Print_Starting_Locs;prints the starting locations of all the characters
Right_PacMan_Print:
	push offset RIGHT_PM;starting offset
	push 12				 ;columns
	push 13			     ;rows
	push [PACMAN_Y]			 ;y
	push [PACMAN_X]		     ;x
	call Print_Anything
Ghost1_Print:	
	push offset Ghost1;starting offset 
	push 13		      ;columns
	push 14			  ;rows
	push [GHOST1_Y]	  ;y
	push [GHOST1_X]   ;x
	call Print_Anything
Ghost2_Print:
	push offset Ghost2;starting offset
	push 13 		  ;columns
	push 14 		  ;rows
	push [GHOST2_Y]		  ;y
	push [GHOST2_X]		  ;x
	call Print_Anything
Ghost3_Print:
	push offset Ghost3;starting offset
	push 13			  ;columns
	push 14			  ;rows
	push [GHOST3_Y]		  ;y
	push [GHOST3_X]		  ;x
	call Print_Anything	
Ghost4_Print:
	push offset Ghost4;starting offset
	push 13			  ;columns
	push 14			  ;rows
	push [GHOST4_Y]		  ;y
	push [GHOST4_X]		  ;x
	call Print_Anything
Ghost5_Print:
	push offset Ghost5;starting offset
	push 13			  ;columns
	push 14			  ;rows
	push [GHOST5_Y]		  ;y
	push [GHOST5_X]		  ;x
	call Print_Anything
	ret
	endp Print_Starting_Locs
	
	proc PacMan_Move;moves pacman according to the direction received and checks for borders
	pop [PACMANRA]
	push ax
	push bx
	push cx
	push dx
Start_Move:	
	mov ah,0Bh ;checks if a key is pressed
	int 21h
	cmp al,0
	je Receive_EndCP
Move_PacMan:
;receives a key from the user
	mov ah,07h
	int 21h
;Checking the pressed key
	mov cx,ax
	mov ch,0
	cmp cx,[Direction] 
	je Receive_EndCP
	cmp al,UP_KEY
	je Up
	cmp al,DOWN_KEY
	je Down
	cmp al,RIGHT_KEY
	je RightCP
	cmp al,LEFT_KEY
	je Left
	jmp Receive_End
Left:
checkPMLeft:  ;checks if pacman can be moved	
	call check_PM_left
	cmp [moveBool],0
	jne dontPrintLeft
	call Move_PM_Left
	mov [Direction],LEFT_KEY
dontPrintLeft:
	mov [moveBool],0
	jmp Receive_End
RightCP:
	jmp Right
Receive_EndCP:
	cmp [Direction],LEFT_KEY
	je Left
	cmp [Direction],RIGHT_KEY
	je Right
	cmp [Direction],DOWN_KEY
	je Down
	cmp [Direction],UP_KEY
	je Up
	jmp Receive_End
Up:
checkPmUP:
	call check_PM_up
	cmp [moveBool],0
	jne dontPrintUp
	call Move_PM_up
	mov [Direction],UP_KEY
dontPrintUp:
	mov [moveBool],0
	jmp Receive_End
Down:
checkPMDown:	
	call check_PM_down
	cmp [moveBool],0
	jne dontPrintDown
	call Move_PM_Down
	mov [Direction],DOWN_KEY
dontPrintDown:
	mov [moveBool],0
	jmp Receive_End
Right:	
checkPMRight:
	call check_PM_right
	cmp [moveBool],0
	jne dontPrintRight
	call Move_PM_Right
	mov [Direction],RIGHT_KEY
dontPrintRight:
	mov [moveBool],0
	jmp Receive_End
Receive_End:
	pop dx
	pop cx
	pop bx
	pop ax
	push [PACMANRA]
	ret
	endp PacMan_Move
	
	proc Move_PM_up  ;moves pacman upwards
	push ax	
	mov [PMRightCounter],0;resets other counters
	mov [PMLeftCounter],0
	mov [PMDownCounter],0
	dec [PACMAN_Y]
	cmp [PMUpCounter],0;checks which part of the up pacman should be printed
	je PrintFirstUpPM
	cmp [PMUpCounter],1
	je PrintSecondUpPM
	cmp [PMUpCounter],2
	je PrintThirdUpPM
PrintFirstUpPM:
	push offset UP_PacMan
	push 13
	push 12
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMUpCounter]
	jmp deleteBottomSide
PrintSecondUpPM:
	push offset UP_PM2
	push 13
	push 12
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMUpCounter]
	jmp deleteBottomSide
PrintThirdUpPM:
	push offset UP_PM3
	push 13
	push 12
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	mov [PMUpCounter],0
deleteBottomSide:	
	push 0
	push 13
	push 2
	mov ax,[PACMAN_Y]
	add ax,12
	push ax
	push [PACMAN_X]
	call Print_Map_Anything
	pop ax
	ret
	endp Move_PM_up
	
	proc Move_PM_Left;moves pacman to the left same like the last procedure
	push ax
	mov [PMRightCounter],0
	mov [PMUpCounter],0
	mov [PMDownCounter],0
	dec [PACMAN_X]
	cmp [PMLeftCounter],0
	je PrintFirstLeftPM
	cmp [PMLeftCounter],1
	je PrintSecondLeftPM
	cmp [PMLeftCounter],2
	je PrintThirdLeftPM
PrintFirstLeftPM:	
	push offset LEFT_PM
	push 12
	push 13
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMLeftCounter]
	jmp deleteRightSide
PrintSecondLeftPM:
	push offset LEFT_PM2
	push 12
	push 13
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMLeftCounter]
	jmp deleteRightSide
PrintThirdLeftPM:
	push offset LEFT_PM3
	push 12
	push 13
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	mov [PMLeftCounter],0
deleteRightSide:	
	push 0
	push 2
	push 13
	push [PACMAN_Y]
	mov ax,[PACMAN_X]
	add ax,12
	push ax
	call Print_Map_Anything
	pop ax
	ret 
	endp Move_PM_Left
	
	proc Move_PM_Right;same as before but to the right
	push ax
	mov [PMLeftCounter],0
	mov [PMUpCounter],0
	mov [PMDownCounter],0
	inc [PACMAN_X]
	cmp [PMRightCounter],0 
	je PrintFirstRightPM
	cmp [PMRightCounter],1
	je PrintSecondRightPM
	cmp [PMRightCounter],2
	je PrintThirdRightPM
PrintFirstRightPM:	
	push offset RIGHT_PM
	push 12
	push 13
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMRightCounter]
	jmp deleteLeftSide
PrintSecondRightPM:
	push offset RIGHT_PM2
	push 12
	push 13
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMRightCounter]
	jmp deleteLeftSide
PrintThirdRightPM:
	push offset RIGHT_PM3
	push 12
	push 13
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	mov [PMRightCounter],0
deleteLeftSide:	
	push 0
	push 1
	push 13
	push [PACMAN_Y]
	mov ax,[PACMAN_X]
	dec ax
	push ax
	call Print_Map_Anything
	pop ax
	ret
	endp Move_PM_Right
	
	proc Move_PM_Down;same as before but to the bottom
	push ax
	mov [PMUpCounter],0
	mov [PMRightCounter],0
	mov [PMLeftCounter],0
	inc [PACMAN_Y]
	cmp [PMDownCounter],0
	je PrintFirstDownPM
	cmp [PMDownCounter],1
	je PrintSecondDownPM
	cmp [PMDownCounter],2
	je PrintThirdDownPM
PrintFirstDownPM:	
	push offset DOWN_PM
	push 13
	push 12
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMDownCounter]
	jmp deleteTopSide
PrintSecondDownPM:
	push offset DOWN_PM2
	push 13
	push 12
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	inc [PMDownCounter]
	jmp deleteTopSide
PrintThirdDownPM:
	push offset DOWN_PM3
	push 13
	push 12
	push [PACMAN_Y]
	push [PACMAN_X]
	call Print_Anything
	mov [PMDownCounter],0
deleteTopSide:	
	push 0
	push 13
	push 1
	mov ax,[PACMAN_Y]
	dec ax
	push ax
	push [PACMAN_X]
	call Print_Map_Anything
	pop ax
	ret
	endp Move_PM_Down
	
	include "PROJFMM.asm"
	
	include "PROJFMAP.asm"
	
	include "PROJFDT.asm"
	
	include "CHECKPM.asm"
	
	include "PROJFG1.asm"
	
END start