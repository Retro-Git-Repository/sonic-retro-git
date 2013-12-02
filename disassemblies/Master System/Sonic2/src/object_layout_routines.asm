LABEL_B30_8000:
	ld      a, (CurrentLevel)
	cp      $07
	ret     nc

	add     a, a
	ld      e, a
	ld      d, $00
	ld      hl, DATA_8135		
	add     hl, de
	ld      a, (hl)
	inc     hl
	ld      h, (hl)
	ld      l, a
	ld      a, (CurrentAct)
	add     a, a
	ld      e, a
	add     hl, de
	ld      a, (hl)
	inc     hl
	ld      h, (hl)
	ld      l, a
	ld      bc, $D400
	exx     
	ld      hl, ($D174)		;horiz. offset in level
	ld      de, $FF80
	add     hl, de			;subtract 128 from horiz. offset
	jr      c, +
	ld      hl, $0000
+:	ex      de, hl
	ld      hl, ($D176)		;vert. offset in level
	ld      bc, $FF80
	add     hl, bc			;subtract 128 from vert. offset
	jr      c, +
	ld      hl, $0000
+:	exx     
-:	ld      a, (hl)
	inc     a
	jr      z, +			;check for $FF terminator byte
	ld      a, (bc)
	or      a
	push    hl
	call    z, LABEL_804D	;load the sprite header if a slot is available
	pop     hl
	inc     bc
	ld      de, $0009		;move to the next sprite header
	add     hl, de
	jr      -
+:  ret     

LABEL_804D:
	inc     hl
	ld      e, (hl)
	inc     hl
	ld      d, (hl)
	ld      a, d
	exx     
	cp      d
	exx     
	jp      c, LABEL_812C
	or      a
	jr      nz, +
	ld      a, e
	exx     
	cp      e
	exx     
	jp      c, LABEL_812C
+:	exx     
	ld      a, d
	exx     
	inc     a
	inc     a
	cp      d
	jp      c, LABEL_812C
	or      a
	jr      nz, +
	ld      a, e
	exx     
	cp      e
	exx     
	jp      nc, LABEL_812C
+:	inc     hl
	ld      e, (hl)
	inc     hl
	ld      d, (hl)
	ld      a, d
	exx     
	cp      h
	exx     
	jp      c, LABEL_812C
	or      a
	jr      nz, +
	ld      a, e
	exx     
	cp      l
	exx     
	jp      c, LABEL_812C
+:	exx     
	ld      a, h
	exx     
	inc     a
	inc     a
	cp      d
	jp      c, LABEL_812C
	or      a
	jr      nz, +
	ld      a, e
	exx     
	cp      l
	exx     
	jp      nc, LABEL_812C
+:	ld      de, $FFFC
	add     hl, de
	ld      a, (hl)
	inc     a
	inc     a
	jr      nz, LABEL_80DE
	ld      a, $FF
	ld      (bc), a
	ld      de, $0005
	add     hl, de
	ex      de, hl
	ld      a, (de)
	add     a, a
	ld      hl, DATA_80BE
	add     a, l
	ld      l, a
	ld      a, $00
	adc     a, h
	ld      h, a
	ld      a, (hl)
	inc     hl
	ld      h, (hl)
	ld      l, a
	jp      (hl)

DATA_80BE:
.dw	LABEL_812E
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
.dw LABEL_812D
		
LABEL_80DE
	push    bc
	;find an empty sprite slot. Carry flag is set if
	;no slots are available. Pointer to slot stored in IY.
	call    LABEL_200 + $03
	pop     bc
	jr      c, LABEL_812C
	ld      a, (hl)
	ld      (iy+$00), a			;sprite type
	ld      (bc), a
	inc     hl
	ld      a, (hl)
	ld      (iy+$3A), a			;horizontal pos
	ld      (iy+$11), a
	inc     hl
	ld      a, (hl)
	ld      (iy+$3B), a
	ld      (iy+$12), a
	inc     hl
	ld      a, (hl)
	ld      (iy+$3C), a			;vertical position
	ld      (iy+$14), a
	inc     hl
	ld      a, (hl)
	ld      (iy+$3D), a
	ld      (iy+$15), a
	inc     hl
	ld      a, (hl)
	or      $40
	ld      (iy+$04), a
	inc     hl
	ld      a, (hl)
	ld      (iy+$3F), a			;object subtype
	inc     hl
	ld      a, (hl)
	ld      (iy+$08), a			;tile index offset for right-facing sprites
	inc     hl
	ld      a, (hl)
	ld      (iy+$09), a			;tile index offset for left-facing sprites
	ld      l, c
	ld      h, b
	ld      de, $D400
	xor     a
	sbc     hl, de
	inc     l
	ld      (iy+$3E), l
LABEL_812C:
	ret     

LABEL_812D:
	ret     

LABEL_812E:
	ex      de, hl
	inc     hl
	ld      e, (hl)
	inc     hl
	ld      d, (hl)
	ex      de, hl
	jp      (hl)
	

DATA_8135:
.dw DATA_8149 
.dw DATA_814F 
.dw DATA_8155 
.dw DATA_815B 
.dw DATA_8161 
.dw DATA_8167 
.dw DATA_816D 
.dw DATA_816D 
.dw DATA_816D 
.dw DATA_816D
 
DATA_8149:
.dw DATA_8173
.dw DATA_82C1 
.dw DATA_840F 

DATA_814F:
.dw DATA_848E 
.dw DATA_84E9 
.dw DATA_8568 

DATA_8155:
.dw DATA_8584 
.dw DATA_8666 
.dw DATA_87BD 

DATA_815B:
.dw DATA_87F4 
.dw DATA_88C4 
.dw DATA_8970 

DATA_8161:
.dw DATA_8983 
.dw DATA_8A4A 
.dw DATA_8AFF 

DATA_8167:
.dw DATA_8B24 
.dw DATA_8BE2 
.dw DATA_8C7C 

DATA_816D:
.dw DATA_8C8F 
.dw DATA_8D20 
.dw DATA_8D8D

DATA_8173:
.incbin "layout\ugz\sprite_layout_ugz1.bin"
DATA_82C1:
.incbin "layout\ugz\sprite_layout_ugz2.bin"
DATA_840F:
.incbin "layout\ugz\sprite_layout_ugz3.bin"

DATA_848E:
.incbin "layout\shz\sprite_layout_shz1.bin"
DATA_84E9:
.incbin "layout\shz\sprite_layout_shz2.bin"
DATA_8568:
.incbin "layout\shz\sprite_layout_shz3.bin"

DATA_8584:
.incbin "layout\alz\sprite_layout_alz1.bin"
DATA_8666:
.incbin "layout\alz\sprite_layout_alz2.bin"
DATA_87BD:
.incbin "layout\alz\sprite_layout_alz3.bin"

DATA_87F4:
.incbin "layout\ghz\sprite_layout_ghz1.bin"
DATA_88C4:
.incbin "layout\ghz\sprite_layout_ghz2.bin"
DATA_8970:
.incbin "layout\ghz\sprite_layout_ghz3.bin"

DATA_8983:
.incbin "layout\gmz\sprite_layout_gmz1.bin"
DATA_8A4A:
.incbin "layout\gmz\sprite_layout_gmz2.bin"
DATA_8AFF:
.incbin "layout\gmz\sprite_layout_gmz3.bin"

DATA_8B24:
.incbin "layout\sez\sprite_layout_sez1.bin"
DATA_8BE2:
.incbin "layout\sez\sprite_layout_sez2.bin"
DATA_8C7C:
.incbin "layout\sez\sprite_layout_sez3.bin"

DATA_8C8F:
.incbin "layout\cez\sprite_layout_cez1.bin"
DATA_8D20:
.incbin "layout\cez\sprite_layout_cez2.bin"
DATA_8D8D:
.incbin "layout\cez\sprite_layout_cez3.bin"
