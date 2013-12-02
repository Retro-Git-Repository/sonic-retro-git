;===============================================================================
; Objeto 0x17 - Desconhecido
; [ Início ]
;===============================================================================  
Offset_0x0102DA:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0102E8(PC, D0), D1
                jmp     Offset_0x0102E8(PC, D1)
Offset_0x0102E8:
                dc.w    Offset_0x0102EE-Offset_0x0102E8
                dc.w    Offset_0x0103B2-Offset_0x0102E8
                dc.w    Offset_0x010414-Offset_0x0102E8
Offset_0x0102EE:
                addq.b  #$02, $0024(A0)
                move.l  #Obj_0x17_Mappings, $0004(A0)          ; Offset_0x01041C
                move.w  #$4398, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$08, $0019(A0)
                move.w  $000C(A0), D2
                move.w  $0008(A0), D3
                move.b  $0000(A0), D4
                lea     $0028(A0), A2
                moveq   #$00, D1
                move.b  (A2), D1
                move.b  #$00, (A2)+
                move.w  D1, D0
                lsr.w   #$01, D0
                lsl.w   #$04, D0
                sub.w   D0, D3
                subq.b  #$02, D1
                bcs.s   Offset_0x0103B2
                moveq   #$00, D6
Offset_0x01033C:
                bsr     SingleObjectLoad_2                     ; Offset_0x017F68
                bne.s   Offset_0x0103B2
                addq.b  #$01, $0028(A0)
                move.w  A1, D5
                subi.w  #$B000, D5
                lsr.w   #$06, D5
                andi.w  #$007F, D5
                move.b  D5, (A2)+
                move.b  #$04, $0024(A1)
                move.b  D4, $0000(A1)
                move.w  D2, $000C(A1)
                move.w  D3, $0008(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  #$4398, $0002(A1)
                bsr     Modify_A1_SpriteAttr_2P                ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$08, $0019(A1)
                move.b  D6, $003E(A1)
                addq.b  #$01, D6
                andi.b  #$07, D6
                addi.w  #$0010, D3
                cmp.w   $0008(A0), D3
                bne.s   Offset_0x0103AE
                move.b  D6, $003E(A0)
                addq.b  #$01, D6
                andi.b  #$07, D6
                addi.w  #$0010, D3
                addq.b  #$01, $0028(A0)
Offset_0x0103AE:
                dbra    D1, Offset_0x01033C
Offset_0x0103B2:
                bsr     Offset_0x0103F4
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x0103CE
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0103CE:
                moveq   #$00, D2
                lea     $0028(A0), A2
                move.b  (A2)+, D2
                subq.b  #$02, D2
                bcs.s   Offset_0x0103F0
Offset_0x0103DA:
                moveq   #$00, D0
                move.b  (A2)+, D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A1
                bsr     Delete_A1_Object                       ; Offset_0x01646E
                dbra    D2, Offset_0x0103DA
Offset_0x0103F0:
                bra     DeleteObject                           ; Offset_0x01646C
Offset_0x0103F4:
                move.b  ($FFFFFEA1).w, D0
                move.b  #$00, $0020(A0)
                add.b   $003E(A0), D0
                andi.b  #$07, D0
                move.b  D0, $001A(A0)
                bne.s   Offset_0x010412
                move.b  #$84, $0020(A0)
Offset_0x010412:
                rts
Offset_0x010414:
                bsr     Offset_0x0103F4
                bra     DisplaySprite                          ; Offset_0x01647A
;-------------------------------------------------------------------------------
Obj_0x17_Mappings: ; Offset_0x01041C:
                dc.w    Offset_0x01042C-Obj_0x17_Mappings
                dc.w    Offset_0x010436-Obj_0x17_Mappings
                dc.w    Offset_0x010440-Obj_0x17_Mappings
                dc.w    Offset_0x01044A-Obj_0x17_Mappings
                dc.w    Offset_0x010454-Obj_0x17_Mappings
                dc.w    Offset_0x01045E-Obj_0x17_Mappings
                dc.w    Offset_0x010472-Obj_0x17_Mappings
                dc.w    Offset_0x010468-Obj_0x17_Mappings
Offset_0x01042C:
                dc.w    $0001
                dc.l    $F0010000, $0000FFFC
Offset_0x010436:
                dc.w    $0001
                dc.l    $F5050002, $0001FFF8
Offset_0x010440:
                dc.w    $0001
                dc.l    $F8050006, $0003FFF8
Offset_0x01044A:
                dc.w    $0001
                dc.l    $FB05000A, $0005FFF8
Offset_0x010454:
                dc.w    $0001
                dc.l    $0001000E, $0007FFFC
Offset_0x01045E:
                dc.w    $0001
                dc.l    $04000010, $0008FFFD
Offset_0x010468:
                dc.w    $0001
                dc.l    $F4000011, $0008FFFD
Offset_0x010472:
                dc.w    $0000
;===============================================================================
; Objeto 0x17 - Desconhecido
; [ Término ]
;===============================================================================  