;===============================================================================
; Objeto 0x5B - Sonic / Miles perdendo anéis ao tocar nas bombas no 
; [ Início ]    Special Stage 
;===============================================================================            
Offset_0x034E50:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x034E5E(PC, D0), D1
                jmp     Offset_0x034E5E(PC, D1)
Offset_0x034E5E:
                dc.w    Offset_0x034E62-Offset_0x034E5E
                dc.w    Offset_0x034F38-Offset_0x034E5E
Offset_0x034E62:
                move.l  $0038(A0), A3
                moveq   #$00, D1
                move.b  $003D(A3), D1
                beq.s   Offset_0x034E78
                subq.b  #$01, $003D(A3)
                move.w  #$000A, D1
                bra.s   Offset_0x034EA8
Offset_0x034E78:
                move.b  $003C(A3), D1
                beq.s   Offset_0x034E8E
                subq.b  #$01, $003C(A3)
                move.b  #$09, $003D(A3)
                move.w  #$000A, D1
                bra.s   Offset_0x034EA8
Offset_0x034E8E:
                move.b  $003E(A3), D1
                beq.s   Offset_0x034EAE
                move.b  #$00, $003E(A3)
                btst    #$00, D1
                beq.s   Offset_0x034EA8
                lea     (Offset_0x034E46), A2
                bra.s   Offset_0x034EAE
Offset_0x034EA8:
                lea     (Offset_0x034E3C), A2
Offset_0x034EAE:
                cmpi.b  #$09, (A3)
                bne.s   Offset_0x034EBA
                sub.w   D1, ($FFFFFE20).w
                bra.s   Offset_0x034EBE
Offset_0x034EBA:
                sub.w   D1, ($FFFFFED0).w
Offset_0x034EBE:
                move.w  D1, D2
                subq.w  #$01, D2
                bmi     Offset_0x034BC6
                move.l  A0, A1
                bra.s   Offset_0x034ED2
Offset_0x034ECA:
                jsr     (Offset_0x006F30)
                bne.s   Offset_0x034F32
Offset_0x034ED2:
                move.b  #$5B, (A1)
                move.b  #$02, $0024(A1)
                move.l  #SS_Rings_Mappings, $0004(A1)          ; Offset_0x035D78
                move.w  #$6322, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$05, $0018(A1)
                move.b  #$00, $0020(A1)
                move.b  #$08, $001C(A1)
                move.w  $0008(A3), $0008(A1)
                move.w  $000C(A3), $000C(A1)
                move.b  $0026(A3), D0
                addi.b  #$40, D0
                add.b   (A2)+, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$0400, D1
                asr.l   #$08, D1
                move.w  D1, $0010(A1)
                muls.w  #$1000, D0
                asr.l   #$08, D0
                move.w  D0, $0012(A1)
Offset_0x034F32:
                dbra    D2, Offset_0x034ECA
                rts
Offset_0x034F38:
                jsr     (ObjectFall)                           ; Offset_0x016306
                addi.w  #$0080, $0012(A0)
                bsr     Offset_0x034F74
                tst.w   $0008(A0)
                bmi     Offset_0x034BC6
                cmpi.w  #$0100, $0008(A0)
                bcc     Offset_0x034BC6
                cmpi.w  #$00E0, $000C(A0)
                bgt     Offset_0x034BC6
                lea     (SS_Rings_AnimateData), A1             ; Offset_0x035D20
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                bra     J_DisplaySprite_01                     ; Offset_0x036014
Offset_0x034F74:
                tst.w   $0012(A0)
                bmi     Offset_0x034F88
                move.b  #$00, $0018(A0)
                move.b  #$09, $001C(A0)
Offset_0x034F88:
                rts
;===============================================================================
; Objeto 0x5B - Sonic / Miles perdendo anéis ao tocar nas bombas no 
; [ Término ]   Special Stage
;===============================================================================  