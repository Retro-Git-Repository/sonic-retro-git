;===============================================================================
; Objeto 0x0B - Plataforma tipo armadilha na Chemical Plant
; [ Início ]
;===============================================================================    
Offset_0x01FFF2:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020000(PC, D0), D1
                jmp     Offset_0x020000(PC, D1)
Offset_0x020000:
                dc.w    Offset_0x020006-Offset_0x020000
                dc.w    Offset_0x02005C-Offset_0x020000
                dc.w    Offset_0x02006A-Offset_0x020000
Offset_0x020006:
                addq.b  #$02, $0024(A0)
                move.l  #Open_Close_Platform_Mappings, $0004(A0) ; Offset_0x0200FC
                move.w  #$E3B0, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$00F0, D0
                addi.w  #$0010, D0
                move.w  D0, D1
                subq.w  #$01, D0
                move.w  D0, $0030(A0)
                move.w  D0, $0032(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                addq.w  #$01, D0
                lsl.w   #$04, D0
                move.b  D0, $0036(A0)
Offset_0x02005C:
                move.b  ($FFFFFE0F).w, D0
                add.b   $0036(A0), D0
                bne.s   Offset_0x020094
                addq.b  #$02, $0024(A0)
Offset_0x02006A:
                subq.w  #$01, $0030(A0)
                bpl.s   Offset_0x020088
                move.w  #$007F, $0030(A0)
                tst.b   $001C(A0)
                beq.s   Offset_0x020082
                move.w  $0032(A0), $0030(A0)
Offset_0x020082:
                bchg    #00, $001C(A0)
Offset_0x020088:
                lea     (Open_Close_Platform_Animate_Data), A1 ; Offset_0x0200E8
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
Offset_0x020094:
                tst.b   $001A(A0)
                bne.s   Offset_0x0200B0
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$11, D3
                move.w  $0008(A0), D4
                bsr     Platform_Object                        ; Offset_0x019BA0
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0200B0:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                beq.s   Offset_0x0200E2
                bclr    #$03, $0022(A0)
                beq.s   Offset_0x0200CE
                bclr    #$03, ($FFFFB022).w
                bset    #$01, ($FFFFB022).w
Offset_0x0200CE:
                bclr    #$04, $0022(A0)
                beq.s   Offset_0x0200E2
                bclr    #$03, ($FFFFB062).w
                bset    #$01, ($FFFFB062).w
Offset_0x0200E2:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Open_Close_Platform_Animate_Data: ; Offset_0x0200E8:
                dc.w    Offset_0x0200EC-Open_Close_Platform_Animate_Data
                dc.w    Offset_0x0200F4-Open_Close_Platform_Animate_Data
Offset_0x0200EC:
                dc.b    $07, $00, $01, $02, $03, $04, $FE, $01
Offset_0x0200F4:
                dc.b    $07, $04, $03, $02, $01, $00, $FE, $01
;-------------------------------------------------------------------------------
Open_Close_Platform_Mappings: ; Offset_0x0200FC:
                dc.w    Offset_0x020106-Open_Close_Platform_Mappings
                dc.w    Offset_0x020118-Open_Close_Platform_Mappings
                dc.w    Offset_0x02012A-Open_Close_Platform_Mappings
                dc.w    Offset_0x02013C-Open_Close_Platform_Mappings
                dc.w    Offset_0x02014E-Open_Close_Platform_Mappings
Offset_0x020106:
                dc.w    $0002
                dc.l    $F00C0000, $0000FFF0, $F80E0024, $0012FFF0
Offset_0x020118:
                dc.w    $0002
                dc.l    $E80F0004, $0002FFF0, $F80E0024, $0012FFF0
Offset_0x02012A:
                dc.w    $0002
                dc.l    $F40F0014, $000AFFF0, $F80E0024, $0012FFF0
Offset_0x02013C:
                dc.w    $0002
                dc.l    $000F1004, $1002FFF0, $F80E0024, $0012FFF0
Offset_0x02014E:
                dc.w    $0002
                dc.l    $100C1000, $1000FFF0, $F80E0024, $0012FFF0
;===============================================================================
; Objeto 0x0B - Plataforma tipo armadilha na Chemical Plant
; [ Término ]
;===============================================================================  