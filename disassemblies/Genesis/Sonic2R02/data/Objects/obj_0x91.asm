;===============================================================================
; Objeto 0x91 -> Inimigo Chop Chop na Aquatic Ruin
; [ Início ]
;=============================================================================== 
Offset_0x0367F6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036804(PC, D0), D1
                jmp     Offset_0x036804(PC, D1)
Offset_0x036804:
                dc.w    Offset_0x03680C-Offset_0x036804
                dc.w    Offset_0x03682E-Offset_0x036804
                dc.w    Offset_0x036882-Offset_0x036804
                dc.w    Offset_0x0368B6-Offset_0x036804
Offset_0x03680C:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$0200, $002A(A0)
                move.w  #$0050, $002C(A0)
                moveq   #$40, D0
                btst    #$00, $0022(A0)
                bne.s   Offset_0x036828
                neg.w   D0
Offset_0x036828:
                move.w  D0, $0010(A0)
                rts
Offset_0x03682E:
                subq.b  #$01, $002C(A0)
                bne.s   Offset_0x036838
                bsr     Offset_0x0368CE
Offset_0x036838:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x036854
                move.w  #$0200, $002A(A0)
                bchg    #00, $0022(A0)
                bchg    #00, $0001(A0)
                neg.w   $0010(A0)
Offset_0x036854:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x0360FC
                move.w  D2, D4
                move.w  D3, D5
                bsr     Offset_0x03690A
                bne.s   Offset_0x03686E
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03686E:
                addq.b  #$02, $0024(A0)
                move.b  #$10, $002A(A0)
                clr.w   $0010(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036882:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x03688C
                bra     Offset_0x0368BC
Offset_0x03688C:
                addq.b  #$02, $0024(A0)
                bsr     Offset_0x0360FC
                lsr.w   #$01, D0
                move.b  Offset_0x0368B2(PC, D0), $0010(A0)
                addi.w  #$0010, D3
                cmpi.w  #$0020, D3
                bcs.s   Offset_0x0368AE
                lsr.w   #$01, D1
                move.b  Offset_0x0368B2+$02(PC, D1), $0013(A0)
Offset_0x0368AE:
                bra     Offset_0x0368BC
Offset_0x0368B2:
                dc.b    $FE, $02, $80, $80
Offset_0x0368B6:
                jsr     (SpeedToPos)                           ; Offset_0x016332
Offset_0x0368BC:
                lea     (Chop_Chop_Animate_Data), A1           ; Offset_0x036948
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0368CE:
                move.w  #$0050, $002C(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x036908
                move.b  #$0A, $0000(A1) ; Carrega o objeto 0x0A - jogador embaixo d´água
                move.b  #$06, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                moveq   #$14, D0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x0368FA
                neg.w   D0
Offset_0x0368FA:
                add.w   D0, $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addq.w  #$06, $000C(A1)
Offset_0x036908:
                rts
Offset_0x03690A:
                addi.w  #$0020, D3
                cmpi.w  #$0040, D3
                bcc.s   Offset_0x036936
                tst.w   D2
                bmi.s   Offset_0x036922
                tst.w   $0010(A0)
                bpl.s   Offset_0x036936
                bra     Offset_0x03692A
Offset_0x036922:
                tst.w   $0010(A0)
                bmi.s   Offset_0x036936
                neg.w   D2
Offset_0x03692A:
                cmpi.w  #$0020, D2
                bcs.s   Offset_0x036936
                cmpi.w  #$00A0, D2
                bcs.s   Offset_0x03693A
Offset_0x036936:
                moveq   #$00, D2
                rts
Offset_0x03693A:
                moveq   #$01, D2
                rts
;-------------------------------------------------------------------------------
Obj_0x91_Ptr: ; Offset_0x03693E:
                dc.l    Chop_Chop_Mappings                     ; Offset_0x03694E
                dc.w    $253B
                dc.b    $04, $04, $10, $02
;-------------------------------------------------------------------------------
Chop_Chop_Animate_Data: ; Offset_0x036948:
                dc.w    Offset_0x03694A-Chop_Chop_Animate_Data
Offset_0x03694A:
                dc.b    $04, $00, $01, $FF  
;-------------------------------------------------------------------------------
Chop_Chop_Mappings: ; Offset_0x03694E:
                dc.w    Offset_0x036952-Chop_Chop_Mappings
                dc.w    Offset_0x03695C-Chop_Chop_Mappings
Offset_0x036952:
                dc.w    $0001
                dc.l    $F40E0000, $0000FFF0
Offset_0x03695C:
                dc.w    $0001
                dc.l    $F40E000C, $0006FFF0                              
;===============================================================================
; Objeto 0x91 -> Inimigo Chop Chop na Aquatic Ruin
; [ Término ]
;===============================================================================
