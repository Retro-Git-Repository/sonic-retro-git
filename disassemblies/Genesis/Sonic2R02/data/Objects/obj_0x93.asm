;===============================================================================
; Objeto 0x93 - Broca lançada pelo inimigo Spiker na Hill Top 
; [ Início ]
;===============================================================================   
Offset_0x036A50:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036A5E(PC, D0), D1
                jmp     Offset_0x036A5E(PC, D1)
Offset_0x036A5E:
                dc.w    Offset_0x036A62-Offset_0x036A5E
                dc.w    Offset_0x036A92-Offset_0x036A5E
Offset_0x036A62:
                bsr     ObjectSettings                         ; Offset_0x03601A
                ori.b   #$80, $0001(A0)
                ori.b   #$80, $0020(A0)
                move.w  $002C(A0), A1
                move.b  $0001(A1), D0
                andi.b  #$03, D0
                or.b    D0, $0001(A0)
                moveq   #$02, D1
                btst    #$01, D0
                bne.s   Offset_0x036A8C
                neg.w   D1
Offset_0x036A8C:
                move.b  D1, $0012(A0)
                rts
Offset_0x036A92:
                tst.b   $0001(A0)
                bpl     J_DeleteObject_01                      ; Offset_0x036344
                bchg    #00, $0001(A0)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Spiker_Sub: ; Offset_0x036AAC: ; Usado pelo objeto 0x92 - Spiker                 
                tst.b   $002B(A0)
                bne.s   Offset_0x036AD0
                tst.b   $0001(A0)
                bpl.s   Offset_0x036AD0
                bsr     Offset_0x0360FC
                addi.w  #$0020, D2
                cmpi.w  #$0040, D2
                bcc.s   Offset_0x036AD0
                addi.w  #$0080, D3
                cmpi.w  #$0100, D3
                bcs.s   Offset_0x036AD4
Offset_0x036AD0:
                moveq   #$00, D0
                rts
Offset_0x036AD4:
                move.b  $0024(A0), $002F(A0)
                move.b  #$06, $0024(A0)
                move.b  #$10, $002E(A0)
                moveq   #$01, D0
                rts                     
;------------------------------------------------------------------------------- 
Obj_0x92_Ptr: ; Offset_0x036AEA:
                dc.l    Spiker_Mappings                        ; Offset_0x036B00
                dc.w    $0000
                dc.b    $04, $04, $10, $12                      
;-------------------------------------------------------------------------------       
Spiker_Animate_Data: ; Offset_0x036AF4:
                dc.w    Offset_0x036AF8-Spiker_Animate_Data
                dc.w    Offset_0x036AFC-Spiker_Animate_Data
Offset_0x036AF8:
                dc.b    $09, $00, $01, $FF
Offset_0x036AFC:
                dc.b    $09, $02, $03, $FF 
;-------------------------------------------------------------------------------
Spiker_Mappings: ; Offset_0x036B00:
                dc.w    Offset_0x036B0A-Spiker_Mappings
                dc.w    Offset_0x036B24-Spiker_Mappings
                dc.w    Offset_0x036B3E-Spiker_Mappings
                dc.w    Offset_0x036B50-Spiker_Mappings
                dc.w    Offset_0x036B62-Spiker_Mappings
Offset_0x036B0A:
                dc.w    $0003
                dc.l    $08090520, $0290FFF4, $E807252C, $2296FFF8
                dc.l    $000503DE, $01EFFFF8
Offset_0x036B24:
                dc.w    $0003
                dc.l    $08090526, $0293FFF4, $E807252C, $2296FFF8
                dc.l    $000503DE, $01EFFFF8
Offset_0x036B3E:
                dc.w    $0002
                dc.l    $08090520, $0290FFF4, $000503DE, $01EFFFF8
Offset_0x036B50:
                dc.w    $0002
                dc.l    $08090526, $0293FFF4, $000503DE, $01EFFFF8
Offset_0x036B62:
                dc.w    $0001
                dc.l    $EC07252C, $2296FFF8                                                                                                                
;===============================================================================
; Objeto 0x93 - Broca lançada pelo inimigo Spiker na Hill Top 
; [ Término ]
;===============================================================================