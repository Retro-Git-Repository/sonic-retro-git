;===============================================================================
; Objeto 0x21 - Resultados no Modo 2 jogadores ( 1P Win / 2P Win / Tied )
; [ Início ]
;===============================================================================    
Offset_0x00803E:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00804C(PC, D0), D1
                jmp     Offset_0x00804C(PC, D1)
Offset_0x00804C:
                dc.w    Offset_0x008064-Offset_0x00804C
                dc.w    Offset_0x0080AE-Offset_0x00804C
Offset_0x008050:
                dc.l    $00F00148, $00F00130, $00E00148, $00F00148
                dc.l    $00F00148
Offset_0x008064:
                addq.b  #$02, $0024(A0)
                move.w  ($FFFFFF10).w, D0
                add.w   D0, D0
                add.w   D0, D0
                move.l  Offset_0x008050(PC, D0), $0008(A0)
                move.l  #_2P_Versus_Results_Mappings, $0004(A0) ; Offset_0x0080C8
                move.w  #$0070, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$00, $0001(A0)
                move.b  #$00, $0018(A0)
                moveq   #$02, D1
                move.b  ($FFFFFF38).w, D0
                sub.b   ($FFFFFF39).w, D0
                beq.s   Offset_0x0080AA
                bcs.s   Offset_0x0080A8
                moveq   #$00, D1
                bra.s   Offset_0x0080AA
Offset_0x0080A8:
                moveq   #$01, D1
Offset_0x0080AA:
                move.b  D1, $001A(A0)
Offset_0x0080AE:
                andi.w  #$07FF, $0002(A0)
                btst    #$03, ($FFFFFE0F).w
                beq.s   Offset_0x0080C2
                ori.w   #$2000, $0002(A0)
Offset_0x0080C2:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
_2P_Versus_Results_Mappings: ; Offset_0x0080C8:
                dc.w    _1P_Wins_Mappings-_2P_Versus_Results_Mappings  ; Offset_0x0080CE
                dc.w    _2P_Wins_Mappings-_2P_Versus_Results_Mappings  ; Offset_0x0080E8
                dc.w    Tied_Mappings-_2P_Versus_Results_Mappings      ; Offset_0x00810A
_1P_Wins_Mappings: ; Offset_0x0080CE:
                dc.w    $0003
                dc.l    $F80D0000, $00000000, $F80D000C, $00060028
                dc.l    $F8090014, $000A0048
_2P_Wins_Mappings: ; Offset_0x0080E8:
                dc.w    $0004
                dc.l    $F8050008, $00040000, $F8050004, $00020010
                dc.l    $F80D000C, $00060028, $F8090014, $000A0048
Tied_Mappings: ; Offset_0x00810A:
                dc.w    $0002
                dc.l    $F80D001A, $000D0018, $F8050022, $00110038                                                             
;===============================================================================
; Objeto 0x21 - Resultados no Modo 2 jogadores ( 1P Win / 2P Win / Tied )
; [ Término ]
;===============================================================================  