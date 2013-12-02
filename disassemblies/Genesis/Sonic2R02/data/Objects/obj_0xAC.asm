;===============================================================================
; Objeto 0xAC - Inimigo Balkiry na Sky Chase
; [ Início ]
;===============================================================================    
Offset_0x038F18:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038F26(PC, D0), D1
                jmp     Offset_0x038F26(PC, D1)
Offset_0x038F26:
                dc.w    Offset_0x038F2A-Offset_0x038F26
                dc.w    Offset_0x038F56-Offset_0x038F26
Offset_0x038F2A:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$01, $001A(A0)
                move.w  #$FD00, $0010(A0)
                bclr    #$01, $0001(A0)
                beq.s   Offset_0x038F48
                move.w  #$FB00, $0010(A0)
Offset_0x038F48:
                lea     (Balkiry_Animate_Data), A1             ; Offset_0x037630
                move.l  A1, $002E(A0)
                bra     Load_Enemy_Boost_SubObj_0x9C           ; Offset_0x03758C
Offset_0x038F56:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x03619C
                bra     Offset_0x0361AE
;-------------------------------------------------------------------------------                
Obj_0xAC_Ptr: ; Offset_0x038F64:
                dc.l    Balkiry_Mappings                       ; Offset_0x038F6E
                dc.w    $0565
                dc.b    $04, $04, $20, $08
;-------------------------------------------------------------------------------                
Balkiry_Mappings: ; Offset_0x038F6E:
                dc.w    Offset_0x038F72-Balkiry_Mappings
                dc.w    Offset_0x038F94-Balkiry_Mappings
Offset_0x038F72:
                dc.w    $0004
                dc.l    $F40D8000, $8000FFDC, $EC048008, $8004000C
                dc.l    $F40D800A, $8005FFFC, $04088012, $8009FFFC
Offset_0x038F94:
                dc.w    $0005
                dc.l    $F40D8000, $8000FFDC, $EC048008, $8004000C
                dc.l    $F40D800A, $8005FFFC, $04088015, $800A000C
                dc.l    $0C008018, $800C001C                    
;===============================================================================
; Objeto 0xAC - Inimigo Balkiry na Sky Chase
; [ Término ]
;===============================================================================