;=============================================================================== 
; Objeto 0x77 - Ponte que abre ao puxar as raizes na Mystic Cave
; [ Início ]                         
;===============================================================================  
Offset_0x029CD4:
                btst    #$06, $0001(A0)
                bne     Offset_0x029CEC
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x029CF6(PC, D0), D1
                jmp     Offset_0x029CF6(PC, D1)
Offset_0x029CEC:
                move.w  #$0280, D0
                jmp     (DisplaySprite_Param)                  ; Offset_0x0164B6
Offset_0x029CF6:
                dc.w    Offset_0x029CFC-Offset_0x029CF6
                dc.w    Offset_0x029DD8-Offset_0x029CF6
                dc.w    Offset_0x029E64-Offset_0x029CF6
Offset_0x029CFC:
                addq.b  #$02, $0024(A0)
                move.l  #Vertical_Bridge_Mappings, $0004(A0)   ; Offset_0x029F34 
                move.w  #$643C, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$05, $0018(A0)
                move.b  #$08, $0019(A0)
                ori.b   #$80, $0022(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                subi.w  #$0048, $000C(A0)
                move.b  #$C0, $0026(A0)
                moveq   #$FFFFFFF0, D4
                btst    #$01, $0022(A0)
                beq.s   Offset_0x029D5C
                addi.w  #$0090, $000C(A0)
                move.b  #$40, $0026(A0)
                neg.w   D4
Offset_0x029D5C:
                move.w  #$0100, D1
                btst    #$00, $0022(A0)
                beq.s   Offset_0x029D6A
                neg.w   D1
Offset_0x029D6A:
                move.w  D1, $0034(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x029DD8
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                bset    #$06, $0001(A1)
                move.b  #$40, $000E(A1)
                move.w  $0030(A0), D2
                move.w  $0032(A0), D3
                moveq   #$08, D1
                move.b  D1, $000F(A1)
                subq.w  #$01, D1
                lea     $0010(A1), A2
Offset_0x029DAE:
                add.w   D4, D3
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0001, (A2)+
                dbra    D1, Offset_0x029DAE
                move.w  $0028(A1), $0008(A1)
                move.w  $002A(A1), $000C(A1)
                move.l  A1, $003C(A0)
                move.b  #$40, $0014(A1)
                bset    #$04, $0001(A1)
Offset_0x029DD8:
                lea     ($FFFFF7E0).w, A2
                moveq   #$00, D0
                move.b  $0028(A0), D0
                btst    #$00, $00(A2, D0)
                beq.s   Offset_0x029E14
                tst.b   $0036(A0)
                bne.s   Offset_0x029E14
                move.b  #$01, $0036(A0)
                move.w  #$00E7, D0
                jsr     (Play_Sfx_Stereo)                      ; Offset_0x001332
                cmpi.b  #$81, $0022(A0)
                bne.s   Offset_0x029E14
                move.w  $0030(A0), $0008(A0)
                subi.w  #$0048, $0008(A0)
Offset_0x029E14:
                tst.b   $0036(A0)
                beq.s   Offset_0x029E62
                move.w  #$0048, D1
                tst.b   $0026(A0)
                beq.s   Offset_0x029E2E
                cmpi.b  #$80, $0026(A0)
                bne.s   Offset_0x029E5A
                neg.w   D1
Offset_0x029E2E:
                move.w  $0032(A0), $000C(A0)
                move.w  $0030(A0), $0008(A0)
                add.w   D1, $0008(A0)
                move.b  #$40, $0019(A0)
                move.b  #$00, $0036(A0)
                move.w  #$00E9, D0
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                addq.b  #$02, $0024(A0)
                bra.s   Offset_0x029E62
Offset_0x029E5A:
                move.w  $0034(A0), D0
                add.w   D0, $0026(A0)
Offset_0x029E62:
                bsr.s   Offset_0x029ECE
Offset_0x029E64:
                move.w  #$0013, D1
                move.w  #$0040, D2
                move.w  #$0041, D3
                move.b  $0026(A0), D0
                beq.s   Offset_0x029E82
                cmpi.b  #$40, D0
                beq.s   Offset_0x029E8E
                cmpi.b  #$C0, D0
                bcc.s   Offset_0x029E8E
Offset_0x029E82:
                move.w  #$004B, D1
                move.w  #$0008, D2
                move.w  #$0009, D3
Offset_0x029E8E:
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x029EA4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x029EA4:
                move.w  $0030(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x029EBE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x029EBE:
                move.l  $003C(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x029ECE:
                tst.b   $0036(A0)
                beq.s   Offset_0x029F32
                moveq   #$00, D0
                moveq   #$00, D1
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  $0032(A0), D2
                move.w  $0030(A0), D3
                moveq   #$00, D6
                move.l  $003C(A0), A1
                move.b  $000F(A1), D6
                subq.w  #$01, D6
                bcs.s   Offset_0x029F32
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                move.l  D0, D4
                move.l  D1, D5
                lea     $0010(A1), A2
Offset_0x029F08:
                movem.l D4/D5, -(A7)
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, (A2)+
                move.w  D4, (A2)+
                movem.l (A7)+, D4/D5
                add.l   D0, D4
                add.l   D1, D5
                addq.w  #$02, A2
                dbra    D6, Offset_0x029F08
                move.w  $0028(A1), $0008(A1)
                move.w  $002A(A1), $000C(A1)
Offset_0x029F32:
                rts
;-------------------------------------------------------------------------------
Vertical_Bridge_Mappings: ; Offset_0x029F34:
                dc.w    Offset_0x029F38-Vertical_Bridge_Mappings
                dc.w    Offset_0x029F3A-Vertical_Bridge_Mappings
Offset_0x029F38:
                dc.w    $0000
Offset_0x029F3A:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8
;=============================================================================== 
; Objeto 0x77 - Ponte que abre ao puxar as raizes na Mystic Cave
; [ Término ]                         
;===============================================================================   