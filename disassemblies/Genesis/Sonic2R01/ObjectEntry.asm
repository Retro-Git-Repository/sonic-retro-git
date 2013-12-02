objectEntry macro id,subtype,xpos,ypos,state,xflip,yflip,s2extra
	if SonicObjectVer==1
	dc.w	xpos
	dc.w	((yflip&1)<<15)|((xflip&1)<<14)|(ypos&$FFF)
	dc.b	((state&1)<<7)|(id&$FF)
	dc.b	subtype
	elseif SonicObjectVer==2
	dc.w	xpos
	dc.w	((state&1)<<15)|((yflip&1)<<14)|((xflip&1)<<13)|((s2extra&1)<<12)|(ypos&$FFF)
	dc.b	id, subtype
	else
	dc.w	xpos
	dc.w	((state&1)<<15)|((yflip&1)<<14)|((xflip&1)<<13)|(ypos&$FFF)
	dc.b	id, subtype
	endif
	endm

objectTerminator macro
	dc.w	$FFFF, 0, 0
	endm

rngHorizontal =	0
rngVertical =	1
ringEntry macro xpos,ypos,dir,count
	if SonicRingVer==2
	dc.w	xpos
	dc.w	((dir&1)<<15)|(((count-1)&7)<<12)|(ypos&$FFF)
	else
tmpx :=	xpos
tmpy :=	ypos
	rept	count
	dc.w	tmpx
	dc.w	tmpy
	switch	dir
	case	rngHorizontal
	tmpx :=	tmpx + 24
	case	rngVertical
	tmpy :=	tmpy + 24
	endcase
	endm
	endif
	endm

ringTerminator macro
	dc.w	$FFFF
	endm

bumperEntry macro id,xpos,ypos
	dc.w	id, xpos, ypos
	endm

bumperTerminator macro
	dc.w	$FFFF, 0
	endm
