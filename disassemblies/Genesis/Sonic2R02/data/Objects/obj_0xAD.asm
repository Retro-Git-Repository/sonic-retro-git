;===============================================================================
; Objeto 0xAD - Plataforma embaixo do Inimigo Clucker na Wing Sky Fortress
; [ Início ]  
;===============================================================================   
Offset_0x038FBE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038FCC(PC, D0), D1
                jmp     Offset_0x038FCC(PC, D1)
Offset_0x038FCC:
                dc.w    Offset_0x038FD0-Offset_0x038FCC
                dc.w    Offset_0x038FDC-Offset_0x038FCC
Offset_0x038FD0:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$0C, $001A(A0)
                rts
Offset_0x038FDC:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0008, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
;===============================================================================
; Objeto 0xAD - Plataforma embaixo do Inimigo Clucker na Wing Sky Fortress
; [ Término ]
;===============================================================================    