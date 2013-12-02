;===============================================================================
; Objeto 0x31 - Atributo invisível das lavas na Hill Top / Metropolis
; [ Início ]
;=============================================================================== 
Offset_0x020D20:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020D2E(PC, D0), D1
                jmp     Offset_0x020D2E(PC, D1)
Offset_0x020D2E:
                dc.w    Offset_0x020D36-Offset_0x020D2E
                dc.w    Offset_0x020D7A-Offset_0x020D2E
;-------------------------------------------------------------------------------                   
Offset_0x020D32:
                dc.b    $96, $94, $95, $00
;-------------------------------------------------------------------------------                   
Offset_0x020D36:
                addq.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.b  Offset_0x020D32(PC, D0), $0020(A0)
                move.l  #Lava_Attributes_Mappings_No_Display, $0004(A0) ; Offset_0x020DA2
                tst.w   (Debug_Mode_Flag_Index).w                    ; $FFFFFE08
                beq.s   Offset_0x020D5C
                move.l  #Lava_Attributes_Mappings, $0004(A0)   ; Offset_0x020DAA
Offset_0x020D5C:
                move.w  #$8680, $0002(A0)
                move.b  #$84, $0001(A0)
                move.b  #$80, $0019(A0)
                move.b  #$04, $0018(A0)
                move.b  $0028(A0), $001A(A0)
Offset_0x020D7A:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                bne.s   Offset_0x020D94
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     J_DeleteObject                         ; Offset_0x0213F0
Offset_0x020D94:
                tst.w   ($FFFFFE08).w
                beq.s   Offset_0x020DA0
                jsr     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x020DA0:
                rts
;-------------------------------------------------------------------------------
Lava_Attributes_Mappings_No_Display: ; Offset_0x020DA2:
                dc.w    Offset_0x020DA8-Lava_Attributes_Mappings_No_Display
                dc.w    Offset_0x020DA8-Lava_Attributes_Mappings_No_Display
                dc.w    Offset_0x020DA8-Lava_Attributes_Mappings_No_Display
Offset_0x020DA8:
                dc.w    $0000
;-------------------------------------------------------------------------------  
Lava_Attributes_Mappings: ; Offset_0x020DAA:
                dc.w    Offset_0x020DB0-Lava_Attributes_Mappings
                dc.w    Offset_0x020DD2-Lava_Attributes_Mappings
                dc.w    Offset_0x020DF4-Lava_Attributes_Mappings
Offset_0x020DB0:
                dc.w    $0004
                dc.l    $E0050034, $001AFFE0, $E0050034, $001A0010
                dc.l    $10050034, $001AFFE0, $10050034, $001A0010
Offset_0x020DD2:
                dc.w    $0004
                dc.l    $E0050034, $001AFFC0, $E0050034, $001A0030
                dc.l    $10050034, $001AFFC0, $10050034, $001A0030
Offset_0x020DF4:
                dc.w    $0004
                dc.l    $E0050034, $001AFF80, $E0050034, $001A0070
                dc.l    $10050034, $001AFF80, $10050034, $001A0070
;===============================================================================
; Objeto 0x31 - Atributo invisível das lavas na Hill Top / Metropolis 
; [ Término ]
;===============================================================================  