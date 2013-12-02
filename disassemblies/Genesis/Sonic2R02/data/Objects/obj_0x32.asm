;===============================================================================
; Objeto 0x32 - Pedra na Hill Top / Obstáculo nos tuneis da Chemical Plant
; [ Início ]
;=============================================================================== 
Offset_0x02340E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02341C(PC, D0), D1
                jmp     Offset_0x02341C(PC, D1)
Offset_0x02341C:
                dc.w    Offset_0x023422-Offset_0x02341C
                dc.w    Offset_0x023478-Offset_0x02341C
                dc.w    Offset_0x023566-Offset_0x02341C
Offset_0x023422:
                addq.b  #$02, $0024(A0)
                move.l  #HTz_Rock_Mappings, $0004(A0)          ; Offset_0x023754
                move.w  #$43B2, $0002(A0)
                move.b  #$18, $0019(A0)
                move.l  #HTz_Rock_Break_Data, $003C(A0)        ; Offset_0x023580
                cmpi.b  #$0D, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x023466
                move.l  #CPz_Tunel_Obstacle_Mappings, $0004(A0) ; Offset_0x023788
                move.w  #$6430, $0002(A0)
                move.b  #$10, $0019(A0)
                move.l  #CPz_Tunel_Obstacle_Break_Data, $003C(A0) ; Offset_0x023598
Offset_0x023466:
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$04, $0018(A0)
Offset_0x023478:
                move.w  ($FFFFF7D0).w, $0038(A0)
                move.b  ($FFFFB01C).w, $0032(A0)
                move.b  ($FFFFB05C).w, $0033(A0)
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x0234B6
Offset_0x0234B0:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0234B6:
                cmpi.b  #$18, D0
                bne.s   Offset_0x0234E4
                cmpi.b  #$02, $0032(A0)
                beq.s   Offset_0x0234CC
                cmpi.b  #$02, $0033(A0)
                bne.s   Offset_0x0234B0
Offset_0x0234CC:
                lea     ($FFFFB000).w, A1
                move.b  $0032(A0), D0
                bsr.s   Offset_0x0234FC
                lea     ($FFFFB040).w, A1
                move.b  $0033(A0), D0
                bsr.s   Offset_0x0234FC
                bra     Offset_0x02354C
Offset_0x0234E4:
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x023534
                cmpi.b  #$02, $0032(A0)
                bne.s   Offset_0x0234B0
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x023502
                bra.s   Offset_0x02354C
Offset_0x0234FC:
                cmpi.b  #$02, D0
                bne.s   Offset_0x023520
Offset_0x023502:
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                move.w  #$FD00, $0012(A1)
Offset_0x023520:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                rts
Offset_0x023534:
                andi.b  #$10, D0
                beq     Offset_0x0234B0
                cmpi.b  #$02, $0033(A0)
                bne     Offset_0x0234B0
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x023502
Offset_0x02354C:
                move.w  $0038(A0), ($FFFFF7D0).w
                andi.b  #$E7, $0022(A0)
                move.l  $003C(A0), A4
                jsr     (Smash_Object)                         ; Offset_0x015D9E
                bsr     Offset_0x0235A8
Offset_0x023566:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                tst.b   $0001(A0)
                bpl     Obj_0x2F_0x30_DeleteObject             ; Offset_0x0237AC
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------              
HTz_Rock_Break_Data: ; Offset_0x023580:
                dc.w    $FE00, $FE00, $0000, $FD80, $0200, $FE00, $FE40, $FE40
                dc.w    $0000, $FE00, $01C0, $FE40
;------------------------------------------------------------------------------- 
CPz_Tunel_Obstacle_Break_Data: ; Offset_0x023598:
                dc.w    $FF00, $FE00, $0100, $FE00, $FF40, $FE40, $00C0, $FE40
;------------------------------------------------------------------------------- 
Offset_0x0235A8:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x0235F2
                move.b  #$29, $0000(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  ($FFFFF7D0).w, D2
                addq.w  #$02, ($FFFFF7D0).w
                cmpi.w  #$0006, D2
                bcs.s   Offset_0x0235D2
                moveq   #$06, D2
Offset_0x0235D2:
                moveq   #$00, D0
                move.w  Break_Obstacle_Points(PC, D2), D0      ; Offset_0x0235F4
                cmpi.w  #$0020, ($FFFFF7D0).w
                bcs.s   Offset_0x0235E6
                move.w  #$03E8, D0
                moveq   #$0A, D2
Offset_0x0235E6:
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                lsr.w   #$01, D2
                move.b  D2, $001A(A1)
Offset_0x0235F2:
                rts                 
;------------------------------------------------------------------------------- 
Break_Obstacle_Points: ; Offset_0x0235F4:
                dc.w    $000A, $0014, $0032, $0064                            
;===============================================================================
; Objeto 0x32 - Pedra na Hill Top / Obstáculo nos tuneis da Chemical Plant
; [ Término ]
;===============================================================================  