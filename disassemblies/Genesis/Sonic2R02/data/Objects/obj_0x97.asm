;===============================================================================
; Objeto 0x97 - Cabeça do inimigo Rexon na Hill Top (Inimigo tipo cobra que 
; [ Início ]    atira bolas de fogo no jogador)
;===============================================================================  
Offset_0x036E66:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036E74(PC, D0), D1
                jmp     Offset_0x036E74(PC, D1)
Offset_0x036E74:
                dc.w    Offset_0x036E7E-Offset_0x036E74
                dc.w    Offset_0x036EEA-Offset_0x036E74
                dc.w    Offset_0x036F20-Offset_0x036E74
                dc.w    Offset_0x036F60-Offset_0x036E74
                dc.w    Offset_0x036F94-Offset_0x036E74
Offset_0x036E7E:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$08, $0019(A0)
                moveq   #$28, D0
                btst    #$00, $0001(A0)
                bne.s   Offset_0x036E94
                moveq   #$FFFFFFE8, D0
Offset_0x036E94:
                add.w   D0, $0008(A0)
                addi.w  #$0010, $000C(A0)
                move.b  #$01, $0038(A0)
                move.w  $002C(A0), A1
                lea     $002E(A1), A1
                move.b  #$0B, $0020(A0)
                moveq   #$00, D0
                move.w  $002E(A0), D0
                cmpi.w  #$0008, D0
                beq.s   Offset_0x036ED0
                move.b  #$01, $001A(A0)
                move.b  #$8B, $0020(A0)
                move.w  $00(A1, D0), $0030(A0)
Offset_0x036ED0:
                move.w  $0006(A1), $0032(A0)
                lsr.w   #$01, D0
                move.b  Offset_0x036EE4(PC, D0), $002A(A0)
                move.b  D0, $0039(A0)
                rts
Offset_0x036EE4:
                dc.b    $1E, $18, $12, $0C, $06, $00
Offset_0x036EEA:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x036EFA
                bsr     Offset_0x036FB0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036EFA:
                addq.b  #$02, $0024(A0)
                move.w  #$FEE0, $0010(A0)
                move.w  #$FE00, $0012(A0)
                move.w  $002E(A0), D0
                subq.w  #$08, D0
                neg.w   D0
                lsr.w   #$01, D0
                move.b  Offset_0x036EE4(PC, D0), $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036F20:
                moveq   #$10, D0
                add.w   D0, $0010(A0)
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x036F3C
                bsr     Offset_0x036FB0
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036F3C:
                addq.b  #$02, $0024(A0)
                bsr     Offset_0x03617A
                move.b  #$20, $002A(A0)
                move.w  $002E(A0), D0
                lsr.w   #$01, D0
                move.b  Offset_0x036F5C(PC, D0), $002B(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036F5C:
                dc.b    $24, $20, $1C, $1A
Offset_0x036F60:
                bsr     Offset_0x036FB0
                cmpi.w  #$0008, $002E(A0)
                bne.s   Offset_0x036F76
                subq.b  #$01, $002A(A0)
                bpl.s   Offset_0x036F76
                bsr     Offset_0x036FD6
Offset_0x036F76:
                move.b  $0039(A0), D0
                addq.b  #$01, D0
                move.b  D0, $0039(A0)
                andi.b  #$03, D0
                bne.s   Offset_0x036F8E
                bsr     Offset_0x037030
                bsr     Offset_0x0370AC
Offset_0x036F8E:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036F94:
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                bcs     J_DeleteObject_01                      ; Offset_0x036344
                jsr     (ObjectFall)                           ; Offset_0x016306
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036FB0:
                move.w  $0032(A0), A1
                cmpi.b  #$97, (A1)
                beq.s   Offset_0x036FCA
                move.b  #$08, $0024(A0)
                move.w  $002E(A0), D0
                move.w  Offset_0x036FCC(PC, D0), $0010(A0)
Offset_0x036FCA:
                rts
Offset_0x036FCC:
                dc.w    $0080, $FF00, $0100, $FF80, $0080
Offset_0x036FD6:
                move.b  #$7F, $002A(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03702E
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Armas dos inimigos
                move.b  #$03, $001A(A1)
                move.b  #$10, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                lea     (SpeedToPos), A2                       ; Offset_0x016332
                move.l  A2, $002A(A1)
                moveq   #$01, D0
                moveq   #$10, D1
                btst    #$00, $0001(A0)
                bne.s   Offset_0x03701C
                neg.w   D0
                neg.w   D1
Offset_0x03701C:
                move.b  D0, $0010(A1)
                add.w   D1, $0008(A1)
                addq.w  #$04, $000C(A1)
                move.b  #$80, $0013(A1)
Offset_0x03702E:
                rts
Offset_0x037030:
                move.b  $002B(A0), D0
                move.b  $0038(A0), D1
                add.b   D1, D0
                move.b  D0, $002B(A0)
                subi.b  #$18, D0
                beq.s   Offset_0x03704C
                bcs.s   Offset_0x03704C
                cmpi.b  #$10, D0
                bcs.s   Offset_0x037050
Offset_0x03704C:
                neg.b   $0038(A0)
Offset_0x037050:
                rts
;-------------------------------------------------------------------------------
Load_Rexon_Head_Obj: ; Offset_0x037052:                
                move.b  #$06, $0024(A0)
                bclr    #$00, $0001(A0)
                tst.w   D0
                beq.s   Offset_0x037068
                bset    #$00, $0001(A0)
Offset_0x037068:
                bsr     Offset_0x03617A
                lea     $002C(A0), A2
                moveq   #$00, D1
                moveq   #$04, D6
Offset_0x037074:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x0370AA
                move.b  #$97, $0000(A1) ; Carrega o objeto 0x97 - Cabeça do Rexon
                move.b  $0001(A0), $0001(A1)
                move.b  $0028(A0), $0028(A1)
                move.w  A0, $002C(A1)
                move.w  A1, (A2)+
                move.w  D1, $002E(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addq.w  #$02, D1
                dbra    D6, Offset_0x037074
Offset_0x0370AA:
                rts
;-------------------------------------------------------------------------------                
Offset_0x0370AC:
                move.w  $0030(A0), D0
                beq.s   Offset_0x0370F8
                move.w  D0, A1
                lea     Offset_0x037150(PC), A2
                moveq   #$00, D0
                move.b  $002B(A0), D0
                andi.b  #$7F, D0
                move.w  D0, D1
                andi.w  #$001F, D0
                add.w   D0, D0
                move.b  $00(A2, D0), D2
                ext.w   D2
                move.b  $01(A2, D0), D3
                ext.w   D3
                lsr.w   #$04, D1
                andi.w  #$0006, D1
                move.w  Offset_0x0370FA(PC, D1), D1
                jsr     Offset_0x0370FA(PC, D1)
                move.w  $0008(A0), D4
                add.w   D2, D4
                move.w  D4, $0008(A1)
                move.b  $000D(A0), D5
                add.b   D3, D5
                move.b  D5, $000D(A1)
Offset_0x0370F8:
                rts
Offset_0x0370FA:
                dc.w    Offset_0x037102-Offset_0x0370FA
                dc.w    Offset_0x037104-Offset_0x0370FA
                dc.w    Offset_0x03710A-Offset_0x0370FA
                dc.w    Offset_0x037110-Offset_0x0370FA
Offset_0x037102:
                rts
Offset_0x037104:
                exg.l   D3, D2
                neg.w   D3
                rts
Offset_0x03710A:
                neg.w   D2
                neg.w   D3
                rts
Offset_0x037110:
                exg.l   D3, D2
                neg.w   D2
                rts      
;-------------------------------------------------------------------------------
Obj_0x96_Ptr: ; Offset_0x037116:
                dc.l    Rexon_Mappings                         ; Offset_0x037120
                dc.w    $637E
                dc.b    $04, $04, $10, $00                    
;-------------------------------------------------------------------------------  
Rexon_Mappings: ; Offset_0x037120:
                dc.w    Offset_0x037128-Rexon_Mappings
                dc.w    Offset_0x037132-Rexon_Mappings
                dc.w    Offset_0x03713C-Rexon_Mappings
                dc.w    Offset_0x037146-Rexon_Mappings
Offset_0x037128:
                dc.w    $0001
                dc.l    $FA090000, $0000FFEC
Offset_0x037132:
                dc.w    $0001
                dc.l    $F8050006, $0003FFF8
Offset_0x03713C:
                dc.w    $0001
                dc.l    $F80D000A, $0005FFF0
Offset_0x037146:
                dc.w    $0001
                dc.l    $FC000012, $0009FFFC
;-------------------------------------------------------------------------------
Offset_0x037150:
                dc.b    $0F, $00, $0F, $FF, $0F, $FF, $0F, $FE, $0F, $FD, $0F, $FC, $0E, $FC, $0E, $FB
                dc.b    $0E, $FA, $0E, $FA, $0D, $F9, $0D, $F8, $0C, $F8, $0C, $F7, $0C, $F6, $0B, $F6
                dc.b    $0B, $F5, $0A, $F5, $0A, $F4, $09, $F4, $08, $F4, $08, $F3, $07, $F3, $06, $F2
                dc.b    $06, $F2, $05, $F2, $04, $F2, $04, $F1, $03, $F1, $02, $F1, $01, $F1, $01, $F1                                                                                                                                                                                                                                                                                                 
;===============================================================================
; Objeto 0x97 - Cabeça do inimigo Rexon na Hill Top (Inimigo tipo cobra que
; [ Término ]   atira bolas de fogo no jogador)
;===============================================================================