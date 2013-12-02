;===============================================================================
; Objeto 0x49 - Cachoeiras na Emerald Hill
; [ Início ]
;===============================================================================  
Offset_0x020ACC:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020ADA(PC, D0), D1
                jmp     Offset_0x020ADA(PC, D1)
Offset_0x020ADA:
                dc.w    Offset_0x020ADE-Offset_0x020ADA
                dc.w    Offset_0x020B1A-Offset_0x020ADA
Offset_0x020ADE:
                addq.b  #$02, $0024(A0)
                move.l  #Waterfall_Mappings, $0004(A0)         ; Offset_0x020B84
                move.w  #$239E, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$20, $0019(A0)
                move.w  $0008(A0), $0030(A0)
                move.b  #$00, $0018(A0)
                move.b  #$80, $0016(A0)
                bset    #$04, $0001(A0)
Offset_0x020B1A:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                bne.s   Offset_0x020B34
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     J_DeleteObject                         ; Offset_0x0213F0
Offset_0x020B34:
                move.w  $0008(A0), D1
                move.w  D1, D2
                subi.w  #$0040, D1
                addi.w  #$0040, D2
                move.b  $0028(A0), D3
                move.b  #$00, $001A(A0)
                move.w  ($FFFFB008).w, D0
                cmp.w   D1, D0
                bcs.s   Offset_0x020B68
                cmp.w   D2, D0
                bcc.s   Offset_0x020B68
                move.b  #$01, $001A(A0)
                add.b   D3, $001A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x020B68:
                move.w  ($FFFFB048).w, D0
                cmp.w   D1, D0
                bcs.s   Offset_0x020B7A
                cmp.w   D2, D0
                bcc.s   Offset_0x020B7A
                move.b  #$01, $001A(A0)
Offset_0x020B7A:
                add.b   D3, $001A(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Waterfall_Mappings: ; Offset_0x020B84:
                dc.w    Offset_0x020B94-Waterfall_Mappings
                dc.w    Offset_0x020BA6-Waterfall_Mappings
                dc.w    Offset_0x020C38-Waterfall_Mappings
                dc.w    Offset_0x020C3A-Waterfall_Mappings
                dc.w    Offset_0x020C38-Waterfall_Mappings
                dc.w    Offset_0x020C5C-Waterfall_Mappings
                dc.w    Offset_0x020B94-Waterfall_Mappings
                dc.w    Offset_0x020CAE-Waterfall_Mappings
Offset_0x020B94:
                dc.w    $0002
                dc.l    $800D0000, $0000FFE0, $800D0000, $00000000
Offset_0x020BA6:
                dc.w    $0012
                dc.l    $800D0000, $0000FFE0, $800D0000, $00000000
                dc.l    $800F0008, $0004FFE0, $800F0008, $00040000
                dc.l    $A00F0008, $0004FFE0, $A00F0008, $00040000
                dc.l    $C00F0008, $0004FFE0, $C00F0008, $00040000
                dc.l    $E00F0008, $0004FFE0, $E00F0008, $00040000
                dc.l    $000F0008, $0004FFE0, $000F0008, $00040000
                dc.l    $200F0008, $0004FFE0, $200F0008, $00040000
                dc.l    $400F0008, $0004FFE0, $400F0008, $00040000
                dc.l    $600F0008, $0004FFE0, $600F0008, $00040000
Offset_0x020C38:
                dc.w    $0000
Offset_0x020C3A:
                dc.w    $0004
                dc.l    $E00F0008, $0004FFE0, $E00F0008, $00040000
                dc.l    $000F0008, $0004FFE0, $000F0008, $00040000
Offset_0x020C5C:
                dc.w    $000A
                dc.l    $C00F0008, $0004FFE0, $C00F0008, $00040000
                dc.l    $E00F0008, $0004FFE0, $E00F0008, $00040000
                dc.l    $000F0008, $0004FFE0, $000F0008, $00040000
                dc.l    $200F0008, $0004FFE0, $200F0008, $00040000
                dc.l    $400F0008, $0004FFE0, $400F0008, $00040000
Offset_0x020CAE:
                dc.w    $000E
                dc.l    $800D0000, $0000FFE0, $800D0000, $00000000
                dc.l    $800F0008, $0004FFE0, $800F0008, $00040000
                dc.l    $A00F0008, $0004FFE0, $A00F0008, $00040000
                dc.l    $C00F0008, $0004FFE0, $C00F0008, $00040000
                dc.l    $E00F0008, $0004FFE0, $E00F0008, $00040000
                dc.l    $000F0008, $0004FFE0, $000F0008, $00040000
                dc.l    $200F0008, $0004FFE0, $200F0008, $00040000
;===============================================================================
; Objeto 0x49 - Cachoeiras na Emerald Hill
; [ Término ]
;===============================================================================  