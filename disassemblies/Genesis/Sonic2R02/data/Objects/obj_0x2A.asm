;===============================================================================
; Objeto 0x2A - Barreira que sobe e desce na Mystic Cave
; [ Início ]
;===============================================================================      
Offset_0x011574:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x011582(PC, D0), D1
                jmp     Offset_0x011582(PC, D1)
Offset_0x011582:
                dc.w    Offset_0x011586-Offset_0x011582
                dc.w    Offset_0x0115C0-Offset_0x011582
Offset_0x011586:
                addq.b  #$02, $0024(A0)
                move.l  #Up_Down_Pillar_Mappings, $0004(A0)    ; Offset_0x011618
                move.w  #$4000, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  #$50, $0016(A0)
                bset    #$04, $0001(A0)
Offset_0x0115C0:
                tst.b   $0025(A0)
                bne.s   Offset_0x0115DA
                addq.w  #$01, $0030(A0)
                cmpi.w  #$0060, $0030(A0)
                bne.s   Offset_0x0115EC
                move.b  #$02, $0025(A0)
                bra.s   Offset_0x0115EC
Offset_0x0115DA:
                subq.w  #$08, $0030(A0)
                bhi.s   Offset_0x0115EC
                move.w  #$0000, $0030(A0)
                move.b  #$00, $0025(A0)
Offset_0x0115EC:
                move.w  $0032(A0), D0
                sub.w   $0030(A0), D0
                move.w  D0, $000C(A0)
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0040, D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                bra     MarkObjGone                            ; Offset_0x016358
;-------------------------------------------------------------------------------
Up_Down_Pillar_Mappings: ; Offset_0x011618:
                dc.w    Offset_0x01161A-Up_Down_Pillar_Mappings
Offset_0x01161A:
                dc.w    $0006
                dc.l    $B009001A, $000DFFF0, $C00F0020, $0010FFF0
                dc.l    $E00F0030, $0018FFF0, $000F1030, $1018FFF0
                dc.l    $200F1020, $1010FFF0, $4009101A, $100DFFF0
;===============================================================================
; Objeto 0x2A - Barreira que sobe e desce na Mystic Cave
; [ Término ]
;===============================================================================  