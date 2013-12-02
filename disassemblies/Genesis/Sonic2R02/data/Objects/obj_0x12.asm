;===============================================================================
; Objeto 0x12 - Esmeralda Mestre na Hidden Palace
; [ Início ]
;===============================================================================   
Offset_0x02025A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020268(PC, D0), D1
                jmp     Offset_0x020268(PC, D1)
Offset_0x020268:
                dc.w    Offset_0x02026C-Offset_0x020268
                dc.w    Offset_0x020296-Offset_0x020268
Offset_0x02026C:
                addq.b  #$02, $0024(A0)
                move.l  #Master_Emerald_Mappings, $0004(A0)    ; Offset_0x0202C4
                move.w  #$6392, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.b  #$04, $0018(A0)
Offset_0x020296:
                move.w  #$0020, D1
                move.w  #$0010, D2
                move.w  #$0010, D3
                move.w  $0008(A0), D4
                bsr     SolidObject                            ; Offset_0x019686
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Obj_0x12_DeleteObject                  ; Offset_0x0202D8
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;------------------------------------------------------------------------------- 
Master_Emerald_Mappings: ; Offset_0x0202C4:
                dc.w    Offset_0x0202C6-Master_Emerald_Mappings
Offset_0x0202C6:
                dc.w    $0002
                dc.l    $F00F0000, $0000FFE0, $F00F0010, $00080000
;-------------------------------------------------------------------------------                 
Obj_0x12_DeleteObject: ; Offset_0x0202D8:
                jmp     (DeleteObject)                         ; Offset_0x01646C                  
;===============================================================================
; Objeto 0x12 - Esmeralda Mestre na Hidden Palace
; [ Término ]
;===============================================================================  