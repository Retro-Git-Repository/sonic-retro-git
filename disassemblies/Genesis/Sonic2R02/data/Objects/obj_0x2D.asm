;===============================================================================
; Objeto 0x2D - Porta automática na Chemical Plant / Hill Top / Metropolis
; [ Início ]
;===============================================================================   
Offset_0x01164C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01165A(PC, D0), D1
                jmp     Offset_0x01165A(PC, D1)
Offset_0x01165A:
                dc.w    Offset_0x01165E-Offset_0x01165A
                dc.w    Offset_0x011710-Offset_0x01165A
Offset_0x01165E:
                addq.b  #$02, $0024(A0)
                move.l  #Automatic_Door_Mappings, $0004(A0)    ; Offset_0x0117D6
                move.w  #$2426, $0002(A0)
                move.b  #$08, $0019(A0)
                cmpi.b  #$04, (Level_Id).w                           ; $FFFFFE10
                beq.s   Offset_0x011686
                cmpi.b  #$05, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x011692
Offset_0x011686:
                move.w  #$6000, $0002(A0)
                move.b  #$0C, $0019(A0)
Offset_0x011692:
                cmpi.b  #$0D, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x0116A6
                move.w  #$2394, $0002(A0)
                move.b  #$08, $0019(A0)
Offset_0x0116A6:
                cmpi.b  #$0E, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x0116BA
                move.w  #$2328, $0002(A0)
                move.b  #$08, $0019(A0)
Offset_0x0116BA:
                cmpi.b  #$0F, (Level_Id).w                           ; $FFFFFE10
                bne.s   Offset_0x0116CE
                move.w  #$23F8, $0002(A0)
                move.b  #$08, $0019(A0)
Offset_0x0116CE:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  $0028(A0), $001A(A0)
                move.w  $0008(A0), D2
                move.w  D2, D3
                subi.w  #$0200, D2
                addi.w  #$0018, D3
                btst    #$00, $0022(A0)
                beq.s   Offset_0x011708
                subi.w  #$FE18, D2
                addi.w  #$01E8, D3
Offset_0x011708:
                move.w  D2, $0038(A0)
                move.w  D3, $003A(A0)
Offset_0x011710:
                btst    #$00, $0022(A0)
                bne.s   Offset_0x01172C
                move.w  $0038(A0), D2
                move.w  $0008(A0), D3
                tst.b   $0025(A0)
                beq.s   Offset_0x01173E
                move.w  $003A(A0), D3
                bra.s   Offset_0x01173E
Offset_0x01172C:
                move.w  $0008(A0), D2
                move.w  $003A(A0), D3
                tst.b   $0025(A0)
                beq.s   Offset_0x01173E
                move.w  $0038(A0), D2
Offset_0x01173E:
                move.w  $0032(A0), D4
                move.w  D4, D5
                subi.w  #$0020, D4
                addi.w  #$0020, D5
                move.b  #$00, $0025(A0)
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x0117A8
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x0117A8
                tst.b   $0025(A0)
                beq.s   Offset_0x011772
                cmpi.w  #$0040, $0030(A0)
                beq.s   Offset_0x011788
                addq.w  #$08, $0030(A0)
                bra.s   Offset_0x01177C
Offset_0x011772:
                tst.w   $0030(A0)
                beq.s   Offset_0x011788
                subq.w  #$08, $0030(A0)
Offset_0x01177C:
                move.w  $0032(A0), D0
                sub.w   $0030(A0), D0
                move.w  D0, $000C(A0)
Offset_0x011788:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0020, D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                bra     MarkObjGone                            ; Offset_0x016358
Offset_0x0117A8:
                move.w  $0008(A1), D0
                cmp.w   D2, D0
                blt     Offset_0x0117D4
                cmp.w   D3, D0
                bcc     Offset_0x0117D4
                move.w  $000C(A1), D0
                cmp.w   D4, D0
                bcs     Offset_0x0117D4
                cmp.w   D5, D0
                bcc     Offset_0x0117D4
                tst.b   $002A(A1)
                bmi.s   Offset_0x0117D4
                move.b  #$02, $0025(A0)
Offset_0x0117D4:
                rts
;-------------------------------------------------------------------------------
Automatic_Door_Mappings: ; Offset_0x0117D6:
                dc.w    Offset_0x0117DE-Automatic_Door_Mappings
                dc.w    Offset_0x011800-Automatic_Door_Mappings
                dc.w    Offset_0x011812-Automatic_Door_Mappings
                dc.w    Offset_0x011824-Automatic_Door_Mappings
Offset_0x0117DE:
                dc.w    $0004
                dc.l    $E0050000, $0000FFF8, $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFF8, $10050000, $0000FFF8
Offset_0x011800:
                dc.w    $0002
                dc.l    $E00B005F, $002FFFF4, $000B005F, $002FFFF4
Offset_0x011812:
                dc.w    $0002
                dc.l    $E0070000, $0000FFF8, $00070000, $0000FFF8
Offset_0x011824:
                dc.w    $0002
                dc.l    $E0070000, $0000FFF8, $00070000, $0000FFF8           
;===============================================================================
; Objeto 0x2D - Porta automática na Chemical Plant / Hill Top / Metropolis
; [ Término ]
;===============================================================================  