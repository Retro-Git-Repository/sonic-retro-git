;===============================================================================
; Objeto 0x9B - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; [ Início ]    Objeto utilizado pelo 0x9A
;===============================================================================   
Offset_0x0374D0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0374DE(PC, D0), D1
                jmp     Offset_0x0374DE(PC, D1)
Offset_0x0374DE:
                dc.w    Offset_0x0374E2-Offset_0x0374DE
                dc.w    Offset_0x0374E6-Offset_0x0374DE
Offset_0x0374E2:
                bra     ObjectSettings                         ; Offset_0x03601A
Offset_0x0374E6:
                move.w  $002C(A0), A1
                lea     Offset_0x0374F6(PC), A2
                bsr     Offset_0x0374FA
                bra     Offset_0x0361AE
Offset_0x0374F6:
                dc.b    $00, $04, $FF, $E8
Offset_0x0374FA:
                move.l  $0008(A1), $0008(A0)
                move.l  $000C(A1), $000C(A0)
                move.w  (A2)+, D0
                add.w   D0, $0008(A0)
                move.w  (A2)+, D0
                add.w   D0, $000C(A0)
;===============================================================================
; Rotina sem efeito usada por vários objetos 
; [ Início ]
;===============================================================================                      
Exit_Sub_01: ; Offset_0x037512:
                rts           
;===============================================================================
; Rotina sem efeito usada por vários objetos 
; [ Término ]
;===============================================================================  
Load_Turtloid_SubObj_0x9B: ; Offset_0x037514:                                             
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03754C
                move.b  #$9B, $0000(A1) ; Carrega o objeto 0x9B - Tartaruga gigante
                move.b  #$02, $001A(A1)
                move.b  #$18, $0028(A1)
                move.w  A0, $002C(A1)
                move.w  A1, $002C(A0)
                move.w  $0008(A0), $0008(A1)
                addq.w  #$04, $0008(A1)
                move.w  $000C(A0), $000C(A1)
                subi.w  #$0018, $000C(A1)
Offset_0x03754C:
                rts                    
;===============================================================================
; Objeto 0x9B - Inimigo tartaruga na Sky Chase (Atira bolas de fogo no jogador)
; [ Término ]   Objeto utilizado pelo 0x9A
;===============================================================================