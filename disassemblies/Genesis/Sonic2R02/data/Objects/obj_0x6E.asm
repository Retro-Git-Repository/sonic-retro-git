;===============================================================================
; Objeto 0x6E - Máquina na Metropolis
; [ Início ]
;===============================================================================   
Offset_0x02812C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02813A(PC, D0), D1
                jmp     Offset_0x02813A(PC, D1)
Offset_0x02813A:
                dc.w    Offset_0x028148-Offset_0x02813A
                dc.w    Offset_0x0281B6-Offset_0x02813A
                dc.w    Offset_0x028242-Offset_0x02813A
Offset_0x028140:
                dc.b    $10, $0C, $28, $08, $60, $18, $0C, $0C
Offset_0x028148:
                addq.b  #$02, $0024(A0)
                move.l  #Machine_Mappings, $0004(A0)           ; Offset_0x0282B2
                move.w  #$6000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                lea     Offset_0x028140(PC, D0), A3
                move.b  (A3)+, $0019(A0)
                move.b  (A3)+, $0016(A0)
                lsr.w   #$01, D0
                move.b  D0, $001A(A0)
                move.w  $0008(A0), $0034(A0)
                move.w  $000C(A0), $0030(A0)
                cmpi.b  #$03, D0
                bne.s   Offset_0x0281B6
                addq.b  #$02, $0024(A0)
                move.w  #$63F0, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$05, $0018(A0)
                bra     Offset_0x028242
Offset_0x0281B6:
                move.w  $0008(A0), -(A7)
                move.b  ($FFFFFE80).w, D1
                subi.b  #$38, D1
                ext.w   D1
                move.b  ($FFFFFE84).w, D2
                subi.b  #$38, D2
                ext.w   D2
                btst    #$00, $0028(A0)
                beq.s   Offset_0x0281DA
                neg.w   D1
                neg.w   D2
Offset_0x0281DA:
                btst    #$01, $0028(A0)
                beq.s   Offset_0x0281E6
                neg.w   D1
                exg.l   D2, D1
Offset_0x0281E6:
                add.w   $0034(A0), D1
                move.w  D1, $0008(A0)
                add.w   $0030(A0), D2
                move.w  D2, $000C(A0)
                move.w  (A7)+, D4
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
                move.w  $0034(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x02822A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02822A:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x02823C
                bclr    #$07, $02(A2, D0)
Offset_0x02823C:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x028242:
                move.b  ($FFFFFE80).w, D1
                lsr.b   #$01, D1
                subi.b  #$1C, D1
                ext.w   D1
                move.b  ($FFFFFE84).w, D2
                lsr.b   #$01, D2
                subi.b  #$1C, D2
                ext.w   D2
                btst    #$00, $0028(A0)
                beq.s   Offset_0x028266
                neg.w   D1
                neg.w   D2
Offset_0x028266:
                btst    #$01, $0028(A0)
                beq.s   Offset_0x028272
                neg.w   D1
                exg.l   D2, D1
Offset_0x028272:
                add.w   $0034(A0), D1
                move.w  D1, $0008(A0)
                add.w   $0030(A0), D2
                move.w  D2, $000C(A0)
                move.w  $0034(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x02829A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02829A:
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x0282AC
                bclr    #$07, $02(A2, D0)
Offset_0x0282AC:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;-------------------------------------------------------------------------------
Machine_Mappings: ; Offset_0x0282B2:
                dc.w    Offset_0x0282BA-Machine_Mappings
                dc.w    Offset_0x0282C4-Machine_Mappings
                dc.w    Offset_0x0282DE-Machine_Mappings
                dc.w    Offset_0x028330-Machine_Mappings
Offset_0x0282BA:
                dc.w    $0001
                dc.l    $F40E0025, $0012FFF0
Offset_0x0282C4:
                dc.w    $0003
                dc.l    $F80D0031, $0018FFD8, $F80D0031, $0018FFF8
                dc.l    $F8050031, $00180018
Offset_0x0282DE:
                dc.w    $000A
                dc.l    $E80E0039, $001CFFA0, $E80E0839, $081CFFC0
                dc.l    $E80E0039, $001CFFE0, $E80E0839, $081C0000
                dc.l    $E80E0039, $001C0020, $E80E0839, $081C0040
                dc.l    $00060045, $0022FFA0, $00060845, $0822FFB0
                dc.l    $00060045, $00220040, $00060845, $08220050
Offset_0x028330:
                dc.w    $0001
                dc.l    $F40A0000, $0000FFF4
;===============================================================================
; Objeto 0x6E - Máquina na Metropolis
; [ Término ]
;===============================================================================  