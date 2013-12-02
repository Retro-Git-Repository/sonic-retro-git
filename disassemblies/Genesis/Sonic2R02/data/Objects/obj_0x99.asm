;===============================================================================
; Objeto 0x99 - Inimigo Nebula na Sky Chase  (Joga bombas no jogador)
; [ Início ]
;===============================================================================    
Offset_0x037286:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x037294(PC, D0), D1
                jmp     Offset_0x037294(PC, D1)
Offset_0x037294:
                dc.w    Offset_0x03729A-Offset_0x037294
                dc.w    Offset_0x0372A6-Offset_0x037294
                dc.w    Offset_0x0372DE-Offset_0x037294
Offset_0x03729A:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$FF40, $0010(A0)
                rts
Offset_0x0372A6:
                bsr     Offset_0x0360FC
                tst.w   D0
                bne.s   Offset_0x0372B8
                cmpi.w  #$0080, D2
                bcc.s   Offset_0x0372B8
                bsr     Offset_0x0372D2
Offset_0x0372B8:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x03619C
                lea     (Nebula_Animate_Data), A1              ; Offset_0x037358
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Offset_0x0361AE
Offset_0x0372D2:
                addq.b  #$02, $0024(A0)
                move.w  #$FF60, $0012(A0)
                rts
Offset_0x0372DE:
                tst.b   $002A(A0)
                bne.s   Offset_0x0372F4
                bsr     Offset_0x0360FC
                addq.w  #$08, D2
                cmpi.w  #$0010, D2
                bcc.s   Offset_0x0372F4
                bsr     Offset_0x037312
Offset_0x0372F4:
                addq.w  #$01, $0012(A0)                         
                jsr     (SpeedToPos)                           ; Offset_0x016332
                bsr     Offset_0x03619C                           
                lea     (Nebula_Animate_Data), A1              ; Offset_0x037358
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     Offset_0x0361AE
Offset_0x037312:
                st      $002A(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x03734C
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Armas dos inimigos
                move.b  #$04, $001A(A1)
                move.b  #$14, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0018, $000C(A1)
                lea     (Nebula_Weapon), A2                    ; Offset_0x0371BA
                move.l  A2, $002A(A1)
Offset_0x03734C:
                rts
;-------------------------------------------------------------------------------                 
Obj_0x99_Ptr: ; Offset_0x03734E:    
                dc.l    Nebula_Mappings                        ; Offset_0x037360
                dc.w    $A36E
                dc.b    $04, $04, $10, $06            
;-------------------------------------------------------------------------------
Nebula_Animate_Data: ; Offset_0x037358:
                dc.w    Offset_0x03735A-Nebula_Animate_Data
Offset_0x03735A:
                dc.b    $03, $00, $01, $02, $03, $FF    
;-------------------------------------------------------------------------------
Nebula_Mappings: ; Offset_0x037360:
                dc.w    Offset_0x03736A-Nebula_Mappings
                dc.w    Offset_0x03738C-Nebula_Mappings
                dc.w    Offset_0x0373AE-Nebula_Mappings
                dc.w    Offset_0x0373D0-Nebula_Mappings
                dc.w    Offset_0x0373F2-Nebula_Mappings
Offset_0x03736A:
                dc.w    $0004
                dc.l    $EC080012, $0009FFE8, $EC081812, $18090000
                dc.l    $EC040000, $0000FFF8, $F40F0002, $0001FFF0
Offset_0x03738C:
                dc.w    $0004
                dc.l    $EC040015, $000AFFF0, $EC041815, $180A0000
                dc.l    $EC040000, $0000FFF8, $F40F0002, $0001FFF0
Offset_0x0373AE:
                dc.w    $0004
                dc.l    $EC000017, $000BFFF8, $EC000817, $080B0000
                dc.l    $EC040000, $0000FFF8, $F40F0002, $0001FFF0
Offset_0x0373D0:
                dc.w    $0004
                dc.l    $EC041015, $100AFFF0, $EC040815, $080A0000
                dc.l    $EC040000, $0000FFF8, $F40F0002, $0001FFF0
Offset_0x0373F2:
                dc.w    $0001
                dc.l    $F8050018, $000CFFF8                                                                                      
;===============================================================================
; Objeto 0x99 - Inimigo Nebula na Sky Chase  (Joga bombas no jogador)
; [ Término ]
;===============================================================================