proc Ghost1_Move  ;The route for the first ghost, moves the ghost in certain directions and when it finishes, it repeats it.
G1Right:
	cmp [GHOST1RIGHT1ST],0 
	je G1Down1
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_X]
	call moveGhost1	
	call deleteLeft
	dec [GHOST1RIGHT1ST]
G1Right1Finished:
	jmp G1Down1Finished
G1Down1:
	cmp [GHOST1DOWN1ST],0
	je G1Left1
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_Y]
	call moveGhost1	
	call deleteTop
	dec [GHOST1DOWN1ST]
G1Down1Finished:
	jmp G1Left1Finished
G1Left1:
	cmp [GHOST1LEFT1ST],0
	je G1Down2
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_X]
	call moveGhost1	
	call deleteRight
	dec [GHOST1LEFT1ST]
G1Left1Finished:
	jmp G1Down2Finished
G1Down2:
	cmp [GHOST1DOWN2ND],0
	je G1Right2
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_Y]
	call moveGhost1	
	call deleteTop
	dec [GHOST1DOWN2ND]
G1Down2Finished:
	jmp G1Right2Finished
G1Right2:	
	cmp [GHOST1RIGHT2ND],0
	je G1Down3
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_X]
	call moveGhost1	
	call deleteLeft
	dec [GHOST1RIGHT2ND]
G1Right2Finished:
	jmp G1Down3Finished
G1Down3:	
	cmp [GHOST1DOWN3RD],0
	je G1Left2
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_Y]
	call moveGhost1	
	call deleteTop
	dec [GHOST1DOWN3RD]
G1Down3Finished:
	jmp G1Left2Finished
G1Left2:
	cmp [GHOST1LEFT2ND],0
	je G1Down4
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_X]
	call moveGhost1	
	call deleteRight
	dec [GHOST1LEFT2ND]
G1Left2Finished:
	jmp G1Down4Finished
G1Down4:
	cmp [GHOST1DOWN4TH],0
	je G1Right3
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_Y]
	call moveGhost1	
	call deleteTop
	dec [GHOST1DOWN4TH]
G1Down4Finished:
	jmp G1Right3Finished
G1Right3:	
	cmp [GHOST1RIGHT3RD],0
	je G1Up1
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_X]
	call moveGhost1
	call deleteLeft
	dec [GHOST1RIGHT3RD]
G1Right3Finished:
	jmp G1Up1Finished
G1Up1:	
	cmp [GHOST1UP1ST],0
	je G1Left3
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_Y]
	call moveGhost1	
	call deleteBottom
	dec [GHOST1UP1ST]
G1Up1Finished:
	jmp G1Left3Finished
G1Left3:	
	cmp [GHOST1LEFT3RD],0
	je G1Up2
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_X]
	call moveGhost1	
	call deleteRight
	dec [GHOST1LEFT3RD]
G1Left3Finished:
	jmp G1Up2Finished
G1Up2:
	cmp [GHOST1UP2ND],0
	je G1Right4
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_Y]
	call moveGhost1	
	call deleteBottom
	dec [GHOST1UP2ND]
G1Up2Finished:
	jmp G1Right4Finished
G1Right4:
	cmp [GHOST1RIGHT4TH],0
	je G1Up3
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	inc [GHOST1_X]
	call moveGhost1	
	call deleteLeft
	dec [GHOST1RIGHT4TH]
G1Right4Finished:
	jmp G1Up3Finished
G1Up3:
	cmp [GHOST1UP3RD],0
	je G1Left4
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_Y]
	call moveGhost1
	call deleteBottom
	dec [GHOST1UP3RD]
G1Up3Finished:
	jmp G1Left4Finished
G1Left4:	
	cmp [GHOST1LEFT4TH],0
	je G1Up4
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_X]
	call moveGhost1	
	call deleteRight
	dec [GHOST1LEFT4TH]
G1Left4Finished:
	jmp G1Up4Finished
G1Up4:
	cmp [GHOST1UP4TH],0
	je putMoveValuesBack
	push [GHOST1_Y]
	push [GHOST1_X]
	call checkForPacMan
	dec [GHOST1_Y]
	call moveGhost1	
	call deleteBottom
	dec [GHOST1UP4TH]
G1Up4Finished:
	jmp MoveGhost1End
putMoveValuesBack:
	mov [GHOST1RIGHT1ST],108
	mov [GHOST1DOWN1ST],30
	mov [GHOST1LEFT1ST],109
	mov [GHOST1DOWN2ND],55
	mov [GHOST1RIGHT2ND],109
	mov [GHOST1DOWN3RD],50
	mov [GHOST1LEFT2ND],109
	mov [GHOST1DOWN4TH],30
	mov [GHOST1RIGHT3RD],109
	mov [GHOST1UP1ST],30
	mov [GHOST1LEFT3RD],109
	mov [GHOST1UP2ND],50
	mov [GHOST1RIGHT4TH],109
	mov [GHOST1UP3RD],55
	mov [GHOST1LEFT4TH],108
	mov [GHOST1UP4TH],30
MoveGhost1End:
	ret
	endp Ghost1_Move
	
	proc moveGhost1;re prints the ghost in the given locations
printGhost1:	
	push offset Ghost1
	push 13
	push 14
	push [GHOST1_Y]
	push [GHOST1_X]
	call Print_Anything
moveGhost1End2:
	ret
	endp moveGhost1
	
	proc checkForPacMan;this procedure checks if pacman is around the ghosts and triggers a boolean if  he is
	pop [CHK4PMRA]
	pop [CHK4PM_X]
	pop [CHK4PM_Y]
	push ax
	push bx
	push cx
	push dx
	push [CHK4PM_X]
	push [CHK4PM_Y]
checkRight:	;checks the right side of the ghost for pacman
	add [CHK4PM_X],14
	mov cx,14
check4PMRightLoop:	
	push cx
	mov cx,[CHK4PM_X]
	mov dx,[CHK4PM_Y]
	mov bh,1
	mov ah,0Dh
	int 10h;reads the pixels to the right
	cmp al,14
	jne notPacMan
	mov [TouchedPMBool],1;this boolean gets triggered if pacman gets touched by a ghost and will end the game
	pop cx
	jmp endCheckForPacManRight
notPacMan:
	inc [CHK4PM_Y]
	pop cx
	loop check4PMRightLoop
endCheckForPacManRight:
	pop [CHK4PM_Y]
	pop [CHK4PM_X]
	push [CHK4PM_X]
	push [CHK4PM_Y]
checkLeft:;the same as before but for the left
	dec [CHK4PM_X]
	mov cx,14
check4PMLeftLoop:
	push cx
	mov cx,[CHK4PM_X]
	mov dx,[CHK4PM_Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,14
	jne notPacMan2
	mov [TouchedPMBool],1
	pop cx
	jmp endCheckForPacManLeft
notPacMan2:
	inc [CHK4PM_Y]
	pop cx
	loop check4PMLeftLoop
endCheckForPacManLeft:
	pop [CHK4PM_Y]
	pop [CHK4PM_X]
	push [CHK4PM_X]
	push [CHK4PM_Y]
checkDown:;the same as before but for the bottom side
	add [CHK4PM_Y],15
	mov cx,13
check4PMDownLoop:
	push cx
	mov cx,[CHK4PM_X]
	mov dx,[CHK4PM_Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,14
	jne notPacMan3
	mov [TouchedPMBool],1
	pop cx
	jmp endCheckForPacManDown
notPacMan3:
	inc [CHK4PM_X]
	pop cx
	loop check4PMDownLoop
endCheckForPacManDown:
	pop [CHK4PM_Y]
	pop [CHK4PM_X]
	push [CHK4PM_X]
	push [CHK4PM_Y]
checkUp:;same as before but for the up side
	dec [CHK4PM_Y]
	mov cx,13
check4PMUpLoop:
	push cx
	mov cx,[CHK4PM_X]
	mov dx,[CHK4PM_Y]
	mov bh,1
	mov ah,0Dh
	int 10h
	cmp al,14
	jne notPacMan4
	mov [TouchedPMBool],1
	pop cx
	jmp endCheckForPacManUp
notPacMan4:
	inc [CHK4PM_X]
	pop cx
	loop check4PMUpLoop
endCheckForPacManUp:
	pop [CHK4PM_Y]
	pop [CHK4PM_X]
	pop dx
	pop cx
	pop bx
	pop ax
	push [CHK4PMRA]
	ret
	endp checkForPacMan
	
	proc deleteLeft;deletes the column left to the ghost so the ghost's colour wont smudge all over the screen as the ghost moves
	push ax
	push 0
	push 1
	push 14
	push [GHOST1_Y]
	mov ax,[GHOST1_X]
	dec ax
	push ax
	call Print_Map_Anything
	pop ax
	ret
	endp deleteLeft
	
	proc deleteTop;same as before but for the top side
	push ax
	push 0
	push 13
	push 1
	mov ax,[GHOST1_Y]
	dec ax
	push ax
	push [GHOST1_X]
	call Print_Map_Anything
	pop ax
	ret 
	endp deleteTop
	
	proc deleteRight;same as before but for the right side
	push ax
	push 0
	push 1
	push 14
	push [GHOST1_Y]
	mov ax,[GHOST1_X]
	add ax,13
	push ax
	call Print_Map_Anything
	pop ax
	ret
	endp deleteRight
	
	proc deleteBottom;same as before but for the bottom side
	push ax
	push 0
	push 13
	push 1
	mov ax,[GHOST1_Y]
	add ax,14
	push ax
	push [GHOST1_X]
	call Print_Map_Anything
	pop ax
	ret
	endp deleteBottom
	
	proc Ghost2_Move;The route for the second ghost, moves the ghost in certain directions and when it finishes, it repeats it.
G2Right1:
	cmp [GHOST2RIGHT1ST],0
	je G2Down1
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	inc [GHOST2_X]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteLeft2
	dec [GHOST2RIGHT1ST]
G2Right1Finished:
	jmp G2Down1Finished
G2Down1:
	cmp [GHOST2DOWN1ST],0
	je G2Right2
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	inc [GHOST2_Y]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteTop2
	dec [GHOST2DOWN1ST]	
G2Down1Finished:
	jmp G2Right2Finished
G2Right2:
	cmp [GHOST2RIGHT2ND],0
	je G2Left1
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	inc [GHOST2_X]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteLeft2
	dec [GHOST2RIGHT2ND]
G2Right2Finished:
	jmp G2Left1Finished
G2Left1:
	cmp [GHOST2LEFT1ST],0
	je G2Down2
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	dec [GHOST2_X]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteRight2
	dec [GHOST2LEFT1ST]
G2Left1Finished:	
	jmp G2Down2Finished
G2Down2:
	cmp [GHOST2DOWN2ND],0
	je G2Right3
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	inc [GHOST2_Y]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteTop2
	dec [GHOST2DOWN2ND]
G2Down2Finished:	
	jmp G2Right3Finished
G2Right3:
	cmp [GHOST2RIGHT3RD],0
	je G2Left2
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	inc [GHOST2_X]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteLeft2
	dec [GHOST2RIGHT3RD]
G2Right3Finished:	
	jmp G2Left2Finished
G2Left2:
	cmp [GHOST2LEFT2ND],0
	je G2Up1
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	dec [GHOST2_X]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteRight2
	dec [GHOST2LEFT2ND]
G2Left2Finished:	
	jmp G2Up1Finished
G2Up1:
	cmp [GHOST2UP1ST],0
	je putMoveValuesBackG2
	push [GHOST2_Y]
	push [GHOST2_X]
	call checkForPacMan
	dec [GHOST2_Y]
	call moveGhost2
	push [GHOST2_Y]
	push [GHOST2_X]
	call deleteBottom2
	dec [GHOST2UP1ST]
G2Up1Finished:	
	jmp moveGhost2End
putMoveValuesBackG2:
	mov [GHOST2RIGHT1ST],58
	mov [GHOST2DOWN1ST],30
	mov [GHOST2RIGHT2ND],15
	mov [GHOST2LEFT1ST],42
	mov [GHOST2DOWN2ND],50
	mov [GHOST2RIGHT3RD],42
	mov [GHOST2LEFT2ND],73
	mov [GHOST2UP1ST],80
moveGhost2End:	
	ret 
	endp Ghost2_Move
	
	proc moveGhost2;moves the second ghost for the given locations
printGhost2:
	push offset Ghost2
	push 13
	push 14
	push [GHOST2_Y]
	push [GHOST2_X]
	call Print_Anything
	ret
	endp moveGhost2
	
	proc Ghost3_Move;The route for the third ghost, moves the ghost in certain directions and when it finishes, it repeats it.
G3Up1:
	cmp [GHOST3UP1ST],0
	je G3Right1
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	dec [GHOST3_Y]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteBottom2
	dec [GHOST3UP1ST]
G3Up1Finished:	
	jmp G3Right1Finished
G3Right1:	
	cmp [GHOST3RIGHT1ST],0
	je G3Left1
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	inc [GHOST3_X]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteLeft2
	dec [GHOST3RIGHT1ST]
G3Right1Finished:
	jmp G3Left1Finished
G3Left1:
	cmp [GHOST3LEFT1ST],0
	je G3Down1
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	dec [GHOST3_X]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteRight2
	dec [GHOST3LEFT1ST]
G3Left1Finished:
	jmp G3Down1Finished
G3Down1:	
	cmp [GHOST3DOWN1ST],0
	je G3Right2
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	inc [GHOST3_Y]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteTop2
	dec [GHOST3DOWN1ST]
G3Down1Finished:
	jmp G3Right2Finished
G3Right2:	
	cmp [GHOST3RIGHT2ND],0
	je G3Left2
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	inc [GHOST3_X]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteLeft2
	dec [GHOST3RIGHT2ND]
G3Right2Finished:
	jmp G3Left2Finished
G3Left2:
	cmp [GHOST3LEFT2ND],0
	je G3Down2
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	dec [GHOST3_X]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteRight2
	dec [GHOST3LEFT2ND]
G3Left2Finished:
	jmp G3Down2Finished
G3Down2:
	cmp [GHOST3DOWN2ND],0
	je G3Left3
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	inc [GHOST3_Y]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteTop2
	dec [GHOST3DOWN2ND]
G3Down2Finished:
	jmp G3Left3Finished
G3Left3:	
	cmp [GHOST3LEFT3RD],0
	je putMoveValuesBackG3
	push [GHOST3_Y]
	push [GHOST3_X]
	call checkForPacMan
	dec [GHOST3_X]
	call moveGhost3
	push [GHOST3_Y]
	push [GHOST3_X]
	call deleteRight2
	dec [GHOST3LEFT3RD]
G3Left3Finished:
	jmp moveGhost3End
putMoveValuesBackG3:
	mov [GHOST3UP1ST],80
	mov [GHOST3RIGHT1ST],72
	mov [GHOST3LEFT1ST],42
	mov [GHOST3DOWN1ST],50
	mov [GHOST3RIGHT2ND],42
	mov [GHOST3LEFT2ND],13
	mov [GHOST3DOWN2ND],30
	mov [GHOST3LEFT3RD],59
moveGhost3End:		
	ret 
	endp Ghost3_Move
	
	proc moveGhost3;print the third ghost in the given locations
printGhost3:
	push offset Ghost3
	push 13
	push 14
	push [GHOST3_Y]
	push [GHOST3_X]
	call Print_Anything
	ret
	endp moveGhost3
	
	proc Ghost4_Move;The route for the fourth ghost, moves the ghost in certain directions and when it finishes, it repeats it.
G4Down1:	
	cmp [GHOST4DOWN1ST],0
	je G4Left1
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	inc [GHOST4_Y]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteTop2
	dec [GHOST4DOWN1ST]
G4Down1Finished:
	jmp G4Left1Finished
G4Left1:	
	cmp [GHOST4LEFT1ST],0
	je G4Right1
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	dec [GHOST4_X]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteRight2
	dec [GHOST4LEFT1ST]
G4Left1Finished:
	jmp G4Right1Finished
G4Right1:
	cmp [GHOST4RIGHT1ST],0
	je G4Up1
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	inc [GHOST4_X]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteLeft2
	dec [GHOST4RIGHT1ST]
G4Right1Finished:
	jmp G4Up1Finished
G4Up1:	
	cmp [GHOST4UP1ST],0
	je G4Left2
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	dec [GHOST4_Y]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteBottom2
	dec [GHOST4UP1ST]
G4Up1Finished:
	jmp G4Left2Finished
G4Left2:	
	cmp [GHOST4LEFT2ND],0
	je G4Right2
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	dec [GHOST4_X]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteRight2
	dec [GHOST4LEFT2ND]
G4Left2Finished:
	jmp G4Right2Finished
G4Right2:	
	cmp [GHOST4RIGHT2ND],0
	je G4Up2
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	inc [GHOST4_X]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteLeft2
	dec [GHOST4RIGHT2ND]
G4Right2Finished:
	jmp G4Up2Finished
G4Up2:	
	cmp [GHOST4UP2ND],0
	je G4Right3
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	dec [GHOST4_Y]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteBottom2
	dec [GHOST4UP2ND]
G4Up2Finished:
	jmp G4Right3Finished
G4Right3:	
	cmp [GHOST4RIGHT3RD],0
	je putMoveValuesBackG4
	push [GHOST4_Y]
	push [GHOST4_X]
	call checkForPacMan
	inc [GHOST4_X]
	call moveGhost4
	push [GHOST4_Y]
	push [GHOST4_X]
	call deleteLeft2
	dec [GHOST4RIGHT3RD]
G4Right3Finished:
	jmp moveGhost4End
putMoveValuesBackG4:
	mov [GHOST4DOWN1ST],80
	mov [GHOST4LEFT1ST],72
	mov [GHOST4RIGHT1ST],42
	mov [GHOST4UP1ST],50
	mov [GHOST4LEFT2ND],42
	mov [GHOST4RIGHT2ND],13 
	mov [GHOST4UP2ND],30
	mov [GHOST4RIGHT3RD],59
moveGhost4End:	
	ret
	endp Ghost4_Move
	
	proc moveGhost4;prints the 4th ghost in the given locations
printGhost4:
	push offset Ghost4
	push 13
	push 14
	push [GHOST4_Y]
	push [GHOST4_X]
	call Print_Anything
	ret
	endp moveGhost4
	
	proc Ghost5_Move;The route for the fifth ghost, moves the ghost in certain directions and when it finishes, it repeats it.
G5Left1:
	cmp [GHOST5LEFT1ST],0
	je G5Up1
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	dec [GHOST5_X]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteRight2
	dec [GHOST5LEFT1ST]
G5Left1Finished:
	jmp G5Up1Finished
G5Up1:
	cmp [GHOST5UP1ST],0
	je G5Left2
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	dec [GHOST5_Y]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteBottom2
	dec [GHOST5UP1ST]
G5Up1Finished:
	jmp G5Left2Finished
G5Left2:
	cmp [GHOST5LEFT2ND],0
	je G5Right1
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	dec [GHOST5_X]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteRight2
	dec [GHOST5LEFT2ND]
G5Left2Finished:
	jmp G5Right1Finished
G5Right1:	
	cmp [GHOST5RIGHT1ST],0
	je G5Up2
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	inc [GHOST5_X]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteLeft2
	dec [GHOST5RIGHT1ST]
G5Right1Finished:
	jmp G5Up2Finished
G5Up2:	
	cmp [GHOST5UP2ND],0
	je G5Left3
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	dec [GHOST5_Y]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteBottom2
	dec [GHOST5UP2ND]
G5Up2Finished:
	jmp G5Left3Finished
G5Left3:	
	cmp [GHOST5LEFT3RD],0
	je G5Right2
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	dec [GHOST5_X]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteRight2
	dec [GHOST5LEFT3RD]
G5Left3Finished:
	jmp G5Right2Finished
G5Right2:	
	cmp [GHOST5RIGHT2ND],0
	je G5Down1
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	inc [GHOST5_X]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteLeft2
	dec [GHOST5RIGHT2ND]
G5Right2Finished:
	jmp G5Down1Finished
G5Down1:	
	cmp [GHOST5DOWN1ST],0
	je putMoveValuesBackG5
	push [GHOST5_Y]
	push [GHOST5_X]
	call checkForPacMan
	inc [GHOST5_Y]
	call moveGhost5
	push [GHOST5_Y]
	push [GHOST5_X]
	call deleteTop2
	dec [GHOST5DOWN1ST]
G5Down1Finished:
	jmp moveGhost5End
putMoveValuesBackG5:
	mov [GHOST5LEFT1ST],58             
	mov [GHOST5UP1ST],30
	mov [GHOST5LEFT2ND],15
	mov [GHOST5RIGHT1ST],42
	mov [GHOST5UP2ND],50
	mov [GHOST5LEFT3RD],42
	mov [GHOST5RIGHT2ND],73
	mov [GHOST5DOWN1ST],80
moveGhost5End:	
	ret
	endp Ghost5_Move
	
	proc moveGhost5;prints the fifth ghost in the given locations
printGhost5:
	push offset Ghost5
	push 13
	push 14
	push [GHOST5_Y]
	push [GHOST5_X]
	call Print_Anything
	ret
	endp moveGhost5
	
	proc deleteLeft2;same as deleteLeft but fits for every ghost
	pop [DLTRA]
	pop [X3]
	pop [Y3]
	push 0
	push 1
	push 14
	push [Y3]
	dec [X3]
	push [X3]
	call Print_Map_Anything
	push [DLTRA]
	ret
	endp deleteLeft2
	
	proc deleteTop2;same as before but for the top
	pop [DLTRA]
	pop [X3]
	pop [Y3]
	push 0
	push 13
	push 1
	dec [Y3]
	push [Y3]
	push [X3]
	call Print_Map_Anything
	push [DLTRA]
	ret 
	endp deleteTop2
	
	proc deleteRight2;same as before but for the right
	pop [DLTRA]
	pop [X3]
	pop [Y3]
	push 0
	push 1
	push 14
	add [X3],13
	push [Y3]
	push [X3]
	call Print_Map_Anything
	push [DLTRA]
	ret
	endp deleteRight2
	
	proc deleteBottom2;same as before but for the bottom
	pop [DLTRA]
	pop [X3]
	pop [Y3]
	push 0
	push 13
	push 1
	add [Y3],14
	push [Y3]
	push [X3]
	call Print_Map_Anything
	push [DLTRA]
	ret
	endp deleteBottom2