;===============================================================================
; Objeto 0x71 - Miscelânea de objetos - Suporte das pontes na Hidden Palace,
; [ Início ]    Orbs na Hidden Palace, bolhas de lava na Metropolis, etc...
;===============================================================================      
Offset_0x0112A0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0112AE(PC, D0), D1
                jmp     Offset_0x0112AE(PC, D1)
Offset_0x0112AE:
                dc.w    Offset_0x0112CA-Offset_0x0112AE
                dc.w    Offset_0x01130C-Offset_0x0112AE
Offset_0x0112B2:
                dc.l    ($03<<$18)|HPz_Bridge_Mappings         ; Offset_0x00FC16
                dc.w    $6300
                dc.b    $04, $01
                dc.l    Hpz_Orbs_Mappings                      ; Offset_0x011348
                dc.w    $E35A
                dc.b    $10, $01
                dc.l    Mz_Lava_Bubble_Mappings                ; Offset_0x011528
                dc.w    $4536
                dc.b    $10, $01  
Offset_0x0112CA:
                addq.b  #$02, $0024(A0)
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                lsl.w   #$03, D0
                lea     Offset_0x0112B2(PC), A1
                lea     $00(A1, D0), A1
                move.b  (A1), $001A(A0)
                move.l  (A1)+, $0004(A0)
                move.w  (A1)+, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  (A1)+, $0019(A0)
                move.b  (A1)+, $0018(A0)
                move.b  $0028(A0), D0
                andi.w  #$00F0, D0
                lsr.b   #$04, D0
                move.b  D0, $001C(A0)
Offset_0x01130C:
                lea     (Mz_Hpz_Misc_Animate_Data), A1         ; Offset_0x01131A
                bsr     AnimateSprite                          ; Offset_0x0164CA
                bra     MarkObjGone                            ; Offset_0x016358          
;-------------------------------------------------------------------------------                
Mz_Hpz_Misc_Animate_Data: ; Offset_0x01131A:
                dc.w    Offset_0x011322-Mz_Hpz_Misc_Animate_Data
                dc.w    Offset_0x01132A-Mz_Hpz_Misc_Animate_Data
                dc.w    Offset_0x01133A-Mz_Hpz_Misc_Animate_Data
                dc.w    Offset_0x011344-Mz_Hpz_Misc_Animate_Data
Offset_0x011322:
                dc.b    $08, $03, $03, $04, $05, $05, $04, $FF
Offset_0x01132A:
                dc.b    $05, $00, $00, $00, $01, $02, $03, $03, $02, $01, $02, $03, $03, $01, $FF, $00
Offset_0x01133A:
                dc.b    $0B, $00, $01, $02, $03, $04, $05, $FD, $03, $00
Offset_0x011344:
                dc.b    $7F, $06, $FD, $02
;-------------------------------------------------------------------------------    
Hpz_Orbs_Mappings: ; Offset_0x011348:
                dc.w    Offset_0x011350-Hpz_Orbs_Mappings
                dc.w    Offset_0x01135A-Hpz_Orbs_Mappings
                dc.w    Offset_0x011364-Hpz_Orbs_Mappings
                dc.w    Offset_0x011376-Hpz_Orbs_Mappings
Offset_0x011350:
                dc.w    $0001
                dc.l    $F40A0000, $0000FFF4
Offset_0x01135A:
                dc.w    $0001
                dc.l    $F40A0009, $0004FFF4
Offset_0x011364:
                dc.w    $0002
                dc.l    $F00D0012, $0009FFF0, $000D1812, $1809FFF0
Offset_0x011376:
                dc.w    $0002
                dc.l    $F00D001A, $000DFFF0, $000D181A, $180DFFF0                                                                        
;===============================================================================
; Objeto 0x71 - Miscelânea de objetos - Suporte das pontes na Hidden Palace,
; [ Término ]   Orbs na Hidden Palace, bolhas de lava na Metropolis, etc...  
;===============================================================================  