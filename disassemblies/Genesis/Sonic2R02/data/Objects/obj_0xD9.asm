;===============================================================================
; Objeto 0xD9 - Objeto invísivel para se agarrar na Wing Fortress 
; [ Início ]
;===============================================================================   
Offset_0x02C518:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02C526(PC, D0), D1
                jmp     Offset_0x02C526(PC, D1)
Offset_0x02C526:
                dc.w    Offset_0x02C52A-Offset_0x02C526
                dc.w    Offset_0x02C540-Offset_0x02C526
Offset_0x02C52A:
                addq.b  #$02, $0024(A0)
                move.b  #$04, $0001(A0)
                move.b  #$18, $0019(A0)
                move.b  #$04, $0018(A0)
Offset_0x02C540:
                lea     $0030(A0), A2
                lea     ($FFFFB000).w, A1
                move.w  ($FFFFF604).w, D0
                bsr.s   Offset_0x02C560
                lea     ($FFFFB040).w, A1
                addq.w  #$01, A2
                move.w  ($FFFFF606).w, D0
                bsr.s   Offset_0x02C560
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x02C560:
                tst.b   (A2)
                beq.s   Offset_0x02C58E
                andi.b  #$70, D0
                beq     Offset_0x02C5F6
                clr.b   $002A(A1)
                clr.b   (A2)
                move.b  #$12, $0002(A2)
                andi.w  #$0F00, D0
                beq.s   Offset_0x02C584
                move.b  #$3C, $0002(A2)
Offset_0x02C584:
                move.w  #$FD00, $0012(A1)
                bra     Offset_0x02C5F6
Offset_0x02C58E:
                tst.b   $0002(A2)
                beq.s   Offset_0x02C59C
                subq.b  #$01, $0002(A2)
                bne     Offset_0x02C5F6
Offset_0x02C59C:
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$0018, D0
                cmpi.w  #$0030, D0
                bcc     Offset_0x02C5F6
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                cmpi.w  #$0010, D1
                bcc     Offset_0x02C5F6
                tst.b   $002A(A1)
                bmi.s   Offset_0x02C5F6
                cmpi.b  #$06, $0024(A1)
                bcc.s   Offset_0x02C5F6
                tst.w   ($FFFFFE08).w
                bne.s   Offset_0x02C5F6
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                clr.w   $0014(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$14, $001C(A1)
                move.b  #$01, $002A(A1)
                move.b  #$01, (A2)
Offset_0x02C5F6:
                rts    
;===============================================================================
; Objeto 0xD9 - Objeto invísivel para se agarrar na Wing Fortress
; [ Término ]
;===============================================================================