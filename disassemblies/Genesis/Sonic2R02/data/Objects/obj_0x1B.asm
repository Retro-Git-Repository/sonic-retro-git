;===============================================================================
; Objeto 0x1B - Propulsor automático na Chemical Plant
; [ Início ]                                                                        
;=============================================================================== 
Offset_0x0221AC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0221BA(PC, D0), D1
                jmp     Offset_0x0221BA(PC, D1)
Offset_0x0221BA:
                dc.w    Offset_0x0221C2-Offset_0x0221BA
                dc.w    Offset_0x0221FA-Offset_0x0221BA
Offset_0x0221BE:
                dc.w    $1000, $0A00    
Offset_0x0221C2:
                addq.b  #$02, $0024(A0)
                move.l  #CPz_Speed_Booster_Mappings, $0004(A0) ; Offset_0x0222E6
                move.w  #$E39C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  $0028(A0), D0
                andi.w  #$0002, D0
                move.w  Offset_0x0221BE(PC, D0), $0030(A0)
Offset_0x0221FA:
                move.b  ($FFFFFE05).w, D0
                andi.b  #$02, D0
                move.b  D0, $001A(A0)
                move.w  $0008(A0), D0
                move.w  D0, D1
                subi.w  #$0010, D0
                addi.w  #$0010, D1
                move.w  $000C(A0), D2
                move.w  D2, D3
                subi.w  #$0010, D2
                addi.w  #$0010, D3
                lea     ($FFFFB000).w, A1
                btst    #$01, $0022(A1)
                bne.s   Offset_0x022256
                move.w  $0008(A1), D4
                cmp.w   D0, D4
                bcs     Offset_0x022256
                cmp.w   D1, D4
                bcc     Offset_0x022256
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs     Offset_0x022256
                cmp.w   D3, D4
                bcc     Offset_0x022256
                move.w  D0, -(A7)
                bsr     Offset_0x02228C
                move.w  (A7)+, D0
Offset_0x022256:
                lea     ($FFFFB040).w, A1
                btst    #$01, $0022(A1)
                bne.s   Offset_0x022286
                move.w  $0008(A1), D4
                cmp.w   D0, D4
                bcs     Offset_0x022286
                cmp.w   D1, D4
                bcc     Offset_0x022286
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs     Offset_0x022286
                cmp.w   D3, D4
                bcc     Offset_0x022286
                bsr     Offset_0x02228C
Offset_0x022286:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02228C:
                move.w  $0010(A1), D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02229A
                neg.w   D0
Offset_0x02229A:
                cmpi.w  #$1000, D0
                bge.s   Offset_0x0222DC
                move.w  $0030(A0), $0010(A1)
                bclr    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x0222BE
                bset    #$00, $0022(A1)
                neg.w   $0010(A1)
Offset_0x0222BE:
                move.w  #$000F, $002E(A1)
                move.w  $0010(A1), $0014(A1)
                bclr    #$05, $0022(A0)
                bclr    #$06, $0022(A0)
                bclr    #$05, $0022(A1)
Offset_0x0222DC:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------                
CPz_Speed_Booster_Mappings: ; Offset_0x0222E6:
                dc.w    Offset_0x0222EC-CPz_Speed_Booster_Mappings
                dc.w    Offset_0x0222EC-CPz_Speed_Booster_Mappings
                dc.w    Offset_0x0222FE-CPz_Speed_Booster_Mappings
Offset_0x0222EC:
                dc.w    $0002
                dc.l    $F8050000, $0000FFE8, $F8050000, $00000008
Offset_0x0222FE:
                dc.w    $0000
;===============================================================================
; Objeto 0x1B - Propulsor automático na Chemical Plant
; [ Término ]
;===============================================================================  