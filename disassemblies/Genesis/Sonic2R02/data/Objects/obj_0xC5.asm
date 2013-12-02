;===============================================================================
; Objeto 0xC5 - Chefe na Wing Fortress
; [ Início ]
;===============================================================================   
Offset_0x03C110:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03C11E(PC, D0), D1
                jmp     Offset_0x03C11E(PC, D1)
Offset_0x03C11E:
                dc.w    Offset_0x03C132-Offset_0x03C11E
                dc.w    Offset_0x03C144-Offset_0x03C11E
                dc.w    Offset_0x03C458-Offset_0x03C11E
                dc.w    Offset_0x03C508-Offset_0x03C11E
                dc.w    Offset_0x03C5F6-Offset_0x03C11E
                dc.w    Offset_0x03C6E2-Offset_0x03C11E
                dc.w    Offset_0x03C722-Offset_0x03C11E
                dc.w    Offset_0x03C77A-Offset_0x03C11E
                dc.w    Offset_0x03C87E-Offset_0x03C11E
                dc.w    Offset_0x03C90A-Offset_0x03C11E
Offset_0x03C132:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  $0028(A0), D0
                subi.b  #$90, D0
                move.b  D0, $0024(A0)
                rts
Offset_0x03C144:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C156(PC, D0), D1
                jsr     Offset_0x03C156(PC, D1)
                bra     Offset_0x03C93E
Offset_0x03C156:                
                dc.w    Offset_0x03C176-Offset_0x03C156
                dc.w    Offset_0x03C1AC-Offset_0x03C156
                dc.w    Offset_0x03C228-Offset_0x03C156
                dc.w    Offset_0x03C24C-Offset_0x03C156
                dc.w    Offset_0x03C26C-Offset_0x03C156
                dc.w    Offset_0x03C294-Offset_0x03C156
                dc.w    Offset_0x03C2D2-Offset_0x03C156
                dc.w    Offset_0x03C2E4-Offset_0x03C156
                dc.w    Offset_0x03C2FE-Offset_0x03C156
                dc.w    Offset_0x03C334-Offset_0x03C156
                dc.w    Offset_0x03C354-Offset_0x03C156
                dc.w    Offset_0x03C388-Offset_0x03C156
                dc.w    Offset_0x03C3E8-Offset_0x03C156
                dc.w    Offset_0x03C2D2-Offset_0x03C156
                dc.w    Offset_0x03C40C-Offset_0x03C156
                dc.w    Offset_0x03C41C-Offset_0x03C156
Offset_0x03C176:
                addq.b  #$02, $0025(A0)
                move.b  #$00, $0020(A0)
                move.b  #$08, $0021(A0)
                move.w  #$0442, D0
                move.w  D0, ($FFFFEECE).w
                move.w  D0, ($FFFFEEC6).w
                move.w  $0008(A0), D0
                subi.w  #$0060, D0
                move.w  D0, $0034(A0)
                addi.w  #$00C0, D0
                move.w  D0, $0036(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C1AC:
                bsr     Offset_0x0360FC
                addi.w  #$0020, D2
                cmpi.w  #$0040, D2
                bcs.s   Offset_0x03C1C0
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C1C0:
                addq.b  #$02, $0025(A0)
                move.w  #$0040, $0012(A0)
                lea     (Offset_0x03C9B2), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                subi.w  #$0088, $0008(A1)
                addi.w  #$0060, $000C(A1)
                lea     (Offset_0x03C9B2), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                addi.w  #$0088, $0008(A1)
                addi.w  #$0060, $000C(A1)
                lea     (Offset_0x03C9BE), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03C9C2), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Offset_0x03C9CA), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.w  #$005A, $002A(A0)
                moveq   #$FFFFFFF9, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C228:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03C234
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C234:
                addq.b  #$02, $0025(A0)
                move.w  #$0060, $002A(A0)
                moveq   #$FFFFFF93, D0
                jsr     (Play_Music)                           ; Offset_0x00131A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C24C:
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03C25E
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C25E:
                addq.b  #$02, $0025(A0)
                clr.w   $0012(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C26C:
                addq.b  #$02, $0025(A0)
                bsr     Offset_0x0360FC
                move.w  #$0100, D1
                tst.w   D0
                bne.s   Offset_0x03C27E
                neg.w   D1
Offset_0x03C27E:
                move.w  D1, $0010(A0)
                bset    #$02, $0022(A0)
                move.w  #$0070, $002A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C294:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03C2C4
                move.w  $0008(A0), D0
                tst.w   $0010(A0)
                bmi.s   Offset_0x03C2AE
                cmp.w   $0036(A0), D0
                bcc.s   Offset_0x03C2B4
                bra     Offset_0x03C2B8
Offset_0x03C2AE:
                cmp.w   $0034(A0), D0
                bcc.s   Offset_0x03C2B8
Offset_0x03C2B4:
                neg.w   $0010(A0)
Offset_0x03C2B8:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C2C4:
                addq.b  #$02, $0025(A0)
                clr.b   $001C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C2D2:
                lea     (WFz_Boss_Animate_Data), A1            ; Offset_0x03CA04
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C2E4:
                addq.b  #$02, $0025(A0)
                move.w  #$000E, $002A(A0)
                move.w  $003C(A0), A1
                move.b  #$04, $0025(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C2FE:
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03C312
                move.w  $003C(A0), A1
                addq.w  #$01, $000C(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C312:
                addq.b  #$02, $0025(A0)
                move.w  #$0040, $002A(A0)
                bset    #$04, $0022(A0)
                bset    #$06, $0022(A0)
                move.b  #$06, $0020(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C334:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03C340
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C340:
                addq.b  #$02, $0025(A0)
                lea     (Offset_0x03C9C6), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C354:
                move.w  $003E(A0), A1
                btst    #$02, $0022(A1)
                bne.s   Offset_0x03C366
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C366:
                addq.b  #$02, $0025(A0)
                move.w  #$0080, $002A(A0)
                bsr     Offset_0x0360FC
                move.w  #$0080, D1
                tst.w   D0
                bne.s   Offset_0x03C37E
                neg.w   D1
Offset_0x03C37E:
                move.w  D1, $0010(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C388:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03C3B8
                move.w  $0008(A0), D0
                tst.w   $0010(A0)
                bmi.s   Offset_0x03C3A2
                cmp.w   $0036(A0), D0
                bcc.s   Offset_0x03C3A8
                bra     Offset_0x03C3AC
Offset_0x03C3A2:
                cmp.w   $0034(A0), D0
                bcc.s   Offset_0x03C3AC
Offset_0x03C3A8:
                clr.w   $0010(A0)
Offset_0x03C3AC:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C3B8:
                addq.b  #$02, $0025(A0)
                move.w  #$000E, $002A(A0)
                bclr    #$03, $0022(A0)
                bclr    #$04, $0022(A0)
                bclr    #$06, $0022(A0)
                clr.b   $0020(A0)
                move.w  $003E(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C3E8:
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03C3FC
                move.w  $003C(A0), A1
                subq.w  #$01, $000C(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C3FC:
                addq.b  #$02, $0025(A0)
                move.b  #$01, $001C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C40C:
                move.b  #$08, $0025(A0)
                bsr     Offset_0x03C26C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C41C:
                clr.b   $0020(A0)
                st      $0021(A0)
                bclr    #$06, $0022(A0)
                subq.w  #$01, $0030(A0)
                bmi.s   Offset_0x03C43C
                jsr     (Boss_Defeated)                        ; Offset_0x02D278
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C43C:
                moveq   #$FFFFFF8F, D0
                jsr     (Play_Music)                           ; Offset_0x00131A
                move.w  #$0720, D0
                move.w  D0, ($FFFFEECE).w
                move.w  D0, ($FFFFEEC6).w
                bsr     J_DeleteObject_01                      ; Offset_0x036344
                addq.w  #$04, A7
                rts
Offset_0x03C458:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C484(PC, D0), D1
                jsr     Offset_0x03C484(PC, D1)
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                move.w  $0008(A0), -(A7)
                move.w  #$0013, D1
                move.w  #$0040, D2
                move.w  #$0080, D3
                move.w  (A7)+, D4
                jmp     (SolidObject)                          ; Offset_0x019686
Offset_0x03C484:                
                dc.w    Offset_0x03C48A-Offset_0x03C484
                dc.w    Offset_0x03C49A-Offset_0x03C484
                dc.w    Offset_0x03C4C6-Offset_0x03C484
Offset_0x03C48A:
                addq.b  #$02, $0025(A0)
                move.b  #$0C, $001A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C49A:
                move.w  $002C(A0), A1
                btst    #$05, $0022(A1)
                bne.s   Offset_0x03C4B6
                bchg    #00, $002F(A0)
                bne     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C4B6:
                addq.b  #$02, $0025(A0)
                move.b  #$04, $0030(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C4C6:
                subq.b  #$01, $001E(A0)
                bpl     Exit_Sub_01                            ; Offset_0x037512
                move.b  $001E(A0), D0
                move.b  $001B(A0), D1
                addq.b  #$02, D0
                bpl.s   Offset_0x03C4FC
                move.b  D1, $001E(A0)
                subq.b  #$01, $0030(A0)
                bpl.s   Offset_0x03C4FC
                move.b  #$10, $0030(A0)
                addq.b  #$01, D1
                cmpi.b  #$05, D1
                bcc     J_DeleteObject_01                      ; Offset_0x036344
                move.b  D1, $001B(A0)
                move.b  D1, $001E(A0)
Offset_0x03C4FC:
                bclr    #$00, $002F(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C508:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C516(PC, D0), D1
                jmp     Offset_0x03C516(PC, D1)
Offset_0x03C516:
                dc.w    Offset_0x03C520-Offset_0x03C516
                dc.w    Offset_0x03C534-Offset_0x03C516
                dc.w    Offset_0x03C55C-Offset_0x03C516
                dc.w    Offset_0x03C582-Offset_0x03C516
                dc.w    Offset_0x03C5DE-Offset_0x03C516
Offset_0x03C520:
                addq.b  #$02, $0025(A0)
                move.b  #$05, $001A(A0)
                addq.w  #$08, $000C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C534:
                move.w  $002C(A0), A1
                btst    #$02, $0022(A1)
                bne.s   Offset_0x03C546
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C546:
                addq.b  #$02, $0025(A0)
                move.w  #$0040, $002A(A0)
                move.w  #$0040, $0012(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C55C:
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03C56E
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C56E:
                addq.b  #$02, $0025(A0)
                clr.w   $0012(A0)
                move.w  #$0010, $002A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C582:
                move.w  $002C(A0), A1
                btst    #$05, $0022(A1)
                bne.s   Offset_0x03C5CE
                subq.w  #$01, $002A(A0)
                bne.s   Offset_0x03C5C8
                move.w  #$0080, $002A(A0)
                moveq   #$00, D0
                move.b  $002E(A0), D0
                addq.b  #$01, D0
                cmpi.b  #$03, D0
                bcs.s   Offset_0x03C5AA
                moveq   #$00, D0
Offset_0x03C5AA:
                move.b  D0, $002E(A0)
                tst.b   $30(A0, D0)
                bne.s   Offset_0x03C5C8
                st      $30(A0, D0)
                lea     (Offset_0x03C9B6), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.b  $002E(A0), $002E(A1)
Offset_0x03C5C8:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C5CE:
                addq.b  #$02, $0025(A0)
                bset    #$05, $0022(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C5DE:
                move.w  $002C(A0), A1
                cmpi.b  #$C5, (A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                jsr     (Boss_Defeated)                        ; Offset_0x02D278
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C5F6:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C61C(PC, D0), D1
                jsr     Offset_0x03C61C(PC, D1)
                lea     (WFz_Boss_Animate_Data), A1            ; Offset_0x03CA04
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                tst.b   (A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C61C:                
                dc.w    Offset_0x03C622-Offset_0x03C61C
                dc.w    Offset_0x03C648-Offset_0x03C61C
                dc.w    Offset_0x03C670-Offset_0x03C61C
Offset_0x03C622:
                addq.b  #$02, $0025(A0)
                move.b  #$03, $001C(A0)
                move.b  #$07, $001A(A0)
                move.w  #$0100, $0012(A0)
                move.w  #$0060, $002A(A0)
                lea     (Offset_0x03C9BA), A2
                bra     Load_Sub_Obj                           ; Offset_0x0361F6
Offset_0x03C648:
                bsr     Offset_0x03C6B8
                subq.w  #$01, $002A(A0)
                beq.s   Offset_0x03C656
                bra     Offset_0x03C69A
Offset_0x03C656:
                addq.b  #$02, $0025(A0)
                move.w  #$0060, $002A(A0)
                move.w  #$FF00, $0010(A0)
                move.w  $000C(A0), $0034(A0)
                bra     Offset_0x03C69A
Offset_0x03C670:
                bsr     Offset_0x03C6B8
                subq.w  #$01, $002A(A0)
                bne.s   Offset_0x03C684
                move.w  #$00C0, $002A(A0)
                neg.w   $0010(A0)
Offset_0x03C684:
                moveq   #$04, D0
                move.w  $000C(A0), D1
                cmp.w   $0034(A0), D1
                bcs.s   Offset_0x03C692
                neg.w   D0
Offset_0x03C692:
                add.w   D0, $0012(A0)
                bra     Offset_0x03C69A
Offset_0x03C69A:
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  #$0010, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  (A7)+, D4
                jmp     (Platform_Object)                      ; Offset_0x019BA0
Offset_0x03C6B8:
                move.w  $002C(A0), A1
                btst    #$05, $0022(A1)
                bne     Offset_0x03C6C8
                rts
Offset_0x03C6C8:
                bsr     Load_Helix_Obj                         ; Offset_0x03B432
                move.b  #$58, (A0)
                clr.b   $0024(A0)
                move.w  $003C(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                addq.w  #$04, A7
                rts
Offset_0x03C6E2:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C6F0(PC, D0), D1
                jmp     Offset_0x03C6F0(PC, D1)
Offset_0x03C6F0:
                dc.w    Offset_0x03C6F4-Offset_0x03C6F0
                dc.w    Offset_0x03C700-Offset_0x03C6F0
Offset_0x03C6F4:
                addq.b  #$02, $0025(A0)
                move.b  #$98, $0020(A0)
                rts
Offset_0x03C700:
                move.w  $002C(A0), A1
                btst    #$05, $0022(A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), D0
                addi.w  #$000C, D0
                move.w  D0, $000C(A0)
                rts
Offset_0x03C722:
                move.w  $002C(A0), A1
                btst    #$05, $0022(A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C73E(PC, D0), D1
                jmp     Offset_0x03C73E(PC, D1)
Offset_0x03C73E:                
                dc.w    Offset_0x03C744-Offset_0x03C73E
                dc.w    Offset_0x03C754-Offset_0x03C73E
                dc.w    Offset_0x03C76A-Offset_0x03C73E
Offset_0x03C744:  
                addq.b  #$02, $0025(A0)
                move.b  #$04, $001A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C754:                
                move.w  $002C(A0), A1
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C76A:                
                move.w  $002C(A0), A1
                move.w  $0008(A1), $0008(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C77A:                
                move.w  $002C(A0), A1
                btst    #$05, $0022(A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C7A6(PC, D0), D1
                jsr     Offset_0x03C7A6(PC, D1)
                bchg    #00, $002F(A0)
                bne     Exit_Sub_01                            ; Offset_0x037512
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C7A6:
                dc.w    Offset_0x03C7B0-Offset_0x03C7A6
                dc.w    Offset_0x03C7D8-Offset_0x03C7A6
                dc.w    Offset_0x03C810-Offset_0x03C7A6
                dc.w    Offset_0x03C824-Offset_0x03C7A6
                dc.w    Offset_0x03C872-Offset_0x03C7A6
Offset_0x03C7B0:
                addq.b  #$02, $0025(A0)
                move.b  #$0D, $001A(A0)
                move.b  #$04, $0018(A0)
                move.b  #$00, $0020(A0)
                addi.w  #$0010, $000C(A0)
                move.b  #$0C, $001B(A0)
                subq.w  #$03, $000C(A0)
                rts
Offset_0x03C7D8:
                bset    #$00, $002F(A0)
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x03C802
                move.b  $001E(A0), D0
                addq.b  #$02, D0
                bpl.s   Offset_0x03C7FC
                move.b  $001B(A0), D0
                subq.b  #$01, D0
                beq.s   Offset_0x03C804
                move.b  D0, $001B(A0)
                move.b  D0, $001E(A0)
Offset_0x03C7FC:
                bclr    #$00, $002F(A0)
Offset_0x03C802:
                rts
Offset_0x03C804:
                addq.b  #$02, $0025(A0)
                move.w  #$0040, $002A(A0)
                rts
Offset_0x03C810:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03C818
                rts
Offset_0x03C818:
                addq.b  #$02, $0025(A0)
                addi.w  #$0010, $000C(A0)
                rts
Offset_0x03C824:
                moveq   #$00, D0
                move.b  $002E(A0), D0
                addq.b  #$01, D0
                cmpi.b  #$05, D0
                bcc.s   Offset_0x03C84A
                addi.w  #$0010, $000C(A0)
                move.b  D0, $002E(A0)
                move.b  Offset_0x03C866(PC, D0), $001A(A0)
                move.b  Offset_0x03C86C(PC, D0), $0020(A0)
                rts
Offset_0x03C84A:
                addq.b  #$02, $0025(A0)
                move.w  #$0080, $002A(A0)
                bset    #$02, $0022(A0)
                move.w  $002C(A0), A1
                bset    #$03, $0022(A1)
                rts
;-------------------------------------------------------------------------------                
Offset_0x03C866:
                dc.b    $0E, $0F, $10, $11, $12, $00
;-------------------------------------------------------------------------------
Offset_0x03C86C:     
                dc.b    $86, $AB, $AC, $AD, $AE, $00
;-------------------------------------------------------------------------------   
Offset_0x03C872:
                move.w  $002C(A0), A1
                move.w  $0008(A1), $0008(A0)
                rts
Offset_0x03C87E:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03C88C(PC, D0), D1
                jmp     Offset_0x03C88C(PC, D1)
Offset_0x03C88C:
                dc.w    Offset_0x03C892-Offset_0x03C88C
                dc.w    Offset_0x03C8BE-Offset_0x03C88C
                dc.w    Offset_0x03C8EC-Offset_0x03C88C
Offset_0x03C892:
                addq.b  #$02, $0025(A0)
                move.b  #$00, $001A(A0)
                move.b  #$01, $001C(A0)
                move.w  #$2C60, $0008(A0)
                move.w  #$04E6, $000C(A0)
                lea     (Offset_0x03C9CE), A2
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C8BE:
                move.w  $002C(A0), A1
                btst    #$05, $0022(A1)
                bne.s   Offset_0x03C8DC
                lea     (Robotnik_Running_Animate_Data), A1    ; Offset_0x03CE4E ( Obj_0xC6.asm )
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C8DC:
                addq.b  #$02, $0025(A0)
                move.w  #$00C0, $002A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C8EC:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x03C8FC
                addq.w  #$01, $000C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03C8FC:
                move.w  $003E(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x03C90A:
                move.w  $002C(A0), A1
                move.w  $000C(A1), D0
                addi.w  #$0026, D0
                move.w  D0, $000C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
                move.w  $0008(A0), -(A7)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  #$000F, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  (A7)+, D4
                jmp     (Platform_Object)                      ; Offset_0x019BA0
Offset_0x03C93E:                
                tst.b   $0021(A0)
                beq.s   Offset_0x03C98E
                tst.b   $0020(A0)
                bne.s   Offset_0x03C98C
                tst.b   $0030(A0)
                bne.s   Offset_0x03C968
                btst    #$06, $0022(A0)
                beq.s   Offset_0x03C98C
                move.b  #$20, $0030(A0)
                move.w  #Boss_Hit_Sfx, D0       ; $00AC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03C968:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x03C976
                move.w  #$0EEE, D0
Offset_0x03C976:
                move.w  D0, (A1)
                subq.b  #$01, $0030(A0)
                bne.s   Offset_0x03C98C
                btst    #$04, $0022(A0)
                beq.s   Offset_0x03C98C
                move.b  #$06, $0020(A0)
Offset_0x03C98C:
                rts
Offset_0x03C98E:
                moveq   #$64, D0
                bsr     Add_Points_Player_One                  ; Offset_0x040A5C
                clr.b   $0020(A0)
                move.w  #$00EF, $0030(A0)
                move.b  #$1E, $0025(A0)
                bset    #$05, $0022(A0)
                bclr    #$06, $0022(A0)
                rts      
;-------------------------------------------------------------------------------  
Offset_0x03C9B2:
                dc.w    $002A, $C594
Offset_0x03C9B6:
                dc.w    $003E, $C598
Offset_0x03C9BA:
                dc.w    $003C, $C59A
Offset_0x03C9BE:
                dc.w    $003C, $C59C
Offset_0x03C9C2:
                dc.w    $003A, $C596
Offset_0x03C9C6:
                dc.w    $003E, $C59E
Offset_0x03C9CA:
                dc.w    $0038, $C5A0
Offset_0x03C9CE: 
                dc.w    $003E, $C5A2     
;-------------------------------------------------------------------------------                  
Obj_0xC5_Ptr: ; Offset_0x03C9D2:
                dc.l    WFz_Boss_Mappings                      ; Offset_0x03CA2A
                dc.w    $0379
                dc.b    $04, $04, $20, $00
Obj_0xC5_01_Ptr: ; Offset_0x03C9DC:
                dc.l    WFz_Boss_Mappings                      ; Offset_0x03CA2A
                dc.w    $0379
                dc.b    $04, $01, $08, $00
Obj_0xC5_02_Ptr: ; Offset_0x03C9E6:
                dc.l    WFz_Boss_Mappings                      ; Offset_0x03CA2A
                dc.w    $0379
                dc.b    $04, $05, $10, $00
Obj_0xC5_03_Ptr: ; Offset_0x03C9F0:
                dc.l    Robotnik_Running_Mappings              ; Offset_0x03CE64 ( Obj_0xC6.asm )
                dc.w    $0000
                dc.b    $04, $05, $20, $00
Obj_0xC5_04_Ptr: ; Offset_0x03C9FA:  
                dc.l    WFz_Boss_Mappings_01                   ; Offset_0x03CC0E
                dc.w    $A46D
                dc.b    $04, $05, $20, $00  
;-------------------------------------------------------------------------------    
WFz_Boss_Animate_Data: ; Offset_0x03CA04:
                dc.w    Offset_0x03CA0C-WFz_Boss_Animate_Data
                dc.w    Offset_0x03CA16-WFz_Boss_Animate_Data
                dc.w    Offset_0x03CA1E-WFz_Boss_Animate_Data
                dc.w    Offset_0x03CA22-WFz_Boss_Animate_Data
Offset_0x03CA0C:
                dc.b    $05, $00, $01, $02, $03, $03, $03, $03, $FA, $00
Offset_0x03CA16:
                dc.b    $03, $03, $02, $01, $00, $00, $FA, $00
Offset_0x03CA1E:
                dc.b    $03, $05, $06, $FF
Offset_0x03CA22:
                dc.b    $03, $07, $08, $09, $0A, $0B, $FF, $00   
;-------------------------------------------------------------------------------                  
WFz_Boss_Mappings: ; Offset_0x03CA2A:
                dc.w    Offset_0x03CA50-WFz_Boss_Mappings
                dc.w    Offset_0x03CA72-WFz_Boss_Mappings
                dc.w    Offset_0x03CA94-WFz_Boss_Mappings
                dc.w    Offset_0x03CAB6-WFz_Boss_Mappings
                dc.w    Offset_0x03CAD8-WFz_Boss_Mappings
                dc.w    Offset_0x03CAEA-WFz_Boss_Mappings
                dc.w    Offset_0x03CAFC-WFz_Boss_Mappings
                dc.w    Offset_0x03CB06-WFz_Boss_Mappings
                dc.w    Offset_0x03CB10-WFz_Boss_Mappings
                dc.w    Offset_0x03CB1A-WFz_Boss_Mappings
                dc.w    Offset_0x03CB24-WFz_Boss_Mappings
                dc.w    Offset_0x03CB2E-WFz_Boss_Mappings
                dc.w    Offset_0x03CB38-WFz_Boss_Mappings
                dc.w    Offset_0x03CB5A-WFz_Boss_Mappings
                dc.w    Offset_0x03CB64-WFz_Boss_Mappings
                dc.w    Offset_0x03CB76-WFz_Boss_Mappings
                dc.w    Offset_0x03CB90-WFz_Boss_Mappings
                dc.w    Offset_0x03CBB2-WFz_Boss_Mappings
                dc.w    Offset_0x03CBDC-WFz_Boss_Mappings
Offset_0x03CA50:
                dc.w    $0004
                dc.l    $F80C2000, $2000FFE0, $F80C2004, $20020000
                dc.l    $00092008, $2004FFE8, $00092808, $28040000
Offset_0x03CA72:
                dc.w    $0004
                dc.l    $F80C2000, $2000FFE0, $F80C2800, $28000000
                dc.l    $0009200E, $2007FFE8, $0009280E, $28070000
Offset_0x03CA94:
                dc.w    $0004
                dc.l    $F80C2000, $2000FFE0, $F80C2800, $28000000
                dc.l    $00092014, $200AFFE8, $00092814, $280A0000
Offset_0x03CAB6:
                dc.w    $0004
                dc.l    $F80C2000, $2000FFE0, $F80C2800, $28000000
                dc.l    $0008201A, $200DFFE8, $0008281A, $280D0000
Offset_0x03CAD8:
                dc.w    $0002
                dc.l    $F805401D, $400EFFF0, $F805481D, $480E0000
Offset_0x03CAEA:
                dc.w    $0002
                dc.l    $F80D2021, $2010FFE0, $F80D2821, $28100000
Offset_0x03CAFC:
                dc.w    $0001
                dc.l    $F80E2029, $2014FFF0
Offset_0x03CB06:
                dc.w    $0001
                dc.l    $F80E2035, $201AFFF0
Offset_0x03CB10:
                dc.w    $0001
                dc.l    $F80E2041, $2020FFF0
Offset_0x03CB1A:
                dc.w    $0001
                dc.l    $F80E204D, $2026FFF0
Offset_0x03CB24:
                dc.w    $0001
                dc.l    $F80E2841, $2820FFF0
Offset_0x03CB2E:
                dc.w    $0001
                dc.l    $F80E2835, $281AFFF0
Offset_0x03CB38:
                dc.w    $0004
                dc.l    $C0072059, $202CFFF8, $E0072059, $202CFFF8
                dc.l    $00072059, $202CFFF8, $20072059, $202CFFF8
Offset_0x03CB5A:
                dc.w    $0001
                dc.l    $000C4071, $4038FFF0
Offset_0x03CB64:
                dc.w    $0002
                dc.l    $F00F4061, $4030FFF0, $100C4071, $4038FFF0
Offset_0x03CB76:
                dc.w    $0003
                dc.l    $E00F4061, $4030FFF0, $000F4061, $4030FFF0
                dc.l    $200C4071, $4038FFF0
Offset_0x03CB90:
                dc.w    $0004
                dc.l    $D00F4061, $4030FFF0, $F00F4061, $4030FFF0
                dc.l    $100F4061, $4030FFF0, $300C4071, $4038FFF0
Offset_0x03CBB2:
                dc.w    $0005
                dc.l    $C00F4061, $4030FFF0, $E00F4061, $4030FFF0
                dc.l    $000F4061, $4030FFF0, $200F4061, $4030FFF0
                dc.l    $400C4071, $4038FFF0
Offset_0x03CBDC:
                dc.w    $0006
                dc.l    $B00F4061, $4030FFF0, $D00F4061, $4030FFF0
                dc.l    $F00F4061, $4030FFF0, $100F4061, $4030FFF0
                dc.l    $300F4061, $4030FFF0, $500C4071, $4038FFF0               
;-------------------------------------------------------------------------------  
WFz_Boss_Mappings_01: ; Offset_0x03CC0E:
                dc.w    Offset_0x03CC10-WFz_Boss_Mappings_01
Offset_0x03CC10:
                dc.w    $0002
                dc.l    $F40E0000, $0000FFE0, $F40E0800, $08000000                                                                                                                                                                           
;===============================================================================
; Objeto 0xC5 - Chefe na Wing Fortress
; [ Término ]
;===============================================================================