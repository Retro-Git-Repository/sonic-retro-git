;===============================================================================
; Objeto 0x6C - Plataformas na Metropolis
; [ Início ]                                                                       
;=============================================================================== 
Offset_0x027DCE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x027DFA(PC, D0), D1
                jsr     Offset_0x027DFA(PC, D1)
                move.w  $0030(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x027DF4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x027DF4:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x027DFA:
                dc.w    Offset_0x027DFE-Offset_0x027DFA
                dc.w    Offset_0x027F0A-Offset_0x027DFA
Offset_0x027DFE:
                move.b  $0028(A0), D0
                bmi     Offset_0x027EB2
                addq.b  #$02, $0024(A0)
                move.l  #Mz_Moving_Platforms_Mappings, $0004(A0) ; Offset_0x028118
                move.w  #$63F9, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$00, $001A(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.w  D0, D1
                lsr.w   #$03, D0
                andi.w  #$001E, D0
                lea     Mz_Moving_Platforms_Move_Data(PC), A2  ; Offset_0x027FF8
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, $0038(A0)
                move.l  A2, $003C(A0)
                andi.w  #$000F, D1
                lsl.w   #$02, D1
                move.b  D1, $0038(A0)
                move.b  #$04, $003A(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x027E92
                neg.b   $003A(A0)
                moveq   #$00, D1
                move.b  $0038(A0), D1
                add.b   $003A(A0), D1
                cmp.b   $0039(A0), D1
                bcs.s   Offset_0x027E8E
                move.b  D1, D0
                moveq   #$00, D1
                tst.b   D0
                bpl.s   Offset_0x027E8E
                move.b  $0039(A0), D1
                subq.b  #$04, D1
Offset_0x027E8E:
                move.b  D1, $0038(A0)
Offset_0x027E92:
                move.w  $00(A2, D1), D0
                add.w   $0030(A0), D0
                move.w  D0, $0034(A0)
                move.w  $02(A2, D1), D0
                add.w   $0032(A0), D0
                move.w  D0, $0036(A0)
                bsr     Offset_0x027F80
                bra     Offset_0x027F0A
Offset_0x027EB2:
                andi.w  #$007F, D0
                add.w   D0, D0
                lea     (Mz_Moving_Platforms_Move_Data_01), A2 ; Offset_0x02807C
                adda.w  $00(A2, D0), A2
                move.w  (A2)+, D1
                move.l  A0, A1
                move.w  $0008(A0), D2
                move.w  $000C(A0), D3
                bra.s   Offset_0x027ED8
Offset_0x027ED0:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x027F02
Offset_0x027ED8:
                move.b  #$6C, $0000(A1)    ; Nova instância do objeto na memória
                move.w  (A2)+, D0
                add.w   D2, D0
                move.w  D0, $0008(A1)
                move.w  (A2)+, D0
                add.w   D3, D0
                move.w  D0, $000C(A1)
                move.w  D2, $0030(A1)
                move.w  D3, $0032(A1)
                move.w  (A2)+, D0
                move.b  D0, $0028(A1)
                move.b  $0022(A0), $0022(A1)
Offset_0x027F02:
                dbra    D1, Offset_0x027ED0
                addq.l  #$04, A7
                rts
Offset_0x027F0A:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x027F22
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$08, D3
                move.w  (A7)+, D4
                jmp     (Platform_Object)                      ; Offset_0x019BA0
Offset_0x027F22:
                move.w  $0008(A0), D0
                cmp.w   $0034(A0), D0
                bne.s   Offset_0x027F78
                move.w  $000C(A0), D0
                cmp.w   $0036(A0), D0
                bne.s   Offset_0x027F78
                moveq   #$00, D1
                move.b  $0038(A0), D1
                add.b   $003A(A0), D1
                cmp.b   $0039(A0), D1
                bcs.s   Offset_0x027F54
                move.b  D1, D0
                moveq   #$00, D1
                tst.b   D0
                bpl.s   Offset_0x027F54
                move.b  $0039(A0), D1
                subq.b  #$04, D1
Offset_0x027F54:
                move.b  D1, $0038(A0)
                move.l  $003C(A0), A1
                move.w  $00(A1, D1), D0
                add.w   $0030(A0), D0
                move.w  D0, $0034(A0)
                move.w  $02(A1, D1), D0
                add.w   $0032(A0), D0
                move.w  D0, $0036(A0)
                bsr     Offset_0x027F80
Offset_0x027F78:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                rts
Offset_0x027F80:
                moveq   #$00, D0
                move.w  #$FF00, D2
                move.w  $0008(A0), D0
                sub.w   $0034(A0), D0
                bcc.s   Offset_0x027F94
                neg.w   D0
                neg.w   D2
Offset_0x027F94:
                moveq   #$00, D1
                move.w  #$FF00, D3
                move.w  $000C(A0), D1
                sub.w   $0036(A0), D1
                bcc.s   Offset_0x027FA8
                neg.w   D1
                neg.w   D3
Offset_0x027FA8:
                cmp.w   D0, D1
                bcs.s   Offset_0x027FD2
                move.w  $0008(A0), D0
                sub.w   $0034(A0), D0
                beq.s   Offset_0x027FBE
                ext.l   D0
                asl.l   #$08, D0
                divs.w  D1, D0
                neg.w   D0
Offset_0x027FBE:
                move.w  D0, $0010(A0)
                move.w  D3, $0012(A0)
                swap.w  D0
                move.w  D0, $000A(A0)
                clr.w   $000E(A0)
                rts
Offset_0x027FD2:
                move.w  $000C(A0), D1
                sub.w   $0036(A0), D1
                beq.s   Offset_0x027FE4
                ext.l   D1
                asl.l   #$08, D1
                divs.w  D0, D1
                neg.w   D1
Offset_0x027FE4:
                move.w  D1, $0012(A0)
                move.w  D2, $0010(A0)
                swap.w  D1
                move.w  D1, $000E(A0)
                clr.w   $000A(A0)
                rts
;-------------------------------------------------------------------------------
Mz_Moving_Platforms_Move_Data: ; Offset_0x027FF8:
                dc.w    Offset_0x027FFE-Mz_Moving_Platforms_Move_Data
                dc.w    Offset_0x028028-Mz_Moving_Platforms_Move_Data
                dc.w    Offset_0x028052-Mz_Moving_Platforms_Move_Data
Offset_0x027FFE:
                dc.w    $0028
                dc.w    $0000, $0000, $FFEA, $000A, $FFE0, $0020, $FFE0, $00E0
                dc.w    $FFEA, $00F6, $0000, $0100, $0016, $00F6, $0020, $00E0
                dc.w    $0020, $0020, $0016, $000A
Offset_0x028028:
                dc.w    $0028
                dc.w    $0000, $0000, $FFEA, $000A, $FFE0, $0020, $FFE0, $0160
                dc.w    $FFEA, $0176, $0000, $0180, $0016, $0176, $0020, $0160
                dc.w    $0020, $0020, $0016, $000A
Offset_0x028052:
                dc.w    $0028
                dc.w    $0000, $0000, $FFEA, $000A, $FFE0, $0020, $FFE0, $01E0
                dc.w    $FFEA, $01F6, $0000, $0200, $0016, $01F6, $0020, $01E0
                dc.w    $0020, $0020, $0016, $000A
;-------------------------------------------------------------------------------
Mz_Moving_Platforms_Move_Data_01: ; Offset_0x02807C:
                dc.w    Offset_0x028082-Mz_Moving_Platforms_Move_Data_01
                dc.w    Offset_0x0280B4-Mz_Moving_Platforms_Move_Data_01
                dc.w    Offset_0x0280E6-Mz_Moving_Platforms_Move_Data_01
Offset_0x028082:
                dc.w    $0007
                dc.w    $0000, $0000, $0001
                dc.w    $FFE0, $003A, $0003
                dc.w    $FFE0, $0080, $0003
                dc.w    $FFE0, $00C6, $0003
                dc.w    $0000, $0100, $0006
                dc.w    $0020, $00C6, $0008
                dc.w    $0020, $0080, $0008
                dc.w    $0020, $003A, $0008
Offset_0x0280B4:
                dc.w    $0007
                dc.w    $0000, $0000, $0011
                dc.w    $FFE0, $005A, $0013
                dc.w    $FFE0, $00C0, $0013
                dc.w    $FFE0, $0126, $0013
                dc.w    $0000, $0180, $0016
                dc.w    $0020, $0126, $0018
                dc.w    $0020, $00C0, $0018
                dc.w    $0020, $005A, $0018
Offset_0x0280E6:
                dc.w    $0007
                dc.w    $0000, $0000, $0021
                dc.w    $FFE0, $007A, $0023
                dc.w    $FFE0, $0100, $0023
                dc.w    $FFE0, $0186, $0023
                dc.w    $0000, $0200, $0026
                dc.w    $0020, $0186, $0028
                dc.w    $0020, $0100, $0028  
                dc.w    $0020, $007A, $0028  
;-------------------------------------------------------------------------------                                
Mz_Moving_Platforms_Mappings: ; Offset_0x028118:
                dc.w    Offset_0x02811A-Mz_Moving_Platforms_Mappings
Offset_0x02811A:
                dc.w    $0002
                dc.l    $F8050000, $0000FFF0, $F8050800, $08000000                                                     
;===============================================================================
; Objeto 0x6C - Plataformas na Metropolis
; [ Término ]
;===============================================================================  