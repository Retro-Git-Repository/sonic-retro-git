;===============================================================================
; Objeto 0x76 - Plataforma com espinhos nos lados na Mystic Cave
; [ Início ]
;===============================================================================   
Offset_0x028B24:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x028B32(PC, D0), D1
                jmp     Offset_0x028B32(PC, D1)
Offset_0x028B32:
                dc.w    Offset_0x028B3A-Offset_0x028B32
                dc.w    Offset_0x028B8C-Offset_0x028B32      
;-------------------------------------------------------------------------------                   
Platform_Spikes_Config: ; Offset_0x028B36:              
                dc.b    $40, $10          ; Largura / Altura do espinho
                dc.b    $00, $00
;-------------------------------------------------------------------------------                  
Offset_0x028B3A:
                addq.b  #$02, $0024(A0)
                move.l  #Platform_Spikes_Mappings, $0004(A0)   ; Offset_0x028C70
                move.w  #$0000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$02, D0
                andi.w  #$001C, D0
                lea     Platform_Spikes_Config(PC, D0), A2     ; Offset_0x028B36
                move.b  (A2)+, $0019(A0)
                move.b  (A2)+, $0016(A0)
                move.b  (A2)+, $001A(A0)
                move.w  $0008(A0), $0034(A0)
                move.w  $000C(A0), $0030(A0)
                andi.w  #$000F, $0028(A0)
Offset_0x028B8C:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.w  Offset_0x028C00(PC, D0), D1
                jsr     Offset_0x028C00(PC, D1)
                move.w  (A7)+, D4
                tst.b   $0001(A0)
                bpl.s   Offset_0x028BF6
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
                swap.w  D6
                andi.w  #$0003, D6
                beq.s   Offset_0x028BF6
                move.b  D6, D0
                andi.b  #$01, D0
                beq.s   Offset_0x028BE0
                lea     ($FFFFB000).w, A1
                jsr     (Hurt_Player_A1)                       ; Offset_0x015A1A
                bclr    #$05, $0022(A0)
Offset_0x028BE0:
                andi.b  #$02, D6
                beq.s   Offset_0x028BF6
                lea     ($FFFFB040).w, A1
                jsr     (Hurt_Player_A1)                       ; Offset_0x015A1A
                bclr    #$06, $0022(A0)
Offset_0x028BF6:
                move.w  $0034(A0), D0
                jmp     (MarkObjGone_2)                        ; Offset_0x016390
Offset_0x028C00:
                dc.w    Offset_0x028C04-Offset_0x028C00
                dc.w    Offset_0x028C54-Offset_0x028C00
Offset_0x028C04:
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x028C0E
                lea     ($FFFFB040).w, A1
Offset_0x028C0E:
                btst    #$01, $0022(A1)
                bne.s   Offset_0x028C52
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addi.w  #$00C0, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x028C2E
                subi.w  #$0100, D0
Offset_0x028C2E:
                cmpi.w  #$0080, D0
                bcc.s   Offset_0x028C52
                move.w  $000C(A1), D0
                sub.w   $000C(A0), D0
                addi.w  #$0010, D0
                cmpi.w  #$0020, D0
                bcc.s   Offset_0x028C52
                move.b  #$02, $0028(A0)
                move.w  #$0080, $0036(A0)
Offset_0x028C52:
                rts
Offset_0x028C54:
                tst.w   $0036(A0)
                beq.s   Offset_0x028C6E
                subq.w  #$01, $0036(A0)
                moveq   #$FFFFFFFF, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x028C6A
                neg.w   D0
Offset_0x028C6A:
                add.w   D0, $0008(A0)
Offset_0x028C6E:
                rts
;-------------------------------------------------------------------------------
Platform_Spikes_Mappings: ; Offset_0x028C70:
                dc.w    Offset_0x028C72-Platform_Spikes_Mappings
Offset_0x028C72:
                dc.w    $0006
                dc.l    $F005242C, $2216FFC0, $0005242C, $2216FFC0
                dc.l    $F0076040, $6020FFD0, $F00F6048, $6024FFE0
                dc.l    $F00F6048, $60240000, $F00F6048, $60240020
;===============================================================================
; Objeto 0x76 - Plataforma com espinhos nos lados na Mystic Cave
; [ Término ]
;===============================================================================  