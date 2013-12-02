;===============================================================================
; Objeto 0x82 -> Pilar cai ao pisar em cima na Aquatic Ruin
; [ Início ]
;===============================================================================    
Offset_0x029F44:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x029F52(PC, D0), D1
                jmp     Offset_0x029F52(PC, D1)
Offset_0x029F52:
                dc.w    Offset_0x029F5E-Offset_0x029F52
                dc.w    Offset_0x029FC8-Offset_0x029F52
Offset_0x029F56:
                dc.b    $20, $08, $1C, $30, $10, $10, $10, $10
Offset_0x029F5E:
                addq.b  #$02, $0024(A0)
                move.l  #Falling_Pillar_Mappings, $0004(A0)    ; Offset_0x02A138
                move.w  #$0000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                lea     Offset_0x029F56(PC, D0), A2
                move.b  (A2)+, $0019(A0)
                move.b  (A2), $0016(A0)
                lsr.w   #$01, D0
                move.b  D0, $001A(A0)
                move.w  $0008(A0), $0034(A0)
                move.w  $000C(A0), $0030(A0)
                move.b  $0028(A0), D0
                andi.b  #$0F, D0
                beq.s   Offset_0x029FC2
                cmpi.b  #$07, D0
                beq.s   Offset_0x029FC2
                move.b  #$01, $0038(A0)
Offset_0x029FC2:
                andi.b  #$0F, $0028(A0)
Offset_0x029FC8:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                add.w   D0, D0
                move.w  Offset_0x02A012(PC, D0), D1
                jsr     Offset_0x02A012(PC, D1)
                move.w  (A7)+, D4
                tst.b   $0001(A0)
                bpl.s   Offset_0x02A008
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
                swap.w  D6
                move.b  D6, $003F(A0)
                bsr     Offset_0x02A0F4
Offset_0x02A008:
                move.w  $0034(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x02A012:
                dc.w    Offset_0x02A022-Offset_0x02A012
                dc.w    Offset_0x02A024-Offset_0x02A012
                dc.w    Offset_0x02A04C-Offset_0x02A012
                dc.w    Offset_0x02A024-Offset_0x02A012
                dc.w    Offset_0x02A072-Offset_0x02A012
                dc.w    Offset_0x02A096-Offset_0x02A012
                dc.w    Offset_0x02A04C-Offset_0x02A012
                dc.w    Offset_0x02A0AA-Offset_0x02A012
Offset_0x02A022:
                rts
Offset_0x02A024:
                tst.w   $0036(A0)
                bne.s   Offset_0x02A03C
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x02A03A
                move.w  #$001E, $0036(A0)
Offset_0x02A03A:
                rts
Offset_0x02A03C:
                subq.w  #$01, $0036(A0)
                bne.s   Offset_0x02A03A
                addq.b  #$01, $0028(A0)
                clr.b   $0038(A0)
                rts
Offset_0x02A04C:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                addq.w  #$08, $0012(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl     Offset_0x02A070
                addq.w  #$01, D1
                add.w   D1, $000C(A0)
                clr.w   $0012(A0)
                clr.b   $0028(A0)
Offset_0x02A070:
                rts
Offset_0x02A072:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                subq.w  #$08, $0012(A0)
                jsr     (Object_HitCeiling)                    ; Offset_0x01EF4E
                tst.w   D1
                bpl     Offset_0x02A094
                sub.w   D1, $000C(A0)
                clr.w   $0012(A0)
                clr.b   $0028(A0)
Offset_0x02A094:
                rts
Offset_0x02A096:
                move.b  $003F(A0), D0
                andi.b  #$03, D0
                beq.s   Offset_0x02A0A8
                addq.b  #$01, $0028(A0)
                clr.b   $0038(A0)
Offset_0x02A0A8:
                rts
Offset_0x02A0AA:
                move.w  ($FFFFF646).w, D0
                sub.w   $000C(A0), D0
                beq.s   Offset_0x02A0F2
                bcc.s   Offset_0x02A0D4
                cmpi.w  #$FFFE, D0
                bge.s   Offset_0x02A0BE
                moveq   #$FFFFFFFE, D0
Offset_0x02A0BE:
                add.w   D0, $000C(A0)
                jsr     (Object_HitCeiling)                    ; Offset_0x01EF4E
                tst.w   D1
                bpl     Offset_0x02A0D2
                sub.w   D1, $000C(A0)
Offset_0x02A0D2:
                rts
Offset_0x02A0D4:
                cmpi.w  #$0002, D0
                ble.s   Offset_0x02A0DC
                moveq   #$02, D0
Offset_0x02A0DC:
                add.w   D0, $000C(A0)
                jsr     (ObjHitFloor)                          ; Offset_0x01ED8A
                tst.w   D1
                bpl     Offset_0x02A0F2
                addq.w  #$01, D1
                add.w   D1, $000C(A0)
Offset_0x02A0F2:
                rts
Offset_0x02A0F4:
                tst.b   $0038(A0)
                beq.s   Offset_0x02A136
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x02A110
                tst.b   $003E(A0)
                beq.s   Offset_0x02A136
                subq.b  #$04, $003E(A0)
                bra.s   Offset_0x02A11C
Offset_0x02A110:
                cmpi.b  #$40, $003E(A0)
                beq.s   Offset_0x02A136
                addq.b  #$04, $003E(A0)
Offset_0x02A11C:
                move.b  $003E(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  #$0400, D1
                muls.w  D1, D0
                swap.w  D0
                add.w   $0030(A0), D0
                move.w  D0, $000C(A0)
Offset_0x02A136:
                rts
;-------------------------------------------------------------------------------
Falling_Pillar_Mappings: ; Offset_0x02A138:
                dc.w    Offset_0x02A13C-Falling_Pillar_Mappings
                dc.w    Offset_0x02A14E-Falling_Pillar_Mappings
Offset_0x02A13C:
                dc.w    $0002
                dc.l    $F80D6055, $602AFFE0, $F80D6055, $602A0000
Offset_0x02A14E:
                dc.w    $0009
                dc.l    $D005205D, $202EFFE0, $D005285D, $282E0010
                dc.l    $D00D2061, $2030FFF0, $E00D2069, $2034FFF0
                dc.l    $F00D2069, $2034FFF0, $000D2071, $2038FFF0
                dc.l    $100D2069, $2034FFF0, $200D2079, $203CFFF0
                dc.l    $30042081, $2040FFF0
;===============================================================================
; Objeto 0x82 -> Pilar cai ao pisar em cima na Aquatic Ruin
; [ Término ]
;===============================================================================
