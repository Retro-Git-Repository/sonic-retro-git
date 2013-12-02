LABEL_B31_AB00:
	ld      hl, $D293
	set     4, (hl)
	ret

LABEL_B31_AB06:
	res     4, (ix+$04)
	ld      hl, $0200
	ld      (ix+$16), l
	ld      (ix+$17), h
	ld      hl, $0300
	ld      (ix+$18), l
	ld      (ix+$19), h
	call    LABEL_200 + $60
	call    VF_Engine_UpdateObjectPosition
	ld      l, (ix+$11)
	ld      h, (ix+$12)
	ld      de, $0450
	xor     a
	sbc     hl, de
	ret     c
	ld      (ix+$02), $32
	ret     

LABEL_B31_AB34:
	call    LABEL_B31_AB64
	ld      l, (ix+$14)
	ld      h, (ix+$15)
	ld      de, $0190
	xor     a
	sbc     hl, de
	ret     c
	ld      (ix+$02), $0e
	call    LABEL_200 + $75
	ret     

LABEL_B31_AB4C:
	call    LABEL_B31_AB64
	ld      l, (ix+$14)
	ld      h, (ix+$15)
	ld      de, $0260
	xor     a
	sbc     hl, de
	ret     c
	ld      (ix+$02), $0e
	call    LABEL_200 + $75
	ret     

LABEL_B31_AB64:
	call    VF_Engine_UpdateObjectPosition
	ld      de, $0020
	ld      bc, $0500
	call    VF_Engine_SetObjectVerticalSpeed
	ld      bc, $0000
	ld      (ix+$16), c		;set horizontal speed to 0
	ld      (ix+$17), b
	ret     

DATA_B31_AB7A:
.db $10, $08
	.dw LABEL_B31_ABA2
.db $10, $09
	.dw LABEL_B31_ABA2
.db $FF, $00

DATA_B31_AB84:
.db $FF, $07
	.dw LABEL_B31_AB8C
	.dw	LABEL_B31_ABC6
.db $FF, $00

LABEL_B31_AB8C:
	ld      hl, $D52F
	inc     (hl)
	ld      a, (hl)
	cp      $04
	jr      c, +
	xor     a
	ld      (hl), a
+:	add     a, $0c
	ld      ($D506), a
	ld      a, $04
	ld      ($D507), a
	ret     

LABEL_B31_ABA2:
	ld      hl, $0080		;set player's hpos
	ld      ($D511), hl
	ld      hl, $00A0		;set player's vpos
	ld      ($D514), hl
	ld      hl, $0000
	ld      ($D516), hl		;set player's horiz & vert speed to 0
	ld      ($D518), hl
	ld      a, ($D2BD)
	bit     7, a
	ret     z
	ld      (ix+$02), $30
	ld      (ix+$1F), $00
	ret     

LABEL_B31_ABC6:
	inc     (ix+$1F)
	ld      a, (ix+$1F)
	cp      $78
	ret     c
	ld      (ix+$1F), $78
	ld      hl, ($D516)		;player's horizontal speed
	ld      de, $00A0
	add     hl, de
	ld      ($D516), hl
	call    VF_Engine_UpdateObjectPosition
	ret

DATA_B31_ABE1:
.dw DATA_B31_ABE5 
.dw DATA_B31_ABEB

DATA_B31_ABE5:
.db $01, $00, 
	.dw LABEL_B31_ABFD
.db $FF, $00

DATA_B31_ABEB:
.db $04, $01
	.dw LABEL_B31_AC20
.db $04, $02
	.dw LABEL_B31_AC20
.db $04, $01
	.dw LABEL_B31_AC20
.db $04, $02
	.dw LABEL_B31_AC20
.db $FF, $01


LABEL_B31_ABFD:
	ld		hl, ($D35A)
	ld		a, l
	and     $F0
	add     a, $06
	ld      (ix+$11), a
	ld      (ix+$12), h
	ld      hl, ($D35C)
	ld      a, l
	and     $F0
	ld      (ix+$14), a
	ld      (ix+$15), h
	ld      (ix+$02), $01
	set     1, (ix+$04)
	ret     

LABEL_B31_AC20:
	ret     


.include "src\object_logic\logic_block_fragment.asm"

DATA_B31_ACEB:
.dw DATA_B31_ACEF
.dw DATA_B31_ACF8

DATA_B31_ACEF:
.db $FF, $09
	.db SFX_BreakBlock
.db $01, $00
	.dw BlockFragment_State_00_Logic_01
.db $FF, $00

DATA_B31_ACF8:
.db $FF, $07
	.dw LABEL_B31_AD00
	.dw BlockFragment_State_01_Logic_01
.db $FF, $00


LABEL_B31_AD00:
	ld      a, (CurrentLevel)
	or      a
	jr      nz, +
	ld      a, $88			;tile index
	ld      (ix+$08), a		;set tile index for right-facing sprite
	ld      (ix+$09), a		;set tile index for left-facing sprite
	ld      a, (ix+$3F)
	ld      (ix+$06), a
	ld      (ix+$07), $80
	ret     

+:	ld      a, (CurrentLevel)		;$AD19
	cp      $04
	jr      nz, +
	ld      a, $F6
	ld      (ix+$08), a
	ld      (ix+$09), a
	ld      a, (ix+$3F)
	ld      (ix+$06), a
	ld      (ix+$07), $80
	ret     

+:	ld      (ix+$00), $ff			;$AD33
	ret     


.include "src\object_logic\logic_speedshoes_stars.asm"


.include "src\object_logic\logic_invincibility_stars.asm"	


DATA_B31_AF3B:
.dw DATA_B31_AF3F
.dw DATA_B31_AF45

DATA_B31_AF3F:
.db $01, $00
	.dw LABEL_B31_AF4B
.db $FF, $00

DATA_B31_AF45:
.db $80, $00
	.dw LABEL_B31_AF58
.db $FF, $00

LABEL_B31_AF4B:
	xor     a
	ld      ($D2B8), a
	set     1, (ix+$04)
	ld      (ix+$02), $01
	ret     

LABEL_B31_AF58:
	bit     0, (ix+$07)
	ret     z
	ld      hl, $DB38
	ld      b, $08
-:	dec     (hl)
	inc     hl
	djnz    -
	ld      hl, $DB38
	ld      a, (hl)
	cp      $d8
	ret     nc
	ld      (ix+$00), $ff
	ret


DATA_B31_AF72:
.dw DATA_B31_AF78
.dw DATA_B31_AF7E
.dw DATA_B31_AF90

DATA_B31_AF78:
.db $01, $00 
	.dw LABEL_B31_AFAA
.db $FF, $00

DATA_B31_AF7E:
.db $04, $01
	.dw LABEL_B31_B017
.db $04, $02
	.dw LABEL_B31_B017
.db $04, $03
	.dw LABEL_B31_B017
.db $04, $04
	.dw LABEL_B31_B017
.db $FF, $00

DATA_B31_AF90:
.db $04, $05
	.dw LABEL_B31_B079
.db $04, $06
	.dw LABEL_B31_B079
.db $04, $05
	.dw LABEL_B31_B079
.db $04, $06
	.dw LABEL_B31_B079
.db $04, $05
	.dw LABEL_B31_B079
.db $04, $06
	.dw LABEL_B31_B079
.db $FF, $01


LABEL_B31_AFAA:
	ld		hl, ($D511)		;move sprite to 16-pixels above player
	ld      (ix+$11), l		;set sprite's hpos
	ld      (ix+$12), h
	ld      hl, ($D514)
	ld      de, $FFF0
	add     hl, de			;subtract $10
	ld      (ix+$14), l		;set sprite's vpos
	ld      (ix+$15), h
	ld      l, (ix+$3F)
	ld      h, $00
	add     hl, hl
	ex      de, hl
	ld      hl, DATA_B31_AFFB	;set horizontal speed
	add     hl, de
	ld      a, (hl)
	ld      (ix+$16), a
	inc     hl
	ld      a, (hl)
	ld      (ix+$17), a
	ld      hl, DATA_B31_B009	;set vertical speed
	add     hl, de
	ld      a, (hl)
	ld      (ix+$18), a
	inc     hl
	ld      a, (hl)
	ld      (ix+$19), a
	ld      hl, $FC00
	ld      (ix+$3C), l
	ld      (ix+$3D), h
	ld      (ix+$02), $01
	set     7, (ix+$03)
	set     6, (ix+$03)
	set     0, (ix+$04)
	ret     

DATA_B31_AFFB:
.db $00, $00, $00, $FF, $00, $01, $80, $FD, $80, $02, $80, $FC, $80, $03

DATA_B31_B009:
.db $00, $FB, $80, $FB, $80, $FB, $80, $FC, $80, $FC, $00, $FE, $00, $FE


LABEL_B31_B017:
	ld		l, (ix+$18)			;add 32 to sprite's horizontal speed
	ld		h, (ix+$19)
	ld      de, $0020
	add     hl, de
	ld      (ix+$18), l
	ld      (ix+$19), h
	call    VF_Engine_CheckCollision
	ld      a, (ix+$21)
	and     $0F
	jr      nz, LABEL_B31_B06C
	call    VF_Engine_UpdateObjectPosition
	res     1, (ix+$22)
	bit     7, (ix+$19)
	call    z, LABEL_200 + $60
	bit     1, (ix+$22)
	jr      z, +
	res     6, (ix+$03)
	ld      l, (ix+$3c)
	ld      h, (ix+$3d)
	ld      bc, $0080
	xor     a
	add     hl, bc
	jr      c, ++
	ld      (ix+$3c), l
	ld      (ix+$3d), h
	ld      (ix+$18), l
	ld      (ix+$19), h
+:	bit     6, (ix+$04)
	ret     z
++:	ld      (ix+$00), $ff
	ret     

LABEL_B31_B06C:
	ld      a, SFX_Ring
	ld      ($DD04), a
	call    VF_Engine_IncrementRingCounter
	ld      (ix+$02), $02
	ret

LABEL_B31_B079:
	ret

DATA_B31_B07A:
.dw DATA_B31_B07E
.dw DATA_B31_B084

DATA_B31_B07E:
.db $01, $00
	.dw LABEL_B31_B0B4
.db $FF, $00

DATA_B31_B084:
.db $FF, $09
	.db $A2
.db $78, $06
	.dw LABEL_B31_B0DB
.db $FF, $09
	.db $A2
.db $78, $05
	.dw LABEL_B31_B0DB
.db $FF, $09
	.db $A2
.db $78, $04
	.dw LABEL_B31_B0DB
.db $FF, $09
	.db $A2
.db $78, $03
	.dw LABEL_B31_B0DB
.db $FF, $09
	.db $A2
.db $78, $02
	.dw LABEL_B31_B0DB
.db $FF, $09
	.db $A2
.db $78, $01
	.dw LABEL_B31_B0DB
.db $02, $01
	.dw LABEL_B31_B109
.db $FF, $01


LABEL_B31_B0B4:
	ld		hl, ($D511)
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, ($D514)
	ld      bc, $FFDE
	add     hl, bc
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      (ix+$08), $0E
	ld      (ix+$09), $0E
	ld      (ix+$02), $01
	set     1, (ix+$04)
	ret     

LABEL_B31_B0DB:
	ld      hl, ($D511)
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, ($D514)
	ld      bc, $FFD8
	add     hl, bc
	ld      (ix+$14), l
	ld      (ix+$15), h
	res     7, (ix+$04)
	bit     2, (ix+$07)
	jr      z, +
	set     7, (ix+$04)
+:	ld      a, ($D469)
	or      a
	ret     nz
	ld      (ix+$00), $FF
	ret     

LABEL_B31_B109:
	push    iy
	ld      iy, $D500
	ld      (iy+$02), $28
	set     0, (iy+$03)
	ld      (iy+$04), $00
	ld      (iy+$18), $00
	ld      (iy+$19), $00
	ld      hl, $0000
	ld      ($D36F), hl
	res     1, (iy+$22)
	ld      a, Music_LoseLife
	ld      ($DD04), a
	pop     iy
	ld      hl, ($D176)
	ld      ($D27E), hl
	ld      (ix+$00), $FF
	ret     

DATA_B31_B13F:
.dw DATA_B31_B155
.dw DATA_B31_B15B
.dw	DATA_B31_B194
.dw DATA_B31_B19A
.dw DATA_B31_B1B9
.dw DATA_B31_B1BF
.dw DATA_B31_B1EE
.dw DATA_B31_B1F4
.dw DATA_B31_B213
.dw DATA_B31_B219
.dw DATA_B31_B227

DATA_B31_B155:
.db $FF, $02
	.dw LABEL_B31_B22D
.db $FF, $03		;calls the do-nothing stub (?)
DATA_B31_B15B:
.db $10, $00
	.dw VF_DoNothing
.db $FF, $07
	.dw LABEL_B31_B375
	.dw VF_DoNothing
.db $FF, $07
	.dw LABEL_B31_B375
	.dw VF_DoNothing
.db $FF, $07
	.dw LABEL_B31_B375
	.dw VF_DoNothing
.db $FF, $02
	.dw LABEL_B31_B3BD
.db $FF, $02
	.dw LABEL_B31_B38D
.db $FF, $06
	.db $0A
	.dw $0000
	.dw $0000
	.db $01
.db $FF, $04
	.dw $0000
	.dw $FF80
.db $C0, $04
	.dw LABEL_B31_B245
.db $FF, $05
	.db $02
.db $01, $04
	.dw LABEL_B31_B245
.db $FF, $00

DATA_B31_B194:
.db $E0, $04
	.dw LABEL_B31_B24C
.db $FF, $00

DATA_B31_B19A:
.db $10, $00
	.dw VF_DoNothing
.db $FF, $02
	.dw LABEL_B31_B38D
.db $FF, $04
	.dw $0000
	.dw $FF60
.db $10, $03
	.dw LABEL_B31_B3D9
.db $10, $02
	.dw LABEL_B31_B3D9
.db $FF, $05
	.db $04
.db $10, $02
	.dw LABEL_B31_B3D9
.db $FF, $00

DATA_B31_B1B9:
.db $10, $01
	.dw	LABEL_B31_B250
.db $FF, $00

DATA_B31_B1BF:
.db $20, $00
	.dw VF_DoNothing
.db $FF, $02
	.dw LABEL_B31_B38D
.db $FF, $07
	.dw LABEL_B31_B375
	.dw VF_DoNothing
.db $FF, $07
	.dw LABEL_B31_B375
	.dw VF_DoNothing
.db $FF, $04
	.dw $0000
	.dw $FF80
.db $10, $03
	.dw LABEL_B31_B3D9
.db $10, $02
	.dw LABEL_B31_B3D9
.db $10, $01
	.dw LABEL_B31_B3D9
.db $FF, $05
	.db $06
.db $10, $01
	.dw LABEL_B31_B3D9
.db $FF, $00

DATA_B31_B1EE:
.db $10, $05
	.dw LABEL_B31_B272
.db $FF, $00

DATA_B31_B1F4:
.db $FF, $04
	.dw $0000
	.dw $FF80
.db $FF, $02
	.dw LABEL_B31_B3A6
.db $FF, $02
	.dw LABEL_B31_B38D
.db $FF, $02
	.dw LABEL_B31_B35E
.db $10, $03
	.dw LABEL_B31_B3D9
.db $FF, $05
	.db $08
.db $10, $03
	.dw	LABEL_B31_B3D9
.db $FF, $00

DATA_B31_B213:
.db $E0, $06
	.dw	LABEL_B31_B3D2
.db $FF, $00

DATA_B31_B219:
.db $10, $01
	.dw	LABEL_B31_B3D9
.db $30, $00
	.dw VF_DoNothing
.db $30, $00
	.dw LABEL_B31_B4CE
.db $FF, $00

DATA_B31_B227:
.db $E0, $00
	.dw LABEL_B31_B2B6
.db $FF, $00

LABEL_B31_B22D:
	ld      a, (ix+$3f)
	add     a, a
	inc     a
	ld      (ix+$02), a
	set     7, (ix+$03)
	cp      $07
	ret     nz
	set     1, (ix+$04)
	res     6, (ix+$04)
	ret     

LABEL_B31_B245:
	call    LABEL_B31_B3F2
	call    LABEL_B31_B3D9
	ret     

LABEL_B31_B24C:
	call    LABEL_B31_B3D2
	ret     

LABEL_B31_B250:
	call    LABEL_B31_B3D2
	call    VF_Engine_CheckCollision
	ld      a, (ix+$21)
	and     $0F
	ret     z
	ld      a, ($D501)
	cp      $1F
	ret     z
	cp      $28
	ret     z
	cp      $21
	ret     z
	ld      (ix+$02), $09
	ld      a, $25
	ld      ($D502), a
	ret     

LABEL_B31_B272:
	call    LABEL_B31_B3D2
	call    VF_Engine_CheckCollision
	ld      a, (ix+$21)
	and     $0F
	ret     z
	ld      a, ($D501)
	cp      $1F
	ret     z
	cp      $28
	ret     z
	cp      $21
	ret     z
	ld      hl, ($D511)
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, ($D514)
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      a, $24
	ld      ($D502), a
	xor     a
	ld      ($D521), a
	ld      ($D503), a
	ld      (ix+$02), $0A
	ld      hl, $FF00
	ld      (ix+$18), l
	ld      (ix+$19), h
	ret     

LABEL_B31_B2B6:
	call    LABEL_B31_B3D2
	call    LABEL_B31_B311
	ld      l, (ix+$11)
	ld      h, (ix+$12)
	ld      ($D511), hl
	ld      l, (ix+$14)
	ld      h, (ix+$15)
	ld      ($D514), hl
	ld      a, (ix+$00)
	cp      $0A
	jp      nz, LABEL_B31_B307
	ld      bc, $0000
	ld      de, $FFE0
	call    LABEL_200 + $63
	cp      $81
	jp      z, LABEL_B31_B307
	ld      bc, $FFF0
	ld      de, $FFF0
	call    LABEL_200 + $63
	cp      $81
	jr      z, LABEL_B31_B307
	ld      bc, $0010
	ld      de, $FFF0
	call    LABEL_200 + $63
	cp      $81
	jr      z, LABEL_B31_B307
	ld      a, ($D501)
	cp      $24
	ret     z
	jp      LABEL_B31_B30C

LABEL_B31_B307:
	ld      a, $0E
	ld      ($D502), a
LABEL_B31_B30C:
	ld      (ix+$02), $05
	ret     

LABEL_B31_B311:
	ld      a, ($D137)
	and     $0C
	jp      z, LABEL_B31_B341
	ld      hl, $0100
	and     $08
	jr      nz, +
	ld      hl, $FF00
+:	ld      (ix+$16), l
	ld      (ix+$17), h
	ld      l, (ix+$18)
	ld      h, (ix+$19)
	push    hl
	xor     a
	ld      (ix+$18), a
	ld      (ix+$19), a
	call    VF_Engine_UpdateObjectPosition
	pop     hl
	ld      (ix+$18), l
	ld      (ix+$19), h
LABEL_B31_B341:
	ld      a, ($D137)
	ld      b, a
	ld      hl, $FF00
	and     $01
	jr      nz, +
	ld      a, b
	and     $02
	ld      hl, $FF80
	jr      z, +
	ld      hl, $FFD0
+:	ld      (ix+$18), l
	ld      (ix+$19), h
	ret     

LABEL_B31_B35E:
	ld      (ix+$08), $CE
	ld      (ix+$09), $CE
	ld      a, ($D2B9)
	and     $01
	set     4, (ix+$04)
	ret     z
	res     4, (ix+$04)
	ret     

LABEL_B31_B375:
	push    ix
	pop     hl
	call    VF_Engine_GetObjectIndexFromPointer
	add     a, a
	ld      b, a
	ld      a, ($D2B9)
	add     a, b
	and     $3F
	add     a, $40
	ld      (ix+$07), a
	ld      (ix+$06), $00
	ret     

LABEL_B31_B38D:
	ld      a, (ix+$3a)
	ld      (ix+$11), a
	ld      a, (ix+$3b)
	ld      (ix+$12), a
	ld      a, (ix+$3c)
	ld      (ix+$14), a
	ld      a, (ix+$3d)
	ld      (ix+$15), a
	ret     

LABEL_B31_B3A6:
	ld      hl, ($D511)
	ld      (ix+$3a), l
	ld      (ix+$3b), h
	ld      hl, ($D514)
	ld      de, $FFE8
	add     hl, de
	ld      (ix+$3c), l
	ld      (ix+$3d), h
	ret     

LABEL_B31_B3BD:
	ld      hl, $D3CE
	ld      b, $20
	xor     a
-:	ld      (hl), a
	inc     hl
	djnz    -
	ld      hl, $D3EE
	ld      b, $10
	xor     a
-:	ld      (hl), a
	inc     hl
	djnz    -
	ret     

LABEL_B31_B3D2:
	call    LABEL_B31_B3D9
	call    LABEL_B31_B4A0
	ret     

LABEL_B31_B3D9:
	inc     (ix+$1e)
	ld      hl, $0040
	bit     4, (ix+$1e)
	jr      z, +
	ld      hl, $FFC0
+:	ld      (ix+$16), l
	ld      (ix+$17), h
	call    VF_Engine_UpdateObjectPosition
	ret     

LABEL_B31_B3F2:
	push    ix
	ld      b, $06
	ld      iy, $D3CE
	ld      ix, $D3EE
LABEL_B31_B3FE:
	ld      a, ($D2B9)
	rrca    
	rrca    
	rrca    
	rrca    
	and     $03
	add     a, a
	add     a, b
	dec     a
	add     a, a
	add     a, a
	ld      e, a
	ld      d, $00
	ld      hl, DATA_B31_B470
	add     hl, de
	ld      e, (hl)
	inc     hl
	ld      d, (hl)
	push    hl
	ld      hl, $FFF4
	add     hl, de
	ld      a, ($D2B9)
	and     $0F
	add     a, b
	ld      e, a
	ld      d, $00
	add     hl, de
	ex      de, hl
	ld      l, (ix+$01)
	ld      h, (iy+$02)
	ld      c, (iy+$03)
	ld      a, d
	and     $80
	rlca    
	dec     a
	cpl     
	add     hl, de
	adc     a, c
	ld      (iy+$03), a
	ld      (ix+$01), l
	ld      (iy+$02), h
	pop     hl
	inc     hl
	ld      e, (hl)
	inc     hl
	ld      d, (hl)
	ld      l, (ix+$00)
	ld      h, (iy+$00)
	ld      c, (iy+$01)
	ld      a, d
	and     $80
	rlca    
	dec     a
	cpl     
	add     hl, de
	adc     a, c
	ld      (iy+$01), a
	ld      (ix+$00), l
	ld      (iy+$00), h
	ld      de, $0004
	add     iy, de
	ld      de, $0002
	add     ix, de
	dec     b
	jp      nz, LABEL_B31_B3FE
	pop     ix
	ret     

DATA_B31_B470:
.db $04, $00, $F8, $FF, $FC, $FF, $F4, $FF
.db $10, $00, $E0, $FF, $F0, $FF, $D8, $FF
.db $1C, $00, $F0, $FF, $E4, $FF, $EE, $FF
.db $FC, $FF, $FC, $FF, $04, $00, $F6, $FF
.db $F0, $FF, $E4, $FF, $10, $00, $DA, $FF
.db $E8, $FF, $ED, $FF, $18, $00, $F1, $FF


LABEL_B31_B4A0:
	ld      de, ($D176)
	ld      l, (ix+$14)
	ld      h, (ix+$15)
	xor     a
	sbc     hl, de
	jr      c, LABEL_B31_B4CE
	ld      a, h
	cp      $02
	jp      nc, LABEL_B31_B4CE
	ld      a, (CurrentAct)
	dec     a
	jp      z, LABEL_B31_B4D3
	ld      de, $FFD0
	ld      bc, $0000
	call    LABEL_200 + $63
	cp      $00
	jr      z, LABEL_B31_B4CE
	cp      $81
	jr      z, LABEL_B31_B4CE
	ret
	
LABEL_B31_B4CE:
	ld      (ix+$00), $ff
	ret     

LABEL_B31_B4D3:
	ret     

DATA_B31_B4D4:
.dw DATA_B31_B4D8
.dw DATA_B31_B4DE

DATA_B31_B4D8:
.db $01, $00
	.dw LABEL_B31_B4EB
.db $FF, $00

DATA_B31_B4DE:
.db $FF, $09
	.db SFX_Splash
.db $04, $01
	.dw LABEL_B31_B512
.db $08, $02
	.dw LABEL_B31_B512
.db $FF, $01


LABEL_B31_B4EB:
	ld		hl, ($D511)
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, ($D514)
	ld      bc, $FFF0
	add     hl, bc
	ld      a, l
	and     $E0
	ld      l, a
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      (ix+$08), $CC
	ld      (ix+$02), $01
	set     0, (ix+$04)
	ret     

LABEL_B31_B512:
	ret     

DATA_B31_B513:
.dw DATA_B31_B517
.dw DATA_B31_B51D

DATA_B31_B517:
.db $01, $00
	.dw LABEL_B31_B523
.db $FF, $00

DATA_B31_B51D:
.db $80, $01
	.dw LABEL_B31_B53E
.db $FF, $00


LABEL_B31_B523:
	ld      hl, ($d174)
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, $0120
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      (ix+$08), $70
	ld      (ix+$02), $01
	ret     

LABEL_B31_B53E:
	inc     (ix+$1f)
	ld      a, (ix+$1f)
	and     $0f
	ld      l, a
	ld      h, $00
	add     hl, hl
	ld      bc, $b590
	add     hl, bc
	ld      c, (hl)
	inc     hl
	ld      b, (hl)
	ld      hl, ($D174)
	add     hl, bc
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      l, (ix+$14)
	ld      h, (ix+$15)
	ld      ($d4a4), hl
	ld      hl, ($d176)
	ld      de, $0040
	add     hl, de
	ld      de, ($d4a4)
	xor     a
	sbc     hl, de
	jr      nc, LABEL_B31_B584
	dec     hl
	ld      a, h
	cpl     
	ld      h, a
	ld      a, l
	cpl     
	ld      l, a
	ld      a, h
	or      a
	jr      nz, LABEL_B31_B58A		;FIXME: identical to subroutine at B584
	ld      a, l
	ld      ($d132), a
	ret     

LABEL_B31_B584:
	ld      b, $FF
	ld      ($D132), a
	ret     

LABEL_B31_B58A:
	ld      b, $FF
	ld      ($D132), a
	ret     

DATA_B31_B590:
.db $00, $00, $80, $00, $10, $00, $90, $00
.db $20, $00, $A0, $00, $30, $00, $B0, $00
.db $40, $00, $C0, $00, $50, $00, $D0, $00
.db $60, $00, $E0, $00, $70, $00, $F0, $00

DATA_B31_B5B0:
.dw DATA_B31_B5BC
.dw DATA_B31_B5C2
.dw DATA_B31_B5C8
.dw DATA_B31_B5CE
.dw DATA_B31_B5DB
.dw DATA_B31_B5E1

DATA_B31_B5BC:
.db $FF, $02
	.dw LABEL_B31_B5ED
.db $FF, $03		;do-nothing stub
DATA_B31_B5C2:
.db $20, $01
	.dw LABEL_B31_B61C
.db $FF, $00

DATA_B31_B5C8:
.db $20, $02
	.dw LABEL_B31_B633
.db $FF, $00

DATA_B31_B5CE:
.db $40, $00
	.dw VF_DoNothing
.db $FF, $05
	.db $01
.db $40, $00
	.dw VF_DoNothing
.db $FF, $00

DATA_B31_B5DB:
.db $E0, $00
	.dw	LABEL_B31_B658
.db $FF, $00

DATA_B31_B5E1:
.db $FF, $04
	.dw $0200
	.dw $0000
.db $E0, $03
	.dw LABEL_B31_B662
.db $FF, $00


LABEL_B31_B5ED:
	ld      a, (ix+$3f)
	or      a
	jp      z, LABEL_B31_B5F9
	ld      (ix+$02), $04
	ret     

LABEL_B31_B5F9:
	ld      hl, $fb00
	ld      (ix+$18), l
	ld      (ix+$19), h
	ld      hl, $0000
	ld      (ix+$16), l
	ld      (ix+$17), h
	ld      l, (ix+$3c)
	ld      h, (ix+$3d)
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      (ix+$02), $01
	ret     

LABEL_B31_B61C:
	ld      de, $0010
	ld      bc, $0400
	call    VF_Engine_SetObjectVerticalSpeed
	bit     7, (ix+$19)
	jp      nz, LABEL_B31_B67C
	ld      (ix+$02), $02
	jp      LABEL_B31_B67C

LABEL_B31_B633:
	ld      de, $0014
	ld      bc, $0400
	call    VF_Engine_SetObjectVerticalSpeed
	ld      l, (ix+$3c)
	ld      h, (ix+$3d)
	ld      e, (ix+$14)
	ld      d, (ix+$15)
	xor     a
	sbc     hl, de
	jp      nc, LABEL_B31_B67C
	call    LABEL_B31_B5F9
	ld      (ix+$02), $03
	jp      LABEL_B31_B67C

LABEL_B31_B658:
	bit     6, (ix+$04)
	ret     nz
	ld      (ix+$02), $05
	ret

LABEL_B31_B662:
	bit     6, (ix+$04)
	jp      z, LABEL_B31_B67C
	ld      (ix+$02), $04
	ld      l, (ix+$3A)
	ld      h, (ix+$3B)
	ld      (ix+$11), l
	ld      (ix+$12), h
	jp      LABEL_B31_B67C

LABEL_B31_B67C:
	call    VF_Engine_UpdateObjectPosition
	call    VF_Engine_CheckCollision
	ld      a, (ix+$21)
	and     $0F
	ret     z
	ld      a, $FF
	ld      ($D3A8), a
	ret     


;Explosion logic
.include "src\object_logic\logic_explosion.asm"


;Monitor logic
.include "src\object_logic\logic_monitors.asm"


;Emerald logic
.include "src\object_logic\logic_chaosemeralds.asm"


;Signpost logic
.include "src\object_logic\logic_signpost.asm"



DATA_B31_BA7A:
.dw DATA_B31_BAAD
.dw DATA_B31_BAB3
.dw DATA_B31_BAB9
.dw DATA_B31_BADE
.dw DATA_B31_BAE4
.dw DATA_B31_BAF5
DATA_B31_BA86:
.dw DATA_B31_BA8A
.dw DATA_B31_BA90

DATA_B31_BA8A:
.db $01, $00
	.dw LABEL_B31_BA96
.db $FF, $00

DATA_B31_BA90:
.db $E0, $02
	.dw LABEL_B31_BB40
.db $FF, $00


LABEL_B31_BA96:
	ld      (ix+$02), $01
	ld      hl, $FF40
	ld      (ix+$16), l
	ld      (ix+$17), h
	ld      hl, $FB80
	ld      (ix+$18), l
	ld      (ix+$19), h
	ret     


DATA_B31_BAAD:
.db $01, $00
	.dw LABEL_B31_BAFB
.db $FF, $00

DATA_B31_BAB3:
.db $E0, $01
	.dw LABEL_B31_BB61
.db $FF, $00

DATA_B31_BAB9:
.db $02, $01
	.dw LABEL_B31_BB07
.db $02, $04
	.dw LABEL_B31_BB07
.db $02, $01
	.dw LABEL_B31_BB07
.db $02, $04
	.dw LABEL_B31_BB07
.db $02, $01
	.dw LABEL_B31_BB07
.db $02, $04
	.dw LABEL_B31_BB07
.db $02, $01
	.dw LABEL_B31_BB07
.db $02, $04
	.dw LABEL_B31_BB07
.db $FF, $05
	.db $03
.db $FF, $00

DATA_B31_BADE:
.db $04, $01
	.dw LABEL_B31_BB0B
.db $FF, $00

DATA_B31_BAE4:
.db $04, $03
	.dw VF_DoNothing
.db $FF, $06
	.db $1A
	.dw $0000
	.dw	$0000
	.db $00
.db $FF, $05
	.db $05
.db $FF, $00

DATA_B31_BAF5:
.db $E0, $03
	.dw LABEL_B31_BB40
.db $FF, $00

LABEL_B31_BAFB:
	ld      a, (ix+$3f)
	or      a
	jp      nz, LABEL_B31_BB29
	ld      (ix+$02), $01
	ret     

LABEL_B31_BB07:
	call    VF_Engine_CheckCollision
	ret     

LABEL_B31_BB0B:		;called on collision with UGZ falling spikes
	call    VF_Engine_CheckCollision
	ld      a, (ix+$21)
	and     $0F
	jr      nz, LABEL_B31_BB29
	ld      de, $0050
	ld      bc, $0600
	call    VF_Engine_SetObjectVerticalSpeed
	call    VF_Engine_UpdateObjectPosition
	call    LABEL_200 + $60
	bit     1, (ix+$22)
	ret     z
LABEL_B31_BB29:
	ld      (ix+$02), $04
	ld      hl, $00b0
	ld      (ix+$16), l
	ld      (ix+$17), h
	ld      hl, $fc00
	ld      (ix+$18), l
	ld      (ix+$19), h
	ret

LABEL_B31_BB40:
	ld      de, $0050
	ld      bc, $0600
	call    VF_Engine_SetObjectVerticalSpeed
	call    VF_Engine_UpdateObjectPosition
	bit     6, (ix+$04)
	ret     z
	ld      a, (ix+$3e)
	or      a
	jr      nz, LABEL_B31_BB5C
	ld      (ix+$00), $ff
	ret     

LABEL_B31_BB5C:
	ld      (ix+$00), $FE
	ret     

LABEL_B31_BB61:
	bit     6, (ix+$04)
	ret     nz
	ld      hl, ($d514)
	ld      e, (ix+$14)
	ld      d, (ix+$15)
	xor     a
	sbc     hl, de
	ret     c
	ld      a, h
	or      a
	ret     nz
	ld      b, l
	srl     b
	ld      de, ($d516)
	bit     7, d
	jr      z, +
	dec     de
	ld      a, d
	cpl     
	ld      d, a
	ld      a, e
	cpl     
	ld      e, a
+:	ld      hl, $0180
	xor     a
	sbc     hl, de
	jr      nc, +
	ld      a, b
	add     a, a
	ld      b, a
	ld      hl, $0380
	xor     a
	sbc     hl, de
	jr      nc, +
	ld      a, b
	add     a, b
	ld      b, a
	jr      nc, +
	ld      b, $ff
+:	ld      hl, ($d511)
	ld      e, (ix+$11)
	ld      d, (ix+$12)
	xor     a
	sbc     hl, de
	jr      nc, +
	ex      de, hl
	ld      hl, $0000
	xor     a
	sbc     hl, de
+:	ld      a, h
	or      a
	ret     nz
	ld      a, l
	cp      b
	ret     nc
	ld      (ix+$02), $02
	ld      (ix+$1f), $10
	ret     

DATA_B31_BBC6:
.dw DATA_B31_BBCA
.dw DATA_B31_BBD0

DATA_B31_BBCA:
.db $01, $00
	.dw LABEL_B31_BBD6
.db $FF, $00

DATA_B31_BBD0:
.db $10, $01
	.dw LABEL_B31_BBF9
.db $FF, $00

LABEL_B31_BBD6:
	ld      hl, $0080
	ld      a, r
	and     $f8
	add     a, l
	ld      l, a
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, $0054
	ld      a, r
	and     $07
	add     a, l
	ld      l, a
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      (ix+$02), $01
	ret     

LABEL_B31_BBF9:
	call    LABEL_B31_BCA2
	ld      l, (ix+$11)
	ld      h, (ix+$12)
	dec     hl
	ld      a, ($d12f)
	and     $01
	jr      nz, +
	dec     hl
+:	ld      (ix+$11), l
	ld      (ix+$12), h
	ret     

DATA_B31_BC12:
.dw DATA_B31_BC16
.dw DATA_B31_BC1C

DATA_B31_BC16:
.db $01, $00
	.dw LABEL_B31_BC22
.db $FF, $00

DATA_B31_BC1C:
.db $10, $01
	.dw LABEL_B31_BC45
.db $FF, $00

LABEL_B31_BC22:
	ld      hl, $0000
	ld      a, r
	ld      l, a
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, $004c
	push    ix
	pop     bc
	ld      a, c
	rrca    
	rrca    
	rrca    
	add     a, l
	ld      l, a
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      (ix+$02), $01
	ret     

LABEL_B31_BC45:
	call    LABEL_200 + $DE
	call    LABEL_B31_BCA2
	ld      l, (ix+$11)
	ld      h, (ix+$12)
	dec     hl
	ld      a, ($d12f)
	and     $07
	jr      nz, +
	dec     hl
+:	ld      (ix+$11), l
	ld      (ix+$12), h
	ret     

LABEL_B31_BC61:
.dw DATA_B31_BC65
.dw DATA_B31_BC6B

DATA_B31_BC65:
.db $01, $00
	.dw LABEL_B31_B671
.db $FF, $00

DATA_B31_BC6B:
.db $10, $01
	.dw LABEL_B31_BC8E
.db $FF, $00

LABEL_B31_B671:
	ld      hl, $0080
	ld      a, r
	and     $30
	add     a, l
	ld      l, a
	ld      (ix+$11), l
	ld      (ix+$12), h
	ld      hl, $007a
	ld      (ix+$14), l
	ld      (ix+$15), h
	ld      (ix+$02), $01
	ret     

LABEL_B31_BC8E:
	call    LABEL_B31_BCA2
	ld      l, (ix+$11)
	ld      h, (ix+$12)
	dec     hl
	dec     hl
	dec     hl
	dec     hl
	ld      (ix+$11), l
	ld      (ix+$12), h
	ret     

LABEL_B31_BCA2:
	bit     6, (ix+$04)
	ret     nz
	ld      l, (ix+$1a)
	ld      h, (ix+$1b)
	ld      bc, $0040
	xor     a
	sbc     hl, bc
	ret     nc
	ld      l, (ix+$11)
	ld      h, (ix+$12)
	ld      bc, $00c0
	ld      a, r
	and     $1f
	add     a, c
	ld      c, a
	add     hl, bc
	ld      (ix+$11), l
	ld      (ix+$12), h
	ret     
