;===============================================================================
; Objeto 0x16 - Teleféricos na Hill Top
; [ Início ]
;=============================================================================== 
Offset_0x021CCE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x021CDC(PC, D0), D1
                jmp     Offset_0x021CDC(PC, D1)
Offset_0x021CDC:
                dc.w    Offset_0x021CE0-Offset_0x021CDC
                dc.w    Offset_0x021D34-Offset_0x021CDC
Offset_0x021CE0:
                addq.b  #$02, $0024(A0)
                move.l  #Teleferics_Mappings, $0004(A0)        ; Offset_0x021E42
                move.w  #$43E6, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.b  #$00, $001A(A0)
                move.b  #$01, $0018(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  #$40, $0016(A0)
                bset    #$04, $0001(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsl.w   #$03, D0
                move.w  D0, $0034(A0)
Offset_0x021D34:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x021D54
                moveq   #$00, D1
                move.b  $0019(A0), D1
                move.w  #$FFD8, D3
                move.w  (A7)+, D4
                jsr     (Platform_Object)                      ; Offset_0x019BA0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x021D54:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x021D62(PC, D0), D1
                jmp     Offset_0x021D62(PC, D1)
Offset_0x021D62:
                dc.w    Offset_0x021D68-Offset_0x021D62
                dc.w    Offset_0x021D90-Offset_0x021D62
                dc.w    Offset_0x021DEE-Offset_0x021D62
Offset_0x021D68:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x021D8E
                addq.b  #$02, $0025(A0)
                move.w  #$0200, $0010(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x021D88
                neg.w   $0010(A0)
Offset_0x021D88:
                move.w  #$0100, $0012(A0)
Offset_0x021D8E:
                rts
Offset_0x021D90:
                move.w  ($FFFFFE04).w, D0
                andi.w  #$000F, D0
                bne.s   Offset_0x021DA4
                move.w  #Teleferics_Move_Sfx, D0 ; $00E4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x021DA4:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                subq.w  #$01, $0034(A0)
                bne.s   Offset_0x021DEC
                addq.b  #$02, $0025(A0)
                move.b  #$02, $001A(A0)
                move.w  #$0000, $0010(A0)
                move.w  #$0000, $0012(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x021DEC
                move.b  #$1C, $0000(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  $0001(A0), $0001(A1)
                move.b  #$06, $0028(A1)
Offset_0x021DEC:
                rts
Offset_0x021DEE:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addi.w  #$0038, $0012(A0)
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                bcc.s   Offset_0x021E40
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x021E3A
                bclr    #$03, $0022(A0)
                beq.s   Offset_0x021E26
                bclr    #$03, ($FFFFB022).w
                bset    #$01, ($FFFFB022).w
Offset_0x021E26:
                bclr    #$04, $0022(A0)
                beq.s   Offset_0x021E3A
                bclr    #$03, ($FFFFB062).w
                bset    #$01, ($FFFFB062).w
Offset_0x021E3A:
                move.w  #$4000, $0008(A0)
Offset_0x021E40:
                rts
;-------------------------------------------------------------------------------
Teleferics_Mappings: ; Offset_0x021E42:
                dc.w    Offset_0x021E4C-Teleferics_Mappings
                dc.w    Offset_0x021E9E-Teleferics_Mappings
                dc.w    Offset_0x021EE0-Teleferics_Mappings
                dc.w    Offset_0x021EF2-Teleferics_Mappings
                dc.w    Offset_0x021F0C-Teleferics_Mappings
Offset_0x021E4C:
                dc.w    $000A
                dc.l    $C1050000, $0000FFE4, $D0030004, $0002FFE6
                dc.l    $F0030004, $0002FFE6, $10010008, $0004FFE7
                dc.l    $D505000A, $0005000C, $E003000E, $00070011
                dc.l    $10010012, $00090011, $0003000E, $00070011
                dc.l    $200D0014, $000AFFE0, $200D0814, $080A0000
Offset_0x021E9E:
                dc.w    $0008
                dc.l    $C1050000, $0000FFE4, $D0030004, $0002FFE6
                dc.l    $F0030004, $0002FFE6, $1001002C, $0016FFE6
                dc.l    $D505000A, $0005000C, $E003000E, $00070011
                dc.l    $1801002E, $00170011, $0003000E, $00070011
Offset_0x021EE0:
                dc.w    $0002
                dc.l    $200D0014, $000AFFE0, $200D0814, $080A0000
Offset_0x021EF2:
                dc.w    $0003
                dc.l    $D805001C, $000EFFF8, $E8070020, $0010FFF8
                dc.l    $08070020, $0010FFF8
Offset_0x021F0C:
                dc.w    $0003
                dc.l    $D8050028, $0014FFF8, $E8070820, $0810FFF8
                dc.l    $08070820, $0810FFF8
;===============================================================================
; Objeto 0x16 - Teleféricos na Hill Top
; [ Término ]
;===============================================================================  