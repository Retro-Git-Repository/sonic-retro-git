;===============================================================================
; Objeto 0x33 - Aceleradores (Toque para ganhar impulso) na Oil Ocean
; [ Início ]
;===============================================================================     
Offset_0x0239C2:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0239D0(PC, D0), D1
                jmp     Offset_0x0239D0(PC, D1)
Offset_0x0239D0:
                dc.w    Offset_0x0239D6-Offset_0x0239D0
                dc.w    Offset_0x023A60-Offset_0x0239D0
                dc.w    Offset_0x023C6E-Offset_0x0239D0
Offset_0x0239D6:
                addq.b  #$02, $0024(A0)
                move.l  #Touch_Booster_Mappings, $0004(A0)     ; Offset_0x023CB2
                move.w  #$632C, $0002(A0)
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$18, $0019(A0)
                move.w  $000C(A0), $0030(A0)
                addq.b  #$02, $0025(A0)
                move.w  #$0078, $0036(A0)
                tst.b   $0028(A0)
                beq.s   Offset_0x023A16
                move.b  #$04, $0025(A0)
Offset_0x023A16:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x023A60
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                subi.w  #$0010, $000C(A1)
                move.l  #Touch_Booster_Mappings_01, $0004(A1)  ; Offset_0x023CC6
                move.w  #$62E2, $0002(A1)
                move.b  #$04, $0001(A1)
                move.b  #$04, $0018(A1)
                move.b  #$10, $0019(A1)
                move.l  A0, $003C(A1)
Offset_0x023A60:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x023A90(PC, D0), D1
                jsr     Offset_0x023A90(PC, D1)
                move.w  (A7)+, D4
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$08, D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x023A90:
                dc.w    Offset_0x023A9A-Offset_0x023A90
                dc.w    Offset_0x023ABE-Offset_0x023A90
                dc.w    Offset_0x023AFA-Offset_0x023A90
                dc.w    Offset_0x023BF4-Offset_0x023A90
                dc.w    Offset_0x023C6C-Offset_0x023A90
Offset_0x023A9A:
                subq.w  #$01, $0036(A0)
                bpl.s   Offset_0x023ABC
                move.w  #$0078, $0036(A0)
                move.l  #$FFF69800, $0032(A0)
                addq.b  #$02, $0025(A0)
                move.w  #$00D4, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x023ABC:
                rts
Offset_0x023ABE:
                move.l  $000C(A0), D1
                add.l   $0032(A0), D1
                move.l  D1, $000C(A0)
                addi.l  #$00003800, $0032(A0)
                swap.w  D1
                cmp.w   $0030(A0), D1
                bcs.s   Offset_0x023AF8
                move.l  $0032(A0), D0
                cmpi.l  #$00010000, D0
                bcc.s   Offset_0x023AEA
                subq.b  #$02, $0025(A0)
Offset_0x023AEA:
                lsr.l   #$02, D0
                neg.l   D0
                move.l  D0, $0032(A0)
                move.w  $0030(A0), $000C(A0)
Offset_0x023AF8:
                rts
Offset_0x023AFA:
                move.w  $0008(A0), D2
                move.w  D2, D3
                subi.w  #$0010, D2
                addi.w  #$0010, D3
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x023B72
                cmpi.b  #$18, D0
                beq.s   Offset_0x023B74
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                bsr.s   Offset_0x023B26
                lea     ($FFFFB040).w, A1
                addq.b  #$01, D6
Offset_0x023B26:
                btst    D6, $0022(A0)
                beq.s   Offset_0x023B72
                move.w  $0008(A1), D0
                cmp.w   D2, D0
                bcs.s   Offset_0x023B72
                cmp.w   D3, D0
                bcc.s   Offset_0x023B72
                move.b  #$01, $002A(A1)
                move.w  #$0000, $0014(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                bclr    #$05, $0022(A1)
                bclr    #$07, $0002(A1)
                move.l  #$FFF69800, $0032(A0)
                addq.b  #$02, $0025(A0)
                move.w  #$00D4, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x023B72:
                rts
Offset_0x023B74:
                lea     ($FFFFB000).w, A1
                move.w  $0008(A1), D0
                cmp.w   D2, D0
                bcs.s   Offset_0x023BF2
                cmp.w   D3, D0
                bcc.s   Offset_0x023BF2
                lea     ($FFFFB040).w, A2
                move.w  $0008(A2), D0
                cmp.w   D2, D0
                bcs.s   Offset_0x023BF2
                cmp.w   D3, D0
                bcc.s   Offset_0x023BF2
                move.b  #$01, $002A(A1)
                move.w  #$0000, $0014(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                bclr    #$05, $0022(A1)
                bclr    #$07, $0002(A1)
                move.b  #$01, $002A(A2)
                move.w  #$0000, $0014(A2)
                move.w  #$0000, $0010(A2)
                move.w  #$0000, $0012(A2)
                bclr    #$05, $0022(A2)
                bclr    #$07, $0002(A2)
                move.l  #$FFF69800, $0032(A0)
                addq.b  #$02, $0025(A0)
                move.w  #$00D4, D0
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x023BF2:
                rts
Offset_0x023BF4:
                move.l  $000C(A0), D1
                add.l   $0032(A0), D1
                move.l  D1, $000C(A0)
                addi.l  #$00003800, $0032(A0)
                swap.w  D1
                move.w  $0030(A0), D0
                subi.w  #$007D, D0
                cmp.w   D0, D1
                bne.s   Offset_0x023C6A
                addq.b  #$02, $0025(A0)
                lea     ($FFFFB000).w, A1
                move.b  $0022(A0), D0
                andi.b  #$08, D0
                bsr.s   Offset_0x023C34
                lea     ($FFFFB040).w, A1
                move.b  $0022(A0), D0
                andi.b  #$10, D0
Offset_0x023C34:
                beq.s   Offset_0x023C6A
                move.w  $0008(A0), $0008(A1)
                move.b  #$02, $001C(A1)
                move.w  #$0800, $0014(A1)
                bset    #$01, $0022(A1)
                move.w  #$F000, $0012(A1)
                bclr    #$03, $0022(A1)
                move.b  #$00, $002A(A1)
                move.w  #Spring_Sfx, D0         ; $00CC
                jsr     (Play_Sfx_Ex)                          ; Offset_0x001338
Offset_0x023C6A:
                rts
Offset_0x023C6C:
                rts
Offset_0x023C6E:
                move.l  $003C(A0), A1
                move.w  $000C(A0), D0
                sub.w   $000C(A1), D0
                cmpi.w  #$0014, D0
                blt.s   Offset_0x023C98
                move.b  #$9B, $0020(A0)
                lea     (Touch_Booster_Animate_Data), A1       ; Offset_0x023CA6
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x023C98:
                move.b  #$00, $0020(A0)
                move.b  #$00, $001B(A0)
                rts
;-------------------------------------------------------------------------------
Touch_Booster_Animate_Data: ; Offset_0x023CA6:
                dc.w    Offset_0x023CA8-Touch_Booster_Animate_Data
Offset_0x023CA8:
                dc.b    $02, $02, $00, $02, $00, $02, $00, $01, $FF, $00
;-------------------------------------------------------------------------------    
Touch_Booster_Mappings: ; Offset_0x023CB2:
                dc.w    Offset_0x023CB4-Touch_Booster_Mappings
Offset_0x023CB4:
                dc.w    $0002
                dc.l    $F8090000, $0000FFE8, $F8090800, $08000000
;-------------------------------------------------------------------------------  
Touch_Booster_Mappings_01: ; Offset_0x023CC6:
                dc.w    Offset_0x023CCC-Touch_Booster_Mappings_01
                dc.w    Offset_0x023CDE-Touch_Booster_Mappings_01
                dc.w    Offset_0x023CF0-Touch_Booster_Mappings_01
Offset_0x023CCC:
                dc.w    $0002
                dc.l    $F8060000, $0000FFF0, $F8060800, $08000000
Offset_0x023CDE:
                dc.w    $0002
                dc.l    $F0070006, $0003FFF0, $F0070806, $08030000
Offset_0x023CF0:
                dc.w    $0002
                dc.l    $0005000E, $0007FFF0, $0005080E, $08070000                                                    
;===============================================================================
; Objeto 0x33 - Aceleradores (Toque para ganhar impulso) na Oil Ocean
; [ Término ]
;===============================================================================  