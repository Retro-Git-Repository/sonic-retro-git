;===============================================================================
; Objeto 0x60 - Anéis no Special Stage
; [ Início ]
;===============================================================================   
Offset_0x0349E8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0349F6(PC, D0), D1
                jmp     Offset_0x0349F6(PC, D1)
Offset_0x0349F6:
                dc.w    Offset_0x0349FE-Offset_0x0349F6
                dc.w    Offset_0x034A38-Offset_0x0349F6
                dc.w    Offset_0x034D8C-Offset_0x0349F6
                dc.w    Offset_0x034A58-Offset_0x0349F6
Offset_0x0349FE:
                addq.b  #$02, $0024(A0)
                move.w  #$007F, $0008(A0)
                move.w  #$0058, $000C(A0)
                move.l  #SS_Rings_Mappings, $0004(A0)          ; Offset_0x035D78
                move.w  #$6322, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$01, $0020(A0)
                tst.b   $0026(A0)
                bmi.s   Offset_0x034A38
                bsr     Offset_0x034CEC
Offset_0x034A38:
                bsr     Offset_0x034B74
                bsr     Offset_0x034BEC
                bsr     Offset_0x034A80
                lea     (SS_Rings_AnimateData), A1             ; Offset_0x035D20
                bsr     SS_AnimateSprite                       ; Offset_0x034DF0
                tst.b   $0001(A0)
                bmi     J_DisplaySprite_01                     ; Offset_0x036014
                rts
Offset_0x034A58:
                move.b  #$0A, $001C(A0)
                move.w  #$477F, $0002(A0)
                bsr     Offset_0x0349D8
                bsr     Offset_0x034B74
                bsr     Offset_0x034BEC
                lea     (SS_Rings_AnimateData), A1             ; Offset_0x035D20
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     J_DisplaySprite_01                     ; Offset_0x036014
Offset_0x034A80:
                move.w  #$000A, D6
                bsr     Offset_0x034AEA
                bcc.s   Offset_0x034AE8
                cmpa.l  #$FFFFB000, A1
                bne.s   Offset_0x034A98
                addq.w  #$01, ($FFFFFE20).w
                bra.s   Offset_0x034A9C
Offset_0x034A98:
                addq.w  #$01, ($FFFFFED0).w
Offset_0x034A9C:
                addq.b  #$01, $003E(A1)
                cmpi.b  #$0A, $003E(A1)
                blt.s   Offset_0x034AC4
                addq.b  #$01, $003D(A1)
                move.b  #$00, $003E(A1)
                cmpi.b  #$0A, $003D(A1)
                blt.s   Offset_0x034AC4
                addq.b  #$01, $003C(A1)
                move.b  #$00, $003D(A1)
Offset_0x034AC4:
                move.b  #$06, $0024(A0)
                move.l  $0034(A0), D0
                beq.s   Offset_0x034ADE
                move.l  #$00000000, $0034(A0)
                move.l  D0, A1
                st      $002A(A1)
Offset_0x034ADE:
                move.w  #Ring_Sfx, D0           ; $00B5
                jsr     (Play_Sfx_Stereo)                      ; Offset_0x001332
Offset_0x034AE8:
                rts
Offset_0x034AEA:
                cmpi.b  #$08, $001C(A0)
                bne.s   Offset_0x034B26
                tst.b   $0020(A0)
                beq.s   Offset_0x034B26
                lea     ($FFFFB000).w, A2
                lea     ($FFFFB040).w, A3
                move.w  $0034(A2), D0
                cmp.w   $0034(A3), D0
                bcs.s   Offset_0x034B18
                move.l  A3, A1
                bsr     Offset_0x034B2C
                bcs.s   Offset_0x034B2A
                move.l  A2, A1
                bra     Offset_0x034B2C
Offset_0x034B18:
                move.l  A2, A1
                bsr     Offset_0x034B2C
                bcs.s   Offset_0x034B2A
                move.l  A3, A1
                bra     Offset_0x034B2C
Offset_0x034B26:
                move    #$0000, CCR
Offset_0x034B2A:
                rts
Offset_0x034B2C:
                tst.b   (A1)
                beq.s   Offset_0x034B64
                cmpi.b  #$02, $0024(A1)
                bne.s   Offset_0x034B64
                tst.b   $0025(A1)
                bne.s   Offset_0x034B64
                move.b  $0026(A1), D0
                move.b  $0026(A0), D1
                move.b  D1, D2
                add.b   D6, D1
                bcs.s   Offset_0x034B5A
                sub.b   D6, D2
                bcs.s   Offset_0x034B5C
                cmp.b   D1, D0
                bcc.s   Offset_0x034B64
                cmp.b   D2, D0
                bcc.s   Offset_0x034B6A
                bra.s   Offset_0x034B64
Offset_0x034B5A:
                sub.b   D6, D2
Offset_0x034B5C:
                cmp.b   D1, D0
                bcs.s   Offset_0x034B6A
                cmp.b   D2, D0
                bcc.s   Offset_0x034B6A
Offset_0x034B64:
                move    #$0000, CCR
                rts
Offset_0x034B6A:
                clr.b   $0020(A0)
                move    #$0001, CCR
                rts
Offset_0x034B74:
                btst    #$07, $0022(A0)
                bne.s   Offset_0x034BB6
                cmpi.b  #$04, ($FFFFDB0D).w
                bne.s   Offset_0x034B90
                subi.l  #$0000CCCC, $0030(A0)
                ble.s   Offset_0x034BB6
                bra.s   Offset_0x034B9A
Offset_0x034B90:
                subi.l  #$0000CCCD, $0030(A0)
                ble.s   Offset_0x034BB6
Offset_0x034B9A:
                cmpi.b  #$0A, $001C(A0)
                beq.s   Offset_0x034BB4
                move.w  $0030(A0), D0
                cmpi.w  #$001D, D0
                ble.s   Offset_0x034BAE
                moveq   #$1E, D0
Offset_0x034BAE:
                move.b  Offset_0x034BCC(PC, D0), $001C(A0)
Offset_0x034BB4:
                rts
Offset_0x034BB6:
                move.l  (A7)+, D0
                move.l  $0034(A0), D0
                beq     Offset_0x034BC6
                move.l  D0, A1
                st      $002A(A1)
Offset_0x034BC6:
                jmp     (DeleteObject)                         ; Offset_0x01646C   
;-------------------------------------------------------------------------------                
Offset_0x034BCC:
                dc.b    $09, $09, $09, $08, $08, $07, $07, $06, $06, $05, $05, $04, $04, $03, $03, $03
                dc.b    $02, $02, $02, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $01, $00, $00   
;-------------------------------------------------------------------------------
Offset_0x034BEC:
                move.w  D7, -(A7)
                moveq   #$00, D2
                moveq   #$00, D3
                moveq   #$00, D4
                moveq   #$00, D5
                moveq   #$00, D6
                moveq   #$00, D7
                move.l  ($FFFFDB82).w, A1
                move.w  $0030(A0), D0
                beq     Offset_0x034CA8
                cmp.w   (A1)+, D0
                bgt     Offset_0x034CA8
                subq.w  #$01, D0
                add.w   D0, D0
                move.w  D0, D1
                add.w   D0, D0
                add.w   D1, D0
                tst.b   ($FFFFDB0E).w
                bne     Offset_0x034CB0
                move.b  $04(A1, D0), D6
                move.b  $05(A1, D0), D7
                beq.s   Offset_0x034C34
                move.b  $0026(A0), D1
                cmp.b   D6, D1
                bcs.s   Offset_0x034C34
                cmp.b   D7, D1
                bcs.s   Offset_0x034CA8
Offset_0x034C34:
                move.b  $00(A1, D0), D2
                move.b  $02(A1, D0), D4
                move.b  $03(A1, D0), D5
                move.b  $01(A1, D0), D3
Offset_0x034C44:
                bpl.s   Offset_0x034C4E
                cmpi.b  #$48, D3
                bcs.s   Offset_0x034C4E
                ext.w   D3
Offset_0x034C4E:
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  D4, D1
                muls.w  D5, D0
                asr.l   #$08, D0
                asr.l   #$08, D1
                add.w   D2, D1
                add.w   D3, D0
                move.w  D1, $0008(A0)
                move.w  D0, $000C(A0)
                move.l  $0034(A0), D0
                beq.s   Offset_0x034C9E
                move.l  D0, A1
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  D4, D7
                lsr.w   #$02, D7
                add.w   D7, D4
                muls.w  D4, D1
                move.w  D5, D7
                asr.w   #$02, D7
                add.w   D7, D5
                muls.w  D5, D0
                asr.l   #$08, D0
                asr.l   #$08, D1
                add.w   D2, D1
                add.w   D3, D0
                move.w  D1, $0008(A1)
                move.w  D0, $000C(A1)
Offset_0x034C9E:
                ori.b   #$80, $0001(A0)
Offset_0x034CA4:
                move.w  (A7)+, D7
                rts
Offset_0x034CA8:
                andi.b  #$7F, $0001(A0)
                bra.s   Offset_0x034CA4
Offset_0x034CB0:
                move.b  #$80, D1
                move.b  $04(A1, D0), D6
                move.b  $05(A1, D0), D7
                beq.s   Offset_0x034CD2
                sub.w   D1, D6
                sub.w   D1, D7
                neg.w   D6
                neg.w   D7
                move.b  $0026(A0), D1
                cmp.b   D7, D1
                bcs.s   Offset_0x034CD2
                cmp.b   D6, D1
                bcs.s   Offset_0x034CA8
Offset_0x034CD2:
                move.b  $00(A1, D0), D2
                move.b  $02(A1, D0), D4
                move.b  $03(A1, D0), D5
                subi.w  #$0100, D2
                neg.w   D2
                move.b  $01(A1, D0), D3
                bra     Offset_0x034C44
Offset_0x034CEC:
                jsr     (Obj_0x60_Offset_0x006F46)             ; Offset_0x006F46
                bne     Offset_0x034D7E
                move.l  A0, $0034(A1)
                move.b  (A0), (A1)
                move.b  #$04, $0024(A1)
                move.l  #SS_Objects_Shadow_Mappings, $0004(A1) ; Offset_0x033EEA
                move.w  #$623C, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$05, $0018(A1)
                move.b  $0026(A0), D0
                cmpi.b  #$10, D0
                bgt.s   Offset_0x034D38
                bset    #$00, $0001(A1)
                move.b  #$02, $002B(A1)
                move.l  A1, $0034(A0)
                rts
Offset_0x034D38:
                cmpi.b  #$30, D0
                bgt.s   Offset_0x034D50
                bset    #$00, $0001(A1)
                move.b  #$01, $002B(A1)
                move.l  A1, $0034(A0)
                rts
Offset_0x034D50:
                cmpi.b  #$50, D0
                bgt.s   Offset_0x034D62
                move.b  #$00, $002B(A1)
                move.l  A1, $0034(A0)
                rts
Offset_0x034D62:
                cmpi.b  #$70, D0
                bgt.s   Offset_0x034D74
                move.b  #$01, $002B(A1)
                move.l  A1, $0034(A0)
                rts
Offset_0x034D74:
                move.b  #$02, $002B(A1)
                move.l  A1, $0034(A0)
Offset_0x034D7E:
                rts                 
;-------------------------------------------------------------------------------
Offset_0x034D80:
                dc.w    $0000, $0018, $0014, $0014, $0014, $0000
;-------------------------------------------------------------------------------
Offset_0x034D8C:
                tst.b   $002A(A0)
                bne     Offset_0x034DEA
                move.l  $0034(A0), A1
                tst.b   $0001(A1)
                bmi.s   Offset_0x034DA0
                rts
Offset_0x034DA0:
                moveq   #$09, D0
                sub.b   $001C(A1), D0
                addq.b  #$01, D0
                cmpi.b  #$0A, D0
                bne.s   Offset_0x034DB2
                move.w  #$0009, D0
Offset_0x034DB2:
                move.w  D0, D1
                add.w   D0, D0
                add.w   D1, D0
                moveq   #$00, D1
                move.b  $002B(A0), D1
                beq.s   Offset_0x034DDA
                cmpi.b  #$01, D1
                beq.s   Offset_0x034DD0
                add.w   D1, D0
                move.w  #$629C, $0002(A0)
                bra.s   Offset_0x034DE2
Offset_0x034DD0:
                add.w   D1, D0
                move.w  #$6262, $0002(A0)
                bra.s   Offset_0x034DE2
Offset_0x034DDA:
                add.w   D1, D0
                move.w  #$623C, $0002(A0)
Offset_0x034DE2:
                move.b  D0, $001A(A0)
                bra     J_DisplaySprite_01                     ; Offset_0x036014
Offset_0x034DEA:
                jmp     (DeleteObject)                         ; Offset_0x01646C  
;-------------------------------------------------------------------------------    
SS_AnimateSprite: ; Offset_0x034DF0:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x034E3A
                moveq   #$00, D0
                move.b  $001C(A0), D0
                add.w   D0, D0
                adda.w  $00(A1, D0), A1
                move.b  (A1), $001E(A0)
                moveq   #$00, D1
                move.b  $001B(A0), D1
                move.b  $01(A1, D1), D0
                bpl.s   Offset_0x034E1C
                move.b  #$00, $001B(A0)
                move.b  $0001(A1), D0
Offset_0x034E1C:
                andi.b  #$7F, D0
                move.b  D0, $001A(A0)
                move.b  $0022(A0), D1
                andi.b  #$03, D1
                andi.b  #$FC, $0001(A0)
                or.b    D1, $0001(A0)
                addq.b  #$01, $001B(A0)
Offset_0x034E3A:
                rts                                      
;-------------------------------------------------------------------------------
Offset_0x034E3C:
                dc.b    $38, $48, $2A, $56, $1C, $64, $0E, $72, $00, $80
Offset_0x034E46:
                dc.b    $40, $30, $50, $20, $60, $10, $70, $00, $80, $00                              
;===============================================================================
; Objeto 0x60 - Anéis no Special Stage
; [ Término ]
;===============================================================================  