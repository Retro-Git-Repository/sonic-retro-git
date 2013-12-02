;===============================================================================
; Objeto 0x9C - Fogo da turbina usada pelos inimigos Tutloid e Balkiry
; [ Início ]    Objeto utilizado pelo 0x9A e 0xAC
;===============================================================================  
Offset_0x03754E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03755C(PC, D0), D1
                jmp     Offset_0x03755C(PC, D1)
Offset_0x03755C:
                dc.w    Offset_0x037560-Offset_0x03755C
                dc.w    Offset_0x037564-Offset_0x03755C
Offset_0x037560:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x037564:
                move.w  $002C(A0), A1
                move.b  $0032(A0), D0
                cmp.b   (A1), D0
                bne     J_DeleteObject_01                      ; Offset_0x036344
                move.l  $0008(A1), $0008(A0)
                move.l  $000C(A1), $000C(A0)
                move.l  $002E(A0), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Offset_0x0361AE
;-------------------------------------------------------------------------------
Load_Enemy_Boost_SubObj_0x9C: ; Offset_0x03758C:                
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0375C0
                move.b  #$9C, $0000(A1) ; Carrega o objeto 0x9C 
                move.b  #$06, $001A(A1)
                move.b  #$1A, $0028(A1)
                move.w  A0, $002C(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  $002E(A0), $002E(A1)
                move.b  (A0), $0032(A1)
Offset_0x0375C0:
                rts
;-------------------------------------------------------------------------------  
Load_Turtloid_Weapon: ; Offset_0x0375C2:                
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x037604
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Arma dos inimigos
                move.b  #$06, $001A(A1)
                move.b  #$1C, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                subi.w  #$0014, $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$000A, $000C(A1)
                move.w  #$FF00, $0010(A1)
                lea     (Turtloid_Weapon), A2                  ; Offset_0x0371C6
                move.l  A2, $002A(A1)
Offset_0x037604:
                rts
;------------------------------------------------------------------------------- 
Obj_0x9A_Ptr: ; Offset_0x037606:
                dc.l    Turtloid_Mappings                      ; Offset_0x037636
                dc.w    $038A
                dc.b    $04, $05, $18, $00
;------------------------------------------------------------------------------- 
Obj_0x9B_Ptr: ; Offset_0x037610:
                dc.l    Turtloid_Mappings                      ; Offset_0x037636
                dc.w    $038A
                dc.b    $04, $04, $0C, $1A
;------------------------------------------------------------------------------- 
Obj_0x9C_Ptr: ; Offset_0x03761A:
                dc.l    Turtloid_Mappings                      ; Offset_0x037636
                dc.w    $038A
                dc.b    $04, $05, $08, $00 
;-------------------------------------------------------------------------------
Turtloid_Weapon_Animate_Data: ; Offset_0x037624:
                dc.w    Offset_0x037626-Turtloid_Weapon_Animate_Data
Offset_0x037626:
                dc.b    $01, $04, $05, $FF
;-------------------------------------------------------------------------------                
Turtloid_Animate_Data: ; Offset_0x03762A:
                dc.w    Offset_0x03762C-Turtloid_Animate_Data
Offset_0x03762C:
                dc.b    $01, $06, $07, $FF
;-------------------------------------------------------------------------------                
Balkiry_Animate_Data: ; Offset_0x037630:
                dc.w    Offset_0x037632-Balkiry_Animate_Data
Offset_0x037632:
                dc.b    $01, $08, $09, $FF
;-------------------------------------------------------------------------------    
Turtloid_Mappings: ; Offset_0x037636:
                dc.w    Offset_0x03764A-Turtloid_Mappings
                dc.w    Offset_0x037664-Turtloid_Mappings
                dc.w    Offset_0x03767E-Turtloid_Mappings
                dc.w    Offset_0x037688-Turtloid_Mappings
                dc.w    Offset_0x037692-Turtloid_Mappings
                dc.w    Offset_0x03769C-Turtloid_Mappings
                dc.w    Offset_0x0376A6-Turtloid_Mappings
                dc.w    Offset_0x0376B0-Turtloid_Mappings
                dc.w    Offset_0x0376BA-Turtloid_Mappings
                dc.w    Offset_0x0376C4-Turtloid_Mappings
Offset_0x03764A:
                dc.w    $0003
                dc.l    $F009A000, $A000FFE4, $F00FA006, $A003FFFC
                dc.l    $0009A016, $A00BFFE4
Offset_0x037664:
                dc.w    $0003
                dc.l    $F009A000, $A000FFE4, $0009A01C, $A00EFFE4
                dc.l    $F00FA006, $A003FFFC
Offset_0x03767E:
                dc.w    $0001
                dc.l    $F40AA022, $A011FFF4
Offset_0x037688:
                dc.w    $0001
                dc.l    $F40AA02B, $A015FFF4
Offset_0x037692:
                dc.w    $0001
                dc.l    $FC008034, $801AFFFC
Offset_0x03769C:
                dc.w    $0001
                dc.l    $FC008035, $801AFFFC
Offset_0x0376A6:
                dc.w    $0001
                dc.l    $06048036, $801B001C
Offset_0x0376B0:
                dc.w    $0001
                dc.l    $06008038, $801C001C
Offset_0x0376BA:
                dc.w    $0001
                dc.l    $FB048036, $801B001B
Offset_0x0376C4:
                dc.w    $0001
                dc.l    $FB008038, $801C001B                
;===============================================================================
; Objeto 0x9C - Fogo da turbina usada pelos inimigos Tutloid e Balkiry
; [ Término ]   Objeto utilizado pelo 0x9A e 0xAC
;===============================================================================  