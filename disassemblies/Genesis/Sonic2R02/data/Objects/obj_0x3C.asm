;===============================================================================
; Objeto 0x3C - Parede quebrável na Green Hill do Sonic 1 não usado (Left over)
; [ Início ]
;=============================================================================== 
Offset_0x015CCC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x015CDE(PC, D0), D1
                jsr     Offset_0x015CDE(PC, D1)
                bra     MarkObjGone                            ; Offset_0x016358
Offset_0x015CDE:
                dc.w    Offset_0x015CE4-Offset_0x015CDE
                dc.w    Offset_0x015D12-Offset_0x015CDE
                dc.w    Offset_0x015D88-Offset_0x015CDE
Offset_0x015CE4:
                addq.b  #$02, $0024(A0)
                move.l  #Obj_0x30_Mappings, $0004(A0)          ; Offset_0x015E52
                move.w  #$4590, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                move.b  $0028(A0), $001A(A0)
Offset_0x015D12:
                move.w  ($FFFFB010).w, $0030(A0)
                move.w  #$001B, D1
                move.w  #$0020, D2
                move.w  #$0020, D3
                move.w  $0008(A0), D4
                bsr     SolidObject                            ; Offset_0x019686
                btst    #$05, $0022(A0)
                bne.s   Offset_0x015D36
Offset_0x015D34:
                rts
Offset_0x015D36:
                lea     ($FFFFB000).w, A1
                cmpi.b  #$02, $001C(A1)
                bne.s   Offset_0x015D34
                move.w  $0030(A0), D0
                bpl.s   Offset_0x015D4A
                neg.w   D0
Offset_0x015D4A:
                cmpi.w  #$0480, D0
                bcs.s   Offset_0x015D34
                move.w  $0030(A0), $0010(A1)
                addq.w  #$04, $0008(A1)
                lea     (Obj_0x30_Data), A4                    ; Offset_0x015E12
                move.w  $0008(A0), D0
                cmp.w   $0008(A1), D0
                bcs.s   Offset_0x015D74
                subq.w  #$08, $0008(A1)
                lea     (Obj_0x30_Data_1), A4                  ; Offset_0x015E32
Offset_0x015D74:
                move.w  $0010(A1), $0014(A1)
                bclr    #$05, $0022(A0)
                bclr    #$05, $0022(A1)
                bsr.s   Smash_Object                           ; Offset_0x015D9E
Offset_0x015D88:
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0070, $0012(A0)
                tst.b   $0001(A0)
                bpl     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A                      
;===============================================================================
; Objeto 0x3C - Parede quebrável na Green Hill do Sonic 1 não usado (Left over)
; [ Término ]
;===============================================================================  