;===============================================================================
; Objeto 0xA7 - Inimigo Grabber (aranha) na Chemical Plant 
; [ Início ]
;===============================================================================
Offset_0x038940:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03894E(PC, D0), D1
                jmp     Offset_0x03894E(PC, D1)
Offset_0x03894E:
                dc.w    Offset_0x038952-Offset_0x03894E
                dc.w    Offset_0x038992-Offset_0x03894E
Offset_0x038952:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.w  #$FFC0, D0
                btst    #$00, $0001(A0)
                beq.s   Offset_0x038964
                neg.w   D0
Offset_0x038964:
                move.w  D0, $0010(A0)
                move.w  #$00FF, $002A(A0)
                move.b  #$02, $002D(A0)
                lea     (Load_Grabber_Sub_Obj_0xA9), A2        ; Offset_0x038D7E
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Load_Grabber_Sub_Obj_0xA8), A2        ; Offset_0x038D82
                bsr     Load_Sub_Obj                           ; Offset_0x0361F6
                lea     (Load_Grabber_Sub_Obj_0xAA), A2        ; Offset_0x038D86
                bra     Load_Sub_Obj                           ; Offset_0x0361F6
Offset_0x038992:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0389CE(PC, D0), D1
                jsr     Offset_0x0389CE(PC, D1)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                moveq   #$00, D0
                moveq   #$10, D1
                move.w  $003C(A0), A1
                bsr     Offset_0x036186
                move.w  $003E(A0), A1
                move.w  $0008(A0), $0008(A1)
                move.w  $003A(A0), A1
                move.w  $0008(A0), $0008(A1)
                lea     $003A(A0), A2
                bra     Obj_0xA7_Sub_02                        ; Offset_0x038D1A
Offset_0x0389CE:
                dc.w    Offset_0x0389DA-Offset_0x0389CE
                dc.w    Offset_0x038A22-Offset_0x0389CE
                dc.w    Offset_0x038A3C-Offset_0x0389CE
                dc.w    Offset_0x038AC8-Offset_0x0389CE
                dc.w    Offset_0x038AE2-Offset_0x0389CE
                dc.w    Offset_0x038AEC-Offset_0x0389CE
Offset_0x0389DA:
                bsr     Offset_0x0360FC
                addi.w  #$0040, D2
                cmpi.w  #$0080, D2
                bcc.s   Offset_0x0389EE
                cmpi.w  #$FF80, D3
                bhi.s   Offset_0x038A0C
Offset_0x0389EE:
                subq.w  #$01, $002A(A0)
                bpl.s   Offset_0x038A0A
                move.w  #$00FF, $002A(A0)
                neg.w   $0010(A0)
                bchg    #00, $0001(A0)
                bchg    #00, $0022(A0)
Offset_0x038A0A:
                rts
Offset_0x038A0C:
                addq.b  #$02, $0025(A0)
                move.w  $0010(A0), $002E(A0)
                clr.w   $0010(A0)
                move.b  #$10, $002C(A0)
                rts
Offset_0x038A22:
                subq.b  #$01, $002C(A0)
                bmi.s   Offset_0x038A2A
                rts
Offset_0x038A2A:
                addq.b  #$02, $0025(A0)
                move.w  #$0200, $0012(A0)
                move.b  #$40, $002C(A0)
                rts
Offset_0x038A3C:
                tst.b   $0030(A0)
                bne.s   Offset_0x038A78
                subq.b  #$01, $002C(A0)
                beq.s   Offset_0x038A60
                cmpi.b  #$20, $002C(A0)
                bne.s   Offset_0x038A54
                neg.w   $0012(A0)
Offset_0x038A54:
                lea     (Grabber_Animate_Data), A1             ; Offset_0x038DB2
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x038A60:
                move.b  #$00, $0025(A0)
                clr.w   $0012(A0)
                move.w  $002E(A0), $0010(A0)
                move.b  #$00, $001A(A0)
                rts
Offset_0x038A78:
                addq.b  #$02, $0025(A0)
                move.w  $0032(A0), A1
                move.b  #$81, $002A(A1)
                clr.w   $0010(A1)
                clr.w   $0012(A1)
                move.b  #$0E, $001C(A1)
                move.b  #$01, $001A(A0)
                tst.w   $0012(A0)
                bmi.s   Offset_0x038AB4
                neg.w   $0012(A0)
                move.b  $002C(A0), D0
                subi.b  #$40, D0
                neg.w   D0
                addq.b  #$01, D0
                move.b  D0, $002C(A0)
Offset_0x038AB4:
                move.b  #$01, $002A(A0)
                move.b  #$10, $002B(A0)
                move.b  #$20, $0037(A0)
                rts
Offset_0x038AC8:
                bsr     Obj_0xA7_Sub_01                        ; Offset_0x038CD2
                bsr     Obj_0xA7_Sub                           ; Offset_0x038C54
                subq.b  #$01, $002C(A0)
                beq.s   Offset_0x038AD8
                rts
Offset_0x038AD8:
                addq.b  #$02, $0025(A0)
                clr.w   $0012(A0)
                rts
Offset_0x038AE2:
                bsr     Obj_0xA7_Sub_01                        ; Offset_0x038CD2
                bra     Obj_0xA7_Sub                           ; Offset_0x038C54
                rts
Offset_0x038AEC:
                bra     Obj_0xA7_Sub_01                        ; Offset_0x038CD2                                                                                                                       
;===============================================================================
; Objeto 0xA7 - Inimigo Grabber (aranha) na Chemical Plant
; [ Término ]
;===============================================================================