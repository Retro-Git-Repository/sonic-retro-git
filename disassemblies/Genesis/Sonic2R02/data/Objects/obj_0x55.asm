;===============================================================================
; Objeto 0x55 - Robotnik na Oil Ocean
; [ Início ]
;===============================================================================  
Offset_0x032A1E:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x032A2C(PC, D0), D1
                jmp     Offset_0x032A2C(PC, D1)
Offset_0x032A2C:
                dc.w    Offset_0x032A36-Offset_0x032A2C
                dc.w    Offset_0x032A74-Offset_0x032A2C
                dc.w    Offset_0x032CA2-Offset_0x032A2C
                dc.w    Offset_0x032EEC-Offset_0x032A2C
                dc.w    Offset_0x033006-Offset_0x032A2C
Offset_0x032A36:
                move.l  #OOz_Boss_Mappings, $0004(A0)          ; Offset_0x033202   
                move.w  #$038C, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                bset    #$06, $0001(A0)
                move.b  #$00, $000F(A0)
                addq.b  #$02, $000A(A0)
                move.b  #$0F, $0020(A0)
                move.b  #$08, $0032(A0)
                move.b  #$40, $000E(A0)
                rts
Offset_0x032A74:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x032A82(PC, D0), D1
                jmp     Offset_0x032A82(PC, D1)
Offset_0x032A82:
                dc.w    Offset_0x032A8C-Offset_0x032A82
                dc.w    Offset_0x032B06-Offset_0x032A82
                dc.w    Offset_0x032B48-Offset_0x032A82
                dc.w    Offset_0x032B90-Offset_0x032A82
                dc.w    Offset_0x032C34-Offset_0x032A82
Offset_0x032A8C:
                move.w  #$2940, ($FFFFF750).w
                bclr    #$00, $0001(A0)
                move.w  ($FFFFB008).w, D1
                cmpi.w  #$293A, D1
                bcc.s   Offset_0x032AA8
                bchg    #00, $0001(A0)
Offset_0x032AA8:
                move.w  #$02D0, $000C(A0)
                move.w  #$02D0, ($FFFFF754).w
                move.b  #$08, $000B(A0)
                move.b  #$01, $000F(A0)
                addq.b  #$02, $0026(A0)
                move.w  #$FF80, ($FFFFF75A).w
                move.b  #$0F, $0020(A0)
                move.w  $0008(A0), $0010(A0)
                move.w  $000C(A0), $0012(A0)
                clr.b   $001A(A0)
                clr.b   $002A(A0)
                move.b  #$08, $0015(A0)
                lea     ($FFFFF740).w, A2
                move.b  #$05, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)
                move.b  #$00, ($FFFFF73F).w
                rts
Offset_0x032B06:
                bsr     Boss_Sub                               ; Offset_0x02D192
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x032B76
                cmpi.w  #$0290, ($FFFFF754).w
                bcc     Offset_0x032BEA
                move.w  #$0290, ($FFFFF754).w
                addq.b  #$02, $0026(A0)
                move.w  #$00A8, ($FFFFF75C).w
                btst    #$07, $002A(A0)
                bne     Offset_0x032BEA
                lea     ($FFFFF740).w, A2
                move.b  #$10, (A2)+
                move.b  #$00, (A2)
                bra     Offset_0x032BEA
Offset_0x032B48:
                btst    #$07, $002A(A0)
                bne.s   Offset_0x032B68
                bsr     Offset_0x032B76
                subq.w  #$01, ($FFFFF75C).w
                bpl     Offset_0x032BEA
                lea     ($FFFFF740).w, A2
                move.b  #$05, (A2)+
                move.b  #$00, (A2)
Offset_0x032B68:
                addq.b  #$02, $0026(A0)
                move.w  #$FFC0, ($FFFFF75A).w
                bra     Offset_0x032BEA
Offset_0x032B76:
                move.b  $001A(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$07, D1
                add.w   ($FFFFF754).w, D1
                move.w  D1, $000C(A0)
                addq.b  #$04, $001A(A0)
                rts
Offset_0x032B90:
                bsr     Boss_Sub                               ; Offset_0x02D192
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                btst    #$06, $002A(A0)
                bne.s   Offset_0x032BC8
                cmpi.w  #$028C, ($FFFFF754).w
                bcc     Offset_0x032BEA
                move.w  #$028C, ($FFFFF754).w
                move.w  #$0080, ($FFFFF75A).w
                ori.b   #$40, $002A(A0)
                bra     Offset_0x032BEA
Offset_0x032BC8:
                cmpi.w  #$02D0, ($FFFFF754).w
                bcs.s   Offset_0x032BEA
                move.w  #$02D0, ($FFFFF754).w
                clr.b   $0026(A0)
                addq.b  #$02, $000A(A0)
                btst    #$07, $002A(A0)
                beq.s   Offset_0x032BEA
                addq.b  #$02, $000A(A0)
Offset_0x032BEA:
                bsr     Offset_0x032C02
                lea     (OOz_Boss_Animate_Data), A1            ; Offset_0x0331BA
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x032C22
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032C02:
                bsr     Boss_Hit                               ; Offset_0x02D12C
                cmpi.b  #$1F, $0014(A0)
                bne.s   Offset_0x032C20
                lea     ($FFFFF740).w, A1
                andi.b  #$F0, (A1)
                ori.b   #$03, (A1)
                ori.b   #$80, $002A(A0)
Offset_0x032C20:
                rts
Offset_0x032C22:
                move.w  $0008(A0), D0
                move.w  $000C(A0), D1
                move.w  D0, $0010(A0)
                move.w  D1, $0012(A0)
                rts
Offset_0x032C34:
                clr.w   ($FFFFFB22).w
                subq.w  #$01, ($FFFFF75C).w
                bmi.s   Offset_0x032C5C
                cmpi.w  #$001E, ($FFFFF75C).w
                bcc.s   Offset_0x032C52
                move.b  #$0B, $000B(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032C52:
                bsr     Boss_Defeated                          ; Offset_0x02D278
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032C5C:
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x032C74
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
                move.b  #$01, ($FFFFF7A7).w
Offset_0x032C74:
                cmpi.w  #$2A20, ($FFFFEECA).w
                bcc.s   Offset_0x032C82
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x032C90
Offset_0x032C82:
                move.w  #$2A20, ($FFFFEECA).w
                cmpi.w  #$02D0, $000C(A0)
                bcc.s   Offset_0x032C9C
Offset_0x032C90:
                addq.w  #$01, $000C(A0)
                bsr.s   Offset_0x032C22
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032C9C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x032CA2:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x032CB0(PC, D0), D1
                jmp     Offset_0x032CB0(PC, D1)
Offset_0x032CB0:
                dc.w    Offset_0x032CBA-Offset_0x032CB0
                dc.w    Offset_0x032D2E-Offset_0x032CB0
                dc.w    Offset_0x032D5C-Offset_0x032CB0
                dc.w    Offset_0x032DB8-Offset_0x032CB0
                dc.w    Offset_0x032E20-Offset_0x032CB0
Offset_0x032CBA:
                clr.w   ($FFFFFB22).w
                move.w  #$2940, ($FFFFF750).w
                bclr    #$00, $0001(A0)
                move.w  ($FFFFB008).w, D1
                cmpi.w  #$293A, D1
                bcs.s   Offset_0x032CDA
                bchg    #00, $0001(A0)
Offset_0x032CDA:
                move.w  #$02B0, ($FFFFF754).w
                move.w  #$02B0, $000C(A0)
                move.b  #$02, $0026(A0)
                move.b  #$8A, $0020(A0)
                move.b  #$05, $000B(A0)
                moveq   #$07, D0
                moveq   #$07, D2
                moveq   #$00, D4
                move.w  ($FFFFF754).w, D5
Offset_0x032D02:
                addi.w  #$000F, D5
                move.b  D0, $15(A0, D4)
                move.w  D5, $12(A0, D4)
                addq.w  #$06, D4
                dbra    D2, Offset_0x032D02
                move.b  #$08, $000F(A0)
                move.w  #$FF80, ($FFFFF75A).w
                move.b  #$00, $003E(A0)
                move.b  #$01, ($FFFFF73F).w
                rts
Offset_0x032D2E:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$0240, ($FFFFF754).w
                bcc     Offset_0x032E52
                move.w  #$0240, ($FFFFF754).w
                move.w  #$0000, ($FFFFF75A).w
                addq.b  #$02, $0026(A0)
                move.w  #$0080, ($FFFFF75C).w
                move.b  #$03, $0038(A0)
                bra     Offset_0x032E52
Offset_0x032D5C:
                subq.b  #$01, $002C(A0)
                bne.s   Offset_0x032D68
                move.b  #$05, $000B(A0)
Offset_0x032D68:
                subq.w  #$01, ($FFFFF75C).w
                bne     Offset_0x032E52
                subq.b  #$01, $0038(A0)
                bmi.s   Offset_0x032DA0
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
Offset_0x032D7C:
                addq.b  #$01, D0
                andi.w  #$0003, D0
                btst    D0, $003E(A0)
                bne.s   Offset_0x032D7C
                bset    D0, $003E(A0)
                add.w   D0, D0
                move.w  Offset_0x032DB0(PC, D0), ($FFFFF75C).w
                addq.b  #$02, $0026(A0)
                bsr     Offset_0x032E60
                bra     Offset_0x032E52
Offset_0x032DA0:
                move.w  #$0080, ($FFFFF75A).w
                move.b  #$08, $0026(A0)
                bra     Offset_0x032E52
Offset_0x032DB0:
                dc.w    $0238, $0230, $0240, $025F
Offset_0x032DB8:
                bsr     Boss_Sub                               ; Offset_0x02D192
                move.w  ($FFFFF75C).w, D0
                tst.w   ($FFFFF75A).w
                bmi.s   Offset_0x032DD0
                cmp.w   ($FFFFF754).w, D0
                bcs.s   Offset_0x032DD6
                bra     Offset_0x032E52
Offset_0x032DD0:
                cmp.w   ($FFFFF754).w, D0
                bcs.s   Offset_0x032E52
Offset_0x032DD6:
                move.w  #$0000, ($FFFFF75A).w
                move.b  #$08, $002C(A0)
                move.b  #$06, $000B(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x032E52
                move.b  #$55, (A1)         ; Nova instância do objeto na memória
                move.b  #$08, $000A(A1)
                move.l  A0, $0034(A1)
                move.b  #$EA, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.b  #$04, $0026(A0)
                move.w  #$0028, ($FFFFF75C).w
                move.w  #$FF80, ($FFFFF75A).w
                bra     Offset_0x032E52
Offset_0x032E20:
                subq.b  #$01, $002C(A0)
                bne.s   Offset_0x032E2C
                move.b  #$05, $000B(A0)
Offset_0x032E2C:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$02B0, ($FFFFF754).w
                bcs.s   Offset_0x032E52
                move.w  #$02B0, ($FFFFF754).w
                move.w  #$0000, ($FFFFF75A).w
                move.b  #$00, $0026(A0)
                move.b  #$02, $000A(A0)
                rts
Offset_0x032E52:
                bsr     Offset_0x032E7A
                bsr     Offset_0x032E9C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032E60:
                move.w  ($FFFFF75C).w, D0
                sub.w   ($FFFFF754).w, D0
                bpl.s   Offset_0x032E72
                move.w  #$FF80, ($FFFFF75A).w
                rts
Offset_0x032E72:
                move.w  #$0080, ($FFFFF75A).w
                rts
Offset_0x032E7A:
                move.w  ($FFFFB008).w, D0
                sub.w   $0008(A0), D0
                blt.s   Offset_0x032E90
                subq.w  #$08, D0
                blt.s   Offset_0x032E8E
                bset    #$00, $0001(A0)
Offset_0x032E8E:
                rts
Offset_0x032E90:
                addq.w  #$08, D0
                bgt.s   Offset_0x032E8E
                bclr    #$00, $0001(A0)
                rts
Offset_0x032E9C:
                move.w  ($FFFFF750).w, D5
                move.w  ($FFFFF754).w, D6
                move.b  $001A(A0), D3
                move.b  D3, D0
                bsr     Offset_0x032EDA
                move.w  D1, $0008(A0)
                move.w  D0, $000C(A0)
                addq.b  #$02, $001A(A0)
                moveq   #$07, D2
                moveq   #$00, D4
Offset_0x032EBE:
                addi.w  #$000F, D6
                subi.b  #$10, D3
                bsr     Offset_0x032EDA
                move.w  D1, $10(A0, D4)
                move.w  D0, $12(A0, D4)
                addq.w  #$06, D4
                dbra    D2, Offset_0x032EBE
                rts
Offset_0x032EDA:
                move.b  D3, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$04, D1
                add.w   D5, D1
                asr.w   #$06, D0
                add.w   D6, D0
                rts
Offset_0x032EEC:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x032EFA(PC, D0), D1
                jmp     Offset_0x032EFA(PC, D1)
Offset_0x032EFA:
                dc.w    Offset_0x032EFE-Offset_0x032EFA
                dc.w    Offset_0x032F62-Offset_0x032EFA
Offset_0x032EFE:
                clr.w   ($FFFFFB22).w
                move.w  #$28C0, ($FFFFF750).w
                bclr    #$00, $0001(A0)
                move.w  ($FFFFB008).w, D1
                cmpi.w  #$293A, D1
                bcs.s   Offset_0x032F24
                move.w  #$29C0, ($FFFFF750).w
                bset    #$00, $0001(A0)
Offset_0x032F24:
                move.w  #$02A0, ($FFFFF754).w
                move.b  #$02, $000B(A0)
                move.b  #$8A, $0020(A0)
                addq.b  #$02, $0026(A0)
                move.b  #$80, $000E(A0)
                clr.b   $001A(A0)
                moveq   #$07, D0
                moveq   #$07, D1
                moveq   #$00, D2
Offset_0x032F4A:
                move.b  D1, $15(A0, D2)
                addq.w  #$06, D2
                dbra    D0, Offset_0x032F4A
                move.b  #$08, $000F(A0)
                move.b  #$02, ($FFFFF73F).w
                rts
Offset_0x032F62:
                bsr     Offset_0x032F86
                cmpi.b  #$FE, $001A(A0)
                bcs.s   Offset_0x032F7C
                move.b  #$00, $0026(A0)
                move.b  #$04, $000A(A0)
                rts
Offset_0x032F7C:
                bsr     Offset_0x032FE2
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032F86:
                move.b  $001A(A0), D0
                addi.b  #$40, D0
                move.b  D0, D3
                bsr     Offset_0x032FBA
                move.w  D1, $0008(A0)
                move.w  D0, $000C(A0)
                addq.b  #$01, $001A(A0)
                moveq   #$07, D2
                moveq   #$00, D4
Offset_0x032FA4:
                subq.b  #$06, D3
                bsr     Offset_0x032FBA
                move.w  D1, $10(A0, D4)
                move.w  D0, $12(A0, D4)
                addq.w  #$06, D4
                dbra    D2, Offset_0x032FA4
                rts
Offset_0x032FBA:
                move.b  D3, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0068, D1
                asr.l   #$08, D1
                btst    #$00, $0001(A0)
                bne.s   Offset_0x032FD2
                neg.w   D1
Offset_0x032FD2:
                add.w   ($FFFFF750).w, D1
                muls.w  #$0068, D0
                asr.l   #$08, D0
                add.w   ($FFFFF754).w, D0
                rts
Offset_0x032FE2:
                move.b  $001A(A0), D0
                moveq   #$15, D1
                cmpi.b  #$52, D0
                bcs.s   Offset_0x033000
                moveq   #$03, D1
                cmpi.b  #$6B, D0
                bcs.s   Offset_0x033000
                moveq   #$02, D1
                cmpi.b  #$92, D0
                bcs.s   Offset_0x033000
                moveq   #$04, D1
Offset_0x033000:
                move.b  D1, $000B(A0)
                rts
Offset_0x033006:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x033014(PC, D0), D0
                jmp     Offset_0x033014(PC, D0)
Offset_0x033014:
                dc.w    Offset_0x03301C-Offset_0x033014
                dc.w    Offset_0x033074-Offset_0x033014
                dc.w    Offset_0x033152-Offset_0x033014
                dc.w    Offset_0x0331B6-Offset_0x033014
Offset_0x03301C:
                addq.b  #$02, $0025(A0)
                move.l  #OOz_Boss_Mappings, $0004(A0)          ; Offset_0x033202
                move.w  #$038C, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.b  #$0C, $001A(A0)
                move.w  #$FFE0, D0
                move.w  #$FC00, $0010(A0)
                btst    #$00, $0001(A1)
                beq.s   Offset_0x033068
                neg.w   D0
                neg.w   $0010(A0)
Offset_0x033068:
                add.w   D0, $0008(A0)
                move.b  #$AF, $0020(A0)
                rts
Offset_0x033074:
                bsr     Offset_0x033098
                jsr     (SpeedToPos)                           ; Offset_0x016332
                cmpi.w  #$2870, $0008(A0)
                bcs     Offset_0x032C9C
                cmpi.w  #$2A10, $0008(A0)
                bcc     Offset_0x032C9C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x033098:
                cmpi.w  #$0250, $000C(A0)
                bcs.s   Offset_0x0330C0
                tst.w   $0010(A0)
                bmi     Offset_0x0330C2
                move.w  $0008(A0), D0
                cmpi.w  #$2980, D0
                bcc.s   Offset_0x0330C0
                cmpi.w  #$297C, D0
                bcs     Offset_0x0330C0
                move.w  #$2988, D1
                bra.s   Offset_0x0330DA
Offset_0x0330C0:
                rts
Offset_0x0330C2:
                move.w  $0008(A0), D0
                cmpi.w  #$2900, D0
                bcs.s   Offset_0x0330D8
                cmpi.w  #$2904, D0
                bcc.s   Offset_0x0330D8
                move.w  #$28F8, D1
                bra.s   Offset_0x0330DA
Offset_0x0330D8:
                rts
Offset_0x0330DA:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x033150
                move.b  #$55, (A1)         ; Nova instância do objeto na memória
                move.b  #$08, $000A(A1)
                move.b  #$04, $0025(A1)
                move.b  #$8B, $0020(A1)
                move.b  #$02, $001C(A1)
                move.b  #$0D, $001A(A1)
                move.w  #$0000, $0012(A1)
                move.l  #OOz_Boss_Mappings, $0004(A1)          ; Offset_0x033202
                move.w  #$038C, $0002(A1)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A1)
                move.b  #$02, $0018(A1)
                move.w  #$0005, $0032(A1)
                move.b  #$07, $0036(A1)
                move.w  $0010(A0), $0010(A1)
                move.w  D1, $0008(A1)
                move.w  #$0250, $000C(A1)
                move.b  #$EB, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x033150:
                rts
Offset_0x033152:
                subq.w  #$01, $0032(A0)
                bpl.s   Offset_0x0331A4
                move.w  #$00C7, $0032(A0)
                subq.b  #$01, $0036(A0)
                bmi.s   Offset_0x0331A4
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0331A4
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x033172:
                move.l  $00(A0, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x033172
                move.w  #$0005, $0032(A1)
                move.w  #$0200, $001C(A1)
                move.w  #$0010, D0
                tst.w   $0010(A1)
                bpl.s   Offset_0x033196
                neg.w   D0
Offset_0x033196:
                add.w   D0, $0008(A1)
                move.b  #$EB, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0331A4:
                lea     (OOz_Boss_Animate_Data), A1            ; Offset_0x0331BA
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0331B6:
                bra     Offset_0x032C9C
;-------------------------------------------------------------------------------  
OOz_Boss_Animate_Data: ; Offset_0x0331BA:
                dc.w    Offset_0x0331C6-OOz_Boss_Animate_Data
                dc.w    Offset_0x0331E0-OOz_Boss_Animate_Data
                dc.w    Offset_0x0331E4-OOz_Boss_Animate_Data
                dc.w    Offset_0x0331F6-OOz_Boss_Animate_Data
                dc.w    Offset_0x0331FA-OOz_Boss_Animate_Data
                dc.w    Offset_0x0331FE-OOz_Boss_Animate_Data
Offset_0x0331C6:
                dc.b    $09, $08, $08, $08, $08, $09, $09, $09, $09, $08, $08, $08, $08, $09, $09, $09
                dc.b    $09, $08, $08, $08, $08, $09, $09, $09, $09, $FF
Offset_0x0331E0:
                dc.b    $0F, $01, $FF, $00
Offset_0x0331E4:
                dc.b    $01, $0D, $11, $0E, $12, $0F, $13, $10, $14, $14, $10, $13, $0F, $12, $0E, $11
                dc.b    $0D, $FA
Offset_0x0331F6:
                dc.b    $0F, $0A, $FF, $00
Offset_0x0331FA:
                dc.b    $0F, $0B, $FF, $00
Offset_0x0331FE:
                dc.b    $0F, $08, $FF, $00
;-------------------------------------------------------------------------------
OOz_Boss_Mappings: ; Offset_0x033202:                
                dc.w    OOz_Boss_Mappings-OOz_Boss_Mappings
                dc.w    Offset_0x03322E-OOz_Boss_Mappings
                dc.w    Offset_0x033268-OOz_Boss_Mappings
                dc.w    Offset_0x03327A-OOz_Boss_Mappings
                dc.w    Offset_0x033294-OOz_Boss_Mappings
                dc.w    Offset_0x0332C0-OOz_Boss_Mappings
                dc.w    Offset_0x0332D2-OOz_Boss_Mappings
                dc.w    Offset_0x0332E4-OOz_Boss_Mappings
                dc.w    Offset_0x0332EE-OOz_Boss_Mappings
                dc.w    Offset_0x0332F8-OOz_Boss_Mappings
                dc.w    Offset_0x033302-OOz_Boss_Mappings
                dc.w    Offset_0x03330C-OOz_Boss_Mappings
                dc.w    Offset_0x033316-OOz_Boss_Mappings
                dc.w    Offset_0x033320-OOz_Boss_Mappings
                dc.w    Offset_0x03332A-OOz_Boss_Mappings
                dc.w    Offset_0x033334-OOz_Boss_Mappings
                dc.w    Offset_0x03333E-OOz_Boss_Mappings
                dc.w    Offset_0x033320-OOz_Boss_Mappings
                dc.w    Offset_0x03332A-OOz_Boss_Mappings
                dc.w    Offset_0x033334-OOz_Boss_Mappings
                dc.w    Offset_0x03333E-OOz_Boss_Mappings
                dc.w    Offset_0x0332AE-OOz_Boss_Mappings
Offset_0x03322E:
                dc.w    $0007
                dc.l    $E00D2001, $20000000, $E8002000, $2000FFF8
                dc.l    $F00D2009, $2004FFE8, $F00D2011, $20080008
                dc.l    $000F2019, $200CFFD0, $000F2029, $2014FFF0
                dc.l    $000F2039, $201C0010
Offset_0x033268:
                dc.w    $0002
                dc.l    $F80D2049, $2024FFDE, $F8052079, $203CFFF8
Offset_0x03327A:
                dc.w    $0003
                dc.l    $E2092051, $2028FFE2, $F2092057, $202BFFEA
                dc.l    $F8052079, $203CFFF8
Offset_0x033294:
                dc.w    $0003
                dc.l    $06062063, $2031FFE2, $FE06205D, $202EFFF2
                dc.l    $F8052079, $203CFFF8
Offset_0x0332AE:
                dc.w    $0002
                dc.l    $DE0720AD, $2056FFF8, $F8052079, $203CFFF8
Offset_0x0332C0:
                dc.w    $0002
                dc.l    $F80D2069, $2034FFE0, $F8052079, $203CFFF8
Offset_0x0332D2:
                dc.w    $0002
                dc.l    $F80D2071, $2038FFE0, $F8052079, $203CFFF8
Offset_0x0332E4:
                dc.w    $0001
                dc.l    $F8052079, $203CFFF8
Offset_0x0332EE:
                dc.w    $0001
                dc.l    $F009007D, $003EFFF4
Offset_0x0332F8:
                dc.w    $0001
                dc.l    $F0090083, $0041FFF4
Offset_0x033302:
                dc.w    $0001
                dc.l    $F0090089, $0044FFF4
Offset_0x03330C:
                dc.w    $0001
                dc.l    $F009008F, $0047FFF4
Offset_0x033316:
                dc.w    $0001
                dc.l    $FC0C20A9, $2054FFF0
Offset_0x033320:
                dc.w    $0001
                dc.l    $08042095, $204AFFF8
Offset_0x03332A:
                dc.w    $0001
                dc.l    $00052097, $204BFFF8
Offset_0x033334:
                dc.w    $0001
                dc.l    $F806209B, $204DFFF8
Offset_0x03333E:
                dc.w    $0001
                dc.l    $F00720A1, $2050FFF8       
;===============================================================================
; Objeto 0x55 - Robotnik na Oil Ocean
; [ Término ]
;===============================================================================  