;===============================================================================
; Objeto 0xA1 - Inimigo Slicer na Metropolis
; [ Início ]
;===============================================================================  
Offset_0x037ECC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x037EDA(PC, D0), D1
                jmp     Offset_0x037EDA(PC, D1)
Offset_0x037EDA:
                dc.w    Offset_0x037EE4-Offset_0x037EDA
                dc.w    Offset_0x037F08-Offset_0x037EDA
                dc.w    Offset_0x037F88-Offset_0x037EDA
                dc.w    Offset_0x037FA8-Offset_0x037EDA
                dc.w    Offset_0x037FC8-Offset_0x037EDA
Offset_0x037EE4:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$FFC0, D0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x037EF6
                neg.w   D0
Offset_0x037EF6:
                move.w  D0, $0010(A0)
                move.b  #$10, $0016(A0)
                move.b  #$10, $0017(A0)
                rts
Offset_0x037F08:
                tst.b   $0001(A0)
                bpl.s   Offset_0x037F34
                bsr     Offset_0x0360FC
                btst    #$00, $0001(A0)
                beq.s   Offset_0x037F1C
                subq.w  #$02, D0
Offset_0x037F1C:
                tst.w   D0
                bne.s   Offset_0x037F34
                addi.w  #$0080, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x037F34
                addi.w  #$0040, D3
                cmpi.w  #$0080, D3
                bcs.s   Offset_0x037F72
Offset_0x037F34:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                cmpi.w  #$FFF8, D1
                blt.s   Offset_0x037F62
                cmpi.w  #$000C, D1
                bge.s   Offset_0x037F62
                add.w   D1, $000C(A0)
                lea     (Slicer_Animate_Data), A1              ; Offset_0x038110
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037F62:
                addq.b  #$02, $0024(A0)
                move.b  #$3B, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037F72:
                addq.b  #$04, $0024(A0)
                move.b  #$03, $001A(A0)
                move.b  #$08, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037F88:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x037F94
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037F94:
                subq.b  #$02, $0024(A0)
                neg.w   $0010(A0)
                bchg    #00, $0022(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037FA8:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x037FB4
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037FB4:
                addq.b  #$02, $0024(A0)
                move.b  #$04, $001A(A0)
                bsr     Load_Slicer_Pincers_Obj                ; Offset_0x038078
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037FC8:
                jmp     (MarkObjGone)                          ; Offset_0x016358   
;===============================================================================
; Objeto 0xA1 - Inimigo Slicer na Metropolis
; [ Término ]
;===============================================================================  