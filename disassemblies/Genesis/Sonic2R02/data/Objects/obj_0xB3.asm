;===============================================================================
; Objeto 0xB3 - Nuvens na Sky Chase
; [ Início ]
;===============================================================================  
Offset_0x03AF30:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03AF3E(PC, D0), D1
                jmp     Offset_0x03AF3E(PC, D1)
Offset_0x03AF3E:
                dc.w    Offset_0x03AF42-Offset_0x03AF3E
                dc.w    Offset_0x03AF64-Offset_0x03AF3E
Offset_0x03AF42:
                bsr     ObjectSettings                         ; Offset_0x03601A
                moveq   #$00, D0
                move.b  $0028(A0), D0
                subi.b  #$5E, D0
                move.w  Offset_0x03AF5E(PC, D0), $0010(A0)
                lsr.w   #$01, D0
                move.b  D0, $001A(A0)
                rts
Offset_0x03AF5E:
                dc.w    $FF80, $FFC0, $FFE0
Offset_0x03AF64:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  ($FFFFF736).w, D0
                add.w   D0, $0008(A0)
                bra     Offset_0x0361AE    
;------------------------------------------------------------------------------- 
Obj_0xB3_Ptr: ; Offset_0x03AF76:
                dc.l    Clouds_Mappings                        ; Offset_0x03AF80
                dc.w    $454F
                dc.b    $04, $06, $30, $00                   
;-------------------------------------------------------------------------------  
Clouds_Mappings: ; Offset_0x03AF80:
                dc.w    Offset_0x03AF88-Clouds_Mappings
                dc.w    Offset_0x03AFA2-Clouds_Mappings
                dc.w    Offset_0x03AFB4-Clouds_Mappings
                dc.w    Offset_0x03AF88-Clouds_Mappings
Offset_0x03AF88:
                dc.w    $0003
                dc.l    $FC0C0000, $0000FFD8, $FC0C0004, $0002FFF8
                dc.l    $FC040008, $00040018
Offset_0x03AFA2:
                dc.w    $0002
                dc.l    $FC0C000A, $0005FFE8, $FC04000E, $00070008
Offset_0x03AFB4:
                dc.w    $0001
                dc.l    $FC040010, $0008FFF8                    
;===============================================================================
; Objeto 0xB3 - Nuvens na Sky Chase
; [ Término ]
;===============================================================================