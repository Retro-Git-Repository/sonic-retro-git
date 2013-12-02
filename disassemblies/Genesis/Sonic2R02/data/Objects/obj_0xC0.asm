;===============================================================================
; Objeto 0xC0 - Impulsionadores na Wing Fortress
; [ Início ]
;=============================================================================== 
Offset_0x03BBB6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x03BBC4(PC, D0), D1
                jmp     Offset_0x03BBC4(PC, D1)
Offset_0x03BBC4:
                dc.w    Offset_0x03BBC8-Offset_0x03BBC4
                dc.w    Offset_0x03BBF0-Offset_0x03BBC4
Offset_0x03BBC8:
                move.w  #$0086, D0
                bsr     ObjectSettings_D0                      ; Offset_0x036020
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$04, D0
                btst    #$00, $0022(A0)
                bne.s   Offset_0x03BBE2
                neg.w   D0
Offset_0x03BBE2:
                move.w  $0008(A0), D1
                move.w  D1, $0034(A0)
                add.w   D1, D0
                move.w  D0, $0032(A0)
Offset_0x03BBF0:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x03BC16(PC, D0), D1
                jsr     Offset_0x03BC16(PC, D1)
                move.w  #$0010, D1
                move.w  #$0011, D3
                move.w  $0008(A0), D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03BC16:
                dc.w    Offset_0x03BC1C-Offset_0x03BC16
                dc.w    Offset_0x03BC90-Offset_0x03BC16
                dc.w    Offset_0x03BD1C-Offset_0x03BC16
Offset_0x03BC1C:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x03BC6A
                addq.b  #$02, $0025(A0)
                move.w  #$0C00, $0010(A0)
                move.w  #$0080, $0030(A0)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x03BC46
                neg.w   $0010(A0)
                neg.w   $0030(A0)
Offset_0x03BC46:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.b  $0022(A0), D0
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x03BC5E
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x03BC6C
Offset_0x03BC5E:
                andi.b  #$10, D0
                beq.s   Offset_0x03BC6A
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x03BC6C
Offset_0x03BC6A:
                rts
Offset_0x03BC6C:
                clr.w   $0014(A1)
                clr.w   $0010(A1)
                move.w  $0008(A0), $0008(A1)
                bclr    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x03BC8E
                bset    #$00, $0022(A1)
Offset_0x03BC8E:
                rts
Offset_0x03BC90:
                move.w  $0030(A0), D0
                add.w   D0, $0010(A0)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                move.w  $0032(A0), D0
                sub.w   $0008(A0), D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x03BCB0
                neg.w   D0
Offset_0x03BCB0:
                tst.w   D0
                bpl.s   Offset_0x03BCEE
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x03BCD8
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x03BCCC
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x03BC6C
Offset_0x03BCCC:
                andi.b  #$10, D0
                beq.s   Offset_0x03BCD8
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x03BC6C
Offset_0x03BCD8:
                rts
Offset_0x03BCDA:
                move.w  $0010(A0), $0010(A1)
                move.w  #$FC00, $0012(A1)
                bset    #$01, $0022(A1)
                rts
Offset_0x03BCEE:
                addq.b  #$02, $0025(A0)
                move.w  $0032(A0), $0008(A0)
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x03BD1C
                move.b  D0, D1
                andi.b  #$08, D1
                beq.s   Offset_0x03BD10
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x03BCDA
Offset_0x03BD10:
                andi.b  #$10, D0
                beq.s   Offset_0x03BD1C
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x03BCDA
Offset_0x03BD1C:
                move.w  $0008(A0), D0
                moveq   #$04, D1
                tst.w   $0030(A0)
                spl     D2
                bmi.s   Offset_0x03BD2C
                neg.w   D1
Offset_0x03BD2C:
                add.w   D1, D0
                cmp.w   $0034(A0), D0
                bcc.s   Offset_0x03BD36
                not.b   D2
Offset_0x03BD36:
                tst.b   D2
                bne.s   Offset_0x03BD42
                clr.b   $0025(A0)
                move.w  $0034(A0), D0
Offset_0x03BD42:
                move.w  D0, $0008(A0)
                rts
;-------------------------------------------------------------------------------
Obj_0xC0_Ptr: ; Offset_0x03BD48:
                dc.l    Speed_Booster_Mappings                 ; Offset_0x03BD52
                dc.w    $245C
                dc.b    $04, $04, $10, $00
;-------------------------------------------------------------------------------   
Speed_Booster_Mappings: ; Offset_0x03BD52:
                dc.w    Offset_0x03BD54-Speed_Booster_Mappings
Offset_0x03BD54:
                dc.w    $0002
                dc.l    $E9080000, $0000FFF0, $E1010003, $00010008                                                                                                                                
;===============================================================================
; Objeto 0xC0 - Impulsionadores na Wing Fortress
; [ Término ]
;===============================================================================