;===============================================================================
; Objeto 0x7E - Estrelas do Super Sonic 
; [ Início ]
;===============================================================================  
Offset_0x01E084:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01E092(PC, D0), D1
                jmp     Offset_0x01E092(PC, D1)
Offset_0x01E092:
                dc.w    Offset_0x01E096-Offset_0x01E092
                dc.w    Offset_0x01E0CC-Offset_0x01E092
Offset_0x01E096:
                addq.b  #$02, $0024(A0)
                move.l  #Super_Sonic_Stars_Mappings, $0004(A0) ; Offset_0x01E152
                move.b  #$04, $0001(A0)
                move.b  #$01, $0018(A0)
                move.b  #$18, $0019(A0)
                move.w  #$05F2, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                btst    #$07, ($FFFFB002).w
                beq.s   Offset_0x01E0CC
                bset    #$07, $0002(A0)
Offset_0x01E0CC:
                tst.b   ($FFFFFE19).w
                beq.s   Offset_0x01E14C
                tst.b   $0030(A0)
                beq.s   Offset_0x01E11C
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x01E104
                move.b  #$01, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$06, $001A(A0)
                bcs.s   Offset_0x01E104
                move.b  #$00, $001A(A0)
                move.b  #$00, $0030(A0)
                move.b  #$01, $0031(A0)
                rts
Offset_0x01E104:
                tst.b   $0031(A0)
                bne.s   Offset_0x01E116
Offset_0x01E10A:
                move.w  ($FFFFB008).w, $0008(A0)
                move.w  ($FFFFB00C).w, $000C(A0)
Offset_0x01E116:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x01E11C:
                tst.b   ($FFFFB02A).w
                bne.s   Offset_0x01E13E
                move.w  ($FFFFB014).w, D0
                bpl.s   Offset_0x01E12A
                neg.w   D0
Offset_0x01E12A:
                cmpi.w  #$0800, D0
                bcs.s   Offset_0x01E13E
                move.b  #$00, $001A(A0)
                move.b  #$01, $0030(A0)
                bra.s   Offset_0x01E10A
Offset_0x01E13E:
                move.b  #$00, $0030(A0)
                move.b  #$00, $0031(A0)
                rts
Offset_0x01E14C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------   
Super_Sonic_Stars_Mappings: ; Offset_0x01E152:
                dc.w    Offset_0x01E15E-Super_Sonic_Stars_Mappings
                dc.w    Offset_0x01E180-Super_Sonic_Stars_Mappings
                dc.w    Offset_0x01E1A2-Super_Sonic_Stars_Mappings
                dc.w    Offset_0x01E180-Super_Sonic_Stars_Mappings
                dc.w    Offset_0x01E15E-Super_Sonic_Stars_Mappings
                dc.w    Offset_0x01E1C4-Super_Sonic_Stars_Mappings
Offset_0x01E15E:
                dc.w    $0004
                dc.l    $F8000000, $0000FFF8, $F8000800, $08000000
                dc.l    $00001000, $1000FFF8, $00001800, $18000000
Offset_0x01E180:
                dc.w    $0004
                dc.l    $F0050001, $0000FFF0, $F0050801, $08000000
                dc.l    $00051001, $1000FFF0, $00051801, $18000000
Offset_0x01E1A2:
                dc.w    $0004
                dc.l    $E80A0005, $0002FFE8, $E80A0805, $08020000
                dc.l    $000A1005, $1002FFE8, $000A1805, $18020000
Offset_0x01E1C4:
                dc.w    $0000
;===============================================================================
; Objeto 0x7E - Estrelas do Super Sonic 
; [ Término ]
;===============================================================================  