;===============================================================================
; Objeto 0x77 - Pontes na Mystic Cave
; [ Início ]
;===============================================================================  
Offset_0x028CA4:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x028CB2(PC, D0), D1
                jmp     Offset_0x028CB2(PC, D1)
Offset_0x028CB2:
                dc.w    Offset_0x028CB6-Offset_0x028CB2
                dc.w    Offset_0x028CDA-Offset_0x028CB2
Offset_0x028CB6:
                addq.b  #$02, $0024(A0)
                move.l  #MCz_Bridge_Mappings, $0004(A0)        ; Offset_0x028D88
                move.w  #$643C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$80, $0019(A0)
Offset_0x028CDA:
                tst.b   $0034(A0)
                bne.s   Offset_0x028D0E
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  $0028(A0), D0
                btst    #$00, $00(A2, D0)
                beq.s   Offset_0x028D0E
                move.b  #$01, $0034(A0)
                bchg    #00, $001C(A0)
                tst.b   $0001(A0)
                bpl.s   Offset_0x028D0E
                move.w  #Door_Sfx, D0           ; $00BB
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x028D0E:
                lea     (MCz_Bridge_Animate_Data), A1          ; Offset_0x028D74
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                tst.b   $001A(A0)
                bne.s   Offset_0x028D3C
                move.w  #$004B, D1
                move.w  #$0008, D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x028D3C:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x028D6E
                move.b  D0, D1
                andi.b  #$08, D0
                beq.s   Offset_0x028D58
                lea     ($FFFFB000).w, A1
                bclr    #$03, $0022(A1)
Offset_0x028D58:
                andi.b  #$10, D1
                beq.s   Offset_0x028D68
                lea     ($FFFFB040).w, A1
                bclr    #$03, $0022(A1)
Offset_0x028D68:
                andi.b  #$E7, $0022(A0)
Offset_0x028D6E:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
MCz_Bridge_Animate_Data: ; Offset_0x028D74:
                dc.w    Offset_0x028D78-MCz_Bridge_Animate_Data
                dc.w    Offset_0x028D80-MCz_Bridge_Animate_Data
Offset_0x028D78:
                dc.b    $03, $04, $03, $02, $01, $00, $FE, $01
Offset_0x028D80:
                dc.b    $03, $00, $01, $02, $03, $04, $FE, $01
;-------------------------------------------------------------------------------
MCz_Bridge_Mappings: ; Offset_0x028D88:
                dc.w    Offset_0x028D92-MCz_Bridge_Mappings
                dc.w    Offset_0x028DD4-MCz_Bridge_Mappings
                dc.w    Offset_0x028E16-MCz_Bridge_Mappings
                dc.w    Offset_0x028E58-MCz_Bridge_Mappings
                dc.w    Offset_0x028E9A-MCz_Bridge_Mappings
Offset_0x028D92:
                dc.w    $0008
                dc.l    $F8050000, $0000FFC0, $F8050000, $0000FFD0
                dc.l    $F8050000, $0000FFE0, $F8050000, $0000FFF0
                dc.l    $F8050000, $00000000, $F8050000, $00000010
                dc.l    $F8050000, $00000020, $F8050000, $00000030
Offset_0x028DD4:
                dc.w    $0008
                dc.l    $F8050000, $0000FFC0, $FE050000, $0000FFCE
                dc.l    $04050000, $0000FFDD, $0A050000, $0000FFEC
                dc.l    $0A050000, $00000004, $04050000, $00000013
                dc.l    $FE050000, $00000022, $F8050000, $00000030
Offset_0x028E16:
                dc.w    $0008
                dc.l    $F8050000, $0000FFC0, $03050000, $0000FFCB
                dc.l    $0E050000, $0000FFD6, $19050000, $0000FFE1
                dc.l    $19050000, $0000000F, $0E050000, $0000001A
                dc.l    $03050000, $00000025, $F8050000, $00000030
Offset_0x028E58:
                dc.w    $0008
                dc.l    $F8050000, $0000FFC0, $06050000, $0000FFC6
                dc.l    $15050000, $0000FFCC, $24050000, $0000FFD2
                dc.l    $24050000, $0000001E, $15050000, $00000024
                dc.l    $06050000, $0000002A, $F8050000, $00000030
Offset_0x028E9A:
                dc.w    $0008
                dc.l    $F8050000, $0000FFC0, $08050000, $0000FFC0
                dc.l    $18050000, $0000FFC0, $28050000, $0000FFC0
                dc.l    $F8050000, $00000030, $08050000, $00000030
                dc.l    $18050000, $00000030, $28050000, $00000030
;===============================================================================
; Objeto 0x77 - Pontes na Mystic Cave
; [ Término ]
;===============================================================================  