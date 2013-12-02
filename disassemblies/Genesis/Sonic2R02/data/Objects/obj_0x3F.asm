;===============================================================================
; Objeto 0x3F - Ventiladores na Oil Ocean
; [ Início ]
;===============================================================================    
Offset_0x02A42E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02A43C(PC, D0), D1
                jmp     Offset_0x02A43C(PC, D1)
Offset_0x02A43C:
                dc.w    Offset_0x02A442-Offset_0x02A43C
                dc.w    Offset_0x02A482-Offset_0x02A43C
                dc.w    Offset_0x02A580-Offset_0x02A43C
Offset_0x02A442:
                addq.b  #$02, $0024(A0)
                move.l  #Vertical_Fan_Mappings, $0004(A0)      ; Offset_0x02A696
                move.w  #$6403, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                tst.b   $0028(A0)
                bpl.s   Offset_0x02A482
                addq.b  #$02, $0024(A0)
                move.l  #Horizontal_Fan_Mappings, $0004(A0)    ; Offset_0x02A748
                bra     Offset_0x02A580
Offset_0x02A482:
                btst    #$01, $0028(A0)
                bne.s   Offset_0x02A4AA
                subq.w  #$01, $0030(A0)
                bpl.s   Offset_0x02A4AA
                move.w  #$0000, $0034(A0)
                move.w  #$0078, $0030(A0)
                bchg    #00, $0032(A0)
                beq.s   Offset_0x02A4AA
                move.w  #$00B4, $0030(A0)
Offset_0x02A4AA:
                tst.b   $0032(A0)
                beq     Offset_0x02A4CE
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02A510
                cmpi.w  #$0400, $0034(A0)
                bcc.s   Offset_0x02A510
                addi.w  #$002A, $0034(A0)
                move.b  $0034(A0), $001E(A0)
                bra.s   Offset_0x02A4EA
Offset_0x02A4CE:
                lea     ($FFFFB000).w, A1
                bsr     Offset_0x02A516
                lea     ($FFFFB040).w, A1
                bsr     Offset_0x02A516
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02A510
                move.b  #$00, $001E(A0)
Offset_0x02A4EA:
                addq.b  #$01, $001B(A0)
                cmpi.b  #$06, $001B(A0)
                bcs.s   Offset_0x02A4FC
                move.b  #$00, $001B(A0)
Offset_0x02A4FC:
                moveq   #$00, D0
                btst    #$00, $0028(A0)
                beq.s   Offset_0x02A508
                moveq   #$05, D0
Offset_0x02A508:
                add.b   $001B(A0), D0
                move.b  D0, $001A(A0)
Offset_0x02A510:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02A516:
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x02A57E
                tst.b   $002A(A1)
                bne.s   Offset_0x02A57E
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                btst    #$00, $0022(A0)
                bne.s   Offset_0x02A536
                neg.w   D0
Offset_0x02A536:
                addi.w  #$0050, D0
                cmpi.w  #$00F0, D0
                bcc.s   Offset_0x02A57E
                move.w  $000C(A1), D1
                addi.w  #$0060, D1
                sub.w   $000C(A0), D1
                bcs.s   Offset_0x02A57E
                cmpi.w  #$0070, D1
                bcc.s   Offset_0x02A57E
                subi.w  #$0050, D0
                bcc.s   Offset_0x02A55E
                not.w   D0
                add.w   D0, D0
Offset_0x02A55E:
                addi.w  #$0060, D0
                btst    #$00, $0022(A0)
                bne.s   Offset_0x02A56C
                neg.w   D0
Offset_0x02A56C:
                neg.b   D0
                asr.w   #$04, D0
                btst    #$00, $0028(A0)
                beq.s   Offset_0x02A57A
                neg.w   D0
Offset_0x02A57A:
                add.w   D0, $0008(A1)
Offset_0x02A57E:
                rts
Offset_0x02A580:
                btst    #$01, $0028(A0)
                bne.s   Offset_0x02A5A8
                subq.w  #$01, $0030(A0)
                bpl.s   Offset_0x02A5A8
                move.w  #$0000, $0034(A0)
                move.w  #$0078, $0030(A0)
                bchg    #00, $0032(A0)
                beq.s   Offset_0x02A5A8
                move.w  #$00B4, $0030(A0)
Offset_0x02A5A8:
                tst.b   $0032(A0)
                beq     Offset_0x02A5CC
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02A60E
                cmpi.w  #$0400, $0034(A0)
                bcc.s   Offset_0x02A60E
                addi.w  #$002A, $0034(A0)
                move.b  $0034(A0), $001E(A0)
                bra.s   Offset_0x02A5E8
Offset_0x02A5CC:
                lea     ($FFFFB000).w, A1
                bsr     Offset_0x02A614
                lea     ($FFFFB040).w, A1
                bsr     Offset_0x02A614
                subq.b  #$01, $001E(A0)
                bpl.s   Offset_0x02A60E
                move.b  #$00, $001E(A0)
Offset_0x02A5E8:
                addq.b  #$01, $001B(A0)
                cmpi.b  #$06, $001B(A0)
                bcs.s   Offset_0x02A5FA
                move.b  #$00, $001B(A0)
Offset_0x02A5FA:
                moveq   #$00, D0
                btst    #$00, $0028(A0)
                beq.s   Offset_0x02A606
                moveq   #$05, D0
Offset_0x02A606:
                add.b   $001B(A0), D0
                move.b  D0, $001A(A0)
Offset_0x02A60E:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x02A614:
                cmpi.b  #$04, $0024(A1)
                bcc.s   Offset_0x02A694
                tst.b   $002A(A1)
                bne.s   Offset_0x02A694
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$0040, D0
                cmpi.w  #$0080, D0
                bcc.s   Offset_0x02A694
                moveq   #$00, D1
                move.b  ($FFFFFE74).w, D1
                add.w   $000C(A1), D1
                addi.w  #$0060, D1
                sub.w   $000C(A0), D1
                bcs.s   Offset_0x02A694
                cmpi.w  #$0090, D1
                bcc.s   Offset_0x02A694
                subi.w  #$0060, D1
                bcs.s   Offset_0x02A658
                not.w   D1
                add.w   D1, D1
Offset_0x02A658:
                addi.w  #$0060, D1
                neg.w   D1
                asr.w   #$04, D1
                add.w   D1, $000C(A1)
                bset    #$01, $0022(A1)
                move.w  #$0000, $0012(A1)
                move.w  #$0001, $0014(A1)
                tst.b   $0027(A1)
                bne.s   Offset_0x02A694
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$7F, $002C(A1)
                move.b  #$08, $002D(A1)
Offset_0x02A694:
                rts
;-------------------------------------------------------------------------------
Vertical_Fan_Mappings: ; Offset_0x02A696:
                dc.w    Offset_0x02A6AC-Vertical_Fan_Mappings
                dc.w    Offset_0x02A6C6-Vertical_Fan_Mappings
                dc.w    Offset_0x02A6E0-Vertical_Fan_Mappings
                dc.w    Offset_0x02A6FA-Vertical_Fan_Mappings
                dc.w    Offset_0x02A714-Vertical_Fan_Mappings
                dc.w    Offset_0x02A72E-Vertical_Fan_Mappings
                dc.w    Offset_0x02A714-Vertical_Fan_Mappings
                dc.w    Offset_0x02A6FA-Vertical_Fan_Mappings
                dc.w    Offset_0x02A6E0-Vertical_Fan_Mappings
                dc.w    Offset_0x02A6C6-Vertical_Fan_Mappings
                dc.w    Offset_0x02A6AC-Vertical_Fan_Mappings
Offset_0x02A6AC:
                dc.w    $0003
                dc.l    $F3020000, $0000FFF4, $F0050007, $0003FFFC
                dc.l    $00051007, $1003FFFC
Offset_0x02A6C6:
                dc.w    $0003
                dc.l    $F5021000, $1000FFF4, $F0050007, $0003FFFC
                dc.l    $00051007, $1003FFFC
Offset_0x02A6E0:
                dc.w    $0003
                dc.l    $F0030003, $0001FFF4, $F0050007, $0003FFFC
                dc.l    $00051007, $1003FFFC
Offset_0x02A6FA:
                dc.w    $0003
                dc.l    $F3020000, $0000FFF4, $F005000B, $0005FFFC
                dc.l    $0005100B, $1005FFFC
Offset_0x02A714:
                dc.w    $0003
                dc.l    $F5021000, $1000FFF4, $F005000B, $0005FFFC
                dc.l    $0005100B, $1005FFFC
Offset_0x02A72E:
                dc.w    $0003
                dc.l    $F0030003, $0001FFF4, $F005000B, $0005FFFC
                dc.l    $0005100B, $1005FFFC
;-------------------------------------------------------------------------------
Horizontal_Fan_Mappings: ; Offset_0x02A748:
                dc.w    Offset_0x02A75E-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A778-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A792-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A7AC-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A7C6-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A7E0-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A7C6-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A7AC-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A792-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A778-Horizontal_Fan_Mappings
                dc.w    Offset_0x02A75E-Horizontal_Fan_Mappings
Offset_0x02A75E:
                dc.w    $0003
                dc.l    $F408000F, $0007FFF3, $FC050016, $000BFFF0
                dc.l    $FC050816, $080B0000
Offset_0x02A778:
                dc.w    $0003
                dc.l    $F408080F, $0807FFF5, $FC050016, $000BFFF0
                dc.l    $FC050816, $080B0000
Offset_0x02A792:
                dc.w    $0003
                dc.l    $F40C0012, $0009FFF0, $FC050016, $000BFFF0
                dc.l    $FC050816, $080B0000
Offset_0x02A7AC:
                dc.w    $0003
                dc.l    $F408000F, $0007FFF3, $FC05001A, $000DFFF0
                dc.l    $FC05081A, $080D0000
Offset_0x02A7C6:
                dc.w    $0003
                dc.l    $F408080F, $0807FFF5, $FC05001A, $000DFFF0
                dc.l    $FC05081A, $080D0000
Offset_0x02A7E0:
                dc.w    $0003
                dc.l    $F40C0012, $0009FFF0, $FC05001A, $000DFFF0
                dc.l    $FC05081A, $080D0000
;===============================================================================
; Objeto 0x3F - Ventiladores na Oil Ocean
; [ Término ]
;===============================================================================  