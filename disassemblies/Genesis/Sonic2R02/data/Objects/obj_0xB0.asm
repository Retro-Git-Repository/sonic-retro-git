;===============================================================================
; Objeto 0xB0 - Sonic correndo na tela SEGA
; [ Início ]
;===============================================================================    
Offset_0x039DE6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x039DF4(PC, D0), D1
                jmp     Offset_0x039DF4(PC, D1)
Offset_0x039DF4:
                dc.w    Offset_0x039E00-Offset_0x039DF4
                dc.w    Offset_0x039EFE-Offset_0x039DF4
                dc.w    Offset_0x039F3C-Offset_0x039DF4
                dc.w    Offset_0x039FA6-Offset_0x039DF4
                dc.w    Offset_0x039FE0-Offset_0x039DF4
                dc.w    Offset_0x03A00C-Offset_0x039DF4
Offset_0x039E00:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$01E8, $0008(A0)
                move.w  #$00F0, $000A(A0)
                move.w  #$000B, $002A(A0)
                move.w  #$0002, ($FFFFF662).w
                bset    #$00, $0001(A0)
                bset    #$00, $0022(A0)
                lea     ($FFFFE138).w, A1
                lea     Offset_0x03A384(PC), A2
                moveq   #$00, D0
                moveq   #$22, D6
Offset_0x039E34:               
                move.b  (A2)+, D0
                add.w   D0, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x039E34
                lea     Offset_0x039E9E(PC), A1
                lea     (Sonic_Sprites), A3                    ; Offset_0x050000
                lea     ($FFFF0000), A5
                moveq   #$03, D5
Offset_0x039E50:                
                move.l  (A1)+, A2
                move.w  (A2)+, D6
                subq.w  #$01, D6
Offset_0x039E56:                
                move.w  (A2)+, D0
                move.w  D0, D1
                andi.w  #$0FFF, D0
                lsl.w   #$05, D0
                lea     $00(A3, D0), A4
                andi.w  #$F000, D1
                rol.w   #$04, D1
                addq.w  #$01, D1
                lsl.w   #$03, D1
                subq.w  #$01, D1
Offset_0x039E70:                
                move.l  (A4)+, (A5)+
                dbra    D1, Offset_0x039E70
                dbra    D6, Offset_0x039E56
                dbra    D5, Offset_0x039E50
                move.w  D7, -(A7)
                moveq   #$00, D0
                moveq   #$00, D1
                lea     Offset_0x039EAE(PC), A6
                moveq   #$07, D7
Offset_0x039E8A:                
                move.l  (A6)+, A1
                move.l  (A6)+, A2
                move.b  (A6)+, D0
                move.b  (A6)+, D1
                bsr     Sub_Sega_Intro                         ; Offset_0x03E69C
                dbra    D7, Offset_0x039E8A
                move.w  (A7)+, D7
                rts
Offset_0x039E9E:
                dc.l    Offset_0x07181A
                dc.l    Offset_0x071820
                dc.l    Offset_0x071826
                dc.l    Offset_0x07182C  
Offset_0x039EAE:                
                dc.l    $FFFF0000, $FFFF0B00
                dc.b    $02, $01
                dc.l    $FFFF00C0, $FFFF0E00
                dc.b    $03, $03
                dc.l    $FFFF02C0, $FFFF1600
                dc.b    $02, $01
                dc.l    $FFFF0380, $FFFF1900
                dc.b    $03, $03
                dc.l    $FFFF0580, $FFFF2100
                dc.b    $02, $01
                dc.l    $FFFF0640, $FFFF2400
                dc.b    $03, $03
                dc.l    $FFFF0840, $FFFF2C00
                dc.b    $02, $01
                dc.l    $FFFF0900, $FFFF2F00
                dc.b    $03, $03
Offset_0x039EFE:
                subi.w  #$0020, $0008(A0)
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x039F20
                bsr     Offset_0x03A03E
                lea     (Offset_0x03A1B6), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039F20:
                addq.b  #$02, $0024(A0)
                move.w  #$000C, $002A(A0)
                move.b  #$01, $002C(A0)
                move.b  #$FF, $002D(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039F3C:
                tst.w   $002A(A0)
                beq.s   Offset_0x039F4A
                subq.w  #$01, $002A(A0)
                bsr     Offset_0x03A03E
Offset_0x039F4A:
                lea     Offset_0x03A0B6(PC), A1
                bsr     Offset_0x03A066
                bne.s   Offset_0x039F56
                rts
Offset_0x039F56:
                addq.b  #$02, $0024(A0)
                bchg    #00, $0001(A0)
                move.w  #$000B, $002A(A0)
                move.w  #$0004, ($FFFFF662).w
                subi.w  #$0028, $0008(A0)
                bchg    #00, $0001(A0)
                bchg    #00, $0022(A0)
                lea     ($FFFFE000).w, A1
                moveq   #$00, D0
                move.w  #$0400, D1
Offset_0x039F88:                
                move.l  D0, (A1)+
                dbra    D1, Offset_0x039F88
                lea     ($FFFFE13C).w, A1
                lea     Offset_0x03A384(PC), A2
                moveq   #$00, D0
                moveq   #$22, D6
Offset_0x039F9A:                
                move.b  (A2)+, D0
                sub.w   D0, (A1)
                addq.w  #$08, A1
                dbra    D6, Offset_0x039F9A
                rts
Offset_0x039FA6:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x039FC8
                addi.w  #$0020, $0008(A0)
                bsr     Offset_0x03A052
                lea     (Offset_0x03A1B6), A1
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x039FC8:
                addq.b  #$02, $0024(A0)
                move.w  #$000C, $002A(A0)
                move.b  #$01, $002C(A0)
                move.b  #$FF, $002D(A0)
                rts
Offset_0x039FE0:
                tst.w   $002A(A0)
                beq.s   Offset_0x039FEE
                subq.w  #$01, $002A(A0)
                bsr     Offset_0x03A052
Offset_0x039FEE:
                lea     Offset_0x03A12C(PC), A1
                bsr     Offset_0x03A066
                bne.s   Offset_0x039FFA
                rts
Offset_0x039FFA:
                addq.b  #$02, $0024(A0)
                st      ($FFFFF660).w
                move.b  #Sega_Sound, D0                                    ; $FA
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x03A00C:
                rts                             
;===============================================================================
; Objeto 0xB0 - Sonic correndo na tela SEGA
; [ Término ]
;===============================================================================                                                      