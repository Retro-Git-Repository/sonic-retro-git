;===============================================================================
; Objeto 0xB4 - Hélice Vertical na Wing Fortress
; [ Início ]
;===============================================================================   
Offset_0x03AFBE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03AFCC(PC, D0), D1
                jmp     Offset_0x03AFCC(PC, D1)
Offset_0x03AFCC:
                dc.w    Offset_0x03AFD0-Offset_0x03AFCC
                dc.w    Offset_0x03AFE2-Offset_0x03AFCC
Offset_0x03AFD0:
                bsr     ObjectSettings                         ; Offset_0x03601A
                bclr    #$01, $0001(A0)
                beq.s   Offset_0x03AFE0
                clr.b   $0020(A0)
Offset_0x03AFE0:
                rts
Offset_0x03AFE2:                                             
                lea     (Vertical_Helix_Animate_Data), A1      ; Offset_0x03B010
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$1F, D0
                bne.s   Offset_0x03B000
                moveq   #$FFFFFFDE, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x03B000:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Obj_0xB4_Ptr: ; Offset_0x03B006:
                dc.l    Vertical_Helix_Mappings                ; Offset_0x03B018
                dc.w    $A561
                dc.b    $04, $04, $04, $A8
;-------------------------------------------------------------------------------
Vertical_Helix_Animate_Data: ; Offset_0x03B010:
                dc.w    Offset_0x03B012-Vertical_Helix_Animate_Data
Offset_0x03B012:
                dc.b    $01, $00, $01, $02, $FF, $00
;-------------------------------------------------------------------------------   
Vertical_Helix_Mappings: ; Offset_0x03B018:
                dc.w    Offset_0x03B01E-Vertical_Helix_Mappings
                dc.w    Offset_0x03B030-Vertical_Helix_Mappings
                dc.w    Offset_0x03B042-Vertical_Helix_Mappings
Offset_0x03B01E:
                dc.w    $0002
                dc.l    $C0030000, $0000FFFC, $E0031000, $1000FFFC
Offset_0x03B030:
                dc.w    $0002
                dc.l    $E0030000, $0000FFFC, $00031000, $1000FFFC
Offset_0x03B042:
                dc.w    $0002
                dc.l    $00030000, $0000FFFC, $20031000, $1000FFFC                                                                                                                         
;===============================================================================
; Objeto 0xB4 - Hélice Vertical na Wing Fortress
; [ Término ]
;===============================================================================