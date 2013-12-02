;===============================================================================
; Objeto 0x69 - Porca usada nos parafusos na Metropolis
; [ Início ]
;===============================================================================     
Offset_0x027654:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x027662(PC, D0), D1
                jmp     Offset_0x027662(PC, D1)
Offset_0x027662:
                dc.w    Offset_0x02766A-Offset_0x027662
                dc.w    Offset_0x0276AE-Offset_0x027662
                dc.w    Offset_0x0277D2-Offset_0x027662
                dc.w    Offset_0x0276C6-Offset_0x027662
Offset_0x02766A:
                addq.b  #$02, $0024(A0)
                move.l  #Screw_Nut_Mappings, $0004(A0)         ; Offset_0x027800
                move.w  #$2500, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.b  #$0B, $0016(A0)
                move.b  #$04, $0018(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  $0028(A0), D0
                andi.w  #$007F, D0
                lsl.w   #$03, D0
                move.w  D0, $0036(A0)
Offset_0x0276AE:
                lea     ($FFFFB000).w, A1
                lea     $0038(A0), A4
                moveq   #$03, D6
                bsr.s   Offset_0x0276E8
                lea     ($FFFFB040).w, A1
                lea     $003C(A0), A4
                moveq   #$04, D6
                bsr.s   Offset_0x0276E8
Offset_0x0276C6:
                andi.w  #$07FF, $000C(A0)
                move.w  #$002B, D1
                move.w  #$000C, D2
                move.w  #$000D, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0276E8:
                btst    D6, $0022(A0)
                bne.s   Offset_0x0276F0
                clr.b   (A4)
Offset_0x0276F0:
                moveq   #$00, D0
                move.b  (A4), D0
                move.w  Offset_0x0276FC(PC, D0), D0
                jmp     Offset_0x0276FC(PC, D0)
Offset_0x0276FC:
                dc.w    Offset_0x027702-Offset_0x0276FC
                dc.w    Offset_0x027722-Offset_0x0276FC
                dc.w    Offset_0x027744-Offset_0x0276FC
Offset_0x027702:
                btst    D6, $0022(A0)
                bne.s   Offset_0x02770A
                rts
Offset_0x02770A:
                addq.b  #$02, (A4)
                move.b  #$00, $0001(A4)
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcc.s   Offset_0x027722
                move.b  #$01, $0001(A4)
Offset_0x027722:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                tst.b   $0001(A4)
                beq.s   Offset_0x027734
                addi.w  #$000F, D0
Offset_0x027734:
                cmpi.w  #$0010, D0
                bcc.s   Offset_0x027742
                move.w  $0008(A0), $0008(A1)
                addq.b  #$02, (A4)
Offset_0x027742:
                rts
Offset_0x027744:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                bcc.s   Offset_0x0277AA
                add.w   D0, $0034(A0)
                move.w  $0008(A0), $0008(A1)
                move.w  $0034(A0), D0
                asr.w   #$03, D0
                move.w  D0, D1
                asr.w   #$01, D0
                andi.w  #$0003, D0
                move.b  D0, $001A(A0)
                neg.w   D1
                add.w   $0032(A0), D1
                move.w  D1, $000C(A0)
                sub.w   $0032(A0), D1
                move.w  $0036(A0), D0
                cmp.w   D0, D1
                blt.s   Offset_0x0277A8
                move.w  D0, D1
                add.w   $0032(A0), D1
                move.w  D1, $000C(A0)
                lsl.w   #$03, D0
                neg.w   D0
                move.w  D0, $0034(A0)
                move.b  #$00, $001A(A0)
                tst.b   $0028(A0)
                bmi.s   Offset_0x0277A2
                clr.b   (A4)
                rts
Offset_0x0277A2:
                move.b  #$04, $0024(A0)
Offset_0x0277A8:
                rts
Offset_0x0277AA:
                add.w   D0, $0034(A0)
                move.w  $0008(A0), $0008(A1)
                move.w  $0034(A0), D0
                asr.w   #$03, D0
                move.w  D0, D1
                asr.w   #$01, D0
                andi.w  #$0003, D0
                move.b  D0, $001A(A0)
                neg.w   D1
                add.w   $0032(A0), D1
                move.w  D1, $000C(A0)
                rts
Offset_0x0277D2:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0038, $0012(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl     Offset_0x0277FC
                add.w   D1, $000C(A0)
                andi.w  #$07FF, $000C(A0)
                clr.w   $0012(A0)
                addq.b  #$02, $0024(A0)
Offset_0x0277FC:
                bra     Offset_0x0276C6
;-------------------------------------------------------------------------------
Screw_Nut_Mappings: ; Offset_0x027800:
                dc.w    Offset_0x027808-Screw_Nut_Mappings
                dc.w    Offset_0x02781A-Screw_Nut_Mappings
                dc.w    Offset_0x027834-Screw_Nut_Mappings
                dc.w    Offset_0x02784E-Screw_Nut_Mappings
Offset_0x027808:
                dc.w    $0002
                dc.l    $F40E0000, $0000FFE0, $F40E000C, $00060000
Offset_0x02781A:
                dc.w    $0003
                dc.l    $F40A0003, $0001FFE0, $F40E000C, $0006FFF8
                dc.l    $F4020809, $08040018
Offset_0x027834:
                dc.w    $0003
                dc.l    $F4060024, $0012FFE0, $F40E002A, $0015FFF0
                dc.l    $F4060018, $000C0010
Offset_0x02784E:
                dc.w    $0003
                dc.l    $F4020027, $0013FFE0, $F40E0018, $000CFFE8
                dc.l    $F40A082D, $08160008
;===============================================================================
; Objeto 0x68 - Bloco com harpão na Metropolis
; [ Término ]
;===============================================================================  