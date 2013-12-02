Logic_Monitors:			;$B710
.dw Monitors_State_00
.dw Monitors_State_01
.dw Monitors_State_02


Monitors_State_00:		;$B716
.db $01, $00
	.dw Monitors_State_00_Logic_01
.db $FF, $00


Monitors_State_01:		;$B71C
.db $01, $00
	.dw Monitors_State_01_Logic_01
.db $FF, $00

Monitors_State_02:		;$B722
.db $05, $02
	.dw Monitors_State_02_Logic_01
.db $02, $01
	.dw Monitors_State_02_Logic_01
.db $04, $02
	.dw Monitors_State_02_Logic_01
.db $02, $01
	.dw Monitors_State_02_Logic_01
.db $03, $02
	.dw Monitors_State_02_Logic_01
.db $02, $01
	.dw Monitors_State_02_Logic_01
.db $FF, $00


Monitors_State_00_Logic_01:		;$B73C
	set     7, (ix+$03)
	ld      (ix+$02), $01
	ret     

Monitors_State_01_Logic_01:		;$B745
	ld      b, (ix+$3F)
	call    LABEL_B31_B7BE
	ld      (ix+$02), $02
	ret

Monitors_State_02_Logic_01:		;$B750
	ld      b, (ix+$3F)
	call    LABEL_B31_B7BE
	bit     6, (ix+$04)
	ret     nz
	call    LABEL_200 + $18
	ld      a, ($D503)
	bit     1, a
	ret     z
	ld      a, (ix+$21)
	and     $0F
	ret     z
	cp      $02
	jr      nz, LABEL_B31_B775
	ld      hl, $0200
	ld      ($D518), hl		;set player's vertical speed
	ret     

LABEL_B31_B775:
	ld      hl, ($D518)		;get player's vertical speed
	ld      a, l
	or      h
	ret     z				;no collision on this axis
	ld      a, h
	and     $80				;was the collision from above or below?
	ret     nz
	call    LABEL_B31_B797
	ld      (ix+$3f), $40
	ld      a, ($D501)
	cp      $09
	jp      z, VF_Engine_DisplayExplosionObject
	ld      hl, $FC00
	ld      ($d518), hl
	jp      VF_Engine_DisplayExplosionObject

LABEL_B31_B797:
	ld      a, (ix+$3F)		;index into array of monitors
	cp      $0A
	ret     nc
	ld      e, a			;calculate the which monitor to use
	ld      d, $00
	ld      hl, Logic_Data_MonitorTypes
	add     hl, de
	ld      a, ($D39D)		;set monitor collision type
	or      (hl)
	ld      ($D39D), a
	ld      (ix+$3F), $00
	set     6, (ix+$3F)		;FIXME: this could be done in the previous op
	ret     

Logic_Data_MonitorTypes:
.db $00		;nothing
.db $00		;nothing
.db $01		;10-rings
.db $02		;extra life
.db $04		;speed shoes
.db $08		;invincibility
.db $10		;extra continue
.db $20
.db $40
.db $00		;nothing


LABEL_B31_B7BE:
	ld      c, (ix+$24)
	ld      a, (ix+$04)
	ld      (ix+$24), a
	bit     6, a
	ret     nz
	bit     6, c
	ret     z
	ld      a, b
	ld      ($D3AB), a	;used by subroutine 783B to decide which tiles to load
	ret     
