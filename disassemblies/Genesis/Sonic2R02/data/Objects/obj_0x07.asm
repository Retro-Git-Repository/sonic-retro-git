;===============================================================================
; Objeto 0x07 - Viscosidade do óleo na Oil Ocean
; [ Início ]
;===============================================================================  
Offset_0x023EDA:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x023EE8(PC, D0), D1
                jmp     Offset_0x023EE8(PC, D1)
Offset_0x023EE8:
                dc.w    Offset_0x023EEC-Offset_0x023EE8
                dc.w    Offset_0x023F0E-Offset_0x023EE8
Offset_0x023EEC:
                addq.b  #$02, $0024(A0)
                move.w  #$0758, $000C(A0)
                move.b  #$20, $0019(A0)
                move.w  $000C(A0), $0030(A0)
                move.b  #$30, $0038(A0)
                bset    #$07, $0022(A0)
Offset_0x023F0E:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x023FA8
                lea     ($FFFFB000).w, A1
                moveq   #$08, D1
                move.b  $0022(A0), D0
                and.b   D1, D0
                bne.s   Offset_0x023F32
                cmpi.b  #$30, $0038(A0)
                beq.s   Offset_0x023F3C
                addq.b  #$01, $0038(A0)
                bra.s   Offset_0x023F3C
Offset_0x023F32:
                tst.b   $0038(A0)
                beq.s   Offset_0x023F94
                subq.b  #$01, $0038(A0)
Offset_0x023F3C:
                moveq   #$20, D1
                moveq   #$00, D3
                move.b  $0038(A0), D3
                moveq   #$03, D6
                move.w  $0008(A1), D4
                move.w  D4, $0008(A0)
                jsr     (Platform_Object_A1)                   ; Offset_0x019BB6
                lea     ($FFFFB040).w, A1
                moveq   #$10, D1
                move.b  $0022(A0), D0
                and.b   D1, D0
                bne.s   Offset_0x023F70
                cmpi.b  #$30, $003A(A0)
                beq.s   Offset_0x023F7A
                addq.b  #$01, $003A(A0)
                bra.s   Offset_0x023F7A
Offset_0x023F70:
                tst.b   $003A(A0)
                beq.s   Offset_0x023F94
                subq.b  #$01, $003A(A0)
Offset_0x023F7A:
                moveq   #$20, D1
                moveq   #$00, D3
                move.b  $003A(A0), D3
                moveq   #$04, D6
                move.w  $0008(A1), D4
                move.w  D4, $0008(A0)
                jsr     (Platform_Object_A1)                   ; Offset_0x019BB6
                rts
Offset_0x023F94:
                not.b   D1
                and.b   D1, $0022(A0)
                move.l  A0, -(A7)
                move.l  A0, A2
                move.l  A1, A0
                jsr     (Kill_Player)                          ; Offset_0x03F690
                move.l  (A7)+, A0
Offset_0x023FA8:
                rts
;===============================================================================
; Objeto 0x07 - Viscosidade do óleo na Oil Ocean
; [ Término ]
;===============================================================================  