;===============================================================================
; Objeto 0x1E - Atributo teletransportador dos tubos na Chemical Plant
; [ Início ]
;===============================================================================                            
Offset_0x022488:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0224AA(PC, D0), D1
                jsr     Offset_0x0224AA(PC, D1)
                move.b  $002C(A0), D0
                add.b   $0036(A0), D0
                beq     Offset_0x0224A4
                rts
Offset_0x0224A4:
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x0224AA:
                dc.w    Offset_0x0224B4-Offset_0x0224AA
                dc.w    Offset_0x0224C8-Offset_0x0224AA
Offset_0x0224AE:
                dc.w    $00A0, $0100, $0120
Offset_0x0224B4:
                addq.b  #$02, $0024(A0)
                move.b  $0028(A0), D0
                add.w   D0, D0
                andi.w  #$0006, D0
                move.w  Offset_0x0224AE(PC, D0), $002A(A0)
Offset_0x0224C8:
                lea     ($FFFFB000).w, A1
                lea     $002C(A0), A4
                bsr.s   Offset_0x0224DA
                lea     ($FFFFB040).w, A1
                lea     $0036(A0), A4
Offset_0x0224DA:
                moveq   #$00, D0
                move.b  (A4), D0
                move.w  Offset_0x0224E6(PC, D0), D0
                jmp     Offset_0x0224E6(PC, D0)
Offset_0x0224E6:                
                dc.w    Offset_0x0224EE-Offset_0x0224E6
                dc.w    Offset_0x02260C-Offset_0x0224E6
                dc.w    Offset_0x0226F0-Offset_0x0224E6
                dc.w    Offset_0x02275C-Offset_0x0224E6
Offset_0x0224EE:
                tst.w   ($FFFFFE08).w
                bne     Offset_0x02260A
                move.w  $002A(A0), D2
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                cmp.w   D2, D0
                bcc     Offset_0x02260A
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                cmpi.w  #$0080, D1
                bcc     Offset_0x02260A
                cmpi.b  #$20, $001C(A1)
                beq     Offset_0x02260A
                moveq   #$00, D3
                cmpi.w  #$00A0, D2
                beq.s   Offset_0x02253A
                moveq   #$08, D3
                cmpi.w  #$0120, D2
                beq.s   Offset_0x02253A
                moveq   #$04, D3
                neg.w   D0
                addi.w  #$0100, D0
Offset_0x02253A:
                cmpi.w  #$0080, D0
                bcs.s   Offset_0x022570
                moveq   #$00, D2
                move.b  $0028(A0), D0
                lsr.w   #$02, D0
                andi.w  #$000F, D0
                move.b  Offset_0x022560(PC, D0), D2
                cmpi.b  #$02, D2
                bne.s   Offset_0x02257A
                move.b  ($FFFFFE24).w, D2
                andi.b  #$01, D2
                bra.s   Offset_0x02257A
Offset_0x022560:
                dc.b    $02, $02, $02, $02, $02, $02, $02, $02, $02, $02, $00, $02, $00, $01, $02, $01
Offset_0x022570:
                moveq   #$02, D2
                cmpi.w  #$0040, D1
                bcc.s   Offset_0x02257A
                moveq   #$03, D2
Offset_0x02257A:
                move.b  D2, $0001(A4)
                add.w   D3, D2
                add.w   D2, D2
                andi.w  #$001E, D2
                lea     Offset_0x022872(PC), A2
                adda.w  $00(A2, D2), A2
                move.w  (A2)+, $0004(A4)
                subq.w  #$04, $0004(A4)
                move.w  (A2)+, D4
                add.w   $0008(A0), D4
                move.w  D4, $0008(A1)
                move.w  (A2)+, D5
                add.w   $000C(A0), D5
                move.w  D5, $000C(A1)
                move.l  A2, $0006(A4)
                move.w  (A2)+, D4
                add.w   $0008(A0), D4
                move.w  (A2)+, D5
                add.w   $000C(A0), D5
                addq.b  #$02, (A4)
                move.b  #$81, $002A(A1)
                move.b  #$02, $001C(A1)
                move.w  #$0800, $0014(A1)
                move.w  #$0000, $0010(A1)
                move.w  #$0000, $0012(A1)
                bclr    #$05, $0022(A0)
                bclr    #$05, $0022(A1)
                bset    #$01, $0022(A1)
                move.b  #$00, $003C(A1)
                bclr    #$07, $0002(A1)
                move.w  #$0800, D2
                bsr     Offset_0x0227F4
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02260A:
                rts
Offset_0x02260C:                
                subq.b  #$01, $0002(A4)
                bpl.s   Offset_0x022650
                move.l  $0006(A4), A2
                move.w  (A2)+, D4
                add.w   $0008(A0), D4
                move.w  D4, $0008(A1)
                move.w  (A2)+, D5
                add.w   $000C(A0), D5
                move.w  D5, $000C(A1)
                tst.b   $0001(A4)
                bpl.s   Offset_0x022632
                subq.w  #$08, A2
Offset_0x022632:
                move.l  A2, $0006(A4)
                subq.w  #$04, $0004(A4)
                beq.s   Offset_0x022676
                move.w  (A2)+, D4
                add.w   $0008(A0), D4
                move.w  (A2)+, D5
                add.w   $000C(A0), D5
                move.w  #$0800, D2
                bra     Offset_0x0227F4
Offset_0x022650:
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
Offset_0x022676:
                cmpi.b  #$04, $0001(A4)
                bcc.s   Offset_0x022698
                move.b  $0028(A0), D0
                andi.w  #$00FC, D0
                add.b   $0001(A4), D0
                move.b  #$04, $0001(A4)
                move.b  Offset_0x0226B0(PC, D0), D0
                bne     Offset_0x022784
Offset_0x022698:
                andi.w  #$07FF, $000C(A1)
                move.b  #$06, (A4)
                clr.b   $002A(A1)
                move.w  #Spindash_Release_Sfx, D0 ; $00BC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0226B0:
                dc.b    $02, $01, $00, $00, $FF, $03, $00, $00, $04, $FE, $00, $00, $FD, $FC, $00, $00
                dc.b    $FB, $FB, $00, $00, $07, $06, $00, $00, $F9, $FA, $00, $00, $08, $09, $00, $00
                dc.b    $F8, $F7, $00, $00, $0B, $0A, $00, $00, $0C, $00, $00, $00, $F5, $F6, $00, $00
                dc.b    $F4, $00, $00, $00, $00, $0D, $00, $00, $F3, $0E, $00, $00, $00, $F2, $00, $00
Offset_0x0226F0:
                subq.b  #$01, $0002(A4)
                bpl.s   Offset_0x022724
                move.l  $0006(A4), A2
                move.w  (A2)+, D4
                move.w  D4, $0008(A1)
                move.w  (A2)+, D5
                move.w  D5, $000C(A1)
                tst.b   $0001(A4)
                bpl.s   Offset_0x02270E
                subq.w  #$08, A2
Offset_0x02270E:
                move.l  A2, $0006(A4)
                subq.w  #$04, $0004(A4)
                beq.s   Offset_0x02274A
                move.w  (A2)+, D4
                move.w  (A2)+, D5
                move.w  #$0800, D2
                bra     Offset_0x0227F4
Offset_0x022724:
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
Offset_0x02274A:
                andi.w  #$07FF, $000C(A1)
                clr.b   (A4)
                move.w  #Spindash_Release_Sfx, D0 ; $00BC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x02275C:                
                move.w  $002A(A0), D2
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                cmp.w   D2, D0
                bcc     Offset_0x022780
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                cmpi.w  #$0080, D1
                bcc     Offset_0x022780
                rts
Offset_0x022780:
                clr.b   (A4)
                rts
Offset_0x022784:
                bpl.s   Offset_0x0227B6
                neg.b   D0
                move.b  #$FC, $0001(A4)
                add.w   D0, D0
                lea     (Offset_0x022D7A), A2
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
                bra.s   Offset_0x0227D6
Offset_0x0227B6:
                add.w   D0, D0
                lea     (Offset_0x022D7A), A2
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, $0004(A4)
                subq.w  #$04, $0004(A4)
                move.w  (A2)+, D4
                move.w  D4, $0008(A1)
                move.w  (A2)+, D5
                move.w  D5, $000C(A1)
Offset_0x0227D6:
                move.l  A2, $0006(A4)
                move.w  (A2)+, D4
                move.w  (A2)+, D5
                move.w  #$0800, D2
                bsr     Offset_0x0227F4
                move.w  #Spin_Sfx, D0           ; $00BE
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.b  #$02, (A4)
                rts
Offset_0x0227F4:
                moveq   #$00, D0
                move.w  D2, D3
                move.w  D4, D0
                sub.w   $0008(A1), D0
                bge.s   Offset_0x022804
                neg.w   D0
                neg.w   D2
Offset_0x022804:
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   $000C(A1), D1
                bge.s   Offset_0x022812
                neg.w   D1
                neg.w   D3
Offset_0x022812:
                cmp.w   D0, D1
                bcs.s   Offset_0x022844
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   $000C(A1), D1
                swap.w  D1
                divs.w  D3, D1
                moveq   #$00, D0
                move.w  D4, D0
                sub.w   $0008(A1), D0
                beq.s   Offset_0x022830
                swap.w  D0
                divs.w  D1, D0
Offset_0x022830:
                move.w  D0, $0010(A1)
                move.w  D3, $0012(A1)
                tst.w   D1
                bpl.s   Offset_0x02283E
                neg.w   D1
Offset_0x02283E:
                move.w  D1, $0002(A4)
                rts
Offset_0x022844:
                moveq   #$00, D0
                move.w  D4, D0
                sub.w   $0008(A1), D0
                swap.w  D0
                divs.w  D2, D0
                moveq   #$00, D1
                move.w  D5, D1
                sub.w   $000C(A1), D1
                beq.s   Offset_0x02285E
                swap.w  D1
                divs.w  D0, D1
Offset_0x02285E:
                move.w  D1, $0012(A1)
                move.w  D2, $0010(A1)
                tst.w   D0
                bpl.s   Offset_0x02286C
                neg.w   D0
Offset_0x02286C:
                move.w  D0, $0002(A4)
                rts
;-------------------------------------------------------------------------------                
Offset_0x022872:                
                dc.w    Offset_0x02288A-Offset_0x022872
                dc.w    Offset_0x022900-Offset_0x022872
                dc.w    Offset_0x02295E-Offset_0x022872
                dc.w    Offset_0x0229D4-Offset_0x022872
                dc.w    Offset_0x022A32-Offset_0x022872
                dc.w    Offset_0x022AA4-Offset_0x022872
                dc.w    Offset_0x022B02-Offset_0x022872
                dc.w    Offset_0x022B74-Offset_0x022872
                dc.w    Offset_0x022BD2-Offset_0x022872
                dc.w    Offset_0x022C48-Offset_0x022872
                dc.w    Offset_0x022CA6-Offset_0x022872
                dc.w    Offset_0x022D1C-Offset_0x022872
Offset_0x02288A:
                dc.w    $0074, $0090, $0010, $0090, $0070, $0040, $0070, $0035
                dc.w    $006F, $0028, $006A, $001E, $0062, $0015, $0058, $0011
                dc.w    $004A, $0010, $0040, $0011, $0035, $0015, $0027, $001E
                dc.w    $001E, $0028, $0015, $0035, $0011, $0040, $0010, $0050
                dc.w    $0010, $005E, $0012, $0068, $0018, $006D, $0024, $0070
                dc.w    $0030, $006D, $003D, $0068, $0048, $005E, $004E, $0050
                dc.w    $0050, $0030, $0050, $0022, $0052, $0017, $005A, $0011
                dc.w    $0063, $0010, $0070
Offset_0x022900:
                dc.w    $005C, $0090, $0010, $0090, $0070, $0040, $0070, $002E
                dc.w    $006E, $001D, $0062, $0013, $0053, $0010, $0040, $0013
                dc.w    $002D, $001D, $001E, $002E, $0013, $0040, $0010, $0058
                dc.w    $0010, $0064, $0014, $006C, $001A, $0070, $0028, $006C
                dc.w    $0036, $0064, $003C, $0058, $0040, $004B, $003D, $0040
                dc.w    $0038, $0036, $0032, $0028, $0030, $0010, $0030
Offset_0x02295E:
                dc.w    $0074, $0010, $0070, $0011, $0063, $0017, $005A, $0022
                dc.w    $0052, $0030, $0050, $0050, $0050, $005E, $004E, $0068
                dc.w    $0048, $006D, $003D, $0070, $0030, $006D, $0024, $0068
                dc.w    $0018, $005E, $0012, $0050, $0010, $0040, $0010, $0035
                dc.w    $0011, $0028, $0015, $001E, $001E, $0015, $0027, $0011
                dc.w    $0035, $0010, $0040, $0011, $004A, $0015, $0058, $001E
                dc.w    $0062, $0028, $006A, $0035, $006F, $0040, $0070, $0090
                dc.w    $0070, $0090, $0010
Offset_0x0229D4:
                dc.w    $005C, $0010, $0030, $0028, $0030, $0036, $0032, $0040
                dc.w    $0038, $004B, $003D, $0058, $0040, $0064, $003C, $006C
                dc.w    $0036, $0070, $0028, $006C, $001A, $0064, $0014, $0058
                dc.w    $0010, $0040, $0010, $002E, $0013, $001D, $001E, $0013
                dc.w    $002D, $0010, $0040, $0013, $0053, $001D, $0062, $002E
                dc.w    $006E, $0040, $0070, $0090, $0070, $0090, $0010
Offset_0x022A32:
                dc.w    $0070, $0010, $0010, $0010, $0070, $00C0, $0070, $00CA
                dc.w    $006F, $00D4, $006C, $00DB, $0068, $00E3, $0062, $00E8
                dc.w    $005A, $00ED, $0052, $00EF, $0048, $00F0, $0040, $00EF
                dc.w    $0036, $00ED, $002E, $00E8, $0026, $00E3, $001E, $00DB
                dc.w    $0017, $00D4, $0014, $00CA, $0012, $00C0, $0010, $00B7
                dc.w    $0011, $00AF, $0012, $00A6, $0017, $009E, $001E, $0097
                dc.w    $0026, $0093, $002E, $0091, $0036, $0090, $0040, $0090
                dc.w    $0070
Offset_0x022AA4:
                dc.w    $005C, $0010, $0010, $0010, $0070, $00C0, $0070, $00D2
                dc.w    $006E, $00E3, $0062, $00ED, $0053, $00F0, $0040, $00ED
                dc.w    $002D, $00E3, $001E, $00D2, $0013, $00C0, $0010, $00A8
                dc.w    $0010, $009C, $0014, $0094, $001A, $0090, $0028, $0094
                dc.w    $0036, $009C, $003C, $00A8, $0040, $00B5, $003D, $00C0
                dc.w    $0038, $00CA, $0032, $00D8, $0030, $00F0, $0030
Offset_0x022B02:
                dc.w    $0070, $0090, $0070, $0090, $0040, $0091, $0036, $0093
                dc.w    $002E, $0097, $0026, $009E, $001E, $00A6, $0017, $00AF
                dc.w    $0012, $00B7, $0011, $00C0, $0010, $00CA, $0012, $00D4
                dc.w    $0014, $00DB, $0017, $00E3, $001E, $00E8, $0026, $00ED
                dc.w    $002E, $00EF, $0036, $00F0, $0040, $00EF, $0048, $00ED
                dc.w    $0052, $00E8, $005A, $00E3, $0062, $00DB, $0068, $00D4
                dc.w    $006C, $00CA, $006F, $00C0, $0070, $0010, $0070, $0010
                dc.w    $0010
Offset_0x022B74:
                dc.w    $005C, $00F0, $0030, $00D8, $0030, $00CA, $0032, $00C0
                dc.w    $0038, $00B5, $003D, $00A8, $0040, $009C, $003C, $0094
                dc.w    $0036, $0090, $0028, $0094, $001A, $009C, $0014, $00A8
                dc.w    $0010, $00C0, $0010, $00D2, $0013, $00E3, $001E, $00ED
                dc.w    $002D, $00F0, $0040, $00ED, $0053, $00E3, $0062, $00D2
                dc.w    $006E, $00C0, $0070, $0010, $0070, $0010, $0010
Offset_0x022BD2:
                dc.w    $0074, $0110, $0010, $0110, $0070, $0040, $0070, $0035
                dc.w    $006F, $0028, $006A, $001E, $0062, $0015, $0058, $0011
                dc.w    $004A, $0010, $0040, $0011, $0035, $0015, $0027, $001E
                dc.w    $001E, $0028, $0015, $0035, $0011, $0040, $0010, $0050
                dc.w    $0010, $005E, $0012, $0068, $0018, $006D, $0024, $0070
                dc.w    $0030, $006D, $003D, $0068, $0048, $005E, $004E, $0050
                dc.w    $0050, $0030, $0050, $0022, $0052, $0017, $005A, $0011
                dc.w    $0063, $0010, $0070
Offset_0x022C48:
                dc.w    $005C, $0110, $0010, $0110, $0070, $0040, $0070, $002E
                dc.w    $006E, $001D, $0062, $0013, $0053, $0010, $0040, $0013
                dc.w    $002D, $001D, $001E, $002E, $0013, $0040, $0010, $0058
                dc.w    $0010, $0064, $0014, $006C, $001A, $0070, $0028, $006C
                dc.w    $0036, $0064, $003C, $0058, $0040, $004B, $003D, $0040
                dc.w    $0038, $0036, $0032, $0028, $0030, $0010, $0030
Offset_0x022CA6:
                dc.w    $0074, $0010, $0070, $0011, $0063, $0017, $005A, $0022
                dc.w    $0052, $0030, $0050, $0050, $0050, $005E, $004E, $0068
                dc.w    $0048, $006D, $003D, $0070, $0030, $006D, $0024, $0068
                dc.w    $0018, $005E, $0012, $0050, $0010, $0040, $0010, $0035
                dc.w    $0011, $0028, $0015, $001E, $001E, $0015, $0027, $0011
                dc.w    $0035, $0010, $0040, $0011, $004A, $0015, $0058, $001E
                dc.w    $0062, $0028, $006A, $0035, $006F, $0040, $0070, $0110
                dc.w    $0070, $0110, $0010
Offset_0x022D1C:
                dc.w    $005C, $0010, $0030, $0028, $0030, $0036, $0032, $0040
                dc.w    $0038, $004B, $003D, $0058, $0040, $0064, $003C, $006C
                dc.w    $0036, $0070, $0028, $006C, $001A, $0064, $0014, $0058
                dc.w    $0010, $0040, $0010, $002E, $0013, $001D, $001E, $0013
                dc.w    $002D, $0010, $0040, $0013, $0053, $001D, $0062, $002E
                dc.w    $006E, $0040, $0070, $0110, $0070, $0110, $0010
;-------------------------------------------------------------------------------                
Offset_0x022D7A:
                dc.w    Offset_0x022D98-Offset_0x022D7A
                dc.w    Offset_0x022D98-Offset_0x022D7A
                dc.w    Offset_0x022DAE-Offset_0x022D7A
                dc.w    Offset_0x022DD8-Offset_0x022D7A
                dc.w    Offset_0x022DEE-Offset_0x022D7A
                dc.w    Offset_0x022E04-Offset_0x022D7A
                dc.w    Offset_0x022E1A-Offset_0x022D7A
                dc.w    Offset_0x022E2C-Offset_0x022D7A
                dc.w    Offset_0x022E46-Offset_0x022D7A
                dc.w    Offset_0x022E60-Offset_0x022D7A
                dc.w    Offset_0x022E72-Offset_0x022D7A
                dc.w    Offset_0x022E84-Offset_0x022D7A
                dc.w    Offset_0x022E9E-Offset_0x022D7A
                dc.w    Offset_0x022EB4-Offset_0x022D7A
                dc.w    Offset_0x022EC2-Offset_0x022D7A
Offset_0x022D98:
                dc.w    $0014, $0790, $03B0, $0710, $03B0, $0710, $06B0, $0A90
                dc.w    $06B0, $0A90, $0670
Offset_0x022DAE:
                dc.w    $0028, $0790, $03F0, $0790, $04B0, $0A00, $04B0, $0C10
                dc.w    $04B0, $0C10, $0330, $0D90, $0330, $0D90, $01B0, $0F10
                dc.w    $01B0, $0F10, $02B0, $0F90, $02B0
Offset_0x022DD8:
                dc.w    $0014, $0AF0, $0630, $0E90, $0630, $0E90, $06B0, $0F90
                dc.w    $06B0, $0F90, $0670
Offset_0x022DEE:
                dc.w    $0014, $0F90, $02F0, $0F90, $04B0, $0F10, $04B0, $0F10
                dc.w    $0630, $0F90, $0630
Offset_0x022E04:
                dc.w    $0014, $1410, $0530, $1190, $0530, $1190, $06B0, $1410
                dc.w    $06B0, $1410, $0570
Offset_0x022E1A:
                dc.w    $0010, $1AF0, $0530, $1B90, $0530, $1B90, $0330, $1E10
                dc.w    $0330
Offset_0x022E2C:
                dc.w    $0018, $1A90, $0570, $1A90, $05B0, $1C10, $05B0, $1C10
                dc.w    $0430, $1E10, $0430, $1E10, $0370
Offset_0x022E46:
                dc.w    $0018, $2490, $0370, $2490, $03D0, $2390, $03D0, $2390
                dc.w    $05D0, $2510, $05D0, $2510, $0570
Offset_0x022E60:
                dc.w    $0010, $24F0, $0330, $2590, $0330, $2590, $0530, $2570
                dc.w    $0530
Offset_0x022E72:
                dc.w    $0010, $0310, $0330, $0290, $0330, $0290, $0230, $0490
                dc.w    $0230
Offset_0x022E84:
                dc.w    $0018, $0310, $0370, $0310, $03B0, $0410, $03B0, $0410
                dc.w    $02B0, $0490, $02B0, $0490, $0270
Offset_0x022E9E:
                dc.w    $0014, $0490, $06F0, $0490, $0730, $0690, $0730, $0890
                dc.w    $0730, $0890, $06F0
Offset_0x022EB4:
                dc.w    $000C, $0BF0, $0330, $0D90, $0330, $0D90, $02F0
Offset_0x022EC2:
                dc.w    $001C, $0D90, $02B0, $0C90, $02B0, $0C90, $00B0, $0E80
                dc.w    $00B0, $1110, $00B0, $1110, $0230, $10F0, $0230                       
;===============================================================================
; Objeto 0x1E - Atributo teletransportador dos tubos na Chemical Plant
; [ Término ]
;===============================================================================  