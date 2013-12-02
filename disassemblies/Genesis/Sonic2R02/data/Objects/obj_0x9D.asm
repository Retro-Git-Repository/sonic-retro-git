;===============================================================================
; Objeto 0x9D - Coconuts na Emerald Hill
; [ Início ]
;=============================================================================== 
Offset_0x0376CE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0376DC(PC, D0), D1
                jmp     Offset_0x0376DC(PC, D1)
Offset_0x0376DC:
                dc.w    Offset_0x0376E4-Offset_0x0376DC
                dc.w    Offset_0x0376F0-Offset_0x0376DC
                dc.w    Offset_0x037788-Offset_0x0376DC
                dc.w    Offset_0x0377B6-Offset_0x0376DC
Offset_0x0376E4:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$10, $002A(A0)
                rts
Offset_0x0376F0:
                bsr     Offset_0x0360FC
                bclr    #$00, $0001(A0)
                bclr    #$00, $0022(A0)
                tst.w   D0
                beq.s   Offset_0x037710
                bset    #$00, $0001(A0)
                bset    #$00, $0022(A0)
Offset_0x037710:
                addi.w  #$0060, D2
                cmpi.w  #$00C0, D2
                bcc.s   Offset_0x037724
                tst.b   $002E(A0)
                beq.s   Offset_0x03773E
                subq.b  #$01, $002E(A0)
Offset_0x037724:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x037730
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037730:
                addq.b  #$02, $0024(A0)
                bsr     Offset_0x03775C
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03773E:
                move.b  #$06, $0024(A0)
                move.b  #$01, $001A(A0)
                move.b  #$08, $002A(A0)
                move.b  #$20, $002E(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03775C:
                move.w  $002C(A0), D0
                cmpi.w  #$000C, D0
                bcs.s   Offset_0x037768
                moveq   #$00, D0
Offset_0x037768:
                lea     Offset_0x03777C(PC, D0), A1
                addq.w  #$02, D0
                move.w  D0, $002C(A0)
                move.b  (A1)+, $0012(A0)
                move.b  (A1)+, $002A(A0)
                rts
Offset_0x03777C:
                dc.b    $FF, $20, $01, $18, $FF, $10, $01, $28, $FF, $20, $01, $10
Offset_0x037788:
                subq.b  #$01, $002A(A0)
                beq.s   Offset_0x0377A6
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Coconuts_AnimateData), A1             ; Offset_0x037870
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0377A6:
                subq.b  #$02, $0024(A0)
                move.b  #$10, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0377B6:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0377CA(PC, D0), D1
                jsr     Offset_0x0377CA(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0377CA:
                dc.w    Offset_0x0377CE-Offset_0x0377CA
                dc.w    Offset_0x0377EA-Offset_0x0377CA
Offset_0x0377CE:
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0377D6
                rts
Offset_0x0377D6:
                addq.b  #$02, $0025(A0)
                move.b  #$08, $002A(A0)
                move.b  #$02, $001A(A0)
                bra     Offset_0x037806
Offset_0x0377EA:                
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0377F2
                rts
Offset_0x0377F2:
                clr.b   $0025(A0)
                move.b  #$04, $0024(A0)
                move.b  #$08, $002A(A0)
                bra     Offset_0x03775C
Offset_0x037806:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x03785C
                move.b  #$98, $0000(A1) ; Carrega o objeto 0x98 - Arma dos inimigos
                move.b  #$03, $001A(A1)
                move.b  #$20, $0028(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$FFF3, $000C(A1)
                moveq   #$00, D0
                btst    #$00, $0001(A0)
                bne.s   Offset_0x03783E
                moveq   #$04, D0
Offset_0x03783E:
                lea     Offset_0x03785E(PC, D0), A2
                move.w  (A2)+, D0
                add.w   D0, $0008(A1)
                move.w  (A2)+, $0010(A1)
                move.w  #$FF00, $0012(A1)
                lea     (Coconuts_Weapon), A2                  ; Offset_0x0371D8
                move.l  A2, $002A(A1)
Offset_0x03785C:
                rts
;-------------------------------------------------------------------------------                   
Offset_0x03785E:  
                dc.w    $FFF5, $0100, $000B, $FF00
;------------------------------------------------------------------------------- 
Obj_0x9D_Ptr: ; Offset_0x037866:
                dc.l    Coconuts_Mappings                      ; Offset_0x03787E
                dc.w    $03EE
                dc.b    $04, $05, $0C, $09   
;------------------------------------------------------------------------------- 
Coconuts_AnimateData: ; Offset_0x037870:
                dc.w    Offset_0x037874-Coconuts_AnimateData
                dc.w    Offset_0x037878-Coconuts_AnimateData
Offset_0x037874:
                dc.b    $05, $00, $01, $FF
Offset_0x037878:
                dc.b    $09, $01, $02, $01, $FF, $00
;-------------------------------------------------------------------------------
Coconuts_Mappings: ; Offset_0x03787E:
                dc.w    Offset_0x037886-Coconuts_Mappings
                dc.w    Offset_0x0378A8-Coconuts_Mappings
                dc.w    Offset_0x0378CA-Coconuts_Mappings
                dc.w    Offset_0x0378EC-Coconuts_Mappings
Offset_0x037886:
                dc.w    $0004
                dc.l    $0005001A, $000DFFFE, $F0090000, $0000FFFC
                dc.l    $000D0006, $0003FFF4, $1001000E, $0007000C
Offset_0x0378A8:
                dc.w    $0004
                dc.l    $0005001E, $000FFFFE, $F0090000, $0000FFFC
                dc.l    $000D0010, $0008FFF4, $10010018, $000C000C
Offset_0x0378CA:
                dc.w    $0004
                dc.l    $F8010022, $00110007, $F0090000, $0000FFFC
                dc.l    $000D0010, $0008FFF4, $10010018, $000C000C
Offset_0x0378EC:
                dc.w    $0002
                dc.l    $F8014024, $4012FFF8, $F8014824, $48120000                                                                           
;===============================================================================
; Objeto 0x0F - Coconuts na Emerald Hill
; [ Término ]
;===============================================================================  