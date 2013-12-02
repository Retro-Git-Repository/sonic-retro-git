;===============================================================================
; Objeto 0xA3 - Inimigo vagalume na Mystic Cave
; [ Início ]
;===============================================================================   
Offset_0x03827A:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x038288(PC, D0), D1
                jmp     Offset_0x038288(PC, D1)
Offset_0x038288:
                dc.w    Offset_0x038296-Offset_0x038288
                dc.w    Offset_0x0382A2-Offset_0x038288
                dc.w    Offset_0x0382D4-Offset_0x038288
                dc.w    Offset_0x038378-Offset_0x038288
                dc.w    Offset_0x0383A8-Offset_0x038288
                dc.w    Offset_0x0383D2-Offset_0x038288
                dc.w    Offset_0x0383E4-Offset_0x038288
Offset_0x038296:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$0040, $002A(A0)
                rts
Offset_0x0382A2:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x0382AE
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x0382AE:
                addq.b  #$02, $0024(A0)
                move.w  #$FF00, $0010(A0)
                move.w  #$0040, $0012(A0)
                move.w  #$0002, $002E(A0)
                clr.w   $002A(A0)
                move.w  #$0080, $0030(A0)
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x0382D4:
                subq.w  #$01, $0030(A0)
                bmi.s   Offset_0x038340
                move.w  $002A(A0), D0
                bmi     J_DeleteObject_01                      ; Offset_0x036344
                bclr    #$00, $0001(A0)
                bclr    #$00, $0022(A0)
                tst.w   $0010(A0)
                bmi.s   Offset_0x038300
                bset    #$00, $0001(A0)
                bset    #$00, $0022(A0)
Offset_0x038300:
                addq.w  #$01, D0
                move.w  D0, $002A(A0)
                move.w  $002C(A0), D1
                move.w  Offset_0x038356(PC, D1), D2
                cmp.w   D2, D0
                bcs.s   Offset_0x03832C
                addq.w  #$02, D1
                move.w  D1, $002C(A0)
                lea     Offset_0x038366(PC, D1), A1
                tst.b   (A1)+
                beq.s   Offset_0x038324
                neg.w   $002E(A0)
Offset_0x038324:
                tst.b   (A1)+
                beq.s   Offset_0x03832C
                neg.w   $0012(A0)
Offset_0x03832C:
                move.w  $002E(A0), D0
                add.w   D0, $0010(A0)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x038340:
                addq.b  #$02, $0024(A0)
                move.w  #$0080, $0030(A0)
                ori.b   #$80, $0020(A0)
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x038356:
                dc.w    $0100, $01A0, $0208, $0285, $0300, $0340, $0390, $0440
Offset_0x038366:
                dc.b    $F0, $00, $01, $01, $00, $01, $01, $01, $00, $01, $00, $01, $01, $00, $00, $01
                dc.b    $00, $01
Offset_0x038378:
                move.b  $0024(A0), D2
                lea     (Flasher_Animate_Data), A1             ; Offset_0x03840E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                cmp.b   $0024(A0), D2
                bne.s   Offset_0x038394
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x038394:
                clr.l   $001A(A0)
                clr.w   $001E(A0)
                move.b  #$03, $001A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0383A8:
                subq.w  #$01, $0030(A0)
                bmi.s   Offset_0x0383C0
                lea     (Flasher_Animate_Data_01), A1          ; Offset_0x038432
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x0383C0:
                addq.b  #$02, $0024(A0)
                clr.l   $001A(A0)
                clr.w   $001E(A0)
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x0383D2:
                lea     (Flasher_Animate_Data_02), A1          ; Offset_0x03843E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8
Offset_0x0383E4:
                move.b  #$04, $0024(A0)
                move.w  #$0080, $0030(A0)
                andi.b  #$7F, $0020(A0)
                clr.l   $001A(A0)
                clr.w   $001E(A0)
                jmp     (MarkObjGone_4)                        ; Offset_0x0163F8    
;-------------------------------------------------------------------------------                
Obj_0xA3_Ptr: ; Offset_0x038404:                
                dc.l    Flasher_Mappings                       ; Offset_0x038448
                dc.w    $83A8
                dc.b    $04, $04, $10, $06
;-------------------------------------------------------------------------------
Flasher_Animate_Data: ; Offset_0x03840E:
                dc.w    Offset_0x038410-Flasher_Animate_Data
Offset_0x038410:
                dc.b    $00, $00, $01, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $01
                dc.b    $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $01, $00, $02, $03, $04
                dc.b    $FC, $00               
;-------------------------------------------------------------------------------
Flasher_Animate_Data_01: ; Offset_0x038432:
                dc.w    Offset_0x038434-Flasher_Animate_Data_01
Offset_0x038434:
                dc.b    $00, $02, $00, $03, $00, $04, $00, $03, $00, $FF
;-------------------------------------------------------------------------------
Flasher_Animate_Data_02: ; Offset_0x03843E:
                dc.w    Offset_0x038440-Flasher_Animate_Data_02
Offset_0x038440:
                dc.b    $03, $04, $03, $02, $01, $00, $FC, $00
;-------------------------------------------------------------------------------
Flasher_Mappings: ; Offset_0x038448:
                dc.w    Offset_0x038452-Flasher_Mappings
                dc.w    Offset_0x03845C-Flasher_Mappings
                dc.w    Offset_0x03846E-Flasher_Mappings
                dc.w    Offset_0x038490-Flasher_Mappings
                dc.w    Offset_0x0384C2-Flasher_Mappings
Offset_0x038452:
                dc.w    $0001
                dc.l    $F8090000, $0000FFF0
Offset_0x03845C:
                dc.w    $0002
                dc.l    $F8052006, $2003FFF8, $F8090000, $0000FFF0
Offset_0x03846E:
                dc.w    $0004
                dc.l    $F801200A, $2005FFF8, $F801280A, $28050000
                dc.l    $F8052006, $2003FFF8, $F8090000, $0000FFF0
Offset_0x038490:
                dc.w    $0006
                dc.l    $F005200C, $2006FFF0, $F005280C, $28060000
                dc.l    $0005300C, $3006FFF0, $0005380C, $38060000
                dc.l    $F8052006, $2003FFF8, $F8090000, $0000FFF0
Offset_0x0384C2:
                dc.w    $0006
                dc.l    $F0052010, $2008FFF0, $F0052810, $28080000
                dc.l    $00053010, $3008FFF0, $00053810, $38080000
                dc.l    $F8052006, $2003FFF8, $F8090000, $0000FFF0                                                                                                                                                                                      
;===============================================================================
; Objeto 0xA3 - Inimigo vagalume na Mystic Cave
; [ Término ]
;===============================================================================