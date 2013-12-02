;===============================================================================
; Objeto 0x8E -> Grounder na Aquatic Ruin  
; [ Início ]
;===============================================================================    
Offset_0x03649C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0364AA(PC, D0), D1
                jmp     Offset_0x0364AA(PC, D1)
Offset_0x0364AA:
                dc.w    Offset_0x0364B6-Offset_0x0364AA
                dc.w    Offset_0x036502-Offset_0x0364AA
                dc.w    Offset_0x03652A-Offset_0x0364AA
                dc.w    Offset_0x03653C-Offset_0x0364AA
                dc.w    Offset_0x036564-Offset_0x0364AA
                dc.w    Offset_0x0365A2-Offset_0x0364AA
Offset_0x0364B6:
                bsr     ObjectSettings                         ; Offset_0x03601A
                bclr    #$01, $0001(A0)
                beq.s   Offset_0x0364CE
                bclr    #$01, $0022(A0)
                andi.w  #$7FFF, $0002(A0)
Offset_0x0364CE:
                move.b  #$14, $0016(A0)
                move.b  #$10, $0017(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl.s   Offset_0x0364EE
                add.w   D1, $000C(A0)
                move.w  #$0000, $0012(A0)
Offset_0x0364EE:
                move.b  $0000(A0), D0
                subi.b  #$8D, D0
                beq     Load_Grounder_Wall_Obj                 ; Offset_0x0366AC
                move.b  #$06, $0024(A0)
                rts
Offset_0x036502:
                bsr     Offset_0x0360FC
                tst.w   D2
                bpl.s   Offset_0x03650C
                neg.w   D2
Offset_0x03650C:
                cmpi.w  #$0060, D2
                bls.s   Offset_0x036518
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036518:
                addq.b  #$02, $0024(A0)
                st      $002B(A0)
                bsr     Load_Grounder_Rock_Obj                 ; Offset_0x036672
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03652A:
                lea     (Grounder_AnimateData_01), A1          ; Offset_0x036734
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03653C:
                addq.b  #$02, $0024(A0)
                bsr     Offset_0x0360FC
                move.w  Offset_0x036560(PC, D0), $0010(A0)
                bclr    #$00, $0022(A0)
                tst.w   D0
                beq.s   Offset_0x03655A
                bset    #$00, $0022(A0)
Offset_0x03655A:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036560:
                dc.w    $FF00, $0100
Offset_0x036564:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                cmpi.w  #$FFFF, D1
                blt.s   Offset_0x036592
                cmpi.w  #$000C, D1
                bge.s   Offset_0x036592
                add.w   D1, $000C(A0)
                lea     (Grounder_AnimateData), A1             ; Offset_0x03672C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036592:
                addq.b  #$02, $0024(A0)
                move.b  #$3B, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0365A2:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0365AE
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0365AE:
                move.b  #$08, $0024(A0)
                neg.w   $0010(A0)
                bchg    #00, $0022(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
;===============================================================================
; Objeto 0x8E -> Grounder na Aquatic Ruin  
; [ Término ]
;===============================================================================