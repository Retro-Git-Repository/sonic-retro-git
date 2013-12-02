;===============================================================================
; Object 0xAF - Metal Sonic - Death Egg
; [ Begin ]
;===============================================================================     
Offset_0x0392EE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0392FC(PC, D0), D1
                jmp     Offset_0x0392FC(PC, D1)
Offset_0x0392FC:
                dc.w    Offset_0x039320-Offset_0x0392FC
                dc.w    Offset_0x03936E-Offset_0x0392FC
                dc.w    Offset_0x0393AE-Offset_0x0392FC
                dc.w    Offset_0x0393CC-Offset_0x0392FC
                dc.w    Offset_0x03941E-Offset_0x0392FC
                dc.w    Offset_0x03949C-Offset_0x0392FC
                dc.w    Offset_0x03977E-Offset_0x0392FC
                dc.w    Offset_0x0397AC-Offset_0x0392FC
                dc.w    Offset_0x0397BE-Offset_0x0392FC
                dc.w    Offset_0x0397D6-Offset_0x0392FC
                dc.w    Offset_0x0397DE-Offset_0x0392FC
                dc.w    Offset_0x0397F6-Offset_0x0392FC
                dc.w    Offset_0x0397FE-Offset_0x0392FC
                dc.w    Offset_0x039806-Offset_0x0392FC
                dc.w    Offset_0x03981E-Offset_0x0392FC
                dc.w    Offset_0x03983A-Offset_0x0392FC
                dc.w    Offset_0x03984C-Offset_0x0392FC
                dc.w    Offset_0x0398A2-Offset_0x0392FC
Offset_0x039320:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$1B, $0016(A0)
                move.b  #$10, $0017(A0)
                move.b  #$00, $0020(A0)
                move.b  #$08, $0021(A0)
                lea     (Load_Metal_Sonic_Sub_Obj_0xAF), A2    ; Offset_0x0399CC
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.b  #$0E, $0024(A1)
                lea     (Load_Metal_Sonic_Sub_Obj_0xAF_1), A2 ; Offset_0x0399D0
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.b  #$14, $0024(A1)
                lea     (Load_Metal_Sonic_Sub_Obj_0xAF_2), A2 ; Offset_0x0399D4
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                move.b  #$1A, $0024(A1)
                rts
Offset_0x03936E:
                move.w  ($FFFFEE00).w, D0
                cmpi.w  #$0224, D0
                bcc.s   Offset_0x03937E
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03937E:
                addq.b  #$02, $0024(A0)
                move.w  #$003C, $002A(A0)
                move.w  #$0100, $0012(A0)
                move.w  #$0224, D0
                move.w  D0, ($FFFFEEC8).w
                move.w  D0, ($FFFFEECA).w
                move.b  #$09, ($FFFFF7AA).w
                moveq   #$FFFFFFF9, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0393AE:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x0393BA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0393BA:
                addq.b  #$02, $0024(A0)
                moveq   #$FFFFFF93, D0
                jsr     (Play_Music)                           ; Offset_0x00131A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0393CC:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x0393DE
                moveq   #$FFFFFFDC, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0393DE:
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bmi.s   Offset_0x039404
                jsr     (SpeedToPos)                           ; Offset_0x016332
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  $003E(A0), A1
                bsr     Offset_0x036186
                bsr     Offset_0x039954
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039404:
                add.w   D1, $000C(A0)
                move.w  #$0000, $0012(A0)
                move.b  #$1A, $0020(A0)
                bset    #$01, $0022(A0)
                bra     Offset_0x0395B8
Offset_0x03941E:
                bsr     Offset_0x0398B4
                bsr     Offset_0x039926
                subq.b  #$01, $002A(A0)
                beq.s   Offset_0x039460
                cmpi.b  #$32, $002A(A0)
                bne.s   Offset_0x039442
                moveq   #$FFFFFFEE, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jsr     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039442:
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                add.w   D1, $000C(A0)
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bsr     Offset_0x036296
                bsr     Offset_0x039954
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039460:
                addq.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.b  $002F(A0), D0
                andi.b  #$0F, D0
                move.b  Offset_0x03948C(PC, D0), $0025(A0)
                addq.b  #$01, $002F(A0)
                clr.b   $002E(A0)
                move.w  $003C(A0), A1
                move.b  #$16, $0024(A1)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                    
Offset_0x03948C:
                dc.b    $06, $00, $10, $06, $06, $1E, $00, $10, $06, $06, $10, $06, $00, $06, $10, $1E
;-------------------------------------------------------------------------------    
Offset_0x03949C:
                bsr     Offset_0x0398B4
                bsr     Offset_0x039926
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0394D2(PC, D0), D1
                jsr     Offset_0x0394D2(PC, D1)
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  $003E(A0), A1
                bsr     Offset_0x036186
                bsr     Offset_0x039954
                bsr     Offset_0x036186
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0394D2:
                dc.w    Offset_0x0394FE-Offset_0x0394D2
                dc.w    Offset_0x039526-Offset_0x0394D2
                dc.w    Offset_0x039558-Offset_0x0394D2
                dc.w    Offset_0x0395F0-Offset_0x0394D2
                dc.w    Offset_0x039602-Offset_0x0394D2
                dc.w    Offset_0x03962E-Offset_0x0394D2
                dc.w    Offset_0x039652-Offset_0x0394D2
                dc.w    Offset_0x039680-Offset_0x0394D2
                dc.w    Offset_0x0395F0-Offset_0x0394D2
                dc.w    Offset_0x039602-Offset_0x0394D2
                dc.w    Offset_0x039694-Offset_0x0394D2
                dc.w    Offset_0x0396B8-Offset_0x0394D2
                dc.w    Offset_0x0396DE-Offset_0x0394D2
                dc.w    Offset_0x039712-Offset_0x0394D2
                dc.w    Offset_0x039680-Offset_0x0394D2
                dc.w    Offset_0x0395F0-Offset_0x0394D2
                dc.w    Offset_0x039602-Offset_0x0394D2
                dc.w    Offset_0x039694-Offset_0x0394D2
                dc.w    Offset_0x0396B8-Offset_0x0394D2
                dc.w    Offset_0x03972E-Offset_0x0394D2
                dc.w    Offset_0x039712-Offset_0x0394D2
                dc.w    Offset_0x039680-Offset_0x0394D2
Offset_0x0394FE:
                addq.b  #$02, $0025(A0)
                move.b  #$03, $001A(A0)
                move.b  #$02, $002C(A0)
Offset_0x03950E:
                move.b  #$20, $002A(A0)
                move.w  $003E(A0), A1
                move.b  #$10, $0024(A1)
                move.b  #$01, $001C(A1)
                rts
Offset_0x039526:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x03952E
                rts
Offset_0x03952E:
                addq.b  #$02, $0025(A0)
                move.b  #$40, $002A(A0)
                move.b  #$01, $001C(A0)
                move.w  #$0800, D0
                bsr     Offset_0x03996A
                move.w  $003E(A0), A1
                move.b  #$02, $001C(A1)
                moveq   #$FFFFFFBC, D0
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x039558:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0395A4
                cmpi.b  #$20, $002A(A0)
                bne.s   Offset_0x039576
                move.b  #$02, $001C(A0)
                move.w  $003E(A0), A1
                move.b  #$12, $0024(A1)
Offset_0x039576:
                bsr     Offset_0x03997C
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bsr     Offset_0x036296
                cmpi.b  #$02, $001C(A0)
                bne.s   Offset_0x0395A2
                cmpi.b  #$02, $001B(A0)
                bne.s   Offset_0x0395A2
                cmpi.b  #$03, $001E(A0)
                bne.s   Offset_0x0395A2
                bchg    #00, $0001(A0)
Offset_0x0395A2:
                rts
Offset_0x0395A4:
                subq.b  #$01, $002C(A0)
                beq.s   Offset_0x0395B8
                move.b  #$02, $0025(A0)
                clr.w   $0010(A0)
                bra     Offset_0x03950E
Offset_0x0395B8:
                move.b  #$08, $0024(A0)
                move.b  #$00, $001C(A0)
                move.b  #$64, $002A(A0)
                clr.w   $0010(A0)
                move.w  $003E(A0), A1
                move.b  #$12, $0024(A1)
                move.w  $003C(A0), A1
                move.b  #$18, $0024(A1)
                moveq   #$FFFFFFEE, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0395F0:
                addq.b  #$02, $0025(A0)
                move.b  #$03, $001A(A0)
                move.b  #$03, $001C(A0)
                rts
Offset_0x039602:
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bsr     Offset_0x036296
                bne.s   Offset_0x039610
                rts
Offset_0x039610:
                addq.b  #$02, $0025(A0)
                move.b  #$20, $002A(A0)
                move.b  #$04, $001C(A0)
                moveq   #$FFFFFFB0, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03962E:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x039640
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bsr     Offset_0x036296
                rts
Offset_0x039640:
                addq.b  #$02, $0025(A0)
                move.b  #$40, $002A(A0)
                move.w  #$0800, D0
                bra     Offset_0x03996A
Offset_0x039652:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x039666
                bsr     Offset_0x03997C
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bra     Offset_0x036296
Offset_0x039666:
                addq.b  #$02, $0025(A0)
                move.b  #$05, $001C(A0)
                bchg    #00, $0001(A0)
                clr.w   $0010(A0)
                clr.w   $0012(A0)
                rts
Offset_0x039680:
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bsr     Offset_0x036296
                bne     Offset_0x039690
                rts
Offset_0x039690:
                bra     Offset_0x0395B8
Offset_0x039694:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0396A6
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bsr     Offset_0x036296
                rts
Offset_0x0396A6:
                addq.b  #$02, $0025(A0)
                move.b  #$40, $002A(A0)
                move.w  #$0400, D0
                bra     Offset_0x03996A
Offset_0x0396B8:
                subq.b  #$01, $002A(A0)
                cmpi.b  #$3C, $002A(A0)
                bne.s   Offset_0x0396C8
                bsr     Offset_0x0396D2
Offset_0x0396C8:
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bra     Offset_0x036296
Offset_0x0396D2:
                addq.b  #$02, $0025(A0)
                move.w  #$FA00, $0012(A0)
                rts
Offset_0x0396DE:
                subq.b  #$01, $002A(A0)
                bmi     Offset_0x039666
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x0396F4
                bsr     Offset_0x039704
Offset_0x0396F4:
                addi.w  #$0038, $0012(A0)
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bra     Offset_0x036296
Offset_0x039704:
                addq.b  #$02, $0025(A0)
                add.w   D1, $000C(A0)
                clr.w   $0012(A0)
                rts
Offset_0x039712:
                subq.b  #$01, $002A(A0)
                bmi     Offset_0x039666
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                add.w   D1, $000C(A0)
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bra     Offset_0x036296
Offset_0x03972E:
                subq.b  #$01, $002A(A0)
                bmi     Offset_0x039666
                tst.b   $002E(A0)
                bne.s   Offset_0x039752
                tst.w   $0012(A0)
                bmi.s   Offset_0x039752
                st      $002E(A0)
                bsr     Offset_0x03998C
                moveq   #$FFFFFFA2, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x039752:
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x039760
                bsr     Offset_0x039770
Offset_0x039760:
                addi.w  #$0038, $0012(A0)
                lea     (Metal_Sonic_Animate_Data), A1         ; Offset_0x0399EC
                bra     Offset_0x036296
Offset_0x039770:
                addq.b  #$02, $0025(A0)
                add.w   D1, $000C(A0)
                clr.w   $0012(A0)
                rts
Offset_0x03977E:
                clr.b   $0020(A0)
                subq.w  #$01, $0032(A0)
                bmi.s   Offset_0x039794
                jsr     (Boss_Defeated)                        ; Offset_0x02D278
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039794:
                move.w  #$1000, ($FFFFEECA).w
                addq.b  #$02, ($FFFFEEDF).w
                move.b  ($FFFFFF70).w, D0
                jsr     (Play_Music)                           ; Offset_0x00131A
                bra     J_DeleteObject_01                      ; Offset_0x036344
Offset_0x0397AC:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$08, $0019(A0)
                move.b  #$00, $0020(A0)
                rts
Offset_0x0397BE:
                move.w  $002C(A0), A1
                bsr     Offset_0x0361D0
                lea     (Metal_Sonic_Animate_Data_1), A1       ; Offset_0x039A3A
                bsr     Offset_0x036296
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0397D6:
                andi.b  #$7F, $0001(A0)
                rts
Offset_0x0397DE:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$08, $0019(A0)
                move.b  #$0B, $001A(A0)
                move.b  #$03, $0018(A0)
                rts
Offset_0x0397F6:
                move.b  #$00, $0020(A0)
                rts
Offset_0x0397FE:
                move.b  #$98, $0020(A0)
                rts
Offset_0x039806:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$04, $001A(A0)
                move.w  #$02C0, $0008(A0)
                move.w  #$0139, $000C(A0)
                rts
Offset_0x03981E:
                move.w  $002C(A0), A1
                bclr    #$01, $0022(A1)
                bne.s   Offset_0x039830
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039830:
                addq.b  #$02, $0024(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03983A:
                lea     (Metal_Sonic_Animate_Data_2), A1       ; Offset_0x039A4C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x03984C:
                move.w  $002C(A0), A1
                lea     ($FFFFB000).w, A2
                btst    #$02, $0022(A1)
                bne.s   Offset_0x039892
                move.b  #$02, $001C(A0)
                cmpi.b  #$04, $0024(A2)
                bne.s   Offset_0x039874
                move.b  #$03, $001C(A0)
                bra     Offset_0x039880
Offset_0x039874:
                tst.b   $0020(A1)
                bne.s   Offset_0x039880
                move.b  #$04, $001C(A0)
Offset_0x039880:
                lea     (Metal_Sonic_Animate_Data_2), A1       ; Offset_0x039A4C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039892:
                addq.b  #$02, $0024(A0)
                move.b  #$01, $001C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0398A2:
                lea     (Metal_Sonic_Animate_Data_2), A1       ; Offset_0x039A4C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0398B4:
                tst.b   $0021(A0)
                beq.s   Offset_0x0398F6
                tst.b   $0020(A0)
                bne.s   Offset_0x0398F4
                tst.b   $0030(A0)
                bne.s   Offset_0x0398D6
                move.b  #$20, $0030(A0)
                move.w  #$00AC, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0398D6:
                lea     ($FFFFFB22).w, A1
                moveq   #$00, D0
                tst.w   (A1)
                bne.s   Offset_0x0398E4
                move.w  #$0EEE, D0
Offset_0x0398E4:
                move.w  D0, (A1)
                subq.b  #$01, $0030(A0)
                bne.s   Offset_0x0398F4
                clr.w   ($FFFFFB22).w
                bsr     Offset_0x03992E
Offset_0x0398F4:
                rts
Offset_0x0398F6:
                moveq   #$64, D0
                bsr     Add_Points_Player_One                  ; Offset_0x040A5C
                move.w  #$00FF, $0032(A0)
                move.b  #$0C, $0024(A0)
                clr.b   $0020(A0)
                bset    #$02, $0022(A0)
                move.w  $003C(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                move.w  $003E(A0), A1
                jmp     (Delete_A1_Object)                     ; Offset_0x01646E
Offset_0x039926:
                tst.b   $0020(A0)
                beq     Exit_Sub_01                            ; Offset_0x037512
Offset_0x03992E:
                move.b  $001A(A0), D0
                cmpi.b  #$06, D0
                beq.s   Offset_0x03994C
                cmpi.b  #$07, D0
                beq.s   Offset_0x03994C
                cmpi.b  #$08, D0
                beq.s   Offset_0x03994C
                move.b  #$1A, $0020(A0)
                rts
Offset_0x03994C:
                move.b  #$9A, $0020(A0)
                rts
Offset_0x039954:
                moveq   #$0C, D0
                moveq   #$FFFFFFF4, D1
                btst    #$00, $0001(A0)
                beq.s   Offset_0x039962
                neg.w   D0
Offset_0x039962:
                move.w  $003C(A0), A1
                bra     Offset_0x036186
Offset_0x03996A:
                tst.b   $002D(A0)
                bne.s   Offset_0x039972
                neg.w   D0
Offset_0x039972:
                not.b   $002D(A0)
                move.w  D0, $0010(A0)
                rts
Offset_0x03997C:
                moveq   #$20, D0
                tst.w   $0010(A0)
                bmi.s   Offset_0x039986
                neg.w   D0
Offset_0x039986:
                add.w   D0, $0010(A0)
                rts
Offset_0x03998C:
                move.b  #$4A, D2
                moveq   #$07, D6
                lea     (Offset_0x03999C), A2
                bra     Enemy_Weapon                           ; Offset_0x036240
;-------------------------------------------------------------------------------                
Offset_0x03999C:   
                dc.b    $00, $E8, $00, $FD, $0F, $00, $F0, $F0, $FE, $FE, $10, $00, $E8, $00, $FD, $00
                dc.b    $11, $00, $F0, $10, $FE, $02, $12, $00, $00, $18, $00, $03, $13, $00, $10, $10
                dc.b    $02, $02, $14, $00, $18, $00, $03, $00, $15, $00, $10, $F0, $02, $FE, $16, $00  
;-------------------------------------------------------------------------------
Load_Metal_Sonic_Sub_Obj_0xAF: ; Offset_0x0399CC:
                dc.w    $003E, $AF48
Load_Metal_Sonic_Sub_Obj_0xAF_1: ; Offset_0x0399D0:
                dc.w    $003C, $AF48
Load_Metal_Sonic_Sub_Obj_0xAF_2: ; Offset_0x0399D4:
                dc.w    $003A, $AFA4
;-------------------------------------------------------------------------------                    
Obj_0xAF_Ptr: ; Offset_0x0399D8:
                dc.l    Metal_Sonic_Mappings                   ; Offset_0x039A72
                dc.w    $2380
                dc.b    $04, $04, $10, $1A
;-------------------------------------------------------------------------------                
Obj_0xAF_01_Ptr: ; Offset_0x0399E2:
                dc.l    Robotnik_Window_Mappings               ; Offset_0x039C96
                dc.w    $0378
                dc.b    $04, $06, $10, $00       
;-------------------------------------------------------------------------------  
Metal_Sonic_Animate_Data: ; Offset_0x0399EC:
                dc.w    Offset_0x0399F8-Metal_Sonic_Animate_Data
                dc.w    Offset_0x0399FE-Metal_Sonic_Animate_Data
                dc.w    Offset_0x039A02-Metal_Sonic_Animate_Data
                dc.w    Offset_0x039A08-Metal_Sonic_Animate_Data
                dc.w    Offset_0x039A1E-Metal_Sonic_Animate_Data
                dc.w    Offset_0x039A24-Metal_Sonic_Animate_Data
Offset_0x0399F8:
                dc.b    $02, $00, $01, $02, $FF, $00
Offset_0x0399FE:
                dc.b    $45, $03, $FD, $00
Offset_0x039A02:
                dc.b    $03, $04, $05, $04, $03, $FC
Offset_0x039A08:
                dc.b    $03, $03, $03, $06, $06, $06, $07, $07, $07, $08, $08, $08, $06, $06, $07, $07
                dc.b    $08, $08, $06, $07, $08, $FC
Offset_0x039A1E:
                dc.b    $02, $06, $07, $08, $FF, $00
Offset_0x039A24:
                dc.b    $03, $08, $07, $06, $08, $08, $07, $07, $06, $06, $08, $08, $08, $07, $07, $07
                dc.b    $06, $06, $06, $03, $03, $FC                 
;------------------------------------------------------------------------------- 
Metal_Sonic_Animate_Data_1: ; Offset_0x039A3A:
                dc.w    Offset_0x039A40-Metal_Sonic_Animate_Data_1
                dc.w    Offset_0x039A44-Metal_Sonic_Animate_Data_1
                dc.w    Offset_0x039A48-Metal_Sonic_Animate_Data_1
Offset_0x039A40:
                dc.b    $01, $0B, $0C, $FF
Offset_0x039A44:
                dc.b    $01, $0D, $0E, $FF
Offset_0x039A48:
                dc.b    $01, $09, $0A, $FF                   
;-------------------------------------------------------------------------------    
Metal_Sonic_Animate_Data_2: ; Offset_0x039A4C:
                dc.w    Offset_0x039A56-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x039A5E-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x039A66-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x039A6A-Metal_Sonic_Animate_Data_2
                dc.w    Offset_0x039A6E-Metal_Sonic_Animate_Data_2
Offset_0x039A56:
                dc.b    $03, $04, $03, $02, $01, $00, $FC, $00
Offset_0x039A5E:
                dc.b    $03, $00, $01, $02, $03, $04, $FA, $00
Offset_0x039A66:
                dc.b    $03, $05, $05, $FF
Offset_0x039A6A:
                dc.b    $03, $05, $06, $FF
Offset_0x039A6E:
                dc.b    $03, $07, $07, $FF              
;-------------------------------------------------------------------------------
Metal_Sonic_Mappings: ; Offset_0x039A72:
                dc.w    Offset_0x039AA0-Metal_Sonic_Mappings
                dc.w    Offset_0x039ACA-Metal_Sonic_Mappings
                dc.w    Offset_0x039AF4-Metal_Sonic_Mappings
                dc.w    Offset_0x039B1E-Metal_Sonic_Mappings
                dc.w    Offset_0x039B40-Metal_Sonic_Mappings
                dc.w    Offset_0x039B62-Metal_Sonic_Mappings
                dc.w    Offset_0x039B84-Metal_Sonic_Mappings
                dc.w    Offset_0x039BA6-Metal_Sonic_Mappings
                dc.w    Offset_0x039BC8-Metal_Sonic_Mappings
                dc.w    Offset_0x039BEA-Metal_Sonic_Mappings
                dc.w    Offset_0x039BFC-Metal_Sonic_Mappings
                dc.w    Offset_0x039C0E-Metal_Sonic_Mappings
                dc.w    Offset_0x039C20-Metal_Sonic_Mappings
                dc.w    Offset_0x039C32-Metal_Sonic_Mappings
                dc.w    Offset_0x039C3C-Metal_Sonic_Mappings
                dc.w    Offset_0x039C46-Metal_Sonic_Mappings
                dc.w    Offset_0x039C50-Metal_Sonic_Mappings
                dc.w    Offset_0x039C5A-Metal_Sonic_Mappings
                dc.w    Offset_0x039C64-Metal_Sonic_Mappings
                dc.w    Offset_0x039C6E-Metal_Sonic_Mappings
                dc.w    Offset_0x039C78-Metal_Sonic_Mappings
                dc.w    Offset_0x039C82-Metal_Sonic_Mappings
                dc.w    Offset_0x039C8C-Metal_Sonic_Mappings
Offset_0x039AA0:
                dc.w    $0005
                dc.l    $E4090000, $0000FFF3, $F40F0006, $0003FFEF
                dc.l    $140C0016, $000BFFEC, $E404006F, $0037FFF4
                dc.l    $E4070071, $00380004
Offset_0x039ACA:
                dc.w    $0005
                dc.l    $E4090000, $0000FFF3, $F40F0006, $0003FFEF
                dc.l    $140C0016, $000BFFEC, $E4040079, $003CFFF4
                dc.l    $E407007B, $003D0004
Offset_0x039AF4:
                dc.w    $0005
                dc.l    $E4090000, $0000FFF3, $F40F0006, $0003FFEF
                dc.l    $140C0016, $000BFFEC, $E4040083, $0041FFF4
                dc.l    $E4070085, $00420004
Offset_0x039B1E:
                dc.w    $0004
                dc.l    $E40F001A, $000DFFEC, $E403002A, $0015000C
                dc.l    $040E002E, $0017FFF4, $1400003A, $001DFFEC
Offset_0x039B40:
                dc.w    $0004
                dc.l    $E40E003B, $001DFFF0, $04010047, $0023FFE8
                dc.l    $FC0F0049, $0024FFF0, $FC030059, $002C0010
Offset_0x039B62:
                dc.w    $0004
                dc.l    $E406005D, $002EFFF0, $E406085D, $082E0000
                dc.l    $FC0B0063, $0031FFE8, $FC0B0863, $08310000
Offset_0x039B84:
                dc.w    $0004
                dc.l    $EE0A008D, $0046FFE8, $EE0A0096, $004B0000
                dc.l    $060A1896, $184BFFE8, $060A188D, $18460000
Offset_0x039BA6:
                dc.w    $0004
                dc.l    $EE0A009F, $004FFFE8, $EE0A00A8, $00540000
                dc.l    $060A18A8, $1854FFE8, $060A189F, $184F0000
Offset_0x039BC8:
                dc.w    $0004
                dc.l    $EE0A00B1, $0058FFE8, $EE0A00BA, $005D0000
                dc.l    $060A18BA, $185DFFE8, $060A18B1, $18580000
Offset_0x039BEA:
                dc.w    $0002
                dc.l    $040000C3, $0061000E, $140800CB, $00650012
Offset_0x039BFC:
                dc.w    $0002
                dc.l    $040800C4, $0062000E, $140800CE, $00670012
Offset_0x039C0E:
                dc.w    $0002
                dc.l    $1C0000C7, $0063FFF4, $1C0000C7, $0063FFFC
Offset_0x039C20:
                dc.w    $0002
                dc.l    $1C0200C8, $0064FFF4, $1C0200C8, $0064FFFC
Offset_0x039C32:
                dc.w    $0001
                dc.l    $140800CB, $00650012
Offset_0x039C3C:
                dc.w    $0001
                dc.l    $140800CE, $00670012
Offset_0x039C46:
                dc.w    $0001
                dc.l    $F80100D1, $0068FFFC
Offset_0x039C50:
                dc.w    $0001
                dc.l    $F80500D3, $0069FFF8
Offset_0x039C5A:
                dc.w    $0001
                dc.l    $FC0400D7, $006BFFF8
Offset_0x039C64:
                dc.w    $0001
                dc.l    $F80510D3, $1069FFF8
Offset_0x039C6E:
                dc.w    $0001
                dc.l    $F80110D1, $1068FFFC
Offset_0x039C78:
                dc.w    $0001
                dc.l    $F80518D3, $1869FFF8
Offset_0x039C82:
                dc.w    $0001
                dc.l    $FC0408D7, $086BFFF8
Offset_0x039C8C:
                dc.w    $0001
                dc.l    $F80508D3, $0869FFF8                                                                              
;-------------------------------------------------------------------------------
Robotnik_Window_Mappings: ; Offset_0x039C96:
                dc.w    Offset_0x039CA6-Robotnik_Window_Mappings
                dc.w    Offset_0x039CD0-Robotnik_Window_Mappings
                dc.w    Offset_0x039CFA-Robotnik_Window_Mappings
                dc.w    Offset_0x039D24-Robotnik_Window_Mappings
                dc.w    Offset_0x039D5E-Robotnik_Window_Mappings
                dc.w    Offset_0x039D98-Robotnik_Window_Mappings
                dc.w    Offset_0x039DB2-Robotnik_Window_Mappings
                dc.w    Offset_0x039DCC-Robotnik_Window_Mappings
Offset_0x039CA6:
                dc.w    $0005
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $04042006, $2003FFF0, $04042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x039CD0:
                dc.w    $0005
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $00042006, $2003FFF0, $00042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x039CFA:
                dc.w    $0005
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $FC042006, $2003FFF0, $FC042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x039D24:
                dc.w    $0007
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $F8042006, $2003FFF0, $F8042006, $20030000
                dc.l    $00042006, $2003FFF0, $00042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x039D5E:
                dc.w    $0007
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $F4042006, $2003FFF0, $F4042006, $20030000
                dc.l    $FC042006, $2003FFF0, $FC042006, $20030000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x039D98:
                dc.w    $0003
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $F80D0190, $00C8FFF0
Offset_0x039DB2:
                dc.w    $0003
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $F90D0190, $00C8FFF0
Offset_0x039DCC:
                dc.w    $0003
                dc.l    $F4062000, $2000FFF0, $F4062800, $28000000
                dc.l    $F80D0198, $00CCFFF0                                                                                                                                                                                                                    
;===============================================================================
; Object 0xAF - Metal Sonic - Death Egg
; [ End ]
;===============================================================================