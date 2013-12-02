;===============================================================================
; Objeto 0x67 - Atributo dos teletransportes na Metropolis
; [ Início ]
;===============================================================================   
Offset_0x026F48:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x026F74(PC, D0), D1
                jsr     Offset_0x026F74(PC, D1)
                move.b  $002C(A0), D0
                add.b   $0036(A0), D0
                beq     Obj_0x67_MarkObjGone_3                 ; Offset_0x027370
                lea     (Teleport_Animate_Data), A1            ; Offset_0x02731E
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x026F74:
                dc.w    Offset_0x026F78-Offset_0x026F74
                dc.w    Offset_0x026F9C-Offset_0x026F74
Offset_0x026F78:
                addq.b  #$02, $0024(A0)
                move.l  #Teleport_Mappings, $0004(A0)          ; Offset_0x027338
                move.w  #$656B, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$05, $0018(A0)
Offset_0x026F9C:
                lea     ($FFFFB000).w, A1
                lea     $002C(A0), A4
                bsr.s   Offset_0x026FAE
                lea     ($FFFFB040).w, A1
                lea     $0036(A0), A4
Offset_0x026FAE:
                moveq   #$00, D0
                move.b  (A4), D0
                move.w  Offset_0x026FBA(PC, D0), D0
                jmp     Offset_0x026FBA(PC, D0)
Offset_0x026FBA:
                dc.w    Offset_0x026FC0-Offset_0x026FBA
                dc.w    Offset_0x027050-Offset_0x026FBA
                dc.w    Offset_0x027084-Offset_0x026FBA
Offset_0x026FC0:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x02704E
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                addq.w  #$03, D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x026FDE
                addi.w  #$000A, D0
Offset_0x026FDE:
                cmpi.w  #$0010, D0
                bcc.s   Offset_0x02704E
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                addi.w  #$0020, D1
                cmpi.w  #$0040, D1
                bcc.s   Offset_0x02704E
                tst.b   $002A(A1)
                bne.s   Offset_0x02704E
                addq.b  #$02, (A4)
                move.b  #$81, $002A(A1)
                move.b  #$02, $001C(A1)
                move.w  #$0800, $0014(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                bclr    #$05, $0022(A0)
                bclr    #$05, $0022(A1)
                bset    #$01, $0022(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                clr.b   $0001(A4)
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.w  #$0100, $001C(A0)
Offset_0x02704E:
                rts
Offset_0x027050:
                move.b  $0001(A4), D0
                addq.b  #$02, $0001(A4)
                jsr     (CalcSine)                             ; Offset_0x003370
                asr.w   #$05, D0
                move.w  $000C(A0), D2
                sub.w   D0, D2
                move.w  D2, $000C(A1)
                cmpi.b  #$80, $0001(A4)
                bne.s   Offset_0x027082
                bsr     Offset_0x027100
                addq.b  #$02, (A4)
                move.w  #Spindash_Release_Sfx, D0 ; $00BC
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x027082:
                rts
Offset_0x027084:
                subq.b  #$01, $0002(A4)
                bpl.s   Offset_0x0270B8
                move.l  $0006(A4), A2
                move.w  (A2)+, D4
                move.w  D4, $0008(A1)
                move.w  (A2)+, D5
                move.w  D5, $000C(A1)
                tst.b   $0028(A0)
                bpl.s   Offset_0x0270A2
                subq.w  #$08, A2
Offset_0x0270A2:
                move.l  A2, $0006(A4)
                subq.w  #$04, $0004(A4)
                beq.s   Offset_0x0270DE
                move.w  (A2)+, D4
                move.w  (A2)+, D5
                move.w  #$1000, D2
                bra     Offset_0x027164
Offset_0x0270B8:
                move.l  $0008(A1), D2
                move.l  $000C(A1), D3
                move.w  $0010(A1), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D2
                move.w  $0012(A1), D0
                ext.l   D0
                asl.l   #$08, D0
                add.l   D0, D3
                move.l  D2, $0008(A1)
                move.l  D3, $000C(A1)
                rts
Offset_0x0270DE:
                andi.w  #$07FF, $000C(A1)
                clr.b   (A4)
                clr.b   $002A(A1)
                btst    #$04, $0028(A0)
                bne.s   Offset_0x0270FE
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
Offset_0x0270FE:
                rts
Offset_0x027100:
                move.b  $0028(A0), D0
                bpl.s   Offset_0x027134
                neg.b   D0
                andi.w  #$000F, D0
                add.w   D0, D0
                lea     (Teleport_From_To_Data), A2            ; Offset_0x0271E2
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D0
                subq.w  #$04, D0
                move.w  D0, $0004(A4)
                lea     $00(A2, D0), A2
                move.w  (A2)+, D4
                move.w  D4, $0008(A1)
                move.w  (A2)+, D5
                move.w  D5, $000C(A1)
                subq.w  #$08, A2
                bra.s   Offset_0x027158
Offset_0x027134:
                andi.w  #$000F, D0
                add.w   D0, D0
                lea     (Teleport_From_To_Data), A2            ; Offset_0x0271E2
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, $0004(A4)
                subq.w  #$04, $0004(A4)
                move.w  (A2)+, D4
                move.w  D4, $0008(A1)
                move.w  (A2)+, D5
                move.w  D5, $000C(A1)
Offset_0x027158:
                move.l  A2, $0006(A4)
                move.w  (A2)+, D4
                move.w  (A2)+, D5
                move.w  #$1000, D2
Offset_0x027164:
                moveq   #$00, D0
                move.w  D2, D3
                move.w  D4, D0
                sub.w   $0008(A1), D0
                bge.s   Offset_0x027174
                neg.w   D0
                neg.w   D2
Offset_0x027174:
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   $000C(A1), D1
                bge.s   Offset_0x027182
                neg.w   D1
                neg.w   D3
Offset_0x027182:
                cmp.w   D0, D1
                bcs.s   Offset_0x0271B4
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   $000C(A1), D1
                swap.w  D1
                divs.w  D3, D1
                moveq   #$00, D0
                move.w  D4, D0
                sub.w   $0008(A1), D0
                beq.s   Offset_0x0271A0
                swap.w  D0
                divs.w  D1, D0
Offset_0x0271A0:
                move.w  D0, $0010(A1)
                move.w  D3, $0012(A1)
                tst.w   D1
                bpl.s   Offset_0x0271AE
                neg.w   D1
Offset_0x0271AE:
                move.w  D1, $0002(A4)
                rts
Offset_0x0271B4:
                moveq   #$00, D0
                move.w  D4, D0
                sub.w   $0008(A1), D0
                swap.w  D0
                divs.w  D2, D0
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   $000C(A1), D1
                beq.s   Offset_0x0271CE
                swap.w  D1
                divs.w  D0, D1
Offset_0x0271CE:
                move.w  D1, $0012(A1)
                move.w  D2, $0010(A1)
                tst.w   D0
                bpl.s   Offset_0x0271DC
                neg.w   D0
Offset_0x0271DC:
                move.w  D0, $0002(A4)
                rts
;-------------------------------------------------------------------------------
Teleport_From_To_Data: ; Offset_0x0271E2:
                dc.w    Offset_0x0271FC-Teleport_From_To_Data
                dc.w    Offset_0x027216-Teleport_From_To_Data
                dc.w    Offset_0x027220-Teleport_From_To_Data
                dc.w    Offset_0x02723A-Teleport_From_To_Data
                dc.w    Offset_0x027244-Teleport_From_To_Data
                dc.w    Offset_0x02724E-Teleport_From_To_Data
                dc.w    Offset_0x027268-Teleport_From_To_Data
                dc.w    Offset_0x027282-Teleport_From_To_Data
                dc.w    Offset_0x02729C-Teleport_From_To_Data
                dc.w    Offset_0x0272B6-Teleport_From_To_Data
                dc.w    Offset_0x0272D0-Teleport_From_To_Data
                dc.w    Offset_0x0272EA-Teleport_From_To_Data
                dc.w    Offset_0x027304-Teleport_From_To_Data
Offset_0x0271FC:
                dc.w    $0018
                dc.w    $07A8, $0270, $0750, $0270, $0740, $0280, $0740, $03E0
                dc.w    $0750, $03F0, $07A8, $03F0
Offset_0x027216:
                dc.w    $0008
                dc.w    $0C58, $05F0, $0E28, $05F0
Offset_0x027220:
                dc.w    $0018
                dc.w    $1828, $06B0, $17D0, $06B0, $17C0, $06C0, $17C0, $07E0
                dc.w    $17B0, $07F0, $1758, $07F0
Offset_0x02723A:
                dc.w    $0008
                dc.w    $05D8, $0370, $0780, $0370
Offset_0x027244:
                dc.w    $0008
                dc.w    $05D8, $05F0, $0700, $05F0
Offset_0x02724E:
                dc.w    $0018
                dc.w    $0BD8, $01F0, $0C30, $01F0, $0C40, $01E0, $0C40, $00C0
                dc.w    $0C50, $00B0, $0CA8, $00B0
Offset_0x027268:
                dc.w    $0018
                dc.w    $1728, $0330, $15D0, $0330, $15C0, $0320, $15C0, $0240
                dc.w    $15D0, $0230, $1628, $0230
Offset_0x027282:
                dc.w    $0018
                dc.w    $06D8, $01F0, $0730, $01F0, $0740, $01E0, $0740, $0100
                dc.w    $0750, $00F0, $07A8, $00F0
Offset_0x02729C:
                dc.w    $0018
                dc.w    $07D8, $0330, $0828, $0330, $0840, $0340, $0840, $0458
                dc.w    $0828, $0470, $07D8, $0470
Offset_0x0272B6:
                dc.w    $0018
                dc.w    $0FD8, $03B0, $1028, $03B0, $1040, $0398, $1040, $02C4
                dc.w    $1058, $02B0, $10A8, $02B0
Offset_0x0272D0:
                dc.w    $0018
                dc.w    $0FD8, $04B0, $1028, $04B0, $1040, $04C0, $1040, $05D8
                dc.w    $1058, $05F0, $10A8, $05F0
Offset_0x0272EA:
                dc.w    $0018
                dc.w    $2058, $0430, $20A8, $0430, $20C0, $0418, $20C0, $02C0
                dc.w    $20D0, $02B0, $2128, $02B0
Offset_0x027304:
                dc.w    $0018
                dc.w    $2328, $05B0, $22D0, $05B0, $22C0, $05A0, $22C0, $04C0
                dc.w    $22D0, $04B0, $2328, $04B0
;-------------------------------------------------------------------------------
Teleport_Animate_Data: ; Offset_0x02731E:
                dc.w    Offset_0x027322-Teleport_Animate_Data
                dc.w    Offset_0x027326-Teleport_Animate_Data
Offset_0x027322:
                dc.b    $1F, $00, $FF, $00
Offset_0x027326:
                dc.b    $01, $01, $00, $00, $00, $00, $00, $01, $00, $00, $00, $01, $00, $00, $01, $00
                dc.b    $FE, $02
;-------------------------------------------------------------------------------
Teleport_Mappings: ; Offset_0x027338:
                dc.w    Offset_0x02733C-Teleport_Mappings
                dc.w    Offset_0x02733E-Teleport_Mappings
Offset_0x02733C:
                dc.w    $0000
Offset_0x02733E:
                dc.w    $0006
                dc.l    $E0050000, $0000FFEC, $E0050000, $0000FFF8
                dc.l    $F0050000, $0000FFEC, $F0050000, $0000FFF8
                dc.l    $00050000, $0000FFEC, $00050000, $0000FFF8
;-------------------------------------------------------------------------------
Obj_0x67_MarkObjGone_3: ; Offset_0x027370:
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4                                                  
;===============================================================================
; Objeto 0x67 - Atributo dos teletransportes na Metropolis
; [ Término ]
;===============================================================================  