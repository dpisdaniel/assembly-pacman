	mov ah,2ch
	int 21h
	mov [secHold],dx
	cmp dl,[MSecs]
	jae nextTimer
	cmp dh,[Secs]
	je moveGhost1End2
nextTimer:
	jmp printGhost1
back:
	mov dx,[secHold]
	add dl,5
	mov [MSecs],dl
	mov [Secs],dh
	mov [ifGhost1MovedBool],1
	jmp moveGhost1End2