;===============================================================================
; Objeto 0x6F - Resultados do Special Stage
; [ Início ]                
;===============================================================================     
Offset_0x01435E:
                moveq   #$00, D0
                moveq   #$00, D6
                move.b  $0024(A0), D0
                move.w  Offset_0x01436E(PC, D0), D1
                jmp     Offset_0x01436E(PC, D1)
Offset_0x01436E:
                dc.w    Offset_0x0143A4-Offset_0x01436E
                dc.w    Offset_0x0143EE-Offset_0x01436E
                dc.w    Offset_0x014422-Offset_0x01436E
                dc.w    Offset_0x014460-Offset_0x01436E
                dc.w    Offset_0x01445E-Offset_0x01436E
                dc.w    Offset_0x01445C-Offset_0x01436E
                dc.w    Offset_0x01445A-Offset_0x01436E
                dc.w    Offset_0x014458-Offset_0x01436E
                dc.w    Offset_0x014456-Offset_0x01436E
                dc.w    Offset_0x014454-Offset_0x01436E
                dc.w    Offset_0x014502-Offset_0x01436E
                dc.w    Offset_0x01449E-Offset_0x01436E
                dc.w    Offset_0x01447A-Offset_0x01436E
                dc.w    Offset_0x014506-Offset_0x01436E
                dc.w    Offset_0x014510-Offset_0x01436E
                dc.w    Offset_0x01451E-Offset_0x01436E
                dc.w    Offset_0x014510-Offset_0x01436E
                dc.w    Offset_0x0145BA-Offset_0x01436E
                dc.w    Offset_0x014510-Offset_0x01436E
                dc.w    Offset_0x014510-Offset_0x01436E
                dc.w    Offset_0x0145C4-Offset_0x01436E
                dc.w    Offset_0x014630-Offset_0x01436E
                dc.w    Offset_0x014510-Offset_0x01436E
                dc.w    Offset_0x0145BA-Offset_0x01436E
                dc.w    Offset_0x014644-Offset_0x01436E
                dc.w    Offset_0x0146B2-Offset_0x01436E
                dc.w    Offset_0x0146D4-Offset_0x01436E
Offset_0x0143A4:
                tst.l   ($FFFFF680).w
                beq.s   Offset_0x0143AC
                rts
Offset_0x0143AC:
                move.l  A0, A1
                lea     Special_Stage_Screen_Pos(PC), A2       ; Offset_0x0146F0
                moveq   #$0C, D1
Offset_0x0143B4:
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.w  (A2), $0008(A1)
                move.w  (A2)+, $0032(A1)
                move.w  (A2)+, $0030(A1)
                move.w  (A2)+, $000A(A1)
                move.b  (A2)+, $0024(A1)
                move.b  (A2)+, $001A(A1)
                move.l  #Special_Stage_Results_Mappings, $0004(A1) ; Offset_0x014E6E
                move.b  #$78, $0019(A1)
                move.b  #$00, $0001(A1)
                lea     $0040(A1), A1
                dbra    D1, Offset_0x0143B4
Offset_0x0143EE:
                tst.b   ($FFFFFF90).w
                beq.s   Offset_0x0143FA
                move.b  #$04, $001A(A0)
Offset_0x0143FA:
                cmpi.b  #$07, (Emeralds_Count).w                     ; $FFFFFF91
                bne.s   Offset_0x014408
                move.b  #$19, $001A(A0)
Offset_0x014408:
                move.w  $0030(A0), D0
                cmp.w   $0008(A0), D0
                bne.s   Offset_0x01441E
                move.b  #$1C, $0024(A0)
                move.w  #$00B4, $001E(A0)
Offset_0x01441E:
                bra     Offset_0x013DB8
Offset_0x014422:
                cmpi.b  #$07, (Emeralds_Count).w                     ; $FFFFFF91
                bne.s   Offset_0x01442E
                moveq   #$16, D0
                bra.s   Offset_0x014438
Offset_0x01442E:
                tst.b   ($FFFFFF90).w
                beq     DeleteObject                           ; Offset_0x01646C
                moveq   #$01, D0
Offset_0x014438:
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                bne.s   Offset_0x01444C
                addq.w  #$01, D0
                btst    #$07, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x01444C
                addq.w  #$01, D0
Offset_0x01444C:
                move.b  D0, $001A(A0)
                bra     Offset_0x013DB8
Offset_0x014454:
                addq.w  #$01, D6
Offset_0x014456:
                addq.w  #$01, D6
Offset_0x014458:
                addq.w  #$01, D6
Offset_0x01445A:
                addq.w  #$01, D6
Offset_0x01445C:
                addq.w  #$01, D6
Offset_0x01445E:
                addq.w  #$01, D6
Offset_0x014460:
                lea     ($FFFFFF92).w, A1
                tst.b   $00(A1, D6)
                beq     DeleteObject                           ; Offset_0x01646C
                btst    #$00, ($FFFFFE0F).w
                beq.s   Offset_0x014478
                bsr     DisplaySprite                          ; Offset_0x01647A
Offset_0x014478:
                rts
Offset_0x01447A:
                tst.w   (Player_Selected_Flag).w                     ; $FFFFFF7A
                bne     DeleteObject                           ; Offset_0x01646C
                cmpi.b  #$26, ($FFFFB824).w
                beq     DeleteObject                           ; Offset_0x01646C
                moveq   #$0E, D0
                btst    #$07, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x014498
                addq.w  #$01, D0
Offset_0x014498:
                lea     ($FFFFF7D4).w, A1
                bra.s   Offset_0x0144F8
Offset_0x01449E:
                cmpi.b  #$26, ($FFFFB824).w
                bne.s   Offset_0x0144D0
                move.w  #$1388, ($FFFFF7D2).w
                move.b  #$2A, $0024(A0)
                move.w  #$0120, $000A(A0)
                st      ($FFFFF7D6).w
                move.w  #Panel_Spinning_Sfx, D0 ; $00CF
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                move.w  #$005A, ($FFFFB81E).w
                bra     Offset_0x014630
Offset_0x0144D0:
                move.w  (Player_Selected_Flag).w, D0                 ; $FFFFFF7A
                beq.s   Offset_0x0144F2
                move.w  #$0120, $000A(A0)
                subq.w  #$01, D0
                beq.s   Offset_0x0144F2
                moveq   #$0E, D0
                btst    #$07, (Hardware_Id).w                        ; $FFFFFFD8
                beq.s   Offset_0x0144EC
                addq.w  #$01, D0
Offset_0x0144EC:
                lea     ($FFFFF7D4).w, A1
                bra.s   Offset_0x0144F8
Offset_0x0144F2:
                moveq   #$0D, D0
                lea     ($FFFFF7D2).w, A1
Offset_0x0144F8:
                tst.w   (A1)
                bne.s   Offset_0x0144FE
                addq.w  #$05, D0
Offset_0x0144FE:
                move.b  D0, $001A(A0)
Offset_0x014502:
                bra     Offset_0x013DB8
Offset_0x014506:
                tst.b   ($FFFFFF90).w
                beq     DeleteObject                           ; Offset_0x01646C
                bra.s   Offset_0x014502
Offset_0x014510:
                subq.w  #$01, $001E(A0)
                bne.s   Offset_0x01451A
                addq.b  #$02, $0024(A0)
Offset_0x01451A:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x01451E:
                bsr     DisplaySprite                          ; Offset_0x01647A
                move.b  #$01, ($FFFFF7D6).w
                moveq   #$00, D0
                tst.w   ($FFFFF7D2).w
                beq.s   Offset_0x014538
                addi.w  #$000A, D0
                subq.w  #$01, ($FFFFF7D2).w
Offset_0x014538:
                tst.w   ($FFFFF7D4).w
                beq.s   Offset_0x014546
                addi.w  #$000A, D0
                subq.w  #$01, ($FFFFF7D4).w
Offset_0x014546:
                tst.w   ($FFFFFF6E).w
                beq.s   Offset_0x014556
                addi.w  #$000A, D0
                subi.w  #$000A, ($FFFFFF6E).w
Offset_0x014556:
                tst.w   D0
                bne.s   Offset_0x0145A0
                move.w  #Results_Ring_Sfx, D0   ; $00C5
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.b  #$02, $0024(A0)
                move.w  #$0078, $001E(A0)
                tst.w   ($FFFFFF42).w
                bne.s   Offset_0x014592
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                beq.s   Offset_0x01459E
                tst.b   ($FFFFFF90).w
                beq.s   Offset_0x01459E
                cmpi.b  #$07, (Emeralds_Count).w                     ; $FFFFFF91
                bne.s   Offset_0x01459E
                move.b  #$30, $0024(A0)
                rts
Offset_0x014592:
                move.b  #$24, $0024(A0)
                move.w  #$005A, $001E(A0)
Offset_0x01459E:
                rts
Offset_0x0145A0:
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x01459E
                move.w  #Add_Point_Sfx, D0      ; $00CD
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0145BA:
                move.w  #$0001, ($FFFFFE02).w
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0145C4:
                bsr     DisplaySprite                          ; Offset_0x01647A
                move.b  #$01, ($FFFFF7D6).w
                moveq   #$00, D0
                tst.w   ($FFFFF7D2).w
                beq.s   Offset_0x0145E0
                addi.w  #$0014, D0
                subi.w  #$0014, ($FFFFF7D2).w
Offset_0x0145E0:
                tst.w   D0
                beq.s   Offset_0x0145FE
                jsr     (Add_Points_Player_One)                ; Offset_0x040A5C
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$03, D0
                bne.s   Offset_0x01462E
                move.w  #Add_Point_Sfx, D0      ; $00CD
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0145FE:
                move.w  #Results_Ring_Sfx, D0   ; $00C5
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.b  #$04, $0024(A0)
                move.w  #$0078, $001E(A0)
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                beq.s   Offset_0x01462E
                tst.b   ($FFFFFF90).w
                beq.s   Offset_0x01462E
                cmpi.b  #$07, (Emeralds_Count).w                     ; $FFFFFF91
                bne.s   Offset_0x01462E
                move.b  #$30, $0024(A0)
Offset_0x01462E:
                rts
Offset_0x014630:
                moveq   #$11, D0
                btst    #$03, ($FFFFFE0F).w
                beq.s   Offset_0x01463C
                moveq   #$15, D0
Offset_0x01463C:
                move.b  D0, $001A(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x014644:
                move.b  #$32, $0064(A0)
                move.w  $0008(A0), D0
                cmp.w   $0032(A0), D0
                bne.s   Offset_0x0146B2
                move.b  #$14, $0064(A0)
                subq.w  #$08, $004A(A0)
                move.b  #$1A, $005A(A0)
                move.b  #$34, $0024(A0)
                subq.w  #$08, $000A(A0)
                move.b  #$1B, $001A(A0)
                lea     ($FFFFBB40).w, A1
                move.b  $0000(A0), $0000(A1)
                clr.w   $0008(A1)
                move.w  #$0120, $0030(A1)
                move.w  #$00B4, $000A(A1)
                move.b  #$14, $0024(A1)
                move.b  #$1C, $001A(A1)
                move.l  #Special_Stage_Results_Mappings, $0004(A1) ; Offset_0x014E6E
                move.b  #$78, $0019(A1)
                move.b  #$00, $0001(A1)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0146B2:
                moveq   #$20, D0
                move.w  $0008(A0), D1
                cmp.w   $0032(A0), D1
                beq.s   Offset_0x0146CE
                bhi.s   Offset_0x0146C2
                neg.w   D0
Offset_0x0146C2:
                sub.w   D0, $0008(A0)
                cmpi.w  #$0200, $0008(A0)
                bhi.s   Offset_0x0146D2
Offset_0x0146CE:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0146D2:
                rts
Offset_0x0146D4:
                move.w  $0008(A0), D0
                cmp.w   $0030(A0), D0
                bne     Offset_0x013DB8
                move.w  #$00B4, $001E(A0)
                move.b  #$20, $0024(A0)
                bra     DisplaySprite                          ; Offset_0x01647A
;-------------------------------------------------------------------------------
Special_Stage_Screen_Pos: ; Offset_0x0146F0:
                dc.w    $0240, $0120, $00AA
                dc.b    $02, $00
                dc.w    $0000, $0120, $0098
                dc.b    $04, $01
                dc.w    $0118, $0000, $00C4
                dc.b    $06, $05
                dc.w    $0130, $0000, $00D0
                dc.b    $08, $06
                dc.w    $0130, $0000, $00E8
                dc.b    $0A, $07
                dc.w    $0118, $0000, $00F4
                dc.b    $0C, $08
                dc.w    $0100, $0000, $00E8
                dc.b    $0E, $09
                dc.w    $0100, $0000, $00D0
                dc.b    $10, $0A
                dc.w    $0118, $0000, $00DC
                dc.b    $12, $0B
                dc.w    $0330, $0120, $0108
                dc.b    $14, $0C
                dc.w    $0340, $0120, $0118
                dc.b    $16, $0D
                dc.w    $0350, $0120, $0128
                dc.b    $18, $0E
                dc.w    $0360, $0120, $0138
                dc.b    $1A, $10                  
;===============================================================================
; Objeto 0x6F - Resultados do Special Stage
; [ Término ]           
;===============================================================================  