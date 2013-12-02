; Configuração dos movimentos do chefe    [$01=Broca (nº2) Diagonal] 
;                                         [$02=Broca nave movendo] 
;                                         [$03=Broca (nº2) Vertical] 
;                                         [$04..$0B=Broca (nº2) Horizontal] 
;                                         [$0C=Broca (nº2) Subindo] 
; $FFFF742 => Configuração da broca nº 1 
; $FFFF748 => Configuração da broca nº 2 
; $FFFF750 => Posição da tela
; $FFFF75A => Movimento Cima / Baixo
; $FFFF758 => Movimento Esquerda / Direita
; (A0) + 32 => Contagem de toques no chefe 
;===============================================================================
; Objeto 0x57 - Robotnik na Mystic Cave
; [ Início ]
;===============================================================================    
Offset_0x030A8E:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x030A9C(PC, D0), D1
                jmp     Offset_0x030A9C(PC, D1)
Offset_0x030A9C:
                dc.w    Offset_0x030AA2-Offset_0x030A9C
                dc.w    Offset_0x030BA8-Offset_0x030A9C
                dc.w    Offset_0x0310EC-Offset_0x030A9C
Offset_0x030AA2:
                move.l  #MCz_Boss_Mappings, $0004(A0)          ; Offset_0x0311F2
                move.w  #$03C0, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.w  #$21A0, $0008(A0)
                move.w  #$0560, $000C(A0)
                move.b  #$05, $000B(A0)
                addq.b  #$02, $000A(A0)
                move.b  #$02, $0026(A0)
                bset    #$06, $0001(A0)
                move.b  #$04, $000F(A0)
                move.b  #$0F, $0020(A0)
                move.b  #$08, $0032(A0)
                move.w  $0008(A0), ($FFFFF750).w
                move.w  $000C(A0), ($FFFFF754).w
                move.w  #$00C0, ($FFFFF75A).w   ; Movimento de cima para baixo
                move.b  #$00, ($FFFFF73F).w
                move.b  #$01, ($FFFFEEBD).w
                move.b  #$40, $000E(A0)
                move.w  $0008(A0), $0010(A0)
                move.w  $000C(A0), $0012(A0)
                move.b  #$02, $0015(A0)
                move.w  $0008(A0), $0016(A0)
                move.w  $000C(A0), $0018(A0)
                move.b  #$01, $001B(A0)
                move.w  $0008(A0), $001C(A0)
                move.w  $000C(A0), $001E(A0)
                move.b  #$0E, $0021(A0)
                move.w  $0008(A0), $0022(A0)
                move.w  $000C(A0), $0024(A0)
                move.b  #$02, $0027(A0)
                subi.w  #$0028, $0022(A0)
                move.w  #$0028, ($FFFFF75C).w
                move.w  #$FC80, $002E(A0)
                move.w  #$FC80, $0030(A0)
                bsr     Offset_0x030B7A
                rts
Offset_0x030B7A:
                lea     ($FFFFF740).w, A2
                move.b  #$02, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                move.b  #$10, (A2)+
                move.b  #$00, (A2)+
                move.b  #$0D, (A2)+
                move.b  #$00, (A2)+
                move.b  #$03, (A2)+
                move.b  #$00, (A2)+
                rts
Offset_0x030BA8:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x030BB6(PC, D0), D1
                jmp     Offset_0x030BB6(PC, D1)
Offset_0x030BB6:
                dc.w    Offset_0x030BC4-Offset_0x030BB6
                dc.w    Offset_0x030C58-Offset_0x030BB6
                dc.w    Offset_0x030C96-Offset_0x030BB6
                dc.w    Offset_0x030D38-Offset_0x030BB6
                dc.w    Offset_0x030FC4-Offset_0x030BB6
                dc.w    Offset_0x03101A-Offset_0x030BB6
                dc.w    Offset_0x03109E-Offset_0x030BB6
Offset_0x030BC4:
                subq.w  #$01, ($FFFFF75C).w
                bpl.s   Offset_0x030C14
                move.b  #$00, ($FFFFF745).w
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$0560, ($FFFFF754).w
                bgt.s   Offset_0x030C14
                move.w  #$0100, ($FFFFF75A).w
                move.w  ($FFFFB008).w, D3
                cmpi.w  #$2190, D3
                bcc.s   Offset_0x030BF2
                move.w  #$2200, D3
                bra.s   Offset_0x030BF6
Offset_0x030BF2:
                move.w  #$2120, D3
Offset_0x030BF6:
                move.w  D3, ($FFFFF750).w
                addq.b  #$02, $0026(A0)
                bclr    #$00, $0001(A0)   ; Mudança de direção
                move.w  ($FFFFB008).w, D0
                sub.w   ($FFFFF750).w, D0
                bmi.s   Offset_0x030C14
                bset    #$00, $0001(A0)   ; Mudança de direção
Offset_0x030C14:
                cmpi.w  #$0028, ($FFFFF75C).w
                bne.s   Offset_0x030C22
                move.b  #$00, ($FFFFF73F).w
Offset_0x030C22:
                cmpi.w  #$0620, ($FFFFF754).w
                bge.s   Offset_0x030C34
                move.b  #$01, ($FFFFEEBD).w
                bsr     Offset_0x030EB0
Offset_0x030C34:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x030F28
                lea     (MCz_Boss_Animate_Data), A1            ; Offset_0x031106
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8           
                bsr     Offset_0x030DF8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030C58:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x030EB0
                cmpi.w  #$0620, ($FFFFF754).w
                blt.s   Offset_0x030C72
                addq.b  #$02, $0026(A0)
                move.b  #$00, ($FFFFEEBD).w
Offset_0x030C72:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x030F28
                lea     (MCz_Boss_Animate_Data), A1            ; Offset_0x031106
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x030DF8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030C96:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$0660, ($FFFFF754).w
                blt.s   Offset_0x030D14
                move.w  #$0660, ($FFFFF754).w
                addq.b  #$02, $0026(A0)
                lea     ($FFFFF740).w, A1
                andi.b  #$F0, $0002(A1)
                ori.b   #$06, $0002(A1)
                andi.b  #$F0, $0008(A1)
                ori.b   #$06, $0008(A1)
                andi.b  #$F0, $0006(A1)
                ori.b   #$0D, $0006(A1)
                move.b  #$20, $0005(A1)
                move.w  #$0064, ($FFFFF75C).w
                move.b  #$30, $0001(A1)
                bclr    #$00, $0001(A0)
                move.w  ($FFFFB008).w, D0
                sub.w   ($FFFFF750).w, D0
                bmi.s   Offset_0x030CFC
                bset    #$00, $0001(A0)         ; Mudança de direção
Offset_0x030CFC:
                move.w  #$FE00, ($FFFFF758).w   ; Move para esquerda
                move.w  #$0000, ($FFFFF75A).w
                btst    #$00, $0001(A0)         ; Mudança de direção
                beq.s   Offset_0x030D14
                neg.w   ($FFFFF758).w           ; Move para direita
Offset_0x030D14:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x030F28
                lea     (MCz_Boss_Animate_Data), A1            ; Offset_0x031106
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x030DF8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030D38:
                subq.w  #$01, ($FFFFF75C).w
                cmpi.w  #$0028, ($FFFFF75C).w
                bgt     Offset_0x030DD4
                move.b  #$01, ($FFFFF73F).w
                tst.w   ($FFFFF75C).w
                bpl     Offset_0x030DD4
                tst.b   $0038(A0)
                beq.s   Offset_0x030D60
                sf      $0038(A0)
                bra.s   Offset_0x030D84
Offset_0x030D60:
                bsr     Boss_Sub                               ; Offset_0x02D192
                cmpi.w  #$2120, ($FFFFF750).w
                bgt.s   Offset_0x030D74
                move.w  #$2120, ($FFFFF750).w
                bra.s   Offset_0x030D8E
Offset_0x030D74:
                cmpi.w  #$2200, ($FFFFF750).w
                blt.s   Offset_0x030DD4
                move.w  #$2200, ($FFFFF750).w
                bra.s   Offset_0x030D8E
Offset_0x030D84:
                lea     ($FFFFF740).w, A1
                move.b  #$30, $0007(A1)
Offset_0x030D8E:
                move.w  #$0000, ($FFFFF758).w
                move.b  #$00, $0026(A0)
                lea     ($FFFFF740).w, A1
                andi.b  #$F0, $0002(A1)
                ori.b   #$0B, $0002(A1)
                andi.b  #$F0, $0008(A1)
                ori.b   #$0B, $0008(A1)
                move.b  #$00, $0001(A1)
                andi.b  #$F0, $0006(A1)
                ori.b   #$0D, $0006(A1)
                move.w  #$0064, ($FFFFF75C).w
                move.w  #$FF40, ($FFFFF75A).w ; Movimento debaixo para cima
Offset_0x030DD4:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x030F28
                lea     (MCz_Boss_Animate_Data), A1            ; Offset_0x031106
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x030DF8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030DF8:
                move.w  $0008(A0), D0
                move.w  $000C(A0), D1
                move.w  D0, $0016(A0)
                move.w  D1, $0018(A0)
                move.w  D0, $001C(A0)
                move.w  D1, $001E(A0)
                tst.b   $002C(A0)
                bne.s   Offset_0x030E46
                move.w  D0, $0022(A0)
                move.w  D1, $0024(A0)
                move.w  D0, $0010(A0)
                move.w  D1, $0012(A0)
                move.w  D1, $003A(A0)
                move.w  D1, $0034(A0)
                btst    #$00, $0001(A0)         ; Muda a posição das brocas
                beq.s   Offset_0x030E3E
                addi.w  #$0028, $0022(A0)
                rts
Offset_0x030E3E:
                subi.w  #$0028, $0022(A0)
                rts
Offset_0x030E46:
                cmpi.w  #$0078, ($FFFFF75C).w
                bgt.s   Offset_0x030EAE
                subq.w  #$01, $0022(A0)        ; Ejeta a broca de trás da nave
                move.l  $003A(A0), D0
                move.w  $002E(A0), D1
                addi.w  #$0038, $002E(A0)
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, $003A(A0)
                move.w  $003A(A0), $0024(A0)
                cmpi.w  #$06F0, $0024(A0)
                blt.s   Offset_0x030E7E
                move.w  #$0000, $002E(A0)      
Offset_0x030E7E:
                addq.w  #$01, $0010(A0)        ; Ejeta a broca da frente da nave
                move.l  $0034(A0), D0
                move.w  $0030(A0), D1
                addi.w  #$0038, $0030(A0)
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, $0034(A0)
                move.w  $0034(A0), $0012(A0)
                cmpi.w  #$06F0, $0012(A0)
                blt.s   Offset_0x030EAE
                move.w  #$0000, $0030(A0)
Offset_0x030EAE:
                rts
Offset_0x030EB0:
                move.b  ($FFFFFE0F).w, D1
                sf      D2
                andi.b  #$1F, D1
                beq.s   Offset_0x030EC4
                andi.b  #$07, D1
                bne.s   Offset_0x030F26
                st      D2
Offset_0x030EC4:
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                swap.w  D1
                andi.w  #$01FF, D1
                addi.w  #$20F0, D1
                cmpi.w  #$2230, D1
                bgt.s   Offset_0x030EC4
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x030F26
                move.b  #$57, (A1)         ; Nova instância do objeto na memória
                move.b  #$04, $000A(A1)
                move.w  D1, $0008(A1)
                move.w  #$05F0, $000C(A1)
                move.l  #MCz_Boss_Mappings, $0004(A1)          ; Offset_0x0311F2
                move.w  #$0560, $0002(A1)
                ori.b   #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$0D, $001A(A1)
                tst.b   D2
                bne.s   Offset_0x030F26
                move.b  #$14, $001A(A1)
                move.b  #$B1, $0020(A1)
Offset_0x030F26:
                rts
Offset_0x030F28:
                bsr     Offset_0x030F5E
                cmpi.b  #$1F, $0014(A0)
                bne.s   Offset_0x030F3E
                lea     ($FFFFF740).w, A1
                move.b  #$C0, $0007(A1)
Offset_0x030F3E:
                rts
Offset_0x030F40:
                move.b  $001A(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$06, D0
                add.w   ($FFFFF754).w, D0
                move.w  D0, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                addq.b  #$02, $001A(A0)
Offset_0x030F5E:
                cmpi.b  #$08, $0026(A0)
                bcc.s   Offset_0x030FA4
                tst.b   $0032(A0)
                beq.s   Offset_0x030FA6
                tst.b   $0020(A0)
                bne.s   Offset_0x030FA4
                tst.b   $0014(A0)
                bne.s   Offset_0x030F88
                move.b  #$20, $0014(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x030F88:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x030F96
                move.w  #$0EEE, D0
Offset_0x030F96:
                move.w  D0, (A1)
                subq.b  #$01, $0014(A0)
                bne.s   Offset_0x030FA4
                move.b  #$0F, $0020(A0)
Offset_0x030FA4:
                rts
Offset_0x030FA6:
                moveq   #$64, D0
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.w  #$00B3, ($FFFFF75C).w
                move.b  #$08, $0026(A0)
                moveq   #$40, D0
                jsr     (LoadPLC)                              ; Offset_0x0015DA
                rts
Offset_0x030FC4:
                st      $002C(A0)
                move.b  #$00, ($FFFFEEBD).w
                subq.w  #$01, ($FFFFF75C).w
                bmi.s   Offset_0x030FE6
                move.b  #$13, $0021(A0)
                move.b  #$07, $000B(A0)
                bsr     Boss_Defeated                          ; Offset_0x02D278
                bra.s   Offset_0x031004
Offset_0x030FE6:
                bset    #$00, $0001(A0)         ; Mudança de direção
                clr.w   ($FFFFF758).w
                clr.w   ($FFFFF75A).w
                addq.b  #$02, $0026(A0)
                move.b  #$12, $0021(A0)
                move.w  #$FFEE, ($FFFFF75C).w
Offset_0x031004:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x030DF8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03101A:
                addq.w  #$01, ($FFFFF75C).w
                beq.s   Offset_0x031036
                bpl.s   Offset_0x03103C
                cmpi.w  #$0620, ($FFFFF754).w
                bcc.s   Offset_0x03102E
                subq.w  #$01, ($FFFFF75C).w
Offset_0x03102E:
                addi.w  #$0010, ($FFFFF75A).w
                bra.s   Offset_0x031080
Offset_0x031036:
                clr.w   ($FFFFF75A).w
                bra.s   Offset_0x031080
Offset_0x03103C:
                cmpi.w  #$0018, ($FFFFF75C).w
                bcs.s   Offset_0x03106A
                beq.s   Offset_0x031070
                cmpi.w  #$0020, ($FFFFF75C).w
                bcs.s   Offset_0x031080
                lea     ($FFFFF740).w, A1
                move.b  #$0D, $0007(A1)
                move.b  #$02, $0000(A2)
                move.b  #$00, $0001(A1)
                addq.b  #$02, $0026(A0)
                bra.s   Offset_0x031080
Offset_0x03106A:
                subq.w  #$08, ($FFFFF75A).w
                bra.s   Offset_0x031080
Offset_0x031070:
                clr.w   ($FFFFF75A).w
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
Offset_0x031080:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x030F40
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                bsr     Offset_0x030DF8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03109E:
                move.w  #$0400, ($FFFFF758).w
                move.w  #$FFC0, ($FFFFF75A).w
                cmpi.w  #$2240, ($FFFFEECA).w
                beq.s   Offset_0x0310B8
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x0310BE
Offset_0x0310B8:
                tst.b   $0001(A0)
                bpl.s   Offset_0x0310E6
Offset_0x0310BE:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x030F40
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                lea     (MCz_Boss_Animate_Data), A1            ; Offset_0x031106
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x030DF8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0310E6:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x0310EC:
                jsr     (ObjectFall)                           ; Offset_0x016306
                subi.w  #$0028, $0012(A0)
                cmpi.w  #$06F0, $000C(A0)
                bgt.s   Offset_0x0310E6
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
MCz_Boss_Animate_Data: ; Offset_0x031106:
                dc.w    Offset_0x031124-MCz_Boss_Animate_Data
                dc.w    Offset_0x03112A-MCz_Boss_Animate_Data
                dc.w    Offset_0x03112E-MCz_Boss_Animate_Data
                dc.w    Offset_0x031136-MCz_Boss_Animate_Data
                dc.w    Offset_0x031148-MCz_Boss_Animate_Data
                dc.w    Offset_0x03115A-MCz_Boss_Animate_Data
                dc.w    Offset_0x031162-MCz_Boss_Animate_Data
                dc.w    Offset_0x031174-MCz_Boss_Animate_Data
                dc.w    Offset_0x031186-MCz_Boss_Animate_Data
                dc.w    Offset_0x031198-MCz_Boss_Animate_Data
                dc.w    Offset_0x0311AA-MCz_Boss_Animate_Data
                dc.w    Offset_0x0311B2-MCz_Boss_Animate_Data
                dc.w    Offset_0x0311C4-MCz_Boss_Animate_Data
                dc.w    Offset_0x0311D6-MCz_Boss_Animate_Data
                dc.w    Offset_0x0311EE-MCz_Boss_Animate_Data
Offset_0x031124:
                dc.b    $0F, $01, $FF, $00, $FC, $02
Offset_0x03112A:
                dc.b    $05, $08, $FF, $00
Offset_0x03112E:
                dc.b    $01, $05, $06, $FF, $07, $FC, $03, $00
Offset_0x031136:
                dc.b    $01, $02, $02, $02, $02, $02, $03, $03, $03, $03, $03, $04, $04, $04, $04, $FD
                dc.b    $04, $00
Offset_0x031148:
                dc.b    $01, $02, $02, $02, $02, $03, $03, $03, $04, $04, $04, $02, $02, $03, $03, $FD
                dc.b    $05, $00
Offset_0x03115A:
                dc.b    $01, $04, $02, $03, $04, $FC, $01, $00
Offset_0x031162:
                dc.b    $01, $02, $03, $04, $04, $02, $02, $03, $03, $03, $04, $04, $04, $02, $02, $02
                dc.b    $FD, $07
Offset_0x031174:
                dc.b    $01, $02, $03, $03, $03, $03, $04, $04, $04, $04, $04, $02, $08, $08, $08, $FD
                dc.b    $08, $00
Offset_0x031186:
                dc.b    $01, $09, $09, $09, $09, $09, $0A, $0A, $0A, $0A, $0A, $0B, $0B, $0B, $0B, $FD
                dc.b    $09, $00
Offset_0x031198:
                dc.b    $01, $09, $09, $09, $09, $0A, $0A, $0A, $0B, $0B, $0B, $09, $09, $0A, $0A, $FD
                dc.b    $0A, $00
Offset_0x0311AA:
                dc.b    $01, $0B, $09, $0A, $0B, $FC, $01, $00
Offset_0x0311B2:
                dc.b    $01, $09, $0A, $0B, $0B, $09, $09, $0A, $0A, $0A, $0B, $0B, $0B, $09, $09, $09
                dc.b    $FD, $0C
Offset_0x0311C4:
                dc.b    $01, $09, $0A, $0A, $0A, $0A, $0B, $0B, $0B, $0B, $0B, $09, $08, $08, $08, $08
                dc.b    $FD, $03
Offset_0x0311D6:
                dc.b    $07, $0E, $0F, $FF, $10, $11, $10, $11, $10, $11, $10, $11, $FF, $12, $12, $12
                dc.b    $12, $12, $12, $12, $12, $12, $FF, $00
Offset_0x0311EE:
                dc.b    $07, $12, $FF, $00
;-------------------------------------------------------------------------------   
MCz_Boss_Mappings: ; Offset_0x0311F2:
                dc.w    Offset_0x03121C-MCz_Boss_Mappings
                dc.w    Offset_0x031246-MCz_Boss_Mappings
                dc.w    Offset_0x031270-MCz_Boss_Mappings
                dc.w    Offset_0x031282-MCz_Boss_Mappings
                dc.w    Offset_0x031294-MCz_Boss_Mappings
                dc.w    Offset_0x0312A6-MCz_Boss_Mappings
                dc.w    Offset_0x0312B8-MCz_Boss_Mappings
                dc.w    Offset_0x0312CA-MCz_Boss_Mappings
                dc.w    Offset_0x0312D4-MCz_Boss_Mappings
                dc.w    Offset_0x0312FE-MCz_Boss_Mappings
                dc.w    Offset_0x031310-MCz_Boss_Mappings
                dc.w    Offset_0x031322-MCz_Boss_Mappings
                dc.w    Offset_0x031334-MCz_Boss_Mappings
                dc.w    Offset_0x03133E-MCz_Boss_Mappings
                dc.w    Offset_0x031348-MCz_Boss_Mappings
                dc.w    Offset_0x03135A-MCz_Boss_Mappings
                dc.w    Offset_0x03136C-MCz_Boss_Mappings
                dc.w    Offset_0x03137E-MCz_Boss_Mappings
                dc.w    Offset_0x031390-MCz_Boss_Mappings
                dc.w    Offset_0x0313A2-MCz_Boss_Mappings
                dc.w    Offset_0x0313B4-MCz_Boss_Mappings
Offset_0x03121C:
                dc.w    $0005
                dc.l    $F80F2148, $20A4FFF0, $F8072158, $20AC0010
                dc.l    $E8050164, $00B20010, $F80A2009, $2004FFD8
                dc.l    $D8090021, $0010FFF8
Offset_0x031246:
                dc.w    $0005
                dc.l    $F80F2148, $20A4FFF0, $F8072158, $20AC0010
                dc.l    $E8050164, $00B20010, $F80A2000, $2000FFD8
                dc.l    $D8090021, $0010FFF8
Offset_0x031270:
                dc.w    $0002
                dc.l    $D0072027, $2013000C, $F00B203F, $201F0008
Offset_0x031282:
                dc.w    $0002
                dc.l    $D007202F, $2017000C, $F00B204B, $20250008
Offset_0x031294:
                dc.w    $0002
                dc.l    $D0072037, $201B000C, $F00B2057, $202B0008
Offset_0x0312A6:
                dc.w    $0002
                dc.l    $12080012, $0009FFF8, $1A080015, $000AFFF8
Offset_0x0312B8:
                dc.w    $0002
                dc.l    $12080012, $0009FFF8, $1A0A0018, $000CFFF8
Offset_0x0312CA:
                dc.w    $0001
                dc.l    $12080012, $0009FFF8
Offset_0x0312D4:
                dc.w    $0005
                dc.l    $E0092063, $2031FFF8, $F0012069, $20340000
                dc.l    $F00F206B, $20350008, $F802207B, $203D0028
                dc.l    $1004207E, $203F0018
Offset_0x0312FE:
                dc.w    $0002
                dc.l    $FC0D2080, $2040FFF0, $F80E2098, $204C0010
Offset_0x031310:
                dc.w    $0002
                dc.l    $FC0D2088, $2044FFF0, $F80E20A4, $20520010
Offset_0x031322:
                dc.w    $0002
                dc.l    $FC0D2090, $2048FFF0, $F80E20B0, $20580010
Offset_0x031334:
                dc.w    $0001
                dc.l    $F00F40BC, $405EFFF0
Offset_0x03133E:
                dc.w    $0001
                dc.l    $F8054000, $4000FFF8
Offset_0x031348:
                dc.w    $0002
                dc.l    $E80D0170, $00B8FFF0, $E8050168, $00B4FFE0
Offset_0x03135A:
                dc.w    $0002
                dc.l    $E80D0178, $00BCFFF0, $E8050168, $00B4FFE0
Offset_0x03136C:
                dc.w    $0002
                dc.l    $E80D0180, $00C0FFF0, $E805016C, $00B6FFE0
Offset_0x03137E:
                dc.w    $0002
                dc.l    $E80D0188, $00C4FFF0, $E805016C, $00B6FFE0
Offset_0x031390:
                dc.w    $0002
                dc.l    $E80D0190, $00C8FFF0, $E805016C, $00B6FFE0
Offset_0x0313A2:
                dc.w    $0002
                dc.l    $E80D0198, $00CCFFF0, $E805016C, $00B6FFE0
Offset_0x0313B4:
                dc.w    $0001
                dc.l    $F0034004, $4002FFFC
;===============================================================================
; Objeto 0x57 - Robotnik na Mystic Cave
; [ Término ]
;===============================================================================  