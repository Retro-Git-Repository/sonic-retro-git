;===============================================================================
; Objeto 0x9F - Inimigo Shellcracker na Metropolis
; [ Início ]
;===============================================================================    
Offset_0x037B08:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x037B16(PC, D0), D1
                jmp     Offset_0x037B16(PC, D1)
Offset_0x037B16:
                dc.w    Offset_0x037B1E-Offset_0x037B16
                dc.w    Offset_0x037B4A-Offset_0x037B16
                dc.w    Offset_0x037BCA-Offset_0x037B16
                dc.w    Offset_0x037C06-Offset_0x037B16
Offset_0x037B1E:
                bsr     ObjectSettings                         ; Offset_0x03601A
                btst    #$00, $0001(A0)
                beq.s   Offset_0x037B30
                bset    #$00, $0022(A0)
Offset_0x037B30:
                move.w  #$FFC0, $0010(A0)
                move.b  #$0C, $0016(A0)
                move.b  #$18, $0017(A0)
                move.w  #$0140, $002A(A0)
                rts
Offset_0x037B4A:
                bsr     Offset_0x0360FC
                tst.w   D0
                beq.s   Offset_0x037B5A
                btst    #$00, $0001(A0)
                beq.s   Offset_0x037B64
Offset_0x037B5A:
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x037BB2
Offset_0x037B64:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                cmpi.w  #$FFF8, D1
                blt.s   Offset_0x037B98
                cmpi.w  #$000C, D1
                bge.s   Offset_0x037B98
                add.w   D1, $000C(A0)
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x037B9C
                lea     (Shellcracker_Animate_Data), A1        ; Offset_0x037E1C
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037B98:
                neg.w   $0010(A0)
Offset_0x037B9C:
                addq.b  #$02, $0024(A0)
                move.b  #$00, $001A(A0)
                move.w  #$003B, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037BB2:
                move.b  #$06, $0024(A0)
                move.b  #$00, $001A(A0)
                move.w  #$0008, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037BCA:
                tst.b   $0001(A0)
                bpl.s   Offset_0x037BEA
                bsr     Offset_0x0360FC
                tst.w   D0
                beq.s   Offset_0x037BE0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x037BEA
Offset_0x037BE0:
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcs.s   Offset_0x037BB2
Offset_0x037BEA:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x037BF6
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037BF6:
                subq.b  #$02, $0024(A0)
                move.w  #$0140, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037C06:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x037C1A(PC, D0), D1
                jsr     Offset_0x037C1A(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037C1A:
                dc.w    Offset_0x037C20-Offset_0x037C1A
                dc.w    Offset_0x037C36-Offset_0x037C1A
                dc.w    Offset_0x037C4A-Offset_0x037C1A
Offset_0x037C20:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x037C28
                rts
Offset_0x037C28:
                addq.b  #$02, $0025(A0)
                move.b  #$03, $001A(A0)
                bra     Load_Sheelcracker_Craw_Obj             ; Offset_0x037DAA
Offset_0x037C36:
                tst.b   $002C(A0)
                bne.s   Offset_0x037C3E
                rts
Offset_0x037C3E:
                addq.b  #$02, $0025(A0)
                move.w  #$0020, $002A(A0)
                rts
Offset_0x037C4A:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x037C52
                rts
Offset_0x037C52:
                clr.b   $0025(A0)
                clr.b   $002C(A0)
                move.b  #$02, $0024(A0)
                move.w  #$0140, $002A(A0)
                rts
;===============================================================================
; Objeto 0x9F - Inimigo Shellcracker na Metropolis
; [ Término ]
;===============================================================================  