;===============================================================================
; Object 0xA5 - Lander badnick - Chemical Plant
; [ Begin ]
;===============================================================================  
Offset_0x038650:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03865E(PC, D0), D1
                jmp     Offset_0x03865E(PC, D1)
Offset_0x03865E:
                dc.w    Offset_0x038664-Offset_0x03865E
                dc.w    Offset_0x038676-Offset_0x03865E
                dc.w    Offset_0x0386D0-Offset_0x03865E
Offset_0x038664:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$FFC0, $0010(A0)
                move.w  #$0080, $002A(A0)
                rts
Offset_0x038676:
                tst.b   $002B(A0)
                beq.s   Offset_0x038684
                subq.b  #$01, $002B(A0)
                bra     Offset_0x038692
Offset_0x038684:
                bsr     Offset_0x0360FC
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x0386BA
Offset_0x038692:
                subq.b  #$01, $002A(A0)
                bne.s   Offset_0x0386A2
                move.w  #$0080, $002A(A0)
                neg.w   $0010(A0)
Offset_0x0386A2:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Horizontal_Spiny_Animate_Data), A1    ; Offset_0x03883E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0386BA:
                addq.b  #$02, $0024(A0)
                move.b  #$28, $002B(A0)
                move.b  #$02, $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0386D0:
                subq.b  #$01, $002B(A0)
                bmi.s   Offset_0x0386E8
                cmpi.b  #$14, $002B(A0)
                bne.s   Offset_0x0386E2
                bsr     Load_Spiny_Horizontal_Shot_Obj         ; Offset_0x0387A0
Offset_0x0386E2:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0386E8:
                subq.b  #$02, $0024(A0)
                move.b  #$40, $002B(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358                                         
;===============================================================================
; Object 0xA5 - Lander badnick - Chemical Plant
; [ End ]
;===============================================================================