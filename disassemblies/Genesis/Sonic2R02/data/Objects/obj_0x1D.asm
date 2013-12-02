;===============================================================================
; Objeto 0x1D - Inimigo Verme na Chemical Plant
; [ Início ]
;===============================================================================  
Offset_0x022300:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02230E(PC, D0), D1
                jmp     Offset_0x02230E(PC, D1)
Offset_0x02230E:
                dc.w    Offset_0x022320-Offset_0x02230E
                dc.w    Offset_0x0223D2-Offset_0x02230E
                dc.w    Offset_0x0223F2-Offset_0x02230E
                dc.w    Offset_0x0223D2-Offset_0x02230E
                dc.w    Offset_0x02242A-Offset_0x02230E
Offset_0x022318:
                dc.w    $FB80, $FB00, $FA00, $F900
Offset_0x022320:
                addq.b  #$02, $0024(A0)
                move.w  #$FB80, $0012(A0)
                moveq   #$00, D1
                move.b  $0028(A0), D1
                move.b  D1, D0
                andi.b  #$0F, D1
                moveq   #$02, D5
                andi.b  #$F0, D0
                beq.s   Offset_0x022340
                moveq   #$06, D5
Offset_0x022340:
                move.b  $0022(A0), D4
                moveq   #$00, D2
                move.l  A0, A1
                bra.s   Offset_0x022352
Offset_0x02234A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0223CC
Offset_0x022352:
                move.b  $0000(A0), $0000(A1)
                move.b  D5, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  #Worms_Mappings, $0004(A1)             ; Offset_0x02247C
                move.w  #$643C, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$8B, $0020(A1)
                move.w  $0008(A1), $0038(A1)
                move.w  $000C(A1), $0030(A1)
                move.w  $0012(A0), $0012(A1)
                move.w  $0012(A1), $0034(A1)
                move.b  #$08, $0019(A1)
                move.w  #$0060, $003A(A1)
                move.w  #$000B, $0036(A1)
                andi.b  #$01, D4
                beq.s   Offset_0x0223C6
                neg.w   $0036(A1)
                neg.w   $003A(A1)
Offset_0x0223C6:
                move.w  D2, $0032(A1)
                addq.w  #$03, D2
Offset_0x0223CC:
                dbra    D1, Offset_0x02234A
                rts
Offset_0x0223D2:
                subq.w  #$01, $0032(A0)
                bpl.s   Offset_0x0223EC
                addq.b  #$02, $0024(A0)
                move.w  #$003B, $0032(A0)
                move.w  #Worms_Out_Sfx, D0      ; $00DA
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x0223EC:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0223F2:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  $0036(A0), D0
                add.w   D0, $0010(A0)
                addi.w  #$0018, $0012(A0)
                bne.s   Offset_0x02240C
                neg.w   $0036(A0)
Offset_0x02240C:
                move.w  $0030(A0), D0
                cmp.w   $000C(A0), D0
                bhi.s   Offset_0x022424
                move.w  $0034(A0), $0012(A0)
                clr.w   $0010(A0)
                subq.b  #$02, $0024(A0)
Offset_0x022424:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02242A:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                bne.s   Offset_0x022444
                move.w  $003A(A0), D0
                add.w   $0038(A0), D0
                move.w  D0, $0008(A0)
Offset_0x022444:
                cmpi.w  #$0180, $0012(A0)
                bne.s   Offset_0x022456
                move.w  #Worms_Out_Sfx, D0      ; $00DA
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x022456:
                move.w  $0030(A0), D0
                cmp.w   $000C(A0), D0
                bhi.s   Offset_0x022476
                move.w  $0034(A0), $0012(A0)
                move.w  $0038(A0), $0008(A0)
                move.w  #Worms_Out_Sfx, D0      ; $00DA
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x022476:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Worms_Mappings: ; Offset_0x02247C:
                dc.w    Offset_0x02247E-Worms_Mappings
Offset_0x02247E:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
;===============================================================================
; Objeto 0x1D - Inimigo Verme na Chemical Plant
; [ Término ]
;===============================================================================  