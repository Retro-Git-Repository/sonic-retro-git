;===============================================================================
; Objeto 0x89 - Chefe na Aquatic Ruin
; [ Início ]
;===============================================================================    
Offset_0x02FF92:
                moveq   #$00, D0
                move.b  $000A(A0), D0
                move.w  Offset_0x02FFA0(PC, D0), D1
                jmp     Offset_0x02FFA0(PC, D1)
Offset_0x02FFA0:
                dc.w    Offset_0x02FFA6-Offset_0x02FFA0
                dc.w    Offset_0x030136-Offset_0x02FFA0
                dc.w    Offset_0x0304CC-Offset_0x02FFA0
Offset_0x02FFA6:
                tst.l   ($FFFFF680).w
                beq.s   Offset_0x02FFAE
                rts
Offset_0x02FFAE:
                tst.w   ($FFFFFF7A).w
                bne.s   Offset_0x02FFE6
                move.w  ($FFFFB008).w, D0
                cmpi.w  #$2A60, D0
                blt     Offset_0x03010A
                cmpi.w  #$2B60, D0
                bgt     Offset_0x03010A
                cmpi.b  #$81, ($FFFFB06A).w
                beq     Offset_0x02FFE6
                move.w  ($FFFFB048).w, D0
                cmpi.w  #$2A60, D0
                blt     Offset_0x03010A
                cmpi.w  #$2B60, D0
                bgt     Offset_0x03010A
Offset_0x02FFE6:
                move.b  #$01, ($FFFFEEBD).w
                move.w  #$03E0, $0002(A0)
                move.l  #ARz_Boss_Ship_Mappings, $0004(A0)     ; Offset_0x03093E
                ori.b   #$04, $0001(A0)
                move.b  #$20, $000E(A0)
                move.b  #$02, $0018(A0)
                move.b  #$02, $000A(A0)
                move.w  #$2AE0, $0008(A0)
                move.w  #$0388, $000C(A0)
                move.w  #$2AE0, ($FFFFF750).w
                move.w  #$0388, ($FFFFF754).w
                bset    #$06, $0001(A0)
                move.b  #$03, $000F(A0)
                move.b  #$0F, $0020(A0)
                move.b  #$08, $0032(A0)
                move.b  #$08, $000B(A0)
                move.w  #$FC80, $002E(A0)
                clr.b   ($FFFFF73F).w
                move.w  #$2AE0, $0010(A0)
                move.w  #$0488, $0012(A0)   ; Posição de batalha
                move.b  #$00, $0015(A0)
                move.w  #$2AE0, $0016(A0)
                move.w  #$0488, $0018(A0)   ; Posição de batalha
                move.b  #$09, $001B(A0)
                move.w  #$2AE0, $001C(A0)
                move.w  #$0488, $001E(A0)   ; Posição de batalha
                move.b  #$06, $0021(A0)
                move.w  #$0100, ($FFFFF75A).w
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x03010A
                move.b  #$89, (A1)         ; Nova instância do objeto na memória
                move.l  #ARz_Boss_Arrows_Launcher_Mappings, $0004(A1) ; Offset_0x0308A0
                ori.b   #$04, $0001(A1)
                move.w  #$03E0, $0002(A1)
                move.b  #$10, $0019(A1)
                move.b  #$04, $0018(A1)
                move.w  #$2A50, $0008(A1)
                move.w  #$0510, $000C(A1)
                addq.b  #$04, $000A(A1)
                move.l  A0, $002A(A1)
                move.b  #$00, $001A(A1)
                move.b  #$02, $0018(A1)
                move.b  #$20, $0016(A1)
                move.l  A1, A2
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03010A
                moveq   #$00, D0
                move.w  #$000F, D1
Offset_0x0300F2:
                move.l  $00(A2, D0), $00(A1, D0)
                addq.w  #$04, D0
                dbra    D1, Offset_0x0300F2
                bset    #$00, $0001(A1)
                move.w  #$2B70, $0008(A1)
Offset_0x03010A:
                bsr     Offset_0x030110
                rts
Offset_0x030110:
                lea     ($FFFFF740).w, A2
                move.b  #$04, (A2)+
                move.b  #$00, (A2)+
                move.b  #$00, (A2)+
                move.b  #$00, (A2)+
                move.b  #$02, (A2)+
                move.b  #$00, (A2)+
                move.b  #$01, (A2)+
                move.b  #$00, (A2)+
                rts
Offset_0x030136:
                moveq   #$00, D0
                move.b  $0026(A0), D0
                move.w  Offset_0x030144(PC, D0), D1
                jmp     Offset_0x030144(PC, D1)
Offset_0x030144:
                dc.w    Offset_0x030152-Offset_0x030144
                dc.w    Offset_0x030190-Offset_0x030144
                dc.w    Offset_0x0301CE-Offset_0x030144
                dc.w    Offset_0x030220-Offset_0x030144
                dc.w    Offset_0x0303A8-Offset_0x030144
                dc.w    Offset_0x030412-Offset_0x030144
                dc.w    Offset_0x03047E-Offset_0x030144
Offset_0x030152:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x030276
                bsr     Offset_0x030342
                cmpi.w  #$0430, ($FFFFF754).w     ; Posição inicial do Robotnik
                blt.s   Offset_0x030180
                move.w  #$0430, ($FFFFF754).w     ; Posição inicial de batalha
                addq.b  #$02, $0026(A0)
                move.w  #$0000, ($FFFFF75A).w
                move.w  #$FF38, ($FFFFF758).w
                st      $0038(A0)
Offset_0x030180:
                lea     (ARz_Boss_Animate_Data), A1            ; Offset_0x030900
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030190:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x030276
                bsr     Offset_0x030342
                tst.b   $0038(A0)
                bne.s   Offset_0x0301AC
                cmpi.w  #$2B10, ($FFFFF750).w
                blt.s   Offset_0x0301BE
                bra.s   Offset_0x0301B4
Offset_0x0301AC:
                cmpi.w  #$2AB0, ($FFFFF750).w
                bgt.s   Offset_0x0301BE
Offset_0x0301B4:
                addq.b  #$02, $0026(A0)
                move.w  #$0000, ($FFFFF758).w
Offset_0x0301BE:
                lea     (ARz_Boss_Animate_Data), A1            ; Offset_0x030900
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0301CE:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x030276
                bsr     Offset_0x030342
                cmpi.b  #$C0, $001A(A0)
                bne.s   Offset_0x030210
                lea     ($FFFFF740).w, A1
                andi.b  #$F0, $0004(A1)
                ori.b   #$03, $0004(A1)
                addq.b  #$02, $0026(A0)
                btst    #$00, $0001(A0)
                sne     $0038(A0)
                move.w  #$001E, ($FFFFF75C).w  ; Tempo antes de mudar de posição
                move.b  #$BD, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x030210:
                lea     (ARz_Boss_Animate_Data), A1            ; Offset_0x030900
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030220:
                cmpi.w  #$0014, ($FFFFF75C).w
                bne.s   Offset_0x030234
                bset    #$00, $003E(A0)
                move.b  #$01, ($FFFFF73F).w
Offset_0x030234:
                subq.w  #$01, ($FFFFF75C).w
                bpl.s   Offset_0x03025A
                clr.b   ($FFFFF73F).w
                move.b  #$02, $0026(A0)
                bchg    #00, $0001(A0)             ; Modifica a posição do chefe
                beq.s   Offset_0x030254
                move.w  #$FF38, ($FFFFF758).w
                bra.s   Offset_0x03025A
Offset_0x030254:
                move.w  #$00C8, ($FFFFF758).w
Offset_0x03025A:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x030276
                bsr     Offset_0x030342
                lea     (ARz_Boss_Animate_Data), A1            ; Offset_0x030900
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030276:
                bsr     Offset_0x0302A8
                cmpi.b  #$04, ($FFFFB024).w
                beq.s   Offset_0x03028A
                cmpi.b  #$04, ($FFFFB064).w
                bne.s   Offset_0x030294
Offset_0x03028A:
                lea     ($FFFFF740).w, A1
                move.b  #$31, $0003(A1)
Offset_0x030294:
                cmpi.b  #$3F, $0014(A0)
                bne.s   Offset_0x0302A6
                lea     ($FFFFF740).w, A1
                move.b  #$C0, $0003(A1)
Offset_0x0302A6:
                rts
Offset_0x0302A8:
                move.b  $001A(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$06, D0
                add.w   ($FFFFF754).w, D0
                move.w  D0, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                addq.b  #$02, $001A(A0)
                cmpi.b  #$08, $0026(A0)
                bcc.s   Offset_0x03030C
                tst.b   $0032(A0)
                beq.s   Offset_0x03030E
                tst.b   $0020(A0)
                bne.s   Offset_0x03030C
                tst.b   $0014(A0)
                bne.s   Offset_0x0302F0
                move.b  #$40, $0014(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0302F0:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x0302FE
                move.w  #$0EEE, D0
Offset_0x0302FE:
                move.w  D0, (A1)
                subq.b  #$01, $0014(A0)
                bne.s   Offset_0x03030C
                move.b  #$0F, $0020(A0)
Offset_0x03030C:
                rts
Offset_0x03030E:
                moveq   #$64, D0
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.w  #$00B3, ($FFFFF75C).w
                move.b  #$08, $0026(A0)
                lea     ($FFFFF740).w, A1
                move.b  #$05, $0002(A1)
                move.b  #$00, $0003(A1)
                moveq   #$40, D0          ; Ponteiro para o container de animais
                jsr     (LoadPLC)                              ; Offset_0x0015DA
                move.b  #$05, $0015(A0)
                rts
Offset_0x030342:
                move.w  $0008(A0), D0
                move.w  $000C(A0), D1
                move.w  D0, $0010(A0)
                move.w  D1, $0012(A0)
                move.w  D0, $001C(A0)
                move.w  D1, $001E(A0)
                tst.b   $002C(A0)
                bne.s   Offset_0x03036E
                move.w  D0, $0016(A0)
                move.w  D1, $0018(A0)
                move.w  D1, $003A(A0)
                rts
Offset_0x03036E:
                cmpi.w  #$0078, ($FFFFF75C).w
                bgt.s   Offset_0x0303A6
                subq.w  #$01, $0016(A0)
                move.l  $003A(A0), D0
                move.w  $002E(A0), D1
                addi.w  #$0038, $002E(A0)
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D0
                move.l  D0, $003A(A0)
                move.w  $003A(A0), $0018(A0)
                cmpi.w  #$0540, $0018(A0)
                blt.s   Offset_0x0303A6
                move.w  #$0000, $002E(A0)
Offset_0x0303A6:
                rts
Offset_0x0303A8:
                st      $002C(A0)
                subq.w  #$01, ($FFFFF75C).w
                bmi.s   Offset_0x0303B8
                bsr     Boss_Defeated                          ; Offset_0x02D278
                bra.s   Offset_0x0303F2
Offset_0x0303B8:
                move.b  #$03, $000F(A0)
                lea     ($FFFFF740).w, A2
                move.b  #$01, $0004(A2)
                move.b  #$00, $0005(A2)
                move.b  #$00, $0002(A2)
                move.b  #$00, $0003(A2)
                bset    #$00, $0001(A0)
                clr.w   ($FFFFF758).w
                clr.w   ($FFFFF75A).w
                addq.b  #$02, $0026(A0)
                move.w  #$FFEE, ($FFFFF75C).w
Offset_0x0303F2:
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                lea     (ARz_Boss_Animate_Data), A1            ; Offset_0x030900
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x030342
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x030412:
                addq.w  #$01, ($FFFFF75C).w
                beq.s   Offset_0x030422
                bpl.s   Offset_0x030428
                addi.w  #$0018, ($FFFFF75A).w
                bra.s   Offset_0x030456
Offset_0x030422:
                clr.w   ($FFFFF75A).w
                bra.s   Offset_0x030456
Offset_0x030428:
                cmpi.w  #$0018, ($FFFFF75C).w
                bcs.s   Offset_0x030440
                beq.s   Offset_0x030446
                cmpi.w  #$0020, ($FFFFF75C).w
                bcs.s   Offset_0x030456
                addq.b  #$02, $0026(A0)
                bra.s   Offset_0x030456
Offset_0x030440:
                subq.w  #$08, ($FFFFF75A).w
                bra.s   Offset_0x030456
Offset_0x030446:
                clr.w   ($FFFFF75A).w
                jsr     (Boss_Defeated_Music_Restore)          ; Offset_0x00F62C
                jsr     (Boss_Defeated_Load_Flickies)          ; Offset_0x00F636
Offset_0x030456:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x0302A8
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                lea     (ARz_Boss_Animate_Data), A1            ; Offset_0x030900
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x030342
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03047E:
                move.w  #$0400, ($FFFFF758).w
                move.w  #$FFC0, ($FFFFF75A).w
                cmpi.w  #$2C00, ($FFFFEECA).w
                bcc.s   Offset_0x030498
                addq.w  #$02, ($FFFFEECA).w
                bra.s   Offset_0x03049E
Offset_0x030498:
                tst.b   $0001(A0)
                bpl.s   Offset_0x0304C6
Offset_0x03049E:
                bsr     Boss_Sub                               ; Offset_0x02D192
                bsr     Offset_0x0302A8
                move.w  ($FFFFF754).w, $000C(A0)
                move.w  ($FFFFF750).w, $0008(A0)
                lea     (ARz_Boss_Animate_Data), A1            ; Offset_0x030900
                bsr     Boss_AnimateSprite                     ; Offset_0x02D1B8
                bsr     Offset_0x030342
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0304C6:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x0304CC:
                moveq   #$00, D0
                move.l  $002A(A0), A1
                cmpi.b  #$08, $0026(A1)
                blt.s   Offset_0x0304E0
                move.b  #$04, $0025(A0)
Offset_0x0304E0:
                move.b  $0025(A0), D0
                move.w  Offset_0x0304EC(PC, D0), D1
                jmp     Offset_0x0304EC(PC, D1)
Offset_0x0304EC:
                dc.w    Offset_0x0304F6-Offset_0x0304EC
                dc.w    Offset_0x03052A-Offset_0x0304EC
                dc.w    Offset_0x030676-Offset_0x0304EC
                dc.w    Offset_0x0306CC-Offset_0x0304EC
                dc.w    Offset_0x03069A-Offset_0x0304EC
Offset_0x0304F6:
                bsr     Offset_0x0306A8
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x03050E
                move.w  #$00E1, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03050E:
                subq.w  #$01, $000C(A0)
                cmpi.w  #$0488, $000C(A0)
                bgt.s   Offset_0x030524
                addq.b  #$02, $0025(A0)
                move.b  #$00, ($FFFFEEBD).w
Offset_0x030524:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03052A:
                bsr     Offset_0x0306A8
                move.l  $002A(A0), A3
                btst    #$00, $003E(A3)
                beq.s   Offset_0x030560
                tst.b   $0038(A3)
                beq.s   Offset_0x03054A
                btst    #$00, $0001(A0)
                beq.s   Offset_0x030560
                bra.s   Offset_0x030552
Offset_0x03054A:
                btst    #$00, $0001(A0)
                bne.s   Offset_0x030560
Offset_0x030552:
                bclr    #$00, $003E(A3)
                bsr     Offset_0x0305DA
                st      $0038(A0)
Offset_0x030560:
                bsr     Offset_0x03056A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03056A:
                tst.b   $0038(A0)
                beq.s   Offset_0x0305D4
                tst.w   $0030(A0)
                bgt.s   Offset_0x03057C
                move.w  #$001F, $0030(A0)
Offset_0x03057C:
                subq.w  #$01, $0030(A0)
                bgt.s   Offset_0x0305A8
                sf      $0038(A0)
                move.w  #$0000, $0030(A0)
                tst.b   $0038(A3)
                bne.s   Offset_0x03059A
                move.w  #$2A50, $0008(A0)
                bra.s   Offset_0x0305A0
Offset_0x03059A:
                move.w  #$2B70, $0008(A0)
Offset_0x0305A0:
                move.w  #$0488, $000C(A0)
                bra.s   Offset_0x0305D4
Offset_0x0305A8:
                move.w  #$2A50, D1
                tst.b   $0038(A3)
                beq.s   Offset_0x0305B6
                move.w  #$2B70, D1
Offset_0x0305B6:
                move.b  ($FFFFFE0F).w, D0
                andi.w  #$0001, D0
                add.w   D0, D0
                add.w   Offset_0x0305D6(PC, D0), D1
                move.w  D1, $0008(A0)
                move.w  #$0488, D1
                add.w   Offset_0x0305D6(PC, D0), D1
                move.w  D1, $000C(A0)
Offset_0x0305D4:
                rts
Offset_0x0305D6:                
                dc.w    $0001, $FFFF
Offset_0x0305DA:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne     Offset_0x03066C
                move.b  #$89, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$04, $000A(A1)
                move.b  #$08, $0025(A1)
                move.l  #ARz_Boss_Arrows_Launcher_Mappings, $0004(A1) ; Offset_0x0308A0
                move.w  #$03E0, $0002(A1)
                ori.b   #$04, $0001(A1)
                moveq   #$00, D6
                move.b  #$02, $001A(A1)
                move.w  #$2A6A, $0008(A1)
                tst.b   $0038(A3)
                beq.s   Offset_0x03062C
                st      D6
                move.w  #$2B56, $0008(A1)
                bset    #$00, $0001(A1)
Offset_0x03062C:
                move.w  #$0028, $0030(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                andi.w  #$0003, D0
                add.w   D0, D0
                move.w  Arrows_Target(PC, D0), $000C(A1)       ; Offset_0x03066E
                move.l  A1, A2
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03066C
                move.b  #$89, $0000(A1)    ; Nova instância do objeto na memória
                move.b  #$04, $000A(A1)
                move.b  #$06, $0025(A1)
                move.l  A2, $0034(A1)
                move.b  D6, $0028(A1)
                move.l  A3, $0038(A1)
Offset_0x03066C:
                rts
Arrows_Target: ; Offset_0x03066E:
                dc.w    $0458, $0478, $0498, $04B8
Offset_0x030676:
                move.b  #$01, ($FFFFEEBD).w
                addq.w  #$01, $000C(A0)
                cmpi.w  #$0510, $000C(A0)
                blt.s   Offset_0x030694
                move.b  #$00, ($FFFFEEBD).w
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x030694:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03069A:
                subq.w  #$01, $0030(A0)
                beq     Offset_0x0307FE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0306A8:
                move.w  #$0023, D1
                move.w  #$0044, D2
                move.w  #$0045, D3
                move.w  $0008(A0), D4
                move.w  $000C(A0), -(A7)
                addq.w  #$04, $000C(A0)
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  (A7)+, $000C(A0)
                rts
Offset_0x0306CC:
                moveq   #$00, D0
                move.l  $0038(A0), A1
                cmpi.b  #$08, $0026(A1)
                blt.s   Offset_0x0306E0
                move.b  #$06, $002A(A0)
Offset_0x0306E0:
                move.b  $002A(A0), D0
                move.w  Offset_0x0306EC(PC, D0), D1
                jmp     Offset_0x0306EC(PC, D1)
Offset_0x0306EC:
                dc.w    Offset_0x0306F6-Offset_0x0306EC
                dc.w    Offset_0x030764-Offset_0x0306EC
                dc.w    Offset_0x0307B8-Offset_0x0306EC
                dc.w    Offset_0x0307E0-Offset_0x0306EC
                dc.w    Offset_0x0307FE-Offset_0x0306EC
Offset_0x0306F6:
                move.l  #ARz_Boss_Arrows_Launcher_Mappings, $0004(A0) ; Offset_0x0308A0
                move.w  #$03E0, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$90, $000E(A0)
                move.b  #$04, $0018(A0)
                addq.b  #$02, $002A(A0)
                move.l  $0034(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.w  #$0004, $0012(A0)
                move.b  #$04, $001A(A0)
                addi.w  #$0009, $000C(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x030756
                bset    #$00, $0022(A0)
                bset    #$00, $0001(A0)
                move.w  #$FFFD, $0010(A0)
                bra.s   Offset_0x03075C
Offset_0x030756:
                move.w  #$0003, $0010(A0)
Offset_0x03075C:
                move.b  #$B0, $0020(A0)
                rts
Offset_0x030764:
                btst    #$07, $0022(A0)
                beq.s   Offset_0x030772
                move.b  #$08, $002A(A0)
Offset_0x030772:
                move.w  $0008(A0), D0
                add.w   $0010(A0), D0
                tst.w   $0010(A0)
                bpl.s   Offset_0x03078C
                cmpi.w  #$2A77, D0
                bgt.s   Offset_0x0307AE
                move.w  #$2A77, D0
                bra.s   Offset_0x030796
Offset_0x03078C:
                cmpi.w  #$2B49, D0
                blt.s   Offset_0x0307AE
                move.w  #$2B49, D0
Offset_0x030796:
                addq.b  #$02, $002A(A0)
                move.w  D0, $0008(A0)
                move.b  #$DD, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0307AE:
                move.w  D0, $0008(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0307B8:
                move.b  #$00, $0020(A0)
                btst    #$07, $0022(A0)
                beq.s   Offset_0x0307CA
                addq.b  #$02, $002A(A0)
Offset_0x0307CA:
                bsr     Offset_0x030804
                lea     (Pillars_Animate_Data), A1             ; Offset_0x030864
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0307E0:
                bsr     Offset_0x03083C
                move.w  $000C(A0), D0
                add.w   $0012(A0), D0
                cmpi.w  #$04F0, D0
                bgt     Offset_0x0307FE
                move.w  D0, $000C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0307FE:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x030804:
                tst.w   $0030(A0)
                bne.s   Offset_0x03082E
                move.w  #$001B, D1
                move.w  #$0001, D2
                move.w  #$0002, D3
                move.w  $0008(A0), D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                btst    #$03, $0022(A0)
                beq.s   Offset_0x03083A
                move.w  #$001F, $0030(A0)
Offset_0x03082E:
                subq.w  #$01, $0030(A0)
                bne.s   Offset_0x03083A
                move.b  #$06, $002A(A0)
Offset_0x03083A:
                rts
Offset_0x03083C:
                bclr    #$03, $0022(A0)
                beq.s   Offset_0x03084A
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x030856
Offset_0x03084A:
                bclr    #$04, $0022(A0)
                beq.s   Offset_0x030862
                lea     ($FFFFB040).w, A1
Offset_0x030856:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
Offset_0x030862:
                rts     
;-------------------------------------------------------------------------------                
Pillars_Animate_Data: ; Offset_0x030864:
                dc.w    Offset_0x030868-Pillars_Animate_Data
                dc.w    Offset_0x030880-Pillars_Animate_Data
Offset_0x030868:
                dc.b    $01, $04, $06, $05, $04, $06, $04, $05, $04, $06, $04, $04, $06, $05, $04, $06
                dc.b    $04, $05, $04, $06, $04, $FD, $01, $00
Offset_0x030880:
                dc.b    $0F, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04
                dc.b    $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $04, $F9
;-------------------------------------------------------------------------------
ARz_Boss_Arrows_Launcher_Mappings: ; Offset_0x0308A0:
                dc.w    Offset_0x0308AE-ARz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x0308D8-ARz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x0308D8-ARz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x0308E2-ARz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x0308E2-ARz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x0308EC-ARz_Boss_Arrows_Launcher_Mappings
                dc.w    Offset_0x0308F6-ARz_Boss_Arrows_Launcher_Mappings
Offset_0x0308AE:
                dc.w    $0005
                dc.l    $280F2088, $20440000, $080F2088, $20440000
                dc.l    $E80F2088, $20440000, $C80F2088, $20440000
                dc.l    $C00C2084, $20420000
Offset_0x0308D8:
                dc.w    $0001
                dc.l    $FC042098, $204CFFF8
Offset_0x0308E2:
                dc.w    $0001
                dc.l    $FC0C209A, $204DFFF0
Offset_0x0308EC:
                dc.w    $0001
                dc.l    $FC0C209E, $204FFFF0
Offset_0x0308F6:
                dc.w    $0001
                dc.l    $FC0C20A2, $2051FFF0
;-------------------------------------------------------------------------------
ARz_Boss_Animate_Data: ; Offset_0x030900:
                dc.w    ARz_Robotnik_Faces-ARz_Boss_Animate_Data ; Offset_0x03090C
                dc.w    Arz_Ship_Boost-ARz_Boss_Animate_Data     ; Offset_0x030922
                dc.w    ARz_Hammer_Start-ARz_Boss_Animate_Data   ; Offset_0x030926
                dc.w    ARz_Hammer_Usage-ARz_Boss_Animate_Data   ; Offset_0x03092A
                dc.w    ARz_Hammer_Fall-ARz_Boss_Animate_Data    ; Offset_0x030936
                dc.w    Offset_0x03093A-ARz_Boss_Animate_Data
ARz_Robotnik_Faces: ; Offset_0x03090C:
                dc.b    $07, $00, $01, $FF, $02, $03, $02, $03, $02, $03, $02, $03, $FF, $04, $04, $04
                dc.b    $04, $04, $04, $04, $04, $FF
Arz_Ship_Boost: ; Offset_0x030922:
                dc.b    $01, $06, $07, $FF
ARz_Hammer_Start: ; Offset_0x030926:
                dc.b    $0F, $09, $FF, $00
ARz_Hammer_Usage: ; Offset_0x03092A:
                dc.b    $02, $0A, $0A, $0B, $0B, $0B, $0B, $0B, $0A, $0A, $FD, $02
ARz_Hammer_Fall: ; Offset_0x030936:
                dc.b    $0F, $08, $FF, $00
Offset_0x03093A:
                dc.b    $07, $05, $FF, $00
;-------------------------------------------------------------------------------
ARz_Boss_Ship_Mappings: ; Offset_0x03093E:
                dc.w    Offset_0x030956-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x030968-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x03097A-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x03098C-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x03099E-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x0309B0-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x0309C2-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x0309D4-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x0309E6-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x030A20-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x030A4A-ARz_Boss_Ship_Mappings
                dc.w    Offset_0x030A74-ARz_Boss_Ship_Mappings
Offset_0x030956:
                dc.w    $0002
                dc.l    $E80D0150, $00A8FFE8, $E8050148, $00A4FFD8
Offset_0x030968:
                dc.w    $0002
                dc.l    $E80D0158, $00ACFFE8, $E8050148, $00A4FFD8
Offset_0x03097A:
                dc.w    $0002
                dc.l    $E80D0160, $00B0FFE8, $E805014C, $00A6FFD8
Offset_0x03098C:
                dc.w    $0002
                dc.l    $E80D0168, $00B4FFE8, $E805014C, $00A6FFD8
Offset_0x03099E:
                dc.w    $0002
                dc.l    $E80D0170, $00B8FFE8, $E805014C, $00A6FFD8
Offset_0x0309B0:
                dc.w    $0002
                dc.l    $E80D0178, $00BCFFE8, $E805014C, $00A6FFD8
Offset_0x0309C2:
                dc.w    $0002
                dc.l    $1805007E, $003FFFE8, $1805007E, $003F0008
Offset_0x0309D4:
                dc.w    $0002
                dc.l    $18040082, $0041FFE8, $18040082, $00410008
Offset_0x0309E6:
                dc.w    $0007
                dc.l    $D8050140, $00A0FFFA, $E8050144, $00A20008
                dc.l    $0000206F, $2037FFD0, $F8062070, $2038FFD8
                dc.l    $F80F2128, $2094FFE8, $F8072076, $203BFFE8
                dc.l    $F8072076, $203B0008
Offset_0x030A20:
                dc.w    $0005
                dc.l    $EA0F2000, $2000FF9C, $D20A2010, $2008FFA4
                dc.l    $D20B2019, $200CFFBC, $F2052025, $2012FFBC
                dc.l    $F8052065, $2032FFC0
Offset_0x030A4A:
                dc.w    $0005
                dc.l    $F10F2029, $2014FF9D, $D90A2039, $201CFFA5
                dc.l    $D9072042, $2021FFBD, $F902204A, $2025FFBD
                dc.l    $F8052069, $2034FFC0
Offset_0x030A74:
                dc.w    $0003
                dc.l    $EC0F204D, $2026FFA0, $0C0D205D, $202EFFA0
                dc.l    $0004206D, $2036FFC0                              
;===============================================================================
; Objeto 0x89 - Chefe na Aquatic Ruin
; [ Término ]
;===============================================================================