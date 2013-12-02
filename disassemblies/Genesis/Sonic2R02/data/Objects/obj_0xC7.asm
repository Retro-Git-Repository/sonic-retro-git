;===============================================================================
; Objeto 0xC7 - Robotnik gigante na última batalha do jogo na Death Egg 
; [ Início ]
;===============================================================================      
Offset_0x03D252:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03D260(PC, D0), D1
                jmp     Offset_0x03D260(PC, D1)
Offset_0x03D260:
                dc.w    Offset_0x03D282-Offset_0x03D260
                dc.w    Offset_0x03D292-Offset_0x03D260
                dc.w    Offset_0x03D7BE-Offset_0x03D260
                dc.w    Offset_0x03D7F6-Offset_0x03D260
                dc.w    Offset_0x03D822-Offset_0x03D260
                dc.w    Offset_0x03D92C-Offset_0x03D260
                dc.w    Offset_0x03D958-Offset_0x03D260
                dc.w    Offset_0x03D984-Offset_0x03D260
                dc.w    Offset_0x03DA18-Offset_0x03D260
                dc.w    Offset_0x03DA68-Offset_0x03D260
                dc.w    Offset_0x03DA9A-Offset_0x03D260
                dc.w    Offset_0x03DAF0-Offset_0x03D260
                dc.w    Offset_0x03DB22-Offset_0x03D260
                dc.w    Offset_0x03DC54-Offset_0x03D260
                dc.w    Offset_0x03DCAA-Offset_0x03D260
                dc.w    Offset_0x03DDA0-Offset_0x03D260
                dc.w    Offset_0x03D714-Offset_0x03D260
Offset_0x03D282:
                lea     Offset_0x03E38E(PC), A1
                bsr     ObjectSettings_A1                      ; Offset_0x036028
                move.b  $0028(A0), $0024(A0)
                rts
Offset_0x03D292:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D2A6(PC, D0), D1
                jsr     Offset_0x03D2A6(PC, D1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D2A6:
                dc.w    Offset_0x03D2B6-Offset_0x03D2A6
                dc.w    Offset_0x03D334-Offset_0x03D2A6
                dc.w    Offset_0x03D350-Offset_0x03D2A6
                dc.w    Offset_0x03D37A-Offset_0x03D2A6
                dc.w    Offset_0x03D3C2-Offset_0x03D2A6
                dc.w    Offset_0x03D3D4-Offset_0x03D2A6
                dc.w    Offset_0x03D418-Offset_0x03D2A6
                dc.w    Offset_0x03D66E-Offset_0x03D2A6
Offset_0x03D2B6:
                addq.b  #$02, $0025(A0)
                move.b  #$03, $001A(A0)
                move.b  #$05, $0018(A0)
                lea     (Offset_0x03E35A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E362), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E35E), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E366), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E36A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E36E), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E372), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E376), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E37A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E37E), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03E0DE), A1
                bra     Offset_0x03E0A6
Offset_0x03D334:
                btst    #$02, $0022(A0)
                bne.s   Offset_0x03D33E
                rts
Offset_0x03D33E:
                addq.b  #$02, $0025(A0)
                move.b  #$3C, $001E(A0)
                moveq   #$FFFFFFF9, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03D350:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D358
                rts
Offset_0x03D358:
                addq.b  #$02, $0025(A0)
                move.b  #$79, $001E(A0)
                move.w  #$FF00, $0012(A0)
                move.w  $0038(A0), A1
                move.b  #$04, $0025(A1)
                moveq   #$FFFFFF94, D0
                jmp     (Play_Music)                           ; Offset_0x00131A
Offset_0x03D37A:
                subq.b  #$01, $001E(A0)
                beq.s   Offset_0x03D398
                moveq   #$FFFFFFB7, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Offset_0x03E0DE), A1
                bra     Offset_0x03E0A6
Offset_0x03D398:
                addq.b  #$02, $0025(A0)
                clr.w   $0012(A0)
                move.b  #$1F, $001E(A0)
                move.b  #$16, $0020(A0)
                move.b  #$0C, $0021(A0) ; Contagem de toques para destruir o chefe
                bsr     Offset_0x03DEEA
                move.w  $0038(A0), A1
                move.b  #$06, $0025(A1)
                rts
Offset_0x03D3C2:
                bsr     Offset_0x03DDF2
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D3CE
                rts
Offset_0x03D3CE:
                addq.b  #$02, $0025(A0)
                rts
Offset_0x03D3D4:
                bsr     Offset_0x03DDF2
                addq.b  #$02, $0025(A0)
                move.b  #$20, $001E(A0)
                move.b  $0026(A0), D0
                addq.b  #$01, D0
                move.b  D0, $0026(A0)
                andi.w  #$0003, D0
                move.b  Offset_0x03D414(PC, D0), D0
                move.b  D0, $001C(A0)
                clr.b   $001D(A0)
                cmpi.b  #$02, D0
                bne.s   Offset_0x03D412
                move.w  $0038(A0), A1
                move.b  #$04, $0025(A1)
                move.b  #$02, $001C(A1)
Offset_0x03D412:
                rts
Offset_0x03D414:
                dc.b    $02, $00, $02, $04
Offset_0x03D418:
                bsr     Offset_0x03DDF2
                moveq   #$00, D0
                move.b  $001C(A0), D0
                move.w  Offset_0x03D42A(PC, D0), D1
                jmp     Offset_0x03D42A(PC, D1)
Offset_0x03D42A:
                dc.w    Offset_0x03D43E-Offset_0x03D42A
                dc.w    Offset_0x03D496-Offset_0x03D42A
                dc.w    Offset_0x03D5D8-Offset_0x03D42A
;Offset_0x03D430:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D438
                rts
Offset_0x03D438:
                addq.b  #$02, $001C(A0)
                rts
Offset_0x03D43E:
                moveq   #$00, D0
                move.b  $001D(A0), D0
                move.w  Offset_0x03D44C(PC, D0), D1
                jmp     Offset_0x03D44C(PC, D1)
Offset_0x03D44C:
                dc.w    Offset_0x03D454-Offset_0x03D44C
                dc.w    Offset_0x03D462-Offset_0x03D44C
                dc.w    Offset_0x03D454-Offset_0x03D44C
                dc.w    Offset_0x03D47C-Offset_0x03D44C
Offset_0x03D454:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D45C
                rts
Offset_0x03D45C:
                addq.b  #$02, $001D(A0)
                rts
Offset_0x03D462:
                lea     (Offset_0x03E20A), A1
                bsr     Offset_0x03DFA6
                bne.s   Offset_0x03D470
                rts
Offset_0x03D470:
                addq.b  #$02, $001D(A0)
                move.b  #$40, $001E(A0)
                rts
Offset_0x03D47C:
                lea     (Offset_0x03E22A), A1
                bsr     Offset_0x03DFA6
                bne.s   Offset_0x03D48A
                rts
Offset_0x03D48A:
                subq.b  #$02, $0025(A0)
                move.b  #$40, $001E(A0)
                rts
Offset_0x03D496:
                moveq   #$00, D0
                move.b  $001D(A0), D0
                move.w  Offset_0x03D4A4(PC, D0), D1
                jmp     Offset_0x03D4A4(PC, D1)
Offset_0x03D4A4:
                dc.w    Offset_0x03D454-Offset_0x03D4A4
                dc.w    Offset_0x03D4B4-Offset_0x03D4A4
                dc.w    Offset_0x03D4D8-Offset_0x03D4A4
                dc.w    Offset_0x03D454-Offset_0x03D4A4
                dc.w    Offset_0x03D51C-Offset_0x03D4A4
                dc.w    Offset_0x03D550-Offset_0x03D4A4
                dc.w    Offset_0x03D58C-Offset_0x03D4A4
                dc.w    Offset_0x03D5CA-Offset_0x03D4A4
Offset_0x03D4B4:
                lea     (Offset_0x03E1CE), A1
                bsr     Offset_0x03DFA6
                bne.s   Offset_0x03D4C2
                rts
Offset_0x03D4C2:
                addq.b  #$02, $001D(A0)
                move.b  #$80, $001E(A0)
                clr.w   $0010(A0)
                move.w  #$FE00, $0012(A0)
                rts
Offset_0x03D4D8:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D500
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x03D4F0
                moveq   #$FFFFFFDC, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x03D4F0:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Offset_0x03E0DE), A1
                bra     Offset_0x03E0A6
Offset_0x03D500:
                addq.b  #$02, $001D(A0)
                clr.w   $0012(A0)
                lea     (Offset_0x03E382), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                clr.w   $0010(A0)
                clr.w   $0028(A0)
                rts
Offset_0x03D51C:
                move.w  $0028(A0), D0
                bne.s   Offset_0x03D524
                rts
Offset_0x03D524:
                addq.b  #$02, $001D(A0)
                move.w  D0, $0008(A0)
                bclr    #$00, $0001(A0)
                cmpi.w  #$0780, D0
                bcc.s   Offset_0x03D53E
                bset    #$00, $0001(A0)
Offset_0x03D53E:
                bsr     Offset_0x03DF64
                move.w  #$0800, $0012(A0)
                move.b  #$20, $001E(A0)
                rts
Offset_0x03D550:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D566
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Offset_0x03E0DE), A1
                bra     Offset_0x03E0A6
Offset_0x03D566:
                addq.b  #$02, $001D(A0)
                clr.w   $0012(A0)
                move.b  #$01, ($FFFFEEBD).w
                move.w  #$0040, ($FFFFF660).w
                move.w  $0038(A0), A1
                move.b  #$06, $0025(A1)
                moveq   #$FFFFFFB9, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03D58C:
                lea     (Offset_0x03E108), A1
                bsr     Offset_0x03DFA6
                bne.s   Offset_0x03D59A
                rts
Offset_0x03D59A:
                lea     (Offset_0x03E0DE), A1
                bsr     Offset_0x03E0A6
                bsr     Offset_0x0360FC
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03D5B2
                subq.w  #$02, D0
Offset_0x03D5B2:
                tst.w   D0
                bne.s   Offset_0x03D5BC
                subq.b  #$02, $0025(A0)
                rts
Offset_0x03D5BC:
                addq.b  #$02, $001D(A0)
                move.b  #$60, $001E(A0)
                bra     Offset_0x03DF32
Offset_0x03D5CA:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D5D2
                rts
Offset_0x03D5D2:
                subq.b  #$02, $0025(A0)
                rts
Offset_0x03D5D8:
                moveq   #$00, D0
                move.b  $001D(A0), D0
                move.w  Offset_0x03D5E6(PC, D0), D1
                jmp     Offset_0x03D5E6(PC, D1)
Offset_0x03D5E6:
                dc.w    Offset_0x03D454-Offset_0x03D5E6
                dc.w    Offset_0x03D5F2-Offset_0x03D5E6
                dc.w    Offset_0x03D454-Offset_0x03D5E6
                dc.w    Offset_0x03D63A-Offset_0x03D5E6
                dc.w    Offset_0x03D454-Offset_0x03D5E6
                dc.w    Offset_0x03D654-Offset_0x03D5E6
Offset_0x03D5F2:
                bset    #$06, $0022(A0)
                lea     (Offset_0x03E0F4), A1
                bsr     Offset_0x03DFA6
                bne.s   Offset_0x03D606
                rts
Offset_0x03D606:
                bsr     Offset_0x0360FC
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03D614
                subq.w  #$02, D0
Offset_0x03D614:
                tst.w   D0
                bne.s   Offset_0x03D62A
                addq.b  #$02, $001D(A0)
                move.b  #$40, $001E(A0)
                bset    #$04, $0022(A0)
                rts
Offset_0x03D62A:
                move.b  #$08, $001D(A0)
                move.b  #$20, $001E(A0)
                bra     Offset_0x03DF32
Offset_0x03D63A:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D642
                rts
Offset_0x03D642:
                addq.b  #$02, $001D(A0)
                bset    #$05, $0022(A0)
                move.b  #$40, $001E(A0)
                rts
Offset_0x03D654:
                lea     (Offset_0x03E0FE), A1
                bsr     Offset_0x03DFA6
                bne.s   Offset_0x03D662
                rts
Offset_0x03D662:
                subq.b  #$02, $0025(A0)
                bclr    #$06, $0022(A0)
                rts
Offset_0x03D66E:
                moveq   #$00, D0
                move.b  $001C(A0), D0
                move.w  Offset_0x03D67C(PC, D0), D1
                jmp     Offset_0x03D67C(PC, D1)
Offset_0x03D67C:
                dc.w    Offset_0x03D682-Offset_0x03D67C
                dc.w    Offset_0x03D6C2-Offset_0x03D67C
                dc.w    Offset_0x03D6DE-Offset_0x03D67C
Offset_0x03D682:
                jsr     (Boss_Defeated)                        ; Offset_0x02D278
                jsr     (ObjectFall)                           ; Offset_0x016306
                move.w  $000C(A0), D0
                cmpi.w  #$015C, D0
                bcc.s   Offset_0x03D69A
                rts
Offset_0x03D69A:
                move.w  #$015C, $000C(A0)
                move.w  $0012(A0), D0
                bmi.s   Offset_0x03D6B6
                lsr.w   #$02, D0
                cmpi.w  #$0100, D0
                bcs.s   Offset_0x03D6B6
                neg.w   D0
                move.w  D0, $0012(A0)
                rts
Offset_0x03D6B6:
                addq.b  #$02, $001C(A0)
                move.b  #$40, $001E(A0)
                rts
Offset_0x03D6C2:
                subq.b  #$01, $001E(A0)
                bmi.s   Offset_0x03D6CE
                jmp     (Boss_Defeated)                        ; Offset_0x02D278
Offset_0x03D6CE:
                addq.b  #$02, $001C(A0)
                st      ($FFFFF7CC).w
                move.w  #$1000, ($FFFFEECA).w
                rts
Offset_0x03D6DE:
                move.w  #$0808, ($FFFFF602).w
                cmpi.w  #$0840, ($FFFFEE00).w
                bcc.s   Offset_0x03D6EE
                rts
Offset_0x03D6EE:
                move.b  #$20, $0024(A0)
                clr.b   $0025(A0)
                move.w  #$0020, $002A(A0)
                move.b  #$01, ($FFFFEEBD).w
                move.w  #$1000, ($FFFFF660).w
                move.w  $0036(A0), A1
                jmp     (Delete_A1_Object)                     ; Offset_0x01646E
Offset_0x03D714:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x03D72A
                moveq   #$FFFFFFE1, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                subq.w  #$01, $002A(A0)
Offset_0x03D72A:
                lea     ($FFFFB000).w, A1
                move.w  $0008(A1), D0
                sub.w   $002A(A0), D0
                move.w  D0, $0008(A0)
                move.w  $000C(A1), $000C(A0)
                bsr     Offset_0x03DDB4
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D752(PC, D0), D1
                jmp     Offset_0x03D752(PC, D1)
Offset_0x03D752:
                dc.w    Offset_0x03D756-Offset_0x03D752
                dc.w    Offset_0x03D77C-Offset_0x03D752
Offset_0x03D756:
                lea     ($FFFFB000).w, A1
                cmpi.w  #$0EC0, $0008(A1)
                bcc.s   Offset_0x03D764
                rts
Offset_0x03D764:
                addq.b  #$02, $0025(A0)
                move.w  #$003F, ($FFFFF626).w
                move.b  #$16, $001E(A0)
                move.w  #$7FFF, ($FFFFF634).w
                rts
Offset_0x03D77C:
                subq.b  #$01, $001E(A0)
                beq     Offset_0x03D79A
                move.l  A0, A1
                lea     ($FFFFFB00).w, A0
                moveq   #$3F, D0
Offset_0x03D78C:
                jsr     (Pal_AddColor_2)                       ; Offset_0x00259C
                dbra    D0, Offset_0x03D78C
                move.l  A1, A0
                rts
Offset_0x03D79A:
                move.l  #$0EEE0EEE, D0
                lea     ($FFFFFB00).w, A1
                moveq   #$1F, D6
Offset_0x03D7A6:
                move.l  D0, (A1)+
                dbra    D6, Offset_0x03D7A6
                moveq   #$FFFFFFF9, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.b  #gm_Ending_Sequence, (Game_Mode).w      ; $20, $FFFFF600
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x03D7BE:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D7E0(PC, D0), D1
                jsr     Offset_0x03D7E0(PC, D1)
                lea     Offset_0x03D7E4(PC), A1
                bsr     Offset_0x03E080
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D7E0:
                dc.w    Offset_0x03D7E8-Offset_0x03D7E0
                dc.w    Offset_0x03D7F4-Offset_0x03D7E0
Offset_0x03D7E4:
                dc.b    $00, $0C, $FF, $EC
Offset_0x03D7E8:
                addq.b  #$02, $0025(A0)
                move.b  #$04, $001A(A0)
                rts
Offset_0x03D7F4:
                rts
Offset_0x03D7F6:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D810(PC, D0), D1
                jsr     Offset_0x03D810(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D810:
                dc.w    Offset_0x03D814-Offset_0x03D810
                dc.w    Offset_0x03D820-Offset_0x03D810
Offset_0x03D814:
                addq.b  #$02, $0025(A0)
                move.b  #$0B, $001A(A0)
                rts
Offset_0x03D820:
                rts
Offset_0x03D822:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D846(PC, D0), D1
                jsr     Offset_0x03D846(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                btst    #$06, $0022(A0)
                bne     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D846:
                dc.w    Offset_0x03D850-Offset_0x03D846
                dc.w    Offset_0x03D85C-Offset_0x03D846
                dc.w    Offset_0x03D87C-Offset_0x03D846
                dc.w    Offset_0x03D8E6-Offset_0x03D846
                dc.w    Offset_0x03D910-Offset_0x03D846
Offset_0x03D850:
                addq.b  #$02, $0025(A0)
                move.b  #$06, $001A(A0)
                rts
Offset_0x03D85C:
                move.w  $002C(A0), A1
                bclr    #$04, $0022(A1)
                bne.s   Offset_0x03D86A
                rts
Offset_0x03D86A:
                addq.b  #$02, $0025(A0)
                move.w  #$0010, $002A(A0)
                move.w  $000C(A0), $002E(A0)
                rts
Offset_0x03D87C:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03D88E
                addi.w  #$0020, $0012(A0)
                jmp     (SpeedToPos)                           ; Offset_0x016332
Offset_0x03D88E:
                addq.b  #$02, $0025(A0)
                move.w  #$0020, $002A(A0)
                bsr     Offset_0x0360FC
                tst.w   D2
                bpl.s   Offset_0x03D8A2
                neg.w   D2
Offset_0x03D8A2:
                cmpi.w  #$0100, D2
                bcs.s   Offset_0x03D8AC
                move.w  #$00FF, D2
Offset_0x03D8AC:
                andi.w  #$00C0, D2
                lsr.w   #$05, D2
                move.w  Offset_0x03D8DE(PC, D2), D2
                tst.w   D1
                bne.s   Offset_0x03D8BC
                neg.w   D2
Offset_0x03D8BC:
                move.w  D2, $0012(A0)
                move.w  #$0800, D2
                move.w  $002C(A0), A1
                btst    #$00, $0001(A0)
                bne.s   Offset_0x03D8D2
                neg.w   D2
Offset_0x03D8D2:
                move.w  D2, $0010(A0)
                moveq   #$FFFFFFBC, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03D8DE:
                dc.w    $0200, $0100, $0080, $0000
Offset_0x03D8E6:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03D8F2
                jmp     (SpeedToPos)                           ; Offset_0x016332
Offset_0x03D8F2:
                addq.b  #$02, $0025(A0)
                neg.w   $0010(A0)
                move.w  #$0020, $002A(A0)
                move.w  $002E(A0), D0
                sub.w   $000C(A0), D0
                asl.w   #$03, D0
                move.w  D0, $0012(A0)
                rts
Offset_0x03D910:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03D91C
                jmp     (SpeedToPos)                           ; Offset_0x016332
Offset_0x03D91C:
                move.b  #$02, $0025(A0)
                clr.w   $0010(A0)
                clr.w   $0012(A0)
                rts
Offset_0x03D92C:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D946(PC, D0), D1
                jsr     Offset_0x03D946(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D946:
                dc.w    Offset_0x03D94A-Offset_0x03D946
                dc.w    Offset_0x03D956-Offset_0x03D946
Offset_0x03D94A:
                addq.b  #$02, $0025(A0)
                move.b  #$05, $001A(A0)
                rts
Offset_0x03D956:
                rts
Offset_0x03D958:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D972(PC, D0), D1
                jsr     Offset_0x03D972(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D972:
                dc.w    Offset_0x03D976-Offset_0x03D972
                dc.w    Offset_0x03D982-Offset_0x03D972
Offset_0x03D976:
                addq.b  #$02, $0025(A0)
                move.b  #$0A, $001A(A0)
                rts
Offset_0x03D982:
                rts
Offset_0x03D984:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03D9A6(PC, D0), D1
                jsr     Offset_0x03D9A6(PC, D1)
                lea     Offset_0x03D9B0(PC), A1
                bsr     Offset_0x03E080
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D9A6:
                dc.w    Offset_0x03D9B4-Offset_0x03D9A6
                dc.w    Offset_0x03D9C0-Offset_0x03D9A6
                dc.w    Offset_0x03D9DA-Offset_0x03D9A6
                dc.w    Offset_0x03D9EC-Offset_0x03D9A6
                dc.w    Offset_0x03DA0C-Offset_0x03D9A6
Offset_0x03D9B0:
                dc.w    $0000, $FFCC
Offset_0x03D9B4:
                addq.b  #$02, $0025(A0)
                move.b  #$15, $001A(A0)
                rts
Offset_0x03D9C0:
                move.w  ($FFFFF660).w, A1
                btst    #$03, $0022(A1)
                bne.s   Offset_0x03D9CE
                rts
Offset_0x03D9CE:
                addq.b  #$02, $0025(A0)
                move.w  #$0040, $002A(A0)
                rts
Offset_0x03D9DA:
                lea     (Offset_0x03E398), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D9EC:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03D9F8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03D9F8:
                addq.b  #$02, $0025(A0)
                move.w  $002C(A0), A1
                bset    #$02, $0022(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DA0C:
                move.b  #$FF, $0021(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DA18:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03DA2E(PC, D0), D1
                jsr     Offset_0x03DA2E(PC, D1)
                lea     Offset_0x03DA38(PC), A1
                bra     Offset_0x03E080   
Offset_0x03DA2E:
                dc.w    Offset_0x03DA3C-Offset_0x03DA2E
                dc.w    Offset_0x03DA48-Offset_0x03DA2E
                dc.w    Offset_0x03DA4E-Offset_0x03DA2E
                dc.w    Offset_0x03DA60-Offset_0x03DA2E
                dc.w    Offset_0x03DA48-Offset_0x03DA2E
;-------------------------------------------------------------------------------                 
Offset_0x03DA38:
                dc.w    $0038, $0018
;-------------------------------------------------------------------------------  
Offset_0x03DA3C:
                addq.b  #$02, $0025(A0)
                move.b  #$0C, $001A(A0)
                rts
Offset_0x03DA48:
                move.b  #$03, $001C(A0)
Offset_0x03DA4E:
                lea     (Offset_0x03E3A8), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DA60:
                move.b  #$01, $001C(A0)
                bra.s   Offset_0x03DA4E
Offset_0x03DA68:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03DA82(PC, D0), D1
                jsr     Offset_0x03DA82(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DA82:                
                dc.w    Offset_0x03DA86-Offset_0x03DA82
                dc.w    Offset_0x03DA98-Offset_0x03DA82
Offset_0x03DA86:
                addq.b  #$02, $0025(A0)
                move.b  #$0B, $001A(A0)
                move.b  #$05, $0018(A0)
                rts
Offset_0x03DA98:
                rts
Offset_0x03DA9A:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03DAB4(PC, D0), D1
                jsr     Offset_0x03DAB4(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DAB4:
                dc.w    Offset_0x03DABE-Offset_0x03DAB4
                dc.w    Offset_0x03DAD0-Offset_0x03DAB4
                dc.w    Offset_0x03D87C-Offset_0x03DAB4
                dc.w    Offset_0x03D8E6-Offset_0x03DAB4
                dc.w    Offset_0x03D910-Offset_0x03DAB4
Offset_0x03DABE:
                addq.b  #$02, $0025(A0)
                move.b  #$06, $001A(A0)
                move.b  #$05, $0018(A0)
                rts
Offset_0x03DAD0:
                move.w  $002C(A0), A1
                bclr    #$05, $0022(A1)
                bne.s   Offset_0x03DADE
                rts
Offset_0x03DADE:
                addq.b  #$02, $0025(A0)
                move.w  #$0010, $002A(A0)
                move.w  $000C(A0), $002E(A0)
                rts
Offset_0x03DAF0:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03DB0A(PC, D0), D1
                jsr     Offset_0x03DB0A(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DB0A:
                dc.w    Offset_0x03DB0E-Offset_0x03DB0A
                dc.w    Offset_0x03DB20-Offset_0x03DB0A
Offset_0x03DB0E:
                addq.b  #$02, $0025(A0)
                move.b  #$0A, $001A(A0)
                move.b  #$05, $0018(A0)
                rts
Offset_0x03DB20:
                rts
Offset_0x03DB22:                
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03DB30(PC, D0), D1
                jmp     Offset_0x03DB30(PC, D1)
Offset_0x03DB30:
                dc.w    Offset_0x03DB36-Offset_0x03DB30
                dc.w    Offset_0x03DB7A-Offset_0x03DB30
                dc.w    Offset_0x03DC1A-Offset_0x03DB30
Offset_0x03DB36:
                addq.b  #$02, $0025(A0)
                move.b  #$10, $001A(A0)
                ori.w   #$8000, $0002(A0)
                move.b  #$01, $0018(A0)
                move.w  #$00A0, $002A(A0)
                lea     ($FFFFB000).w, A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                move.w  $0010(A1), $0030(A0)
                move.w  $0012(A1), $0032(A0)
                move.w  #$0018, $0026(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DB7A:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03DBE6
                lea     $0040(A0), A1
                move.l  A1, A2
                move.w  -(A1), $0012(A0)
                move.w  -(A1), $0010(A0)
                moveq   #$02, D6
Offset_0x03DB90:
                move.l  -(A1), -(A2)
                dbra    D6, Offset_0x03DB90
                lea     ($FFFFB000).w, A2
                move.w  $0010(A2), D0
                bne.s   Offset_0x03DBA6
                move.w  $0008(A2), $0008(A0)
Offset_0x03DBA6:
                move.w  D0, (A1)+
                move.w  $0012(A2), D0
                bne.s   Offset_0x03DBB4
                move.w  $000C(A2), $000C(A0)
Offset_0x03DBB4:
                move.w  D0, (A1)+
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Offset_0x03E3EC), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                subq.b  #$01, $0026(A0)
                bpl.s   Offset_0x03DBE0
                subq.b  #$01, $0027(A0)
                move.b  $0027(A0), $0026(A0)
                moveq   #$FFFFFFA8, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03DBE0:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DBE6:
                addq.b  #$02, $0025(A0)
                move.w  #$0040, $002A(A0)
                move.b  #$04, $0026(A0)
                lea     ($FFFFB000).w, A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                lea     (Offset_0x03E386), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                clr.w   $0010(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DC1A:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03DC46
                lea     (Offset_0x03E3EC), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                subq.b  #$01, $0026(A0)
                bpl.s   Offset_0x03DC40
                move.b  #$04, $0026(A0)
                moveq   #$FFFFFFA8, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03DC40:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DC46:
                move.w  $002C(A0), A1
                move.w  $0008(A0), $0028(A1)
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x03DC54:                
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03DC62(PC, D0), D1
                jmp     Offset_0x03DC62(PC, D1)
Offset_0x03DC62:
                dc.w    Offset_0x03DC66-Offset_0x03DC62
                dc.w    Offset_0x03DC88-Offset_0x03DC62
Offset_0x03DC66:
                addq.b  #$02, $0025(A0)
                move.b  #$14, $001A(A0)
                move.b  #$01, $0018(A0)
                ori.w   #$8000, $0002(A0)
                move.w  #$0004, $002A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DC88:
                move.w  $002C(A0), A1
                tst.b   (A1)
                beq     J_DeleteObject_01                      ; Offset_0x036344
                subq.w  #$01, $002A(A0)
                bne.s   Offset_0x03DCA4
                move.w  #$0004, $002A(A0)
                bchg    #05, $0002(A0)
Offset_0x03DCA4:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DCAA:                
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03DCB8(PC, D0), D1
                jmp     Offset_0x03DCB8(PC, D1)
Offset_0x03DCB8:
                dc.w    Offset_0x03DCC0-Offset_0x03DCB8
                dc.w    Offset_0x03DCEE-Offset_0x03DCB8
                dc.w    Offset_0x03DD26-Offset_0x03DCB8
                dc.w    Offset_0x03DD74-Offset_0x03DCB8
Offset_0x03DCC0:
                addq.b  #$02, $0025(A0)
                move.b  #$0E, $001A(A0)
                move.b  #$89, $0020(A0)
                move.b  #$05, $0018(A0)
                move.b  #$0C, $0019(A0)
                lea     Offset_0x03DCEA(PC), A1
                bsr     Offset_0x03E080
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DCEA:  
                dc.w    $0038, $FFEC
Offset_0x03DCEE:
                move.w  $002C(A0), A1
                btst    #$07, $0022(A1)
                bne.s   Offset_0x03DD3E
                jsr     (ObjectFall)                           ; Offset_0x016306
                move.w  $000C(A0), D0
                cmpi.w  #$0170, D0
                bcc.s   Offset_0x03DD10
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DD10:
                addq.b  #$02, $0025(A0)
                move.w  #$0170, $000C(A0)
                move.w  #$0040, $002A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DD26:
                move.w  $002C(A0), A1
                btst    #$07, $0022(A1)
                bne.s   Offset_0x03DD3E
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03DD3E
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DD3E:
                move.b  #$06, $0025(A0)
                move.l  #Boss_Explosions_Mappings, $0004(A0)   ; Offset_0x02D0BA
                move.w  #$0580, $0002(A0)
                move.b  #$01, $0018(A0)
                move.b  #$07, $001E(A0)
                move.b  #$00, $001A(A0)
                move.w  #Explosion_Sfx, D0      ; $00C4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DD74:
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x03DD9A
                move.b  #$07, $001E(A0)
                addq.b  #$01, $001A(A0)
                cmpi.b  #$05, $001A(A0)
                bcs.s   Offset_0x03DD9A
                clr.b   $0020(A0)
                cmpi.b  #$07, $001A(A0)
                beq     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x03DD9A:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DDA0:                
                subq.w  #$01, $002A(A0)
                bmi     J_DeleteObject_01                      ; Offset_0x036344
                jsr     (ObjectFall)                           ; Offset_0x016306
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03DDB4:                 
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03DDF0
                move.b  #$58, $0000(A1)      ; Carrega o objeto 0x58 - Explosões
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.w  D0, D1
                moveq   #$00, D1
                move.b  D0, D1
                lsr.b   #$02, D1
                subi.w  #$0030, D1
                add.w   D1, $0008(A1)
                lsr.w   #$08, D0
                lsr.b   #$02, D0
                subi.w  #$0030, D0
                add.w   D0, $000C(A1)
Offset_0x03DDF0:
                rts
Offset_0x03DDF2:                
                tst.b   $0021(A0)
                beq.s   Offset_0x03DE54
                tst.b   $002A(A0)
                bne.s   Offset_0x03DE28
                tst.b   $0020(A0)
                beq.s   Offset_0x03DE18
                move.w  $0036(A0), A1
                tst.b   $0020(A1)
                bne.s   Offset_0x03DE52
                clr.b   $0020(A0)
                subq.b  #$01, $0021(A0)
                beq.s   Offset_0x03DE54
Offset_0x03DE18:
                move.b  #$3C, $002A(A0)
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03DE28:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x03DE36
                move.w  #$0EEE, D0
Offset_0x03DE36:
                move.w  D0, (A1)
                subq.b  #$01, $002A(A0)
                bne.s   Offset_0x03DE52
                clr.w   ($FFFFFB22).w
                move.b  #$16, $0020(A0)
                move.w  $0036(A0), A1
                move.b  #$2A, $0020(A1)
Offset_0x03DE52:
                rts
Offset_0x03DE54:
                moveq   #$64, D0
                bsr     Add_Points_Player_One                  ; Offset_0x040A5C
                clr.b   $001E(A0)
                move.b  #$0E, $0025(A0)
                bset    #$07, $0022(A0)
                clr.b   $001C(A0)
                clr.b   $0020(A0)
                clr.w   $0010(A0)
                clr.w   $0012(A0)
                bsr     Offset_0x03DF1A
                bsr     Offset_0x03DE90
                move.w  $0038(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                addq.w  #$04, A7
                rts
Offset_0x03DE90:
                lea     (Offset_0x03DEE2), A1
                lea     Offset_0x03DEC2(PC), A2
                moveq   #$00, D0
                moveq   #$07, D6
Offset_0x03DE9E:
                move.b  (A1)+, D0
                move.w  $00(A0, D0), A3
                move.b  #$1E, $0024(A3)
                clr.b   $0025(A3)
                move.w  #$0080, $002A(A3)
                move.w  (A2)+, $0010(A3)
                move.w  (A2)+, $0012(A3)
                dbra    D6, Offset_0x03DE9E
                rts
Offset_0x03DEC2:
                dc.w    $0200, $FC00, $FF00, $FF00, $0300, $FD00, $FF00, $FC00
                dc.w    $0180, $FE00, $FE00, $FD00, $0000, $FC00, $0100, $FD00
Offset_0x03DEE2:
                dc.b    $2C, $2E, $30, $32, $34, $3A, $3C, $3E  
Offset_0x03DEEA:
                lea     Offset_0x03DF10(PC), A1
                lea     Offset_0x03DF06(PC), A2
                moveq   #$00, D0
                moveq   #$09, D6
Offset_0x03DEF6:
                move.b  (A1)+, D0
                move.w  $00(A0, D0), A3
                move.b  (A2)+, $0020(A3)
                dbra    D6, Offset_0x03DEF6
                rts
Offset_0x03DF06:
                dc.b    $00, $8F, $9C, $00, $86, $2A, $8B, $8F, $9C, $8B
Offset_0x03DF10:
                dc.b    $2C, $2E, $30, $32, $34, $36, $38, $3A, $3C, $3E
Offset_0x03DF1A:
                lea     Offset_0x03DF10(PC), A1
                moveq   #$00, D0
                moveq   #$09, D6
Offset_0x03DF22:
                move.b  (A1)+, D0
                move.w  $00(A0, D0), A3
                clr.b   $0020(A3)
                dbra    D6, Offset_0x03DF22
                rts
Offset_0x03DF32:                
                lea     Offset_0x03DF5C(PC), A3
                moveq   #$01, D6
Offset_0x03DF38:
                lea     (Offset_0x03E38A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  (A3)+, D0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03DF4E
                neg.w   D0
Offset_0x03DF4E:
                move.w  D0, $0010(A1)
                move.w  (A3)+, $0012(A1)
                dbra    D6, Offset_0x03DF38
                rts
Offset_0x03DF5C:
                dc.w    $0060, $F800, $00C0, $F600
Offset_0x03DF64:
                move.b  $0001(A0), D0
                andi.b  #$01, D0
                moveq   #$00, D1
                lea     Offset_0x03DF9A(PC), A1
Offset_0x03DF72:
                move.b  (A1)+, D1
                beq     Exit_Sub_01                            ; Offset_0x037512
                move.w  $00(A0, D1), A2
                move.b  $0001(A2), D2
                andi.b  #$FE, D2
                or.b    D0, D2
                move.b  D2, $0001(A2)
                move.b  $0022(A2), D2
                andi.b  #$FE, D2
                or.b    D0, D2
                move.b  D2, $0022(A2)
                bra.s   Offset_0x03DF72
Offset_0x03DF9A:
                dc.b    $2C, $2E, $30, $32, $34, $36, $38, $3A, $3C, $3E, $00, $00
Offset_0x03DFA6:
                move.l  (A1)+, A2
                moveq   #$00, D0
                move.b  $001B(A0), D0
                move.b  $00(A1, D0), D0
                move.b  D0, D1
                moveq   #$00, D4
                andi.w  #$00C0, D1
                beq.s   Offset_0x03DFC0
                bsr     Offset_0x03E03A
Offset_0x03DFC0:
                add.w   D0, D0
                adda.w  $00(A2, D0), A2
                move.b  (A2)+, D0
                move.b  (A2)+, D3
                move.b  $001F(A0), D2
                addq.b  #$01, D2
                cmp.b   D3, D2
                bcs.s   Offset_0x03DFDA
                addq.b  #$01, $001B(A0)
                moveq   #$00, D2
Offset_0x03DFDA:
                move.b  D2, $001F(A0)
                moveq   #$00, D5
Offset_0x03DFE0:
                move.b  (A2)+, D5
                move.w  $00(A0, D5), A3
                tst.w   D5
                bne.s   Offset_0x03DFEC
                move.l  A0, A3
Offset_0x03DFEC:
                move.l  $0008(A3), D2
                move.b  (A2)+, D1
                ext.w   D1
                asl.w   #$04, D1
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03E000
                neg.w   D1
Offset_0x03E000:
                tst.w   D4
                beq.s   Offset_0x03E006
                neg.w   D1
Offset_0x03E006:
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D2
                move.l  D2, $0008(A3)
                move.l  $000C(A3), D3
                move.b  (A2)+, D1
                ext.w   D1
                asl.w   #$04, D1
                tst.w   D4
                beq.s   Offset_0x03E020
                neg.w   D1
Offset_0x03E020:
                ext.l   D1
                asl.l   #$08, D1
                add.l   D1, D3
                move.l  D3, $000C(A3)
                dbra    D0, Offset_0x03DFE0
                moveq   #$00, D1
                rts
Offset_0x03E032:                 
                clr.b   $001B(A0)
                moveq   #$01, D1
Offset_0x03E038:                
                rts
Offset_0x03E03A:
                andi.b  #$3F, D0
                rol.b   #$03, D1
                move.w  Offset_0x03E048-$02(PC, D1), D1
                jmp     Offset_0x03E048(PC, D1)
Offset_0x03E048:                
                dc.w    Offset_0x03E04E-Offset_0x03E048
                dc.w    Offset_0x03E078-Offset_0x03E048
                dc.w    Offset_0x03E07C-Offset_0x03E048
Offset_0x03E04E:
                tst.b   $001F(A0)
                bne.s   Offset_0x03E038
                move.b  $001B(A0), D1
                addq.b  #$01, D1
                move.b  $00(A1, D1), D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.b  #$01, D1
                move.b  D1, $001B(A0)
                move.b  $00(A1, D1), D0
                move.b  D0, D1
                andi.b  #$C0, D1
                bne.s   Offset_0x03E03A
                rts
Offset_0x03E078:
                moveq   #$01, D4
                rts
Offset_0x03E07C:
                addq.w  #$04, A7
                bra.s   Offset_0x03E032
Offset_0x03E080:
                move.w  $002C(A0), A2
                move.w  $0008(A2), D0
                move.w  (A1)+, D1
                btst    #$00, $0001(A2)
                beq.s   Offset_0x03E094
                neg.w   D1
Offset_0x03E094:
                add.w   D1, D0
                move.w  D0, $0008(A0)
                move.w  $000C(A2), D0
                add.w   (A1)+, D0
                move.w  D0, $000C(A0)
                rts
Offset_0x03E0A6:                
                moveq   #$00, D0
                moveq   #$00, D6
                move.b  (A1)+, D6
Offset_0x03E0AC:
                move.b  (A1)+, D0
                move.w  $00(A0, D0), A2
                move.w  $0008(A0), D1
                move.b  (A1)+, D2
                ext.w   D2
                btst    #$00, $0001(A0)
                beq.s   Offset_0x03E0C4
                neg.w   D2
Offset_0x03E0C4:
                add.w   D2, D1
                move.w  D1, $0008(A2)
                move.w  $000C(A0), D1
                move.b  (A1)+, D2
                ext.w   D2
                add.w   D2, D1
                move.w  D1, $000C(A2)
                dbra    D6, Offset_0x03E0AC
                rts   
;-------------------------------------------------------------------------------                    
Offset_0x03E0DE:  
                dc.b    $06, $2E, $FC, $3C, $30, $F4, $08, $32, $0C, $F8, $34, $04, $24, $3A, $FC, $3C
                dc.b    $3C, $F4, $08, $3E, $04, $24                            
;-------------------------------------------------------------------------------    
Offset_0x03E0F4:
                dc.l    Offset_0x03E116
                dc.b    $00, $01, $02, $03, $FF, $00
;-------------------------------------------------------------------------------    
Offset_0x03E0FE:
                dc.l    Offset_0x03E116
                dc.b    $05, $06, $07, $08, $FF, $00 
;------------------------------------------------------------------------------- 
Offset_0x03E108:
                dc.l    Offset_0x03E116
                dc.b    $00, $01, $02, $03, $04, $05, $06, $07, $08, $C0      
;-------------------------------------------------------------------------------  
Offset_0x03E116:         
                dc.w    Offset_0x03E128-Offset_0x03E116
                dc.w    Offset_0x03E13C-Offset_0x03E116
                dc.w    Offset_0x03E150-Offset_0x03E116
                dc.w    Offset_0x03E164-Offset_0x03E116
                dc.w    Offset_0x03E178-Offset_0x03E116
                dc.w    Offset_0x03E17E-Offset_0x03E116
                dc.w    Offset_0x03E192-Offset_0x03E116
                dc.w    Offset_0x03E1A6-Offset_0x03E116
                dc.w    Offset_0x03E1BA-Offset_0x03E116
Offset_0x03E128:
                dc.b    $05, $08, $00, $E0, $0C, $30, $E0, $0C, $32, $E0, $0C, $3C, $E0, $0C, $34, $F8
                dc.b    $04, $3E, $F8, $04
Offset_0x03E13C:
                dc.b    $05, $08, $00, $EC, $14, $30, $EC, $14, $32, $EC, $14, $3C, $EC, $14, $34, $FA
                dc.b    $06, $3E, $FA, $06
Offset_0x03E150:
                dc.b    $05, $08, $00, $F8, $14, $30, $F8, $14, $32, $F8, $14, $3C, $F8, $14, $34, $FE
                dc.b    $04, $3E, $FE, $04
Offset_0x03E164:
                dc.b    $05, $08, $00, $FC, $0C, $30, $FC, $0C, $32, $FC, $0C, $3C, $FC, $0C, $34, $00
                dc.b    $02, $3E, $00, $02
Offset_0x03E178:
                dc.b    $00, $08, $00, $00, $00, $00
Offset_0x03E17E:
                dc.b    $05, $08, $00, $04, $E8, $30, $04, $E8, $32, $04, $E8, $3C, $04, $E8, $34, $02
                dc.b    $FA, $3E, $02, $FA
Offset_0x03E192:
                dc.b    $05, $08, $00, $0C, $E8, $30, $0C, $E8, $32, $0C, $E8, $3C, $0C, $E8, $34, $04
                dc.b    $FC, $3E, $04, $FC
Offset_0x03E1A6:
                dc.b    $05, $08, $00, $18, $F4, $30, $18, $F4, $32, $18, $F4, $3C, $18, $F4, $34, $04
                dc.b    $FC, $3E, $04, $FC
Offset_0x03E1BA:
                dc.b    $05, $08, $00, $18, $FC, $30, $18, $FC, $32, $18, $FC, $3C, $18, $FC, $34, $06
                dc.b    $FE, $3E, $06, $FE
;-------------------------------------------------------------------------------  
Offset_0x03E1CE:
                dc.l    Offset_0x03E1D6
                dc.b    $00, $01, $02, $C0                  
;-------------------------------------------------------------------------------     
Offset_0x03E1D6:
                dc.w    Offset_0x03E1DC-Offset_0x03E1D6
                dc.w    Offset_0x03E1F0-Offset_0x03E1D6
                dc.w    Offset_0x03E1F6-Offset_0x03E1D6
Offset_0x03E1DC:
                dc.b    $05, $10, $00, $00, $04, $30, $00, $04, $32, $00, $04, $3C, $00, $04, $34, $00
                dc.b    $04, $3E, $00, $04
Offset_0x03E1F0:
                dc.b    $00, $10, $00, $00, $00, $00
Offset_0x03E1F6:
                dc.b    $05, $08, $00, $00, $F8, $30, $00, $F8, $32, $00, $F8, $3C, $00, $F8, $34, $00
                dc.b    $F8, $3E, $00, $F8        
;-------------------------------------------------------------------------------
Offset_0x03E20A:
                dc.l    Offset_0x03E236
                dc.b    $00, $01, $02, $03, $40, $BD, $04, $05, $06, $07, $08, $40, $BD, $09, $0A, $01
                dc.b    $02, $03, $40, $BD, $04, $05, $06, $07, $08, $40, $BD, $C0
;-------------------------------------------------------------------------------                  
Offset_0x03E22A:     
                dc.l    Offset_0x03E236
                dc.b    $88, $87, $86, $85, $0B, $40, $BD, $C0            
;-------------------------------------------------------------------------------         
Offset_0x03E236:
                dc.w    Offset_0x03E24E-Offset_0x03E236
                dc.w    Offset_0x03E266-Offset_0x03E236
                dc.w    Offset_0x03E27E-Offset_0x03E236
                dc.w    Offset_0x03E292-Offset_0x03E236
                dc.w    Offset_0x03E2AA-Offset_0x03E236
                dc.w    Offset_0x03E2C2-Offset_0x03E236
                dc.w    Offset_0x03E2D4-Offset_0x03E236
                dc.w    Offset_0x03E2EC-Offset_0x03E236
                dc.w    Offset_0x03E300-Offset_0x03E236
                dc.w    Offset_0x03E318-Offset_0x03E236
                dc.w    Offset_0x03E330-Offset_0x03E236
                dc.w    Offset_0x03E342-Offset_0x03E236
Offset_0x03E24E:
                dc.b    $06, $20, $34, $F8, $F8, $2E, $F8, $F8, $00, $00, $FC, $30, $04, $FB, $32, $03
                dc.b    $FB, $3C, $FC, $FB, $3E, $00, $FE, $00
Offset_0x03E266:
                dc.b    $06, $10, $34, $F0, $FC, $2E, $F0, $FC, $00, $F0, $FC, $30, $F4, $FB, $32, $F3
                dc.b    $FB, $3C, $EC, $FB, $3E, $F8, $00, $00
Offset_0x03E27E:
                dc.b    $05, $10, $34, $F8, $04, $2E, $F8, $04, $00, $F8, $04, $30, $FC, $03, $32, $FB
                dc.b    $03, $3C, $F4, $03
Offset_0x03E292:
                dc.b    $06, $10, $34, $FC, $10, $2E, $F8, $10, $00, $00, $08, $30, $F8, $0A, $32, $FA
                dc.b    $0A, $3C, $08, $0A, $3E, $00, $08, $00
Offset_0x03E2AA:
                dc.b    $06, $20, $34, $FE, $FE, $00, $F4, $FC, $30, $F0, $FD, $32, $F1, $FD, $3C, $F8
                dc.b    $FD, $3E, $EC, $FA, $3A, $E8, $FC, $00
Offset_0x03E2C2:
                dc.b    $04, $20, $3E, $F8, $FC, $3A, $F8, $FC, $30, $FC, $FF, $32, $FD, $FF, $3C, $04
                dc.b    $FF, $00
Offset_0x03E2D4:
                dc.b    $06, $10, $3E, $F0, $FC, $3A, $F0, $FC, $00, $F0, $FC, $30, $EC, $FB, $32, $ED
                dc.b    $FB, $3C, $F4, $FB, $34, $F8, $00, $00
Offset_0x03E2EC:
                dc.b    $05, $10, $3E, $F8, $04, $3A, $F8, $04, $00, $F8, $04, $30, $F4, $03, $32, $F5
                dc.b    $03, $3C, $FC, $03
Offset_0x03E300:
                dc.b    $06, $10, $3E, $FC, $10, $3A, $F8, $10, $00, $00, $08, $30, $08, $0A, $32, $06
                dc.b    $0A, $3C, $F8, $0A, $34, $00, $08, $00
Offset_0x03E318:
                dc.b    $06, $20, $3E, $FE, $FE, $00, $F4, $FC, $30, $F8, $FD, $32, $F7, $FD, $3C, $F1
                dc.b    $FD, $34, $EC, $FA, $2E, $E8, $FC, $00
Offset_0x03E330:
                dc.b    $04, $20, $34, $F8, $FC, $2E, $F8, $FC, $30, $04, $FF, $32, $03, $FF, $3C, $FC
                dc.b    $FF, $00
Offset_0x03E342:
                dc.b    $06, $10, $3E, $00, $08, $3A, $00, $08, $00, $00, $08, $30, $00, $08, $32, $00
                dc.b    $08, $3C, $00, $08, $34, $00, $08, $00   
;-------------------------------------------------------------------------------                                         
Offset_0x03E35A:
                dc.w    $002C, $C704
;-------------------------------------------------------------------------------  
Offset_0x03E35E:
                dc.w    $002E, $C706
;------------------------------------------------------------------------------- 
Offset_0x03E362:
                dc.w    $0030, $C708
;-------------------------------------------------------------------------------
Offset_0x03E366:
                dc.w    $0032, $C70A 
;-------------------------------------------------------------------------------    
Offset_0x03E36A:
                dc.w    $0034, $C70C 
;-------------------------------------------------------------------------------  
Offset_0x03E36E:
                dc.w    $0036, $C70E
;-------------------------------------------------------------------------------  
Offset_0x03E372:
                dc.w    $0038, $C710
;-------------------------------------------------------------------------------                  
Offset_0x03E376:
                dc.w    $003A, $C712
;-------------------------------------------------------------------------------                  
Offset_0x03E37A:
                dc.w    $003C, $C714
;-------------------------------------------------------------------------------                  
Offset_0x03E37E:
                dc.w    $003E, $C716
;-------------------------------------------------------------------------------                  
Offset_0x03E382:
                dc.w    $0010, $C718
;-------------------------------------------------------------------------------  
Offset_0x03E386:
                dc.w    $0010, $C71A
;-------------------------------------------------------------------------------                  
Offset_0x03E38A:
                dc.w    $0010, $C71C                                       
;-------------------------------------------------------------------------------                 
Offset_0x03E38E:     
                dc.l    Final_Boss_Mappings                    ; Offset_0x03E3F6
                dc.w    $0330
                dc.b    $04, $04, $38, $00                
;-------------------------------------------------------------------------------  
Offset_0x03E398:
                dc.w    Offset_0x03E39A-Offset_0x03E398
Offset_0x03E39A:
                dc.b    $07, $15, $15, $15, $15, $15, $15, $15, $15, $00, $01, $02, $FA, $00
;-------------------------------------------------------------------------------                
Offset_0x03E3A8:
                dc.w    Offset_0x03E3B0-Offset_0x03E3A8
                dc.w    Offset_0x03E3B4-Offset_0x03E3A8
                dc.w    Offset_0x03E3CE-Offset_0x03E3A8
                dc.w    Offset_0x03E3E8-Offset_0x03E3A8
Offset_0x03E3B0:
                dc.b    $01, $0C, $0D, $FF
Offset_0x03E3B4:
                dc.b    $01, $0C, $0D, $0C, $0C, $0D, $0D, $0C, $0C, $0C, $0D, $0D, $0D, $0C, $0C, $0C
                dc.b    $0C, $0C, $0D, $0D, $0D, $0D, $0D, $0D, $FA, $00
Offset_0x03E3CE:
                dc.b    $01, $0D, $0D, $0D, $0D, $0D, $0D, $0C, $0C, $0C, $0C, $0C, $0D, $0D, $0D, $0C
                dc.b    $0C, $0C, $0D, $0D, $0C, $0C, $0D, $0C, $FD, $00
Offset_0x03E3E8:
                dc.b    $00, $0D, $15, $FF
;-------------------------------------------------------------------------------                  
Offset_0x03E3EC:
                dc.w    Offset_0x03E3EE-Offset_0x03E3EC
Offset_0x03E3EE:
                dc.b    $03, $13, $12, $11, $10, $16, $FF, $00                
;-------------------------------------------------------------------------------                  
Final_Boss_Mappings: ; Offset_0x03E3F6:
                dc.w    Offset_0x03E424-Final_Boss_Mappings
                dc.w    Offset_0x03E42E-Final_Boss_Mappings
                dc.w    Offset_0x03E448-Final_Boss_Mappings
                dc.w    Offset_0x03E462-Final_Boss_Mappings
                dc.w    Offset_0x03E4B4-Final_Boss_Mappings
                dc.w    Offset_0x03E4BE-Final_Boss_Mappings
                dc.w    Offset_0x03E4C8-Final_Boss_Mappings
                dc.w    Offset_0x03E4DA-Final_Boss_Mappings
                dc.w    Offset_0x03E4DA-Final_Boss_Mappings
                dc.w    Offset_0x03E4DA-Final_Boss_Mappings
                dc.w    Offset_0x03E4DA-Final_Boss_Mappings
                dc.w    Offset_0x03E4E4-Final_Boss_Mappings
                dc.w    Offset_0x03E516-Final_Boss_Mappings
                dc.w    Offset_0x03E520-Final_Boss_Mappings
                dc.w    Offset_0x03E52A-Final_Boss_Mappings
                dc.w    Offset_0x03E534-Final_Boss_Mappings
                dc.w    Offset_0x03E53E-Final_Boss_Mappings
                dc.w    Offset_0x03E580-Final_Boss_Mappings
                dc.w    Offset_0x03E5C2-Final_Boss_Mappings
                dc.w    Offset_0x03E604-Final_Boss_Mappings
                dc.w    Offset_0x03E646-Final_Boss_Mappings
                dc.w    Offset_0x03E650-Final_Boss_Mappings
                dc.w    Offset_0x03E65A-Final_Boss_Mappings
Offset_0x03E424:
                dc.w    $0001
                dc.l    $F00B0000, $0000000C
Offset_0x03E42E:
                dc.w    $0003
                dc.l    $F00D000C, $0006FFEC, $00090014, $000AFFF4
                dc.l    $F80A001A, $000D000C
Offset_0x03E448:
                dc.w    $0003
                dc.l    $08000023, $0011FFDC, $F80E0024, $0012FFE4
                dc.l    $F80E0030, $00180004
Offset_0x03E462:
                dc.w    $000A
                dc.l    $DC0F203C, $201EFFD4, $DC0F204C, $2026FFF4
                dc.l    $DC0B205C, $202E0014, $DC0B2068, $2034002C
                dc.l    $FC0F2074, $203AFFD4, $FC0F2084, $2042FFF4
                dc.l    $FC0B2094, $204A0014, $FC0920A0, $2050002C
                dc.l    $1C0C20A6, $2053FFE4, $1C0C20AA, $20550004
Offset_0x03E4B4:
                dc.w    $0001
                dc.l    $F00F20AE, $2057FFF0
Offset_0x03E4BE:
                dc.w    $0001
                dc.l    $F40A20BE, $205FFFF4
Offset_0x03E4C8:
                dc.w    $0002
                dc.l    $F40E20C7, $20630000, $F40E20D3, $2069FFE0
Offset_0x03E4DA:
                dc.w    $0001
                dc.l    $F00F20E2, $2071FFF0
Offset_0x03E4E4:
                dc.w    $0006
                dc.l    $E00620F2, $2079FFEB, $E80920F8, $207CFFFB
                dc.l    $F80620FE, $207FFFEE, $100D2104, $2082FFE0
                dc.l    $F80E210C, $2086FFFE, $100D2118, $208C0000
Offset_0x03E516:
                dc.w    $0001
                dc.l    $F4062120, $2090FFF8
Offset_0x03E520:
                dc.w    $0001
                dc.l    $F4052126, $2093FFF8
Offset_0x03E52A:
                dc.w    $0001
                dc.l    $F00F012B, $0095FFF0
Offset_0x03E534:
                dc.w    $0001
                dc.l    $FC00013B, $009DFFFC
Offset_0x03E53E:
                dc.w    $0008
                dc.l    $F005213C, $209EFFF0, $F005293C, $289E0000
                dc.l    $0005313C, $309EFFF0, $0005393C, $389E0000
                dc.l    $E0002144, $20A2FFE0, $E0002944, $28A20018
                dc.l    $18003144, $30A2FFE0, $18003944, $38A20018
Offset_0x03E580:
                dc.w    $0008
                dc.l    $F005213C, $209EFFF0, $F005293C, $289E0000
                dc.l    $0005313C, $309EFFF0, $0005393C, $389E0000
                dc.l    $D8002145, $20A2FFD8, $D8002945, $28A20020
                dc.l    $20003145, $30A2FFD8, $20003945, $38A20020
Offset_0x03E5C2:
                dc.w    $0008
                dc.l    $F005213C, $209EFFF0, $F005293C, $289E0000
                dc.l    $0005313C, $309EFFF0, $0005393C, $389E0000
                dc.l    $D0002146, $20A3FFD0, $D0002946, $28A30028
                dc.l    $28003146, $30A3FFD0, $28003946, $38A30028
Offset_0x03E604:
                dc.w    $0008
                dc.l    $F005213C, $209EFFF0, $F005293C, $289E0000
                dc.l    $0005313C, $309EFFF0, $0005393C, $389E0000
                dc.l    $C800212A, $2095FFC8, $C800292A, $28950030
                dc.l    $3000312A, $3095FFC8, $3000392A, $38950030
Offset_0x03E646:
                dc.w    $0001
                dc.l    $F8050140, $00A0FFF8
Offset_0x03E650:
                dc.w    $0001
                dc.l    $00000004, $00020000
Offset_0x03E65A:
                dc.w    $0008
                dc.l    $F005213C, $209EFFF0, $F005293C, $289E0000
                dc.l    $0005313C, $309EFFF0, $0005393C, $389E0000
                dc.l    $E8002144, $20A2FFE8, $E8002944, $28A20010
                dc.l    $10003144, $30A2FFE8, $10003944, $38A20010                                                                                                                                                                               
;===============================================================================
; Objeto 0xC7 - Robotnik gigante na última batalha do jogo na Death Egg
; [ Término ]
;===============================================================================