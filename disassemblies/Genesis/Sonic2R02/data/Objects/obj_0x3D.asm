;===============================================================================
; Objeto 0x3D - Obstásculo quebre para obter impulso na Oil Ocean
; [ Início ]
;===============================================================================    
Offset_0x024C58:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x024C66(PC, D0), D1
                jmp     Offset_0x024C66(PC, D1)
Offset_0x024C66:
                dc.w    Offset_0x024C6E-Offset_0x024C66
                dc.w    Offset_0x024CB0-Offset_0x024C66
                dc.w    Offset_0x024DCE-Offset_0x024C66
                dc.w    Offset_0x024DE8-Offset_0x024C66
Offset_0x024C6E:
                addq.b  #$02, $0024(A0)
                move.l  #Break_Boost_Mappings, $0004(A0)       ; Offset_0x024F50 
                move.w  #$6332, $0002(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x024C92
                move.w  #$63FF, $0002(A0)
                move.b  #$02, $001A(A0)
Offset_0x024C92:
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                bset    #$07, $0022(A0)
                move.b  #$04, $0018(A0)
Offset_0x024CB0:
                move.b  ($FFFFB01C).w, $0032(A0)
                move.b  ($FFFFB05C).w, $0033(A0)
                move.w  ($FFFFB012).w, $0034(A0)
                move.w  ($FFFFB052).w, $0036(A0)
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x024CEE
Offset_0x024CE8:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x024CEE:
                cmpi.b  #$18, D0
                bne.s   Offset_0x024D24
                cmpi.b  #$02, $0032(A0)
                beq.s   Offset_0x024D04
                cmpi.b  #$02, $0033(A0)
                bne.s   Offset_0x024CE8
Offset_0x024D04:
                lea     ($FFFFB000).w, A1
                move.b  $0032(A0), D0
                move.w  $0034(A0), D1
                bsr.s   Offset_0x024D40
                lea     ($FFFFB040).w, A1
                move.b  $0033(A0), D0
                move.w  $0036(A0), D1
                bsr.s   Offset_0x024D40
                bra     Offset_0x024D92
Offset_0x024D24:
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x024D76
                cmpi.b  #$02, $0032(A0)
                bne.s   Offset_0x024CE8
                lea     ($FFFFB000).w, A1
                move.w  $0034(A0), D1
                bsr.s   Offset_0x024D46
                bra.s   Offset_0x024D92
Offset_0x024D40:
                cmpi.b  #$02, D0
                bne.s   Offset_0x024D62
Offset_0x024D46:
                bset    #$02, $0022(A1)
                move.b  #$0E, $0016(A1)
                move.b  #$07, $0017(A1)
                move.b  #$02, $001C(A1)
                move.w  D1, $0012(A1)
Offset_0x024D62:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                rts
Offset_0x024D76:
                andi.b  #$10, D0
                beq     Offset_0x024CE8
                cmpi.b  #$02, $0033(A0)
                bne     Offset_0x024CE8
                lea     ($FFFFB040).w, A1
                move.w  $0036(A0), D1
                bsr.s   Offset_0x024D46
Offset_0x024D92:
                andi.b  #$E7, $0022(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x024DB8
                moveq   #$00, D0
                move.w  #$000A, D1
Offset_0x024DA6:
                move.l  $00(A0, D0), $00(A1, D0) ; Nova instância do objeto na memória
                addq.w  #$04, D0
                dbra    D1, Offset_0x024DA6
                move.b  #$06, $0024(A1)
Offset_0x024DB8:
                lea     (Break_Boost_Data), A4                 ; Offset_0x024F10
                addq.b  #$01, $001A(A0)
                moveq   #$0F, D1
                move.w  #$0018, D2
                jsr     (Smash_Object)                         ; Offset_0x015D9E
Offset_0x024DCE:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                tst.b   $0001(A0)
                bpl     Obj_0x3D_DeleteObject                  ; Offset_0x0250A6
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x024DE8:
                lea     ($FFFFB000).w, A1
                lea     $002C(A0), A4
                bsr.s   Offset_0x024E0A
                lea     ($FFFFB040).w, A1
                lea     $0036(A0), A4
                bsr.s   Offset_0x024E0A
                move.b  $002C(A0), D0
                add.b   $0036(A0), D0
                beq     Obj_0x3D_MarkObjGone_3                 ; Offset_0x0250A0
                rts
Offset_0x024E0A:
                moveq   #$00, D0
                move.b  (A4), D0
                move.w  Offset_0x024E16(PC, D0), D0
                jmp     Offset_0x024E16(PC, D0)
Offset_0x024E16:
                dc.w    Offset_0x024E1A-Offset_0x024E16
                dc.w    Offset_0x024ECC-Offset_0x024E16
Offset_0x024E1A:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$0010, D0
                cmpi.w  #$0020, D0
                bcc     Offset_0x024ECA
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                tst.b   $0028(A0)
                beq.s   Offset_0x024E40
                addi.w  #$0010, D1
Offset_0x024E40:
                cmpi.w  #$0010, D1
                bcc     Offset_0x024ECA
                cmpa.w  #$B040, A1
                bne.s   Offset_0x024E58
                cmpi.w  #$0004, ($FFFFF708).w
                beq     Offset_0x024ECA
Offset_0x024E58:
                addq.b  #$02, (A4)
                move.b  #$81, $002A(A1)
                move.b  #$02, $001C(A1)
                move.w  #$0800, $0014(A1)
                tst.b   $0028(A0)
                beq.s   Offset_0x024E86
                move.w  $0008(A0), $0008(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$F800, $0012(A1)
                bra.s   Offset_0x024E98
Offset_0x024E86:
                move.w  $000C(A0), $000C(A1)
                move.w  #$0800, $0010(A1)
                move.w  #$0000, $0012(A1)
Offset_0x024E98:
                bclr    #$05, $0022(A0)
                bclr    #$05, $0022(A1)
                bset    #$01, $0022(A1)
                bset    #$03, $0022(A1)
                move.w  A0, D0
                subi.w  #$B000, D0
                lsr.w   #$06, D0
                andi.w  #$007F, D0
                move.b  D0, $003D(A1)
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x024ECA:
                rts
Offset_0x024ECC:
                tst.b   $0001(A1)
                bmi.s   Offset_0x024EEA
                move.b  #$00, $002A(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$00, (A4)
                rts
Offset_0x024EEA:
                move.l  $0008(A1), D2
                move.l  $000C(A1), D3
                move.w  $0010(A1), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A1), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, $0008(A1)
                move.l  D3, $000C(A1)
                rts
;-------------------------------------------------------------------------------
Break_Boost_Data: ; Offset_0x024F10:
                dc.w    $FC00, $FC00, $FE00, $FC00, $0200, $FC00, $0400, $FC00
                dc.w    $FC40, $FE00, $FE40, $FE00, $01C0, $FE00, $03C0, $FE00
                dc.w    $FC80, $0200, $FE80, $0200, $0180, $0200, $0380, $0200
                dc.w    $FCC0, $0400, $FEC0, $0400, $0140, $0400, $0340, $0400
;-------------------------------------------------------------------------------
Break_Boost_Mappings: ; Offset_0x024F50:
                dc.w    Offset_0x024F58-Break_Boost_Mappings
                dc.w    Offset_0x024F7A-Break_Boost_Mappings
                dc.w    Offset_0x024FFC-Break_Boost_Mappings
                dc.w    Offset_0x02501E-Break_Boost_Mappings
Offset_0x024F58:
                dc.w    $0004
                dc.l    $F0030000, $0000FFF0, $F0030000, $0000FFF8
                dc.l    $F0030000, $00000000, $F0030000, $00000008
Offset_0x024F7A:
                dc.w    $0010
                dc.l    $F0000000, $0000FFF0, $F0000000, $0000FFF8
                dc.l    $F0000000, $00000000, $F0000000, $00000008
                dc.l    $F8000001, $0000FFF0, $F8000001, $0000FFF8
                dc.l    $F8000001, $00000000, $F8000001, $00000008
                dc.l    $00000002, $0001FFF0, $00000002, $0001FFF8
                dc.l    $00000002, $00010000, $00000002, $00010008
                dc.l    $08000003, $0001FFF0, $08000003, $0001FFF8
                dc.l    $08000003, $00010000, $08000003, $00010008
Offset_0x024FFC:
                dc.w    $0004
                dc.l    $F00C0000, $0000FFF0, $F80C0000, $0000FFF0
                dc.l    $000C0000, $0000FFF0, $080C0000, $0000FFF0
Offset_0x02501E:
                dc.w    $0010
                dc.l    $F0000000, $0000FFF0, $F0000001, $0000FFF8
                dc.l    $F0000002, $00010000, $F0000003, $00010008
                dc.l    $F8000000, $0000FFF0, $F8000001, $0000FFF8
                dc.l    $F8000002, $00010000, $F8000003, $00010008
                dc.l    $00000000, $0000FFF0, $00000001, $0000FFF8
                dc.l    $00000002, $00010000, $00000003, $00010008
                dc.l    $08000000, $0000FFF0, $08000001, $0000FFF8
                dc.l    $08000002, $00010000, $08000003, $00010008 
;-------------------------------------------------------------------------------
Obj_0x3D_MarkObjGone_3: ; Offset_0x0250A0:
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Obj_0x3D_DeleteObject: ; Offset_0x0250A6:
                jmp     (DeleteObject)                         ; Offset_0x01646C                    
;===============================================================================
; Objeto 0x3D - Obstásculo quebre para obter impulso na Oil Ocean
; [ Término ]
;===============================================================================  