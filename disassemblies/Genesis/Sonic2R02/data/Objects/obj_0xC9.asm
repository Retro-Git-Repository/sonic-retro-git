;===============================================================================
; Objeto 0xC9 - Manipulador das mudanças de paleta da tela título
; [ Início ]
;===============================================================================    
Offset_0x01328E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01329C(PC, D0), D1
                jmp     Offset_0x01329C(PC, D1)
Offset_0x01329C:
                dc.w    Offset_0x0132A0-Offset_0x01329C
                dc.w    Offset_0x0132E2-Offset_0x01329C
Offset_0x0132A0:
                addq.b  #$02, $0024(A0)                
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lea     (Offset_0x01331A), A1
                adda.w  $00(A1, D0), A1
                move.l  (A1)+, $003A(A0)
                move.l  (A1)+, A2
                move.b  (A1)+, D0
                move.w  D0, $0034(A0)
                lea     ($FFFFFB80).w, A3
                adda.w  D0, A3
                move.b  (A1)+, D0
                move.w  D0, $0036(A0)
Offset_0x0132CC:                
                move.w  (A2)+, (A3)+
                dbra    D0, Offset_0x0132CC
                move.b  (A1)+, D0
                move.b  D0, $0030(A0)
                move.b  D0, $0031(A0)
                move.b  (A1)+, $0032(A0)
                rts
Offset_0x0132E2:
                subq.b  #$01, $0030(A0)
                bpl.s   Offset_0x013318
                move.b  $0031(A0), $0030(A0)
                subq.b  #$01, $0032(A0)
                bmi     DeleteObject                           ; Offset_0x01646C
                move.l  $003A(A0), A2
                move.l  A0, A3
                move.w  $0036(A0), D0
                move.w  $0034(A0), D1
                lea     ($FFFFFB00).w, A0
                adda.w  D1, A0
                lea     ($FFFFFB80).w, A1
                adda.w  D1, A1
Offset_0x013310:                
                jsr     (A2)
                dbra    D0, Offset_0x013310
                move.l  A3, A0
Offset_0x013318:
                rts    
;-------------------------------------------------------------------------------                
Offset_0x01331A:                                          
                dc.w    Offset_0x01332A-Offset_0x01331A
                dc.w    Offset_0x013336-Offset_0x01331A
                dc.w    Offset_0x013342-Offset_0x01331A
                dc.w    Offset_0x01334E-Offset_0x01331A
                dc.w    Offset_0x01335A-Offset_0x01331A
                dc.w    Offset_0x013366-Offset_0x01331A
                dc.w    Offset_0x013372-Offset_0x01331A
                dc.w    Offset_0x01337E-Offset_0x01331A
Offset_0x01332A:
                dc.l    Pal_AddColor                           ; Offset_0x0023FA
                dc.l    Offset_0x0133CA
                dc.b    $60, $0F, $02, $15
Offset_0x013336:
                dc.l    Offset_0x0133EA
                dc.l    Offset_0x0133AA
                dc.b    $40, $0F, $04, $07
Offset_0x013342:
                dc.l    Offset_0x0133EA
                dc.l    Offset_0x00AD1A
                dc.b    $00, $0F, $08, $07
Offset_0x01334E:
                dc.l    Offset_0x013428
                dc.l    Offset_0x00AD1A
                dc.b    $00, $0F, $08, $07
Offset_0x01335A:
                dc.l    Offset_0x0133EA
                dc.l    Offset_0x00AC7A
                dc.b    $00, $1F, $04, $07
Offset_0x013366:
                dc.l    Offset_0x0133EA
                dc.l    Offset_0x00ACDA
                dc.b    $40, $1F, $04, $07
Offset_0x013372:
                dc.l    Offset_0x0133EA
                dc.l    Offset_0x00AD3A
                dc.b    $00, $0F, $04, $07
Offset_0x01337E:
                dc.l    Offset_0x0133EA
                dc.l    Offset_0x00AC9A
                dc.b    $00, $1F, $04, $07                                         
;===============================================================================
; Objeto 0xC9 - Manipulador das mudanças de paleta da tela título
; [ Término ]
;===============================================================================  