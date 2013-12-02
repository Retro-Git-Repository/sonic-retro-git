;===============================================================================
; Objeto 0xB2 - Tornado na Wing Fortress / Sky Chase (Avião do Sonic)
; [ Início ]                                                                      
;===============================================================================
Offset_0x03A3A8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03A3B6(PC, D0), D1
                jmp     Offset_0x03A3B6(PC, D1)
Offset_0x03A3B6:
                dc.w    Offset_0x03A3C6-Offset_0x03A3B6
                dc.w    Offset_0x03A3F8-Offset_0x03A3B6
                dc.w    Offset_0x03A4BA-Offset_0x03A3B6
                dc.w    Offset_0x03A580-Offset_0x03A3B6
                dc.w    Offset_0x03A8A0-Offset_0x03A3B6
                dc.w    Offset_0x03A942-Offset_0x03A3B6
                dc.w    Offset_0x03A962-Offset_0x03A3B6
                dc.w    Offset_0x03A97E-Offset_0x03A3B6
Offset_0x03A3C6:
                bsr     ObjectSettings                         ; Offset_0x03601A
                moveq   #$00, D0
                move.b  $0028(A0), D0
                subi.b  #$4E, D0
                move.b  D0, $0024(A0)
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x03A3F2
                cmpi.b  #$08, D0
                bcc.s   Offset_0x03A3F2
                move.b  #$04, $001A(A0)
                move.b  #$01, $001C(A0)
Offset_0x03A3F2:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A3F8:
                bsr     Tornado_Load_Sonic_Or_Miles            ; Offset_0x03ABA6
                tst.w   ($FFFFFE08).w
                bne     Offset_0x03A49C
                lea     ($FFFFB000).w, A1
                move.w  $0002(A1), D0
                andi.w  #$8000, D0
                move.w  $0002(A0), D1
                andi.w  #$7FFF, D1
                or.w    D0, D1
                move.w  D1, $0002(A0)
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x03A9F0
                move.b  $0022(A0), $002E(A0)
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                bsr     Offset_0x03AA82
                move.b  $002E(A0), D0
                move.b  $0022(A0), D1
                andi.b  #$01, D0
                andi.b  #$01, D1
                eor.b   D0, D1
                move.b  D1, $002E(A0)
                lea     ($FFFFB000).w, A1
                move.w  $0008(A1), D1
                move.w  ($FFFFEE00).w, D0
                move.w  D0, ($FFFFEEC8).w
                move.w  D0, D2
                addi.w  #$0011, D2
                cmp.w   D2, D1
                bhi.s   Offset_0x03A47A
                addq.w  #$01, D1
                move.w  D1, $0008(A1)
Offset_0x03A47A:
                cmpi.w  #$1400, D0
                bcs.s   Offset_0x03A494
                cmpi.w  #$1568, D1
                bcc.s   Offset_0x03A4AE
                st      ($FFFFF7CC).w
                move.w  #$0808, ($FFFFF602).w
                bra     Offset_0x03A498
Offset_0x03A494:
                subi.w  #$0040, D0
Offset_0x03A498:
                move.w  D0, ($FFFFEECA).w
Offset_0x03A49C:
                lea     (Tornado_Animate_Data), A1             ; Offset_0x03AC2E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A4AE:
                bsr     Offset_0x03A87C
                move.w  #$0600, (Level_Id).w                         ; $FFFFFE10
                bra.s   Offset_0x03A49C
Offset_0x03A4BA:
                bsr     Tornado_Load_Sonic_Or_Miles            ; Offset_0x03ABA6
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03A4DE(PC, D0), D1
                jsr     Offset_0x03A4DE(PC, D1)
                lea     (Tornado_Animate_Data), A1             ; Offset_0x03AC2E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (Offset_0x03631E)
Offset_0x03A4DE:
                dc.w    Offset_0x03A4E6-Offset_0x03A4DE
                dc.w    Offset_0x03A4F8-Offset_0x03A4DE
                dc.w    Offset_0x03A542-Offset_0x03A4DE
                dc.w    Offset_0x03A578-Offset_0x03A4DE
Offset_0x03A4E6:
                addq.b  #$02, $0025(A0)
                move.w  #$00C0, $0032(A0)
                move.w  #$0100, $0010(A0)
                rts
Offset_0x03A4F8:
                subq.w  #$01, $0032(A0)
                bmi.s   Offset_0x03A524
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x03619C
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                bra     Offset_0x03AB38
Offset_0x03A524:
                addq.b  #$02, $0025(A0)
                move.w  #$0060, $002A(A0)
                move.w  #$0001, $0032(A0)
                move.w  #$0100, $0010(A0)
                move.w  #$0100, $0012(A0)
                rts
Offset_0x03A542:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x03A554
                moveq   #$FFFFFFEB, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03A554:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03A570
Offset_0x03A55A:
                bsr     Offset_0x03A9CE
                subq.w  #$01, $0032(A0)
                bne     Exit_Sub_01                            ; Offset_0x037512
                move.w  #$000E, $0032(A0)
                bra     Offset_0x03AB80
Offset_0x03A570:
                addq.b  #$02, $0025(A0)
                bra     Load_Helix_Obj                         ; Offset_0x03B432
Offset_0x03A578:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bra.s   Offset_0x03A55A
Offset_0x03A580:
                bsr     Tornado_Load_Sonic_Or_Miles            ; Offset_0x03ABA6
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03A59E(PC, D0), D1
                jsr     Offset_0x03A59E(PC, D1)
                lea     (Tornado_Animate_Data), A1             ; Offset_0x03AC2E
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x03A59E:
                dc.w    Offset_0x03A5B0-Offset_0x03A59E
                dc.w    Offset_0x03A63C-Offset_0x03A59E
                dc.w    Offset_0x03A67A-Offset_0x03A59E
                dc.w    Offset_0x03A6A2-Offset_0x03A59E
                dc.w    Offset_0x03A6D8-Offset_0x03A59E
                dc.w    Offset_0x03A730-Offset_0x03A59E
                dc.w    Offset_0x03A79C-Offset_0x03A59E
                dc.w    Offset_0x03A7B0-Offset_0x03A59E
                dc.w    Offset_0x03A812-Offset_0x03A59E
Offset_0x03A5B0:
                lea     ($FFFFB000).w, A1
                cmpi.w  #$05EC, $000C(A1)
                bcs.s   Offset_0x03A5CC
                clr.w   ($FFFFF602).w
                addq.w  #$01, $002E(A0)
                cmpi.w  #$0040, $002E(A0)
                bcc.s   Offset_0x03A5CE
Offset_0x03A5CC:
                rts
Offset_0x03A5CE:
                addq.b  #$02, $0025(A0)
                move.w  #$2E58, $0008(A0)
                move.w  #$066C, $000C(A0)
                lea     ($FFFFB000).w, A1
                bsr     Offset_0x03A88C
                lea     (Offset_0x03AC0E), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$3118, $0008(A1)
                move.w  #$03F0, $000C(A1)
                lea     (Offset_0x03AC0A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$3070, $0008(A1)
                move.w  #$03B0, $000C(A1)
                lea     (Offset_0x03AC0A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$3070, $0008(A1)
                move.w  #$0430, $000C(A1)
                lea     (Offset_0x03AC12), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                clr.w   $0008(A1)
                clr.w   $000C(A1)
                rts
Offset_0x03A63C:
                lea     ($FFFFB000).w, A1
                cmpi.w  #$2E30, $0008(A1)
                bcc.s   Offset_0x03A650
                move.w  #$0808, ($FFFFF602).w
                rts
Offset_0x03A650:
                addq.b  #$02, $0025(A0)
                clr.w   ($FFFFF602).w
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                clr.w   $0014(A1)
                move.w  #$0600, ($FFFFF760).w
                move.w  #$000C, ($FFFFF762).w
                move.w  #$0080, ($FFFFF764).w
                bra     Offset_0x03A88C
Offset_0x03A67A:
                cmpi.w  #$0380, ($FFFFEEE2).w
                bcc.s   Offset_0x03A68A
                clr.w   ($FFFFF602).w
                bra     Offset_0x03A88C
Offset_0x03A68A:
                addq.b  #$02, $0025(A0)
                move.w  #$0100, $0010(A0)
                move.w  #$FF00, $0012(A0)
                clr.w   $002A(A0)
                bra     Offset_0x03A88C
Offset_0x03A6A2:
                bsr     Offset_0x03A88C
                addq.w  #$01, $002A(A0)
                cmpi.w  #$0030, $002A(A0)
                bne.s   Offset_0x03A6CE
                addq.b  #$02, $0025(A0)
                move.w  #$4040, ($FFFFF602).w
                move.w  #$0038, $002E(A0)
                tst.b   ($FFFFFE19).w
                beq.s   Offset_0x03A6CE
                move.w  #$0028, $002E(A0)
Offset_0x03A6CE:
                bsr     Offset_0x03A9CE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A6D8:
                clr.w   ($FFFFF602).w
                addq.w  #$01, $002A(A0)
                subq.w  #$01, $002E(A0)
                bmi.s   Offset_0x03A6EC
                move.w  #$4848, ($FFFFF602).w
Offset_0x03A6EC:
                bsr     Offset_0x03A9CE
                btst    #$03, $0022(A0)
                beq.s   Offset_0x03A72A
                addq.b  #$02, $0025(A0)
                move.w  #$0020, $002E(A0)
                lea     ($FFFF80D2).w, A1
                move.l  #$501F0025, (A1)+
                lea     ($FFFF81D2).w, A1
                move.l  #$25001F50, (A1)+
                lea     ($FFFF8BD6).w, A1
                move.l  #$501F0025, (A1)+
                lea     ($FFFF8CD6).w, A1
                move.l  #$25001F50, (A1)+
Offset_0x03A72A:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A730:
                addq.w  #$01, $002A(A0)
                cmpi.w  #$0100, $002A(A0)
                bcs.s   Offset_0x03A74A
                addq.b  #$02, $0025(A0)
                move.w  $003A(A0), A1
                move.b  #$02, $0025(A1)
Offset_0x03A74A:
                clr.w   ($FFFFF602).w
                lea     ($FFFFB000).w, A1
                move.w  $0008(A0), $0008(A1)
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                clr.w   $0014(A1)
                bclr    #$01, $0022(A1)
                bclr    #$02, $0022(A1)
                move.l  #$01000505, $001A(A1)
                move.w  #$0100, $001E(A1)
                move.b  #$13, $0016(A1)
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x03A792
                move.b  #$0F, $0016(A1)
Offset_0x03A792:
                bsr     Offset_0x03A9CE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A79C:
                clr.w   ($FFFFF602).w
                bsr     Offset_0x03A88C
                cmpi.w  #$0437, $002A(A0)
                bcs.s   Offset_0x03A7BE
                addq.b  #$02, $0025(A0)
Offset_0x03A7B0:
                cmpi.w  #$0447, $002A(A0)
                bcc.s   Offset_0x03A7BE
                move.w  #$4040, ($FFFFF602).w
Offset_0x03A7BE:
                cmpi.w  #$0460, $002A(A0)
                bcs.s   Offset_0x03A812
                move.b  #$06, ($FFFFEEDF).w
                addq.b  #$02, $0025(A0)
                lea     (Offset_0x03AC0A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$3090, $0008(A1)
                move.w  #$03D0, $000C(A1)
                lea     (Offset_0x03AC0A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$30C0, $0008(A1)
                move.w  #$03F0, $000C(A1)
                lea     (Offset_0x03AC0A), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$3090, $0008(A1)
                move.w  #$0410, $000C(A1)
Offset_0x03A812:
                cmpi.w  #$09C0, $002A(A0)
                bcc.s   Offset_0x03A876
                move.w  $002A(A0), D0
                addq.w  #$01, D0
                move.w  D0, $002A(A0)
                move.w  $0034(A0), D1
                move.w  Offset_0x03A84C(PC, D1), D2
                cmp.w   D2, D0
                bcs.s   Offset_0x03A842
                addq.w  #$02, D1
                move.w  D1, $0034(A0)
                lea     Offset_0x03A860(PC, D1), A1
                move.b  (A1)+, $0010(A0)
                move.b  (A1)+, $0012(A0)
Offset_0x03A842:
                bsr     Offset_0x03A9CE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
Offset_0x03A84C:  
                dc.w    $01E0, $0260, $02A0, $02C0, $0300, $03A0, $03F0, $0460
                dc.w    $04A0, $0580
;-------------------------------------------------------------------------------                
Offset_0x03A860:  
                dc.b    $FF, $FF, $01, $00, $00, $01, $01, $FF, $01, $01, $01, $FF, $FF, $01, $FF, $FF
                dc.b    $FF, $01, $FE, $00, $00, $00
;-------------------------------------------------------------------------------                 
Offset_0x03A876:
                move.w  #$0E00, (Level_ID).w                         ; $FFFFFE10
Offset_0x03A87C:
                move.w  #$0001, ($FFFFFE02).w
                clr.b   ($FFFFFE30).w
                clr.b   ($FFFFFEE0).w
                rts
Offset_0x03A88C:
                lea     ($FFFFB000).w, A1
                move.l  #$01000505, $001A(A1)
                move.w  #$0100, $001E(A1)
                rts
Offset_0x03A8A0:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03A8AE(PC, D0), D1
                jmp     Offset_0x03A8AE(PC, D1)
Offset_0x03A8AE:
                dc.w    Offset_0x03A8B4-Offset_0x03A8AE
                dc.w    Offset_0x03A8BA-Offset_0x03A8AE
                dc.w    Offset_0x03A928-Offset_0x03A8AE
Offset_0x03A8B4:
                move.b  #$C7, $0020(A0)
Offset_0x03A8BA:                
                tst.b   $0021(A0) 
                beq.s   Offset_0x03A926
                addq.b  #$02, $0025(A0)
                clr.b   $0020(A0)
                move.w  #$0078, ($FFFFEED8).w
                move.w  $002C(A0), A1
                bset    #$06, $0022(A1)
                lea     ($FFFFB000).w, A1
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                move.w  $0008(A0), D0
                subi.w  #$0010, D0
                move.w  D0, $0008(A1)
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x03A8FE
                subi.w  #$0010, $000C(A1)
Offset_0x03A8FE:                
                bset    #$00, $0022(A1)
                bclr    #$01, $0022(A1)
                bclr    #$02, $0022(A1)
                move.b  #$11, $001C(A1)
                move.b  #$01, ($FFFFB02A).w
                move.b  #$01, ($FFFFF7C9).w
                clr.w   ($FFFFF602).w
Offset_0x03A926:                
                rts
Offset_0x03A928:                
                lea     ($FFFFB000).w, A1
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                move.w  $0008(A0), D0
                subi.w  #$0010, D0
                move.w  D0, $0008(A1)
                rts
Offset_0x03A942:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03A950(PC, D0), D1
                jmp     Offset_0x03A950(PC, D1)
Offset_0x03A950:
                dc.w    Offset_0x03A952-Offset_0x03A950
Offset_0x03A952:
                bchg    #02, $0022(A0)
                bne     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A962:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03A970(PC, D0), D1
                jmp     Offset_0x03A970(PC, D1)
Offset_0x03A970:                
                dc.w    Offset_0x03A972-Offset_0x03A970
Offset_0x03A972:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03A97E:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03A98C(PC, D0), D1
                jmp     Offset_0x03A98C(PC, D1)
Offset_0x03A98C:
                dc.w    Offset_0x03A990-Offset_0x03A98C
                dc.w    Offset_0x03A99A-Offset_0x03A98C 
Offset_0x03A990:
                bsr     Offset_0x03A9B0
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A99A:                
                bsr     Offset_0x03A9B0
                lea     (Tornado_Animate_Data_01), A1          ; Offset_0x03AC3E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03A9B0:
                move.w  $002C(A0), A1
                move.w  $0008(A1), D0
                subi.w  #$000C, D0
                move.w  D0, $0008(A0)
                move.w  $000C(A1), D0
                addi.w  #$0028, D0
                move.w  D0, $000C(A0)
                rts
Offset_0x03A9CE:                
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x03619C
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                jmp     (SolidObject)                          ; Offset_0x019686
Offset_0x03A9F0:                
                lea     ($FFFFB000).w, A1
                btst    #$03, $0022(A1)
                beq.s   Offset_0x03AA0E
                bsr     Offset_0x03AA3E
                bsr     Offset_0x03AB58
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bra     Offset_0x03619C
Offset_0x03AA0E:
                tst.b   $002E(A0)
                beq.s   Offset_0x03AA1C
                bsr     Offset_0x0360FC
                move.w  D2, $0038(A0)
Offset_0x03AA1C:
                move.w  #$0001, D0
                move.w  $0038(A0), D3
                beq.s   Offset_0x03AA30
                bmi.s   Offset_0x03AA2A
                neg.w   D0
Offset_0x03AA2A:
                add.w   D0, D3
                move.w  D3, $0038(A0)
Offset_0x03AA30:
                move.w  $0008(A1), D1
                add.w   D3, D1
                move.w  D1, $0008(A0)
                bra     Offset_0x03619C
Offset_0x03AA3E:
                tst.b   $002F(A0)
                bne.s   Offset_0x03AA5E
                tst.b   $002E(A0)
                beq.s   Offset_0x03AA80
                st      $002F(A0)
                clr.b   $0030(A0)
                move.w  #$0200, $0012(A0)
                move.b  #$14, $0031(A0)
Offset_0x03AA5E:
                subq.b  #$01, $0031(A0)
                bpl.s   Offset_0x03AA6E
                clr.b   $002F(A0)
                clr.w   $0012(A0)
                rts
Offset_0x03AA6E:
                move.w  $0012(A0), D0
                cmpi.w  #$FF00, D0
                ble.s   Offset_0x03AA7C
                addi.w  #$FFE0, D0
Offset_0x03AA7C:
                move.w  D0, $0012(A0)
Offset_0x03AA80:
                rts
Offset_0x03AA82:                
                lea     ($FFFFB000).w, A1
                btst    #$03, $0022(A1)
                beq.s   Offset_0x03AAEA
                tst.b   $002F(A0)
                bne.s   Offset_0x03AABC
                clr.w   $0012(A0)
                move.w  ($FFFFF604).w, D2
                move.w  #$0080, D3
                andi.w  #$0300, D2
                beq.s   Offset_0x03AABC
                andi.w  #$0200, D2
                bne.s   Offset_0x03AAAE
                neg.w   D3
Offset_0x03AAAE:
                move.w  D3, $0012(A0)
                bsr     Offset_0x03AB58
                jsr     (SpeedToPos)                           ; Offset_0x016332
Offset_0x03AABC:
                bsr     Offset_0x0360FC
                moveq   #$10, D3
                add.w   D3, D2
                cmpi.w  #$0020, D2
                bcs.s   Offset_0x03AAE8
                move.w  $0014(A1), D2
                bpl.s   Offset_0x03AAD2
                neg.w   D2
Offset_0x03AAD2:
                cmpi.w  #$0900, D2
                bcc.s   Offset_0x03AAE8
                tst.w   D0
                beq.s   Offset_0x03AADE
                neg.w   D3
Offset_0x03AADE:
                move.w  $0008(A1), D1
                add.w   D3, D1
                move.w  D1, $0008(A0)
Offset_0x03AAE8:
                rts
Offset_0x03AAEA:
                tst.b   $0030(A0)
                bne.s   Offset_0x03AB0A
                tst.b   $002E(A0)
                beq.s   Offset_0x03AAE8
                st      $0030(A0)
                clr.b   $002F(A0)
                move.w  #$0200, $0012(A0)
                move.b  #$2B, $0031(A0)
Offset_0x03AB0A:
                subq.b  #$01, $0031(A0)
                bpl.s   Offset_0x03AB1A
                clr.b   $0030(A0)
                clr.w   $0012(A0)
                rts
Offset_0x03AB1A:
                move.w  $0012(A0), D0
                cmpi.w  #$FF00, D0
                ble.s   Offset_0x03AB28
                addi.w  #$FFE0, D0
Offset_0x03AB28:
                move.w  D0, $0012(A0)
                bsr     Offset_0x03AB58
                jsr     (SpeedToPos)                           ; Offset_0x016332
                rts
Offset_0x03AB38:                
                bsr     Offset_0x0360FC
                moveq   #$10, D3
                add.w   D3, D2
                cmpi.w  #$0020, D2
                bcs.s   Offset_0x03AB56
                tst.w   D0
                beq.s   Offset_0x03AB4C
                neg.w   D3
Offset_0x03AB4C:
                move.w  $0008(A0), D1
                sub.w   D3, D1
                move.w  D1, $0008(A1)
Offset_0x03AB56:
                rts
Offset_0x03AB58:
                move.w  ($FFFFEE04).w, D0
                move.w  $000C(A0), D1
                move.w  $0012(A0), D2
                beq.s   Offset_0x03AB7E
                bpl.s   Offset_0x03AB72
                addi.w  #$0034, D0
                cmp.w   D0, D1
                bcs.s   Offset_0x03AB7A
                rts
Offset_0x03AB72:
                addi.w  #$00A8, D0
                cmp.w   D0, D1
                bcs.s   Offset_0x03AB7E
Offset_0x03AB7A:
                clr.w   $0012(A0)
Offset_0x03AB7E:
                rts
Offset_0x03AB80:                
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03ABA4
                move.b  #$C4, $0000(A1) ; Carrega o objeto 0xC4 - Fumaça saindo do Tornado ao ser atigindo..
                move.b  #$90, $0028(A1) ; .. pelo laser na Wing Fortress
                move.w  A0, $002C(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
Offset_0x03ABA4:
                rts   
;-------------------------------------------------------------------------------
Tornado_Load_Sonic_Or_Miles: ; Offset_0x03ABA6: ; Usada também pelo objeto 0xCC - Tornado na seqüência do final
                subq.b  #$01, $0037(A0)
                bmi.s   Offset_0x03ABAE
                rts
Offset_0x03ABAE:
                move.b  #$08, $0037(A0)
                moveq   #$00, D0
                move.b  $0036(A0), D0
                moveq   #$18, D1
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x03ABC6
                moveq   #$04, D1
Offset_0x03ABC6:
                addq.b  #$01, D0
                cmp.w   D1, D0
                bcs.s   Offset_0x03ABCE
                moveq   #$00, D0
Offset_0x03ABCE:
                move.b  D0, $0036(A0)
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x03ABE4
                move.b  Offset_0x03ABEE(PC, D0), D0
                jmp     (Load_Sonic_Dynamic_PLC_D0)            ; Offset_0x01B7CA
Offset_0x03ABE4:
                move.b  Offset_0x03ABF2(PC, D0), D0
                jmp     (Load_Miles_Dynamic_PLC_D0)            ; Offset_0x01D13E   
;-------------------------------------------------------------------------------
Offset_0x03ABEE:
                dc.b    $2D, $2E, $2F, $30                                      
;-------------------------------------------------------------------------------
Offset_0x03ABF2:
                dc.b    $10, $10, $10, $10, $01, $02, $03, $02, $01, $01, $10, $10, $10, $10, $01, $02
                dc.b    $03, $02, $01, $01, $04, $04, $01, $01  
;-------------------------------------------------------------------------------                  
Offset_0x03AC0A:
                dc.w    $003E, $B258
Offset_0x03AC0E:
                dc.w    $003C, $B256
Offset_0x03AC12:
                dc.w    $003A, $B25C
Offset_0x03AC16:
                dc.w    $003E, $B25A              
;-------------------------------------------------------------------------------             
Obj_0xB2_Ptr: ; Offset_0x03AC1A:
                dc.l    Tornado_Mappings                       ; Offset_0x03AC44
                dc.w    $8500
                dc.b    $04, $04, $60, $00
;-------------------------------------------------------------------------------
Obj_0xB2_01_Ptr: ; Offset_0x03AC24:
                dc.l    Tornado_Mappings_01                    ; Offset_0x03AEE4
                dc.w    $0561
                dc.b    $04, $03, $40, $00  
;-------------------------------------------------------------------------------
Tornado_Animate_Data: ; Offset_0x03AC2E: ; Usado também pelo objeto 0xCC - Tornado na seqüência do final
                dc.w    Offset_0x03AC32-Tornado_Animate_Data
                dc.w    Offset_0x03AC38-Tornado_Animate_Data
Offset_0x03AC32:
                dc.b    $00, $00, $01, $02, $03, $FF
Offset_0x03AC38:
                dc.b    $00, $04, $05, $06, $07, $FF
;-------------------------------------------------------------------------------                  
Tornado_Animate_Data_01: ; Offset_0x03AC3E:
                dc.w    Offset_0x03AC40-Tornado_Animate_Data_01
Offset_0x03AC40:
                dc.b    $00, $01, $02, $FF
;-------------------------------------------------------------------------------                
Tornado_Mappings: ; Offset_0x03AC44:
                dc.w    Offset_0x03AC54-Tornado_Mappings
                dc.w    Offset_0x03ACA6-Tornado_Mappings
                dc.w    Offset_0x03ACF8-Tornado_Mappings
                dc.w    Offset_0x03AD4A-Tornado_Mappings
                dc.w    Offset_0x03AD9C-Tornado_Mappings
                dc.w    Offset_0x03ADEE-Tornado_Mappings
                dc.w    Offset_0x03AE40-Tornado_Mappings
                dc.w    Offset_0x03AE92-Tornado_Mappings
Offset_0x03AC54:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $0802003F, $001F0010, $20050042, $0021FFF4
Offset_0x03ACA6:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $08020046, $00230010, $20050042, $0021FFF4
Offset_0x03ACF8:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $08020049, $00240010, $20050042, $0021FFF4
Offset_0x03AD4A:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F80902A0, $0150FFD0
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $0802004C, $00260010, $20050042, $0021FFF4
Offset_0x03AD9C:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F8090280, $0140FFCE
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $0802003F, $001F0010, $20050042, $0021FFF4
Offset_0x03ADEE:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F8090280, $0140FFCE
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $08020046, $00230010, $20050042, $0021FFF4
Offset_0x03AE40:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F8090280, $0140FFCE
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $08020049, $00240010, $20050042, $0021FFF4
Offset_0x03AE92:
                dc.w    $000A
                dc.l    $F00B0000, $0000FFA0, $1008000C, $0006FFA0
                dc.l    $030A000F, $0007FFB8, $F8090280, $0140FFCE
                dc.l    $080E001E, $000FFFD0, $F80D002A, $0015FFE8
                dc.l    $F8000032, $00190008, $080E0033, $0019FFF0
                dc.l    $0802004C, $00260010, $20050042, $0021FFF4
;-------------------------------------------------------------------------------
Tornado_Mappings_01: ; Offset_0x03AEE4:
                dc.w    Offset_0x03AEEA-Tornado_Mappings_01
                dc.w    Offset_0x03AEFC-Tornado_Mappings_01
                dc.w    Offset_0x03AF16-Tornado_Mappings_01
Offset_0x03AEEA:
                dc.w    $0002
                dc.l    $F8092000, $2000FFE4, $F80D2006, $2003FFFC
Offset_0x03AEFC:
                dc.w    $0003
                dc.l    $F8092000, $2000FFE4, $F80D2006, $2003FFFC
                dc.l    $F80D400E, $4007FFC4
Offset_0x03AF16:
                dc.w    $0003
                dc.l    $F8092000, $2000FFE4, $F80D2006, $2003FFFC
                dc.l    $F8054016, $400BFFD4                                                                                                          
;===============================================================================
; Objeto 0xB2 - Tornado na Wing Fortress / Sky Chase (Avião do Sonic)
; [ Término ]
;===============================================================================