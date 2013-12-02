;===============================================================================
; Objeto 0x75 - Bola de espinhos com corrente na Mystic Cave
; [ Início ]
;===============================================================================  
Offset_0x02891A:
                btst    #$06, $0001(A0)
                bne     Offset_0x028932
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02893C(PC, D0), D1
                jmp     Offset_0x02893C(PC, D1)
Offset_0x028932:
                move.w  #$0280, D0
                jmp     (DisplaySprite_Param)                  ; Offset_0x0164B6
Offset_0x02893C:
                dc.w    Offset_0x028942-Offset_0x02893C
                dc.w    Offset_0x028A22-Offset_0x02893C
                dc.w    Offset_0x028ACE-Offset_0x02893C
Offset_0x028942:
                addq.b  #$02, $0024(A0)
                move.l  #Spikeball_Chain_Mappings, $0004(A0)   ; Offset_0x028AF0
                move.w  #$2000, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$05, $0018(A0)
                move.b  #$10, $0019(A0)
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                move.b  $0028(A0), D1
                move.b  D1, D0
                andi.w  #$000F, D1
                andi.b  #$F0, D0
                ext.w   D0
                asl.w   #$03, D0
                move.w  D0, $0034(A0)
                move.b  $0022(A0), D0
                ror.b   #$02, D0
                andi.b  #$C0, D0
                move.b  D0, $0026(A0)
                cmpi.b  #$0F, D1
                bne.s   Offset_0x0289B4
                addq.b  #$02, $0024(A0)
                move.b  #$04, $0018(A0)
                move.b  #$02, $001A(A0)
                rts
Offset_0x0289B4:
                move.b  #$9A, $0020(A0)
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x028A22
                move.b  $0000(A0), $0000(A1) ; Nova instância do objeto na memória
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$04, $0001(A1)
                bset    #$06, $0001(A1)
                move.b  #$40, $000E(A1)
                move.w  $0008(A0), D2
                move.w  $000C(A0), D3
                move.b  D1, $000F(A1)
                subq.w  #$01, D1
                lea     $0010(A1), A2
Offset_0x0289F8:
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0001, (A2)+
                dbra    D1, Offset_0x0289F8
                move.w  D2, $0008(A1)
                move.w  D3, $000C(A1)
                move.b  #$00, $000B(A1)
                move.l  A1, $003C(A0)
                move.b  #$40, $0014(A1)
                bset    #$04, $0001(A1)
Offset_0x028A22:
                moveq   #$00, D0
                moveq   #$00, D1
                move.w  $0034(A0), D0
                add.w   D0, $0026(A0)
                move.b  $0026(A0), D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  $0032(A0), D2
                move.w  $0030(A0), D3
                moveq   #$00, D6
                move.l  $003C(A0), A1
                move.b  $000F(A1), D6
                subq.w  #$01, D6
                bcs.s   Offset_0x028A98
                swap.w  D0
                swap.w  D1
                asr.l   #$04, D0
                asr.l   #$04, D1
                moveq   #$00, D4
                moveq   #$00, D5
                lea     $0010(A1), A2
Offset_0x028A5E:
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
                dbra    D6, Offset_0x028A5E
                swap.w  D4
                swap.w  D5
                add.w   D2, D4
                add.w   D3, D5
                move.w  D5, $0008(A0)
                move.w  D4, $000C(A0)
                move.w  $0028(A1), $0008(A1)
                move.w  $002A(A1), $000C(A1)
Offset_0x028A98:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x028AA4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x028AA4:
                move.w  $0030(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x028ABE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x028ABE:
                move.l  $003C(A0), A1
                jsr     (Delete_A1_Object)                     ; Offset_0x01646E
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x028ACE:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                move.w  #$0010, D2
                move.w  #$0011, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Spikeball_Chain_Mappings: ; Offset_0x028AF0:
                dc.w    Offset_0x028AF6-Spikeball_Chain_Mappings
                dc.w    Offset_0x028B08-Spikeball_Chain_Mappings
                dc.w    Offset_0x028B12-Spikeball_Chain_Mappings
Offset_0x028AF6:
                dc.w    $0002
                dc.l    $F00D007A, $003DFFF0, $000D187A, $183DFFF0
Offset_0x028B08:
                dc.w    $0001
                dc.l    $F8054066, $4033FFF8
Offset_0x028B12:
                dc.w    $0002
                dc.l    $F0074040, $4020FFF0, $F0074840, $48200000
;===============================================================================
; Objeto 0x75 - Bola de espinhos com corrente na Mystic Cave
; [ Término ]
;===============================================================================  