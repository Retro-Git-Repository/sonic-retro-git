;===============================================================================
; Object 0xA6 - Lander badnick - Chemical Plant
; [ Begin ]
;=============================================================================== 
Offset_0x0386F8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038706(PC, D0), D1
                jmp     Offset_0x038706(PC, D1)
Offset_0x038706:
                dc.w    Offset_0x03870C-Offset_0x038706
                dc.w    Offset_0x03871E-Offset_0x038706
                dc.w    Offset_0x038778-Offset_0x038706
Offset_0x03870C:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$FFC0, $0012(A0)
                move.w  #$0080, $002A(A0)
                rts
Offset_0x03871E:
                tst.b   $002B(A0)
                beq.s   Offset_0x03872C
                subq.b  #$01, $002B(A0)
                bra     Offset_0x03873A
Offset_0x03872C:
                bsr     Offset_0x0360FC
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x038762
Offset_0x03873A:
                subq.b  #$01, $002A(A0)
                bne.s   Offset_0x03874A
                move.w  #$0080, $002A(A0)
                neg.w   $0012(A0)
Offset_0x03874A:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Vertical_Spiny_Animate_Data), A1      ; Offset_0x038844
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x038762:
                addq.b  #$02, $0024(A0)
                move.b  #$28, $002B(A0)
                move.b  #$05, $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x038778:
                subq.b  #$01, $002B(A0)
                bmi.s   Offset_0x038790
                cmpi.b  #$14, $002B(A0)
                bne.s   Offset_0x03878A
                bsr     Load_Spiny_Vertical_Shot_Obj           ; Offset_0x0387F0
Offset_0x03878A:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x038790:
                subq.b  #$02, $0024(A0)
                move.b  #$40, $002B(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Load_Spiny_Horizontal_Shot_Obj: ; Offset_0x0387A0:                
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0387EE
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Arma dos inimigos
                move.b  #$06, $001A(A1)
                move.b  #$34, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  #$FD00, $0012(A1)
                move.w  #$0100, D1
                lea     ($FFFFB000).w, A2
                move.w  $0008(A0), D0
                cmp.w   $0008(A2), D0
                bcs.s   Offset_0x0387E0
                neg.w   D1
Offset_0x0387E0:
                move.w  D1, $0010(A1)
                lea     (Spiny_Weapon), A2                     ; Offset_0x0371F8
                move.l  A2, $002A(A1)
Offset_0x0387EE:
                rts
;-------------------------------------------------------------------------------                
Load_Spiny_Vertical_Shot_Obj: ; Offset_0x0387F0:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x038832
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Arma dos inimigos
                move.b  #$06, $001A(A1)
                move.b  #$34, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.w  #$0300, D1
                btst    #$00, $0001(A0)
                beq.s   Offset_0x038824
                neg.w   D1
Offset_0x038824:
                move.w  D1, $0010(A1)                   
                lea     (Spiny_Weapon), A2                     ; Offset_0x0371F8
                move.l  A2, $002A(A1)
Offset_0x038832:
                rts    
;-------------------------------------------------------------------------------
Obj_0xA5_Ptr: ; Offset_0x038834:
                dc.l    Spiny_Mappings                         ; Offset_0x038850
                dc.w    $252D
                dc.b    $04, $04, $08, $0B
;-------------------------------------------------------------------------------   
Horizontal_Spiny_Animate_Data: ; Offset_0x03883E:
                dc.w    Offset_0x038840-Horizontal_Spiny_Animate_Data
Offset_0x038840:
                dc.b    $09, $00, $01, $FF
;-------------------------------------------------------------------------------
Vertical_Spiny_Animate_Data: ; Offset_0x038844:
                dc.w    Offset_0x038846-Vertical_Spiny_Animate_Data
Offset_0x038846:
                dc.b    $09, $03, $04, $FF
;------------------------------------------------------------------------------- 
Spiny_Weapon_Animate_Data: ; Offset_0x03884A:
                dc.w    Offset_0x03884C-Spiny_Weapon_Animate_Data
Offset_0x03884C:
                dc.b    $03, $06, $07, $FF
;-------------------------------------------------------------------------------                
Spiny_Mappings: ; Offset_0x038850:
                dc.w    Offset_0x038860-Spiny_Mappings
                dc.w    Offset_0x038882-Spiny_Mappings
                dc.w    Offset_0x0388A4-Spiny_Mappings
                dc.w    Offset_0x0388C6-Spiny_Mappings
                dc.w    Offset_0x0388E8-Spiny_Mappings
                dc.w    Offset_0x03890A-Spiny_Mappings
                dc.w    Offset_0x03892C-Spiny_Mappings
                dc.w    Offset_0x038936-Spiny_Mappings
Offset_0x038860:
                dc.w    $0004
                dc.l    $F4000000, $0000FFF8, $FC090001, $0000FFE8
                dc.l    $F4000800, $08000000, $FC090801, $08000000
Offset_0x038882:
                dc.w    $0004
                dc.l    $F4000000, $0000FFF8, $FC090007, $0003FFE8
                dc.l    $F4000800, $08000000, $FC090807, $08030000
Offset_0x0388A4:
                dc.w    $0004
                dc.l    $F404000D, $0006FFF0, $FC090001, $0000FFE8
                dc.l    $F404080D, $08060000, $FC090801, $08000000
Offset_0x0388C6:
                dc.w    $0004
                dc.l    $E806000F, $0007FFF4, $F8000015, $000A0004
                dc.l    $0006100F, $1007FFF4, $00001015, $100A0004
Offset_0x0388E8:
                dc.w    $0004
                dc.l    $E8060016, $000BFFF4, $F8000015, $000A0004
                dc.l    $00061016, $100BFFF4, $00001015, $100A0004
Offset_0x03890A:
                dc.w    $0004
                dc.l    $E806000F, $0007FFF4, $F001001C, $000E0004
                dc.l    $0006100F, $1007FFF4, $0001101C, $100E0004
Offset_0x03892C:
                dc.w    $0001
                dc.l    $FC00001E, $000FFFFC
Offset_0x038936:
                dc.w    $0001
                dc.l    $FC00001F, $000FFFFC                                                                                   
;===============================================================================
; Object 0xA6 - Lander badnick - Chemical Plant
; [ End ]
;===============================================================================