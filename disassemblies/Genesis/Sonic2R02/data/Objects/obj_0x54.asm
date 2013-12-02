;===============================================================================
; Objeto 0x54 - Robotnik na Metropolis
; [ Início ]    Rotinas adicionais deste objeto no objeto 0x53 ( obj_0x53.asm )
;===============================================================================   
Offset_0x031D32:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x031D40(PC, D0), D1
                jmp     Offset_0x031D40(PC, D1)
Offset_0x031D40:
                dc.w    Offset_0x031D48-Offset_0x031D40
                dc.w    Offset_0x031E68-Offset_0x031D40
                dc.w    Mz_Boss_Sub_02-Offset_0x031D40         ; Offset_0x03277A
                dc.w    Mz_Boss_Sub_03-Offset_0x031D40         ; Offset_0x032814
Offset_0x031D48:
                move.l  #Mz_Boss_Mappings, $0004(A0)           ; Offset_0x03289A
                move.w  #$037C, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.w  #$2B50, $0008(A0)
                move.w  #$0380, $000C(A0)
                move.b  #$02, $000B(A0)
                addq.b  #$02, $000A(A0)
                bset    #$06, $0001(A0)
                move.b  #$02, $000F(A0)
                move.b  #$0F, $0020(A0)
                move.b  #$08, $0032(A0)
                move.b  #$07, $003E(A0)
                move.w  $0008(A0), ($FFFFF750).w
                move.w  $000C(A0), ($FFFFF754).w
                move.w  #$0000, ($FFFFF758).w
                move.w  #$0100, ($FFFFF75A).w
                move.b  #$20, $000E(A0)
                clr.b   $002B(A0)
                clr.b   $002C(A0)
                move.b  #$40, $001A(A0)
                move.b  #$27, $0033(A0)
                move.b  #$27, $0039(A0)
                move.w  $0008(A0), $0010(A0)
                move.w  $000C(A0), $0012(A0)
                move.b  #$0C, $0015(A0)
                move.w  $0008(A0), $0016(A0)
                move.w  $000C(A0), $0018(A0)
                move.b  #$00, $001B(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x031E4A
                move.b  #$54, (A1)         ; Nova instância do objeto na memória
                move.b  #$06, $000A(A1)
                move.b  #$13, $001A(A1)
                move.l  #Mz_Boss_Mappings, $0004(A1)           ; Offset_0x03289A
                move.w  #$037C, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$06, $0018(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  A0, $0034(A1)
                move.b  #$20, $0019(A1)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x031E4A
                move.b  #$53, (A1)     ; Carrega o objeto 0x53 - Bolinhas e mini Robotniks
                move.l  A0, $0034(A1)
Offset_0x031E4A:
                lea     ($FFFFF740).w, A2
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)+
                rts
Offset_0x031E68:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x031E76(PC, D0), D1
                jmp     Offset_0x031E76(PC, D1)
Offset_0x031E76:
                dc.w    Offset_0x031E8A-Offset_0x031E76
                dc.w    Offset_0x031F06-Offset_0x031E76
                dc.w    Offset_0x031F8E-Offset_0x031E76
                dc.w    Offset_0x031FD6-Offset_0x031E76
                dc.w    Offset_0x031FF6-Offset_0x031E76
                dc.w    Offset_0x032026-Offset_0x031E76
                dc.w    Offset_0x032070-Offset_0x031E76
                dc.w    Offset_0x0320E0-Offset_0x031E76
                dc.w    Offset_0x0322B4-Offset_0x031E76
                dc.w    Offset_0x03231A-Offset_0x031E76
Offset_0x031E8A:
                bsr     Boss_Sub                               ; Offset_0x02D192
                move.w  ($FFFFF754).w, $000C(A0)
                cmpi.w  #$04A0, ($FFFFF754).w
                bcs.s   Offset_0x031ED4
                addq.b  #$02, $0026(A0)
                move.w  #$0000, ($FFFFF75A).w
                move.w  #$FF00, ($FFFFF758).w
                bclr    #$07, $002B(A0)
                bclr    #$00, $0001(A0)
                move.w  ($FFFFB008).w, D0
                cmp.w   ($FFFFF750).w, D0
                bcs.s   Offset_0x031ED4
                move.w  #$0100, ($FFFFF758).w
                bset    #$07, $002B(A0)
                bset    #$00, $0001(A0)
Offset_0x031ED4:
                bsr     Offset_0x032240
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x032848
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x032226
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x031EEC:
                move.b  $001A(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$06, D0
                add.w   ($FFFFF754).w, D0
                move.w  D0, $000C(A0)
                addq.b  #$04, $001A(A0)
                rts
Offset_0x031F06:
                bsr     Boss_Sub                               ; Offset_0x02D192
                btst    #$07, $002B(A0)
                bne.s   Offset_0x031F40
                cmpi.w  #$2AD0, ($FFFFF750).w
                bcc.s   Offset_0x031F6C
                bchg    #07, $002B(A0)
                move.w  #$0100, ($FFFFF758).w
                bset    #$00, $0001(A0)
                bset    #$06, $002B(A0)
                beq.s   Offset_0x031F6C
                addq.b  #$02, $0026(A0)
                move.w  #$FF00, ($FFFFF75A).w
                bra.s   Offset_0x031F6C
Offset_0x031F40:
                cmpi.w  #$2BD0, ($FFFFF750).w
                bcs.s   Offset_0x031F6C
                bchg    #07, $002B(A0)
                move.w  #$FF00, ($FFFFF758).w
                bclr    #$00, $0001(A0)
                bset    #$06, $002B(A0)
                beq.s   Offset_0x031F6C
                addq.b  #$02, $0026(A0)
                move.w  #$FF00, ($FFFFF75A).w
Offset_0x031F6C:
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x031EEC
Offset_0x031F76:
                bsr     Offset_0x032240
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x032848
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x032226
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x031F8E:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$0470, ($FFFFF754).w
                bcc.s   Offset_0x031FA0
                move.w  #$0000, ($FFFFF75A).w
Offset_0x031FA0:
                btst    #$07, $002B(A0)
                bne.s   Offset_0x031FB8
                cmpi.w  #$2B50, ($FFFFF750).w
                bcc.s   Offset_0x031FC6
                move.w  #$0000, ($FFFFF758).w
                bra.s   Offset_0x031FC6
Offset_0x031FB8:
                cmpi.w  #$2B50, ($FFFFF750).w
                bcs.s   Offset_0x031FC6
                move.w  #$0000, ($FFFFF758).w
Offset_0x031FC6:
                move.w  ($FFFFF758).w, D0
                or.w    ($FFFFF75A).w, D0
                bne.s   Offset_0x031FD4
                addq.b  #$02, $0026(A0)
Offset_0x031FD4:
                bra.s   Offset_0x031F6C
Offset_0x031FD6:
                cmpi.b  #$68, $0033(A0)
                bcc.s   Offset_0x031FE8
                addq.b  #$01, $0033(A0)
                addq.b  #$01, $0039(A0)
                bra.s   Offset_0x031FF2
Offset_0x031FE8:
                subq.b  #$01, $0039(A0)
                bne.s   Offset_0x031FF2
                addq.b  #$02, $0026(A0)
Offset_0x031FF2:
                bra     Offset_0x031F6C
Offset_0x031FF6:
                cmpi.b  #$27, $0033(A0)
                bcs.s   Offset_0x032004
                subq.b  #$01, $0033(A0)
                bra.s   Offset_0x032022
Offset_0x032004:
                addq.b  #$01, $0039(A0)
                cmpi.b  #$27, $0039(A0)
                bcs.s   Offset_0x032022
                move.w  #$0100, ($FFFFF75A).w
                move.b  #$00, $0026(A0)
                bclr    #$06, $002B(A0)
Offset_0x032022:
                bra     Offset_0x031F6C
Offset_0x032026:
                tst.b   $0039(A0)
                beq.s   Offset_0x032032
                subq.b  #$01, $0039(A0)
                bra.s   Offset_0x032038
Offset_0x032032:
                move.b  #$FF, $003A(A0)
Offset_0x032038:
                cmpi.b  #$27, $0033(A0)
                bcs.s   Offset_0x032044
                subq.b  #$01, $0033(A0)
Offset_0x032044:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$0420, ($FFFFF754).w
                bcc.s   Offset_0x032056
                move.w  #$0000, ($FFFFF75A).w
Offset_0x032056:
                tst.b   $002C(A0)
                bne.s   Offset_0x03206C
                tst.b   $003A(A0)
                beq.s   Offset_0x032068
                move.b  #$80, $003A(A0)
Offset_0x032068:
                addq.b  #$02, $0026(A0)
Offset_0x03206C:
                bra     Offset_0x031F6C
Offset_0x032070:
                tst.b   $003E(A0)
                beq.s   Offset_0x03209E
                tst.b   $003A(A0)
                bne.s   Offset_0x0320DC
                cmpi.b  #$27, $0039(A0)
                bcc.s   Offset_0x03208A
                addq.b  #$01, $0039(A0)
                bra.s   Offset_0x0320DC
Offset_0x03208A:
                move.w  #$0100, ($FFFFF75A).w
                move.b  #$00, $0026(A0)
                bclr    #$06, $002B(A0)
                bra.s   Offset_0x0320DC
Offset_0x03209E:
                move.w  #$FE80, ($FFFFF75A).w
                move.w  #$FF00, ($FFFFF758).w
                bclr    #$00, $0001(A0)
                btst    #$07, $002B(A0)
                beq.s   Offset_0x0320C4
                move.w  #$0100, ($FFFFF758).w
                bset    #$00, $0001(A0)
Offset_0x0320C4:
                move.b  #$0E, $0026(A0)
                move.b  #$00, $002E(A0)
                bclr    #$06, $002B(A0)
                move.b  #$00, $002F(A0)
Offset_0x0320DC:
                bra     Offset_0x031F6C
Offset_0x0320E0:
                tst.b   $002F(A0)
                beq.s   Offset_0x0320EE
                subq.b  #$01, $002F(A0)
                bra     Offset_0x031F76
Offset_0x0320EE:
                moveq   #$00, D0
                move.b  $002E(A0), D0
                move.w  Offset_0x0320FC(PC, D0), D1
                jmp     Offset_0x0320FC(PC, D1)
Offset_0x0320FC:
                dc.w    Offset_0x032102-Offset_0x0320FC
                dc.w    Offset_0x03216A-Offset_0x0320FC
                dc.w    Offset_0x0321B6-Offset_0x0320FC
Offset_0x032102:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$0420, ($FFFFF754).w
                bcc.s   Offset_0x032114
                move.w  #$0000, ($FFFFF75A).w
Offset_0x032114:
                btst    #$07, $002B(A0)
                bne.s   Offset_0x032142
                cmpi.w  #$2AF0, ($FFFFF750).w
                bcc.s   Offset_0x032166
                addq.b  #$02, $002E(A0)
                move.w  #$0180, ($FFFFF75A).w
                move.b  #$03, $002D(A0)
                move.w  #$001E, ($FFFFF75C).w
                bset    #$00, $0001(A0)
                bra.s   Offset_0x032166
Offset_0x032142:
                cmpi.w  #$2BB0, ($FFFFF750).w
                bcs.s   Offset_0x032166
                addq.b  #$02, $002E(A0)
                move.w  #$0180, ($FFFFF75A).w
                move.b  #$03, $002D(A0)
                move.w  #$001E, ($FFFFF75C).w
                bclr    #$00, $0001(A0)
Offset_0x032166:
                bra     Offset_0x031F6C
Offset_0x03216A:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$04A0, ($FFFFF754).w
                bcs.s   Offset_0x032188
                move.w  #$FE80, ($FFFFF75A).w
                addq.b  #$02, $002E(A0)
                bchg    #07, $002B(A0)
                bra.s   Offset_0x0321AE
Offset_0x032188:
                btst    #$07, $002B(A0)
                bne.s   Offset_0x0321A0
                cmpi.w  #$2AD0, ($FFFFF750).w
                bcc.s   Offset_0x0321AE
                move.w  #$0000, ($FFFFF758).w
                bra.s   Offset_0x0321AE
Offset_0x0321A0:
                cmpi.w  #$2BD0, ($FFFFF750).w
                bcs.s   Offset_0x0321AE
                move.w  #$0000, ($FFFFF758).w
Offset_0x0321AE:
                bsr     Offset_0x0321F2
                bra     Offset_0x031F6C
Offset_0x0321B6:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$0470, ($FFFFF754).w
                bcc.s   Offset_0x0321D6
                move.w  #$0100, ($FFFFF758).w
                btst    #$07, $002B(A0)
                bne.s   Offset_0x0321D6
                move.w  #$FF00, ($FFFFF758).w
Offset_0x0321D6:
                cmpi.w  #$0420, ($FFFFF754).w
                bcc.s   Offset_0x0321EA
                move.w  #$0000, ($FFFFF75A).w
                move.b  #$00, $002E(A0)
Offset_0x0321EA:
                bsr     Offset_0x0321F2
                bra     Offset_0x031F6C
Offset_0x0321F2:
                subq.w  #$01, ($FFFFF75C).w
                bne.s   Offset_0x032224
                tst.b   $002D(A0)
                beq.s   Offset_0x032224
                subq.b  #$01, $002D(A0)
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x032224
                move.b  #$54, (A1)         ; Nova instância do objeto na memória
                move.b  #$04, $000A(A1)
                move.l  A0, $0034(A1)
                move.w  #$001E, ($FFFFF75C).w
                move.b  #$10, $002F(A0)
Offset_0x032224:
                rts
Offset_0x032226:
                move.w  $0008(A0), D0
                move.w  $000C(A0), D1
                move.w  D0, $0010(A0)
                move.w  D1, $0012(A0)
                move.w  D0, $0016(A0)
                move.w  D1, $0018(A0)
                rts
Offset_0x032240:
                bsr     Offset_0x032398
                cmpi.b  #$3F, $0014(A0)
                bne.s   Offset_0x032284
                st      $0038(A0)
                lea     ($FFFFF740).w, A1
                andi.b  #$F0, $0002(A1)
                ori.b   #$05, $0002(A1)
                tst.b   $003E(A0)
                beq.s   Offset_0x03227C
                move.b  #$0A, $0026(A0)
                move.w  #$FE80, ($FFFFF75A).w
                subq.b  #$01, $003E(A0)
                move.w  #$0000, ($FFFFF758).w
Offset_0x03227C:
                move.w  #$0000, ($FFFFF758).w
                rts
Offset_0x032284:
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x032294
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x0322B2
Offset_0x032294:
                lea     ($FFFFF740).w, A1
                move.b  $0002(A1), D0
                andi.b  #$0F, D0
                cmpi.b  #$04, D0
                beq.s   Offset_0x0322B2
                andi.b  #$F0, $0002(A1)
                ori.b   #$04, $0002(A1)
Offset_0x0322B2:
                rts
Offset_0x0322B4:
                subq.w  #$01, ($FFFFF75C).w
                cmpi.w  #$003C, ($FFFFF75C).w
                bcs.s   Offset_0x0322FA
                bmi.s   Offset_0x0322D2
                bsr     Boss_Defeated                          ; Offset_0x02D278
                lea     ($FFFFF740).w, A1
                move.b  #$07, $0002(A1)
                bra.s   Offset_0x0322FA
Offset_0x0322D2:
                bset    #$00, $0001(A0)
                clr.w   ($FFFFF758).w
                clr.w   ($FFFFF75A).w
                addq.b  #$02, $0026(A0)
                move.w  #$FFEE, ($FFFFF75C).w
                lea     ($FFFFF740).w, A1
                move.b  #$03, $0002(A1)
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
Offset_0x0322FA:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x032848
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x032226
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03231A:
                move.w  #$0400, ($FFFFF758).w
                move.w  #$FFC0, ($FFFFF75A).w
                cmpi.w  #$2BF0, ($FFFFEECA).w
                bcc.s   Offset_0x032334
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x03233A
Offset_0x032334:
                tst.b   $0001(A0)
                bpl.s   Offset_0x032374
Offset_0x03233A:
                tst.b   ($FFFFF7A7).w
                bne.s   Offset_0x03234C
                move.b  #$01, ($FFFFF7A7).w
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
Offset_0x03234C:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x03237A
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                lea     (Mz_Boss_Animate_Data), A1             ; Offset_0x032848
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x032226
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x032374:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x03237A:
                move.b  $001A(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$06, D0
                add.w   ($FFFFF754).w, D0
                move.w  D0, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                addq.b  #$02, $001A(A0)
Offset_0x032398:
                cmpi.b  #$10, $0026(A0)
                bcc.s   Offset_0x0323DE
                tst.b   $0032(A0)
                beq.s   Offset_0x0323E0
                tst.b   $0020(A0)
                bne.s   Offset_0x0323DE
                tst.b   $0014(A0)
                bne.s   Offset_0x0323C2
                move.b  #$40, $0014(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0323C2:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x0323D0
                move.w  #$0EEE, D0
Offset_0x0323D0:
                move.w  D0, (A1)
                subq.b  #$01, $0014(A0)
                bne.s   Offset_0x0323DE
                move.b  #$0F, $0020(A0)
Offset_0x0323DE:
                rts
Offset_0x0323E0:
                moveq   #$64, D0
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.w  #$00EF, ($FFFFF75C).w
                move.b  #$10, $0026(A0)
                moveq   #$40, D0
                jsr     (LoadPLC)                              ; Offset_0x0015DA
                rts   
;===============================================================================
; Objeto 0x54 - Robotnik na Metropolis
; [ Término ]
;===============================================================================  