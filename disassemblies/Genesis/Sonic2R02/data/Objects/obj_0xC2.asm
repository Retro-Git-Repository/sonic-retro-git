;===============================================================================
; Objeto 0xC2 - Botão para acesso a cabine do avião com chefe na Wing Fortress
; [ Início ]
;===============================================================================  
Offset_0x03BFEA:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03BFF8(PC, D0), D1
                jmp     Offset_0x03BFF8(PC, D1)
Offset_0x03BFF8:
                dc.w    Offset_0x03BFFC-Offset_0x03BFF8
                dc.w    Offset_0x03C000-Offset_0x03BFF8
Offset_0x03BFFC:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x03C000:
                move.b  ($FFFFB01C).w, $0030(A0)
                move.w  $0008(A0), -(A7)
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
                move.w  (A7)+, D4
                jsr     (SolidObject)                          ; Offset_0x019686
                btst    #$03, $0022(A0)
                bne.s   Offset_0x03C02C
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03C02C:
                cmpi.b  #$02, $0030(A0)
                bne.s   Offset_0x03C07A
                move.w  #$2880, ($FFFFEEC8).w
                bclr    #$03, $0022(A0)
                move.b  #$27, $0000(A0)
                move.b  #$02, $0024(A0)
                bset    #$01, ($FFFFB022).w
                bclr    #$03, ($FFFFB022).w
                lea     ($FFFF8850).w, A1
                move.l  #$8A707172, (A1)+
                move.w  #$7374, (A1)+
                lea     ($FFFF8950).w, A1
                move.l  #$6E787978, (A1)+
                move.w  #$787A, (A1)+
                move.b  #$01, ($FFFFF72C).w
Offset_0x03C07A:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Obj_0xC2_Ptr: ; Offset_0x03C080:
                dc.l    WFz_Boss_Access_Switch_Mappings        ; Offset_0x03C08A
                dc.w    $A461
                dc.b    $04, $04, $10, $00
;-------------------------------------------------------------------------------   
WFz_Boss_Access_Switch_Mappings: ; Offset_0x03C08A:
                dc.w    Offset_0x03C08C-WFz_Boss_Access_Switch_Mappings
Offset_0x03C08C:
                dc.w    $0002
                dc.l    $F8050000, $0000FFF0, $F8050800, $08000000                                                                                                                               
;===============================================================================
; Objeto 0xC2 - Botão para acesso a cabine do avião com chefe na Wing Fortress 
; [ Término ]
;===============================================================================