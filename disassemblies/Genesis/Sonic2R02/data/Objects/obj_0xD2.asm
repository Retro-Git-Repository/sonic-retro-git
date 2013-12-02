;===============================================================================
; Objeto 0xD2 -> Plataformas verdes que aprecem de desaparecem na Casino Night
; [ Início ]
;===============================================================================   
Offset_0x02B17E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02B18C(PC, D0), D1
                jmp     Offset_0x02B18C(PC, D1)
Offset_0x02B18C:
                dc.w    Offset_0x02B190-Offset_0x02B18C
                dc.w    Offset_0x02B1D6-Offset_0x02B18C
Offset_0x02B190:
                addq.b  #$02, $0024(A0)
                move.l  #Green_Platform_Mappings, $0004(A0)    ; Offset_0x02B2F2
                move.w  #$437C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$08, $0019(A0)
                move.b  #$04, $0018(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$04, D0
                move.w  D0, $0038(A0)
                bsr     Offset_0x02B26A
Offset_0x02B1D6:
                tst.w   $0038(A0)
                beq.s   Offset_0x02B1E6
                subq.w  #$01, $0038(A0)
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x02B1E6:
                subq.w  #$01, $003A(A0)
                bpl.s   Offset_0x02B246
                move.w  #$000F, $003A(A0)
                addq.b  #$01, $001A(A0)
                andi.b  #$0F, $001A(A0)
                bne.s   Offset_0x02B244
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$04, D0
                move.w  D0, $0038(A0)
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x02B23C
                bclr    #$03, $0022(A0)
                beq.s   Offset_0x02B228
                bclr    #$03, ($FFFFB022).w
                bset    #$01, ($FFFFB022).w
Offset_0x02B228:
                bclr    #$04, $0022(A0)
                beq.s   Offset_0x02B23C
                bclr    #$03, ($FFFFB062).w
                bset    #$01, ($FFFFB062).w
Offset_0x02B23C:
                move.w  $0030(A0), $0008(A0)
                bra.s   Offset_0x02B26A
Offset_0x02B244:
                bsr.s   Offset_0x02B26A
Offset_0x02B246:
                move.w  $0034(A0), D1
                addi.w  #$000B, D1
                move.w  $0036(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  $0030(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x02B26A:
                moveq   #$00, D0
                move.b  $001A(A0), D0
                add.w   D0, D0
                add.w   D0, D0
                lea     Offset_0x02B2B2(PC, D0), A1
                move.b  (A1)+, D0
                ext.w   D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x02B286
                neg.w   D0
Offset_0x02B286:
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                move.b  (A1)+, D0
                ext.w   D0
                add.w   $0032(A0), D0
                move.w  D0, $000C(A0)
                moveq   #$00, D1
                moveq   #$00, D2
                moveq   #$00, D3
                move.b  (A1)+, D1
                move.b  (A1)+, D2
                move.w  D1, $0034(A0)
                move.b  D1, $0019(A0)
                move.w  D2, $0036(A0)
                rts
;-------------------------------------------------------------------------------                
Offset_0x02B2B2:
                dc.b    $D8, $18, $08, $08, $D8, $10, $08, $10, $D8, $08, $08, $18, $D8, $00, $08, $20
                dc.b    $E0, $00, $10, $20, $E8, $F8, $18, $18, $F0, $F0, $20, $10, $F8, $E8, $28, $08
                dc.b    $08, $E8, $28, $08, $10, $F0, $20, $10, $18, $F8, $18, $18, $20, $00, $10, $20
                dc.b    $28, $00, $08, $20, $28, $08, $08, $18, $28, $10, $08, $10, $28, $18, $08, $08
;-------------------------------------------------------------------------------
Green_Platform_Mappings: ; Offset_0x02B2F2:
                dc.w    Offset_0x02B312-Green_Platform_Mappings
                dc.w    Offset_0x02B31C-Green_Platform_Mappings
                dc.w    Offset_0x02B32E-Green_Platform_Mappings
                dc.w    Offset_0x02B348-Green_Platform_Mappings
                dc.w    Offset_0x02B36A-Green_Platform_Mappings
                dc.w    Offset_0x02B394-Green_Platform_Mappings
                dc.w    Offset_0x02B3BE-Green_Platform_Mappings
                dc.w    Offset_0x02B3E8-Green_Platform_Mappings
                dc.w    Offset_0x02B3E8-Green_Platform_Mappings
                dc.w    Offset_0x02B412-Green_Platform_Mappings
                dc.w    Offset_0x02B43C-Green_Platform_Mappings
                dc.w    Offset_0x02B466-Green_Platform_Mappings
                dc.w    Offset_0x02B348-Green_Platform_Mappings
                dc.w    Offset_0x02B32E-Green_Platform_Mappings
                dc.w    Offset_0x02B31C-Green_Platform_Mappings
                dc.w    Offset_0x02B312-Green_Platform_Mappings
Offset_0x02B312:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
Offset_0x02B31C:
                dc.w    $0002
                dc.l    $F0050000, $0000FFF8, $00050000, $0000FFF8
Offset_0x02B32E:
                dc.w    $0003
                dc.l    $E8050000, $0000FFF8, $F8050000, $0000FFF8
                dc.l    $08050000, $0000FFF8
Offset_0x02B348:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8, $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $10050000, $0000FFF8
Offset_0x02B36A:
                dc.w    $0005
                dc.l    $E0050000, $00000000, $E0050000, $0000FFF0
                dc.l    $F0050000, $0000FFF0, $00050000, $0000FFF0
                dc.l    $10050000, $0000FFF0
Offset_0x02B394:
                dc.w    $0005
                dc.l    $E8050000, $00000008, $E8050000, $0000FFF8
                dc.l    $E8050000, $0000FFE8, $F8050000, $0000FFE8
                dc.l    $08050000, $0000FFE8
Offset_0x02B3BE:
                dc.w    $0005
                dc.l    $F0050000, $00000010, $F0050000, $00000000
                dc.l    $F0050000, $0000FFF0, $F0050000, $0000FFE0
                dc.l    $00050000, $0000FFE0
Offset_0x02B3E8:
                dc.w    $0005
                dc.l    $F8050000, $00000018, $F8050000, $00000008
                dc.l    $F8050000, $0000FFF8, $F8050000, $0000FFE8
                dc.l    $F8050000, $0000FFD8
Offset_0x02B412:
                dc.w    $0005
                dc.l    $00050000, $00000010, $F0050000, $00000010
                dc.l    $F0050000, $00000000, $F0050000, $0000FFF0
                dc.l    $F0050000, $0000FFE0
Offset_0x02B43C:
                dc.w    $0005
                dc.l    $08050000, $00000008, $F8050000, $00000008
                dc.l    $E8050000, $00000008, $E8050000, $0000FFF8
                dc.l    $E8050000, $0000FFE8
Offset_0x02B466:
                dc.w    $0005
                dc.l    $10050000, $00000000, $00050000, $00000000
                dc.l    $F0050000, $00000000, $E0050000, $00000000
                dc.l    $E0050000, $0000FFF0
;===============================================================================
; Objeto 0xD2 -> Plataformas verdes que aprecem de desaparecem na Casino Night
; [ Término ]
;===============================================================================
