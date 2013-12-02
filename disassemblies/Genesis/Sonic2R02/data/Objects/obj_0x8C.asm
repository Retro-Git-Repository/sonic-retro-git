;===============================================================================
; Objeto 0x8C -> Moscas na Aquatic Ruin 
; [ Início ]
;===============================================================================  
Offset_0x03634A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036358(PC, D0), D1
                jmp     Offset_0x036358(PC, D1)
Offset_0x036358:
                dc.w    Offset_0x036362-Offset_0x036358
                dc.w    Offset_0x036374-Offset_0x036358
                dc.w    Offset_0x0363CE-Offset_0x036358
                dc.w    Offset_0x03637E-Offset_0x036358
                dc.w    Offset_0x03644C-Offset_0x036358
Offset_0x036362:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$10, $002A(A0)
                move.b  #$04, $002B(A0)
                rts
Offset_0x036374:
                tst.b   $0001(A0)
                bmi.s   Offset_0x036396
                bra     Offset_0x036384
Offset_0x03637E:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x036396
Offset_0x036384:
                lea     (Whisp_Animate_Data), A1               ; Offset_0x03646E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036396:
                subq.b  #$01, $002B(A0)
                bpl.s   Offset_0x0363BC
                move.b  #$08, $0024(A0)
                bclr    #$00, $0022(A0)
                clr.w   $0012(A0)
                move.w  #$FE00, $0010(A0)
                move.w  #$FE00, $0012(A0)
                bra     Offset_0x03644C
Offset_0x0363BC:
                move.b  #$04, $0024(A0)
                move.w  #$FF00, $0012(A0)
                move.b  #$60, $002A(A0)
Offset_0x0363CE:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x03641E
                bsr     Offset_0x0360FC
                bclr    #$00, $0022(A0)
                tst.w   D0
                beq.s   Offset_0x0363E8
                bset    #$00, $0022(A0)
Offset_0x0363E8:
                move.w  Offset_0x03641A(PC, D0), D2
                add.w   D2, $0010(A0)
                move.w  Offset_0x03641A(PC, D1), D2
                add.w   D2, $0012(A0)
                move.w  #$0200, D0
                move.w  D0, D1
                bsr     Offset_0x036140
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Whisp_Animate_Data), A1               ; Offset_0x03646E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03641A:
                dc.w    $FFF0, $0010
Offset_0x03641E:
                move.b  #$06, $0024(A0)
                jsr     (PseudoRandomNumber)                   ; Offset_0x00334A
                move.l  ($FFFFF636).w, D0
                andi.b  #$1F, D0
                move.b  D0, $002A(A0)
                bsr     Offset_0x03617A
                lea     (Whisp_Animate_Data), A1               ; Offset_0x03646E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03644C:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Whisp_Animate_Data), A1               ; Offset_0x03646E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Obj_0x8C_Ptr: ; Offset_0x036464:
                dc.l    Whisp_Mappings                         ; Offset_0x036474
                dc.w    $A500
                dc.b    $04, $04, $0C, $0B
;-------------------------------------------------------------------------------
Whisp_Animate_Data: ; Offset_0x03646E:
                dc.w    Offset_0x036470-Whisp_Animate_Data
Offset_0x036470:
                dc.b    $01, $00, $01, $FF
;-------------------------------------------------------------------------------
Whisp_Mappings: ; Offset_0x036474:                
                dc.w    Offset_0x036478-Whisp_Mappings
                dc.w    Offset_0x03648A-Whisp_Mappings
Offset_0x036478:
                dc.w    $0002
                dc.l    $F8080000, $0000FFF4, $00080003, $0001FFF4
Offset_0x03648A:
                dc.w    $0002
                dc.l    $F8080006, $0003FFF4, $00080003, $0001FFF4                        
;===============================================================================
; Objeto 0x8C -> Moscas na Aquatic Ruin 
; [ Término ]
;===============================================================================
