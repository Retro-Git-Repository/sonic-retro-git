;===============================================================================
; Objeto 0xD4 - Caixas azuis na Casino Night
; [ Início ]
;===============================================================================
Offset_0x02B52C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02B53A(PC, D0), D1
                jmp     Offset_0x02B53A(PC, D1)
Offset_0x02B53A:
                dc.w    Offset_0x02B53E-Offset_0x02B53A
                dc.w    Offset_0x02B5B0-Offset_0x02B53A
Offset_0x02B53E:
                addq.b  #$02, $0024(A0)
                move.l  #Blue_Box_Mappings, $0004(A0)          ; Offset_0x02B612
                move.w  #$436C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.b  #$04, $0018(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                move.w  #$8000, $000A(A0)
                move.w  #$8000, $000E(A0)
                tst.b   $0028(A0)
                bne.s   Offset_0x02B59C
                subi.w  #$0060, $0008(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02B5B0
                addi.w  #$00C0, $0008(A0)
                bra.s   Offset_0x02B5B0
Offset_0x02B59C:
                subi.w  #$0060, $000C(A0)
                btst    #$01, $0022(A0)
                beq.s   Offset_0x02B5B0
                addi.w  #$00C0, $000C(A0)
Offset_0x02B5B0:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.w  Offset_0x02B5E6(PC, D0), D1
                jsr     Offset_0x02B5E6(PC, D1)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  #$002B, D1
                move.w  #$0020, D2
                move.w  #$0021, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  $0030(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x02B5E6:
                dc.w    Offset_0x02B5EA-Offset_0x02B5E6
                dc.w    Offset_0x02B5FE-Offset_0x02B5E6
Offset_0x02B5EA:
                moveq   #$04, D1
                move.w  $0030(A0), D0
                cmp.w   $0008(A0), D0
                bhi.s   Offset_0x02B5F8
                neg.w   D1
Offset_0x02B5F8:
                add.w   D1, $0010(A0)
                rts
Offset_0x02B5FE:
                moveq   #$04, D1
                move.w  $0032(A0), D0
                cmp.w   $000C(A0), D0
                bhi.s   Offset_0x02B60C
                neg.w   D1
Offset_0x02B60C:
                add.w   D1, $0012(A0)
                rts
;-------------------------------------------------------------------------------
Blue_Box_Mappings: ; Offset_0x02B612:
                dc.w    Offset_0x02B614-Blue_Box_Mappings
Offset_0x02B614:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFE0, $E00F0800, $08000000
                dc.l    $000F1000, $1000FFE0, $000F1800, $18000000                                                                                                                   
;===============================================================================
; Objeto 0xD4 - Caixas azuis na Casino Night
; [ Término ]
;===============================================================================