;===============================================================================
; Objeto 0xB1 - Sonic correndo na tela SEGA
; [ Início ]
;===============================================================================  
Offset_0x03A00E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03A01C(PC, D0), D1
                jmp     Offset_0x03A01C(PC, D1)
Offset_0x03A01C:
                dc.w    Offset_0x03A020-Offset_0x03A01C
                dc.w    Offset_0x03A038-Offset_0x03A01C
Offset_0x03A020:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$04, $001A(A0)
                move.w  #$0174, $0008(A0)
                move.w  #$00D8, $000A(A0)
                rts
Offset_0x03A038:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
Offset_0x03A03E: ; Usado pelo objeto 0xB0                
                lea     ($FFFFE138).w, A1
                move.w  #$0022, D6
Offset_0x03A046:
                subi.w  #$0020, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x03A046
                rts
;-------------------------------------------------------------------------------                
Offset_0x03A052: ; Usado pelo objeto 0xB0                  
                lea     ($FFFFE13C).w, A1
                move.w  #$0022, D6
Offset_0x03A05A:
                addi.w  #$0020, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x03A05A
                rts
;-------------------------------------------------------------------------------                
Offset_0x03A066:  ; Usado pelo objeto 0xB0                 
                subq.b  #$01, $002C(A0)
                bne.s   Offset_0x03A0AE
                moveq   #$00, D0
                move.b  $002D(A0), D0
                addq.b  #$01, D0
                cmp.b   $0001(A1), D0
                bcs.s   Offset_0x03A080
                tst.b   $0003(A1)
                bne.s   Offset_0x03A0B2
Offset_0x03A080:
                move.b  D0, $002D(A0)
                move.b  $0000(A1), $002C(A0)
                lea     $0006(A1), A2
                moveq   #$00, D1
                move.b  $0002(A1), D1
                move.w  D1, D2
                tst.w   D0
                beq.s   Offset_0x03A0A4
Offset_0x03A09A:
                subq.b  #$01, D0
                beq.s   Offset_0x03A0A2
                add.w   D2, D1
                bra.s   Offset_0x03A09A
Offset_0x03A0A2:
                adda.w  D1, A2
Offset_0x03A0A4:
                move.w  $0004(A1), A3
Offset_0x03A0A8:
                move.w  (A2)+, (A3)+
                subq.w  #$02, D2
                bne.s   Offset_0x03A0A8
Offset_0x03A0AE:
                moveq   #$00, D0
                rts
Offset_0x03A0B2:
                moveq   #$01, D0
                rts   
;-------------------------------------------------------------------------------                   
Offset_0x03A0B6:
                dc.b    $04, $07, $10, $FF
                dc.w    $FB10                  
                dc.w    $0E60, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0E62, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE, $0EEE
                dc.w    $0E84, $0E62, $0E60, $0E60, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60, $0EEE
                dc.w    $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60, $0EEE
                dc.w    $0EEE, $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0EEE 
;-------------------------------------------------------------------------------
Offset_0x03A12C:
                dc.b    $04, $07, $10, $FF
                dc.w    $FB00                    
                dc.w    $0EEE, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0E62, $0E60, $0E60, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0E84, $0E62, $0E60, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60, $0E60
                dc.w    $0EEE, $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60, $0E60
                dc.w    $0EEE, $0EEE, $0EEC, $0EC8, $0EA6, $0E84, $0E62, $0E60                                
;-------------------------------------------------------------------------------                 
Obj_0xB0_Ptr: ; Offset_0x03A1A2:
                dc.l    Sonic_Sega_Logo_Mappings               ; Offset_0x03A1BE
                dc.w    $C088
                dc.b    $00, $01, $10, $00  
;-------------------------------------------------------------------------------                  
Obj_0xB1_Ptr: ; Offset_0x03A1AC:
                dc.l    Sonic_Sega_Logo_Mappings               ; Offset_0x03A1BE
                dc.w    $0003
                dc.b    $00, $02, $08, $00
;-------------------------------------------------------------------------------                   
Offset_0x03A1B6:
                dc.w    Offset_0x03A1B8-Offset_0x03A1B6
Offset_0x03A1B8:
                dc.b    $00, $00, $01, $02, $03, $FF
;-------------------------------------------------------------------------------   
Sonic_Sega_Logo_Mappings: ; Offset_0x03A1BE:
                dc.w    Offset_0x03A1C8-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x03A1FA-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x03A22C-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x03A25E-Sonic_Sega_Logo_Mappings
                dc.w    Offset_0x03A290-Sonic_Sega_Logo_Mappings
Offset_0x03A1C8:
                dc.w    $0006
                dc.l    $D80F0000, $0000FFF0, $D8070010, $00080010
                dc.l    $F80F0018, $000CFFE0, $180F0028, $0014FFE0
                dc.l    $F80F0038, $001C0000, $180F0048, $00240000
Offset_0x03A1FA:
                dc.w    $0006
                dc.l    $D80F0058, $002CFFF0, $D8070068, $00340010
                dc.l    $F80F0070, $0038FFE0, $180F0080, $0040FFE0
                dc.l    $F80F0090, $00480000, $180F00A0, $00500000
Offset_0x03A22C:
                dc.w    $0006
                dc.l    $D80F00B0, $0058FFF0, $D80700C0, $00600010
                dc.l    $F80F00C8, $0064FFE0, $180F00D8, $006CFFE0
                dc.l    $F80F00E8, $00740000, $180F00F8, $007C0000
Offset_0x03A25E:
                dc.w    $0006
                dc.l    $D80F0108, $0084FFF0, $D8070118, $008C0010
                dc.l    $F80F0120, $0090FFE0, $180F0130, $0098FFE0
                dc.l    $F80F0140, $00A00000, $180F0150, $00A80000
Offset_0x03A290:
                dc.w    $0002
                dc.l    $FC000000, $0000FFF8, $FC000000, $00000000                             
;===============================================================================
; Objeto 0xB1 - Sonic correndo na tela SEGA
; [ Término ]
;===============================================================================  