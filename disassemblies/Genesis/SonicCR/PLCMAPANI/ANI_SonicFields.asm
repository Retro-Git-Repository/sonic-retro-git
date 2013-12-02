; ===========================================================================
; ---------------------------------------------------------------------------
; Animation scripts - Sonic Fields
; ---------------------------------------------------------------------------
;
; Each animation script starts with 3 bytes of data
;
;		dc.b $XX,$YY,$ZZ
;
;	$XX   = Speed to run animation at (00 Slow/3F Fast)
;		(Note: if it is 40, then it's a special animation speed that
;		is controled by routines somewhere)
;	$YY   = Number of frames within script
;	$ZZ   = (unknown)
;
; Then each byte in the line under, is each frame to use in that specific script
; (Basically the same as S1 and S2)
;
; ---------------------------------------------------------------------------
; ===========================================================================
; ---------------------------------------------------------------------------
			dc.w AniSonFld_Normal-ANI_SonicFields			; Standing animation (all directions)
			dc.w AniSonFld_WalkDw-ANI_SonicFields			; running animation (Moving downwards)
			dc.w AniSonFld_WalkLR-ANI_SonicFields			; running animation (Moving Left or Right)
			dc.w AniSonFld_WalkUp-ANI_SonicFields			; running animation (Moving Upwards
			dc.w AniSonFld_Ball-ANI_SonicFields			; Ball animation (Unused) (Could be jumping or rolling)
; ---------------------------------------------------------------------------
AniSonFld_Normal:	dc.b $00,$02,$00					; Standing (00 Forward/01 Left/Right/02 Backwards)
			dc.b $00,$01,$02
AniSonFld_WalkDw:	dc.b $20,$07,$00					; Down running
			dc.b $03,$04,$05,$06,$07,$08,$09,$0A,$00
AniSonFld_WalkLR:	dc.b $20,$07,$00					; LR running
			dc.b $0B,$0C,$0D,$0E,$0F,$10,$11,$12,$00
AniSonFld_WalkUp:	dc.b $20,$07,$00					; Up Running
			dc.b $13,$14,$15,$16,$17,$18,$19,$1A,$00
AniSonFld_Ball:		dc.b $80,$03,$00					; Ball Animation (Unused)
			dc.b $1B,$1C,$1D,$1C,$00
			even
; ---------------------------------------------------------------------------
; ===========================================================================