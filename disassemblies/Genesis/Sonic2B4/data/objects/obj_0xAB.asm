;===============================================================================
; Object 0xAB - Grabber Sub - Chemical Plant
; [ Begin ]
;===============================================================================	
;loc_35214:
		moveq	#0,d0
		move.b	$24(a0),d0
		move.w	loc_35222(pc,d0),d1
		jmp	loc_35222(pc,d1)
loc_35222:
		dc.w	loc_35226-loc_35222
		dc.w	loc_3522A-loc_35222
loc_35226:
		bra	EnemySettings	
loc_3522A:
		bra	loc_3A8A4	
;===============================================================================
; Object 0xAB - Grabber Sub - Chemical Plant
; [ End ]
;===============================================================================