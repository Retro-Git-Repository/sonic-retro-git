;===============================================================================
; Objeto 0x64 - Pistões gigantes na Metropolis.
; [ Início ]
;===============================================================================  
Offset_0x02672E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02673C(PC, D0), D1
                jmp     Offset_0x02673C(PC, D1)
Offset_0x02673C:
                dc.w    Offset_0x026748-Offset_0x02673C
                dc.w    Offset_0x0267B2-Offset_0x02673C
Offset_0x026740:
                dc.b    $40, $0C, $40, $01, $10, $20, $40, $01
Offset_0x026748:
                addq.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                lsr.w   #$02, D0
                andi.w  #$001C, D0
                lea     Offset_0x026740(PC, D0), A3
                move.b  (A3)+, $0019(A0)
                move.b  (A3)+, $002E(A0)
                lsr.w   #$02, D0
                move.b  D0, $001A(A0)
                bne.s   Offset_0x026778
                move.b  #$6C, $0016(A0)
                bset    #$04, $0001(A0)
Offset_0x026778:
                move.l  #Pistons_Mappings, $0004(A0)           ; Offset_0x02686E
                move.w  #$2000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.w  $0008(A0), $0034(A0)
                move.w  $000C(A0), $0030(A0)
                moveq   #$00, D0
                move.b  (A3)+, D0
                move.w  D0, $003C(A0)
                andi.b  #$0F, $0028(A0)
Offset_0x0267B2:
                move.w  $0008(A0), -(A7)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                add.w   D0, D0
                move.w  Offset_0x026806(PC, D0), D1
                jsr     Offset_0x026806(PC, D1)
                move.w  (A7)+, D4
                tst.b   $0001(A0)
                bpl.s   Offset_0x0267E8
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $002E(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                jsr     (SolidObject)                          ; Offset_0x019686
Offset_0x0267E8:
                move.w  $0034(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi.s   Offset_0x026800
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x026800:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x026806:
                dc.w    Offset_0x02680A-Offset_0x026806
                dc.w    Offset_0x02680C-Offset_0x026806
Offset_0x02680A:
                rts
Offset_0x02680C:
                tst.b   $0038(A0)
                bne.s   Offset_0x026830
                tst.w   $003A(A0)
                beq.s   Offset_0x02681E
                subq.w  #$08, $003A(A0)
                bra.s   Offset_0x026850
Offset_0x02681E:
                subq.w  #$01, $0036(A0)
                bpl.s   Offset_0x026850
                move.w  #$005A, $0036(A0)
                move.b  #$01, $0038(A0)
Offset_0x026830:
                move.w  $003A(A0), D0
                cmp.w   $003C(A0), D0
                beq.s   Offset_0x026840
                addq.w  #$08, $003A(A0)
                bra.s   Offset_0x026850
Offset_0x026840:
                subq.w  #$01, $0036(A0)
                bpl.s   Offset_0x026850
                move.w  #$005A, $0036(A0)
                clr.b   $0038(A0)
Offset_0x026850:
                move.w  $003A(A0), D0
                btst    #$00, $0022(A0)
                beq.s   Offset_0x026862
                neg.w   D0
                addi.w  #$0040, D0
Offset_0x026862:
                move.w  $0030(A0), D1
                add.w   D0, D1
                move.w  D1, $000C(A0)
                rts
;-------------------------------------------------------------------------------                
Pistons_Mappings: ; Offset_0x02686E:
                dc.w    Offset_0x026872-Pistons_Mappings
                dc.w    Offset_0x0268C4-Pistons_Mappings
Offset_0x026872:
                dc.w    $000A
                dc.l    $F40E0001, $0000FFC0, $F40E0801, $0800FFE0
                dc.l    $F40E0001, $00000000, $F40E0801, $08000020
                dc.l    $0C07000D, $0006FFD8, $2C07000D, $0006FFD8
                dc.l    $4C07000D, $0006FFD8, $0C07000D, $00060018
                dc.l    $2C07000D, $00060018, $4C07000D, $00060018
Offset_0x0268C4:
                dc.w    $0004
                dc.l    $E0070057, $002BFFF0, $E0070857, $082B0000
                dc.l    $00071057, $102BFFF0, $00071857, $182B0000
;===============================================================================
; Objeto 0x64 - Pistões gigantes na Metropolis.
; [ Término ]
;===============================================================================  