;===============================================================================
; Objeto 0x37 - Perdendo anéis após sofrer algum dano
; [ Início ]             
;===============================================================================    
Offset_0x01201C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01202A(PC, D0), D1
                jmp     Offset_0x01202A(PC, D1)
Offset_0x01202A:
                dc.w    Offset_0x012034-Offset_0x01202A
                dc.w    Offset_0x01211E-Offset_0x01202A
                dc.w    Offset_0x012180-Offset_0x01202A
                dc.w    Offset_0x012194-Offset_0x01202A
                dc.w    Offset_0x0121A2-Offset_0x01202A
Offset_0x012034:
                move.l  A0, A1
                moveq   #$00, D5
                move.w  ($FFFFFE20).w, D5
                tst.b   $003F(A0)
                beq.s   Offset_0x012046
                move.w  ($FFFFFED0).w, D5
Offset_0x012046:
                moveq   #$20, D0
                cmp.w   D0, D5
                bcs.s   Offset_0x01204E
                move.w  D0, D5
Offset_0x01204E:
                subq.w  #$01, D5
                move.w  #$0288, D4
                bra.s   Offset_0x01205E
Offset_0x012056:
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne     Offset_0x0120E8
Offset_0x01205E:
                move.b  #$37, $0000(A1) ; Carrega uma nova instância do objeto na memória
                addq.b  #$02, $0024(A1)
                move.b  #$08, $0016(A1)
                move.b  #$08, $0017(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  #Rings_Mappings, $0004(A1)             ; Offset_0x012328
                move.w  #$26BC, $0002(A1)
                bsr     Modify_A1_SpriteAttr_2P                ; Offset_0x016D16
                move.b  #$84, $0001(A1)
                move.b  #$03, $0018(A1)
                move.b  #$47, $0020(A1)
                move.b  #$08, $0019(A1)
                move.b  #$FF, ($FFFFFEA6).w
                tst.w   D4
                bmi.s   Offset_0x0120D8
                move.w  D4, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                move.w  D4, D2
                lsr.w   #$08, D2
                asl.w   D2, D0
                asl.w   D2, D1
                move.w  D0, D2
                move.w  D1, D3
                addi.b  #$10, D4
                bcc.s   Offset_0x0120D8
                subi.w  #$0080, D4
                bcc.s   Offset_0x0120D8
                move.w  #$0288, D4
Offset_0x0120D8:
                move.w  D2, $0010(A1)
                move.w  D3, $0012(A1)
                neg.w   D2
                neg.w   D4
                dbra    D5, Offset_0x012056
Offset_0x0120E8:
                move.w  #Ring_Lost_Sfx, D0       ; $00C6
                jsr     (Play_Sfx_Stereo)                      ; Offset_0x001332
                tst.b   $003F(A0)
                bne.s   Offset_0x01210C
                move.w  #$0000, ($FFFFFE20).w
                move.b  #$80, ($FFFFFE1D).w
                move.b  #$00, ($FFFFFE1B).w
                bra.s   Offset_0x01211E
Offset_0x01210C:
                move.w  #$0000, ($FFFFFED0).w
                move.b  #$80, ($FFFFFEC9).w
                move.b  #$00, ($FFFFFEC7).w
Offset_0x01211E:
                move.b  ($FFFFFEA7).w, $001A(A0)
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                bmi.s   Offset_0x01215E
                move.b  ($FFFFFE0F).w, D0
                add.b   D7, D0
                andi.b  #$07, D0
                bne.s   Offset_0x01215E
                tst.b   $0001(A0)
                bpl.s   Offset_0x012176
                jsr     (Ring_FindFloor)                       ; Offset_0x01EDE6
                tst.w   D1
                bpl.s   Offset_0x01215E
                add.w   D1, $000C(A0)
                move.w  $0012(A0), D0
                asr.w   #$02, D0
                sub.w   D0, $0012(A0)
                neg.w   $0012(A0)
Offset_0x01215E:
                tst.b   ($FFFFFEA6).w
                beq.s   Offset_0x0121A2
                move.w  ($FFFFEECE).w, D0
                addi.w  #$00E0, D0
                cmp.w   $000C(A0), D0
                bcs.s   Offset_0x0121A2
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012176:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                bne     Offset_0x0121A2
                bra.s   Offset_0x01215E
Offset_0x012180:
                addq.b  #$02, $0024(A0)
                move.b  #$00, $0020(A0)
                move.b  #$01, $0018(A0)
                bsr     Add_Rings                              ; Offset_0x011F66
Offset_0x012194:
                lea     (Rings_Animate_Data), A1               ; Offset_0x012320
                bsr     AnimateSprite                          ; Offset_0x0164CA
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0121A2:
                bra     DeleteObject                           ; Offset_0x01646C              
;===============================================================================
; Objeto 0x37 - Perdendo anéis após sofrer algum dano
; [ Término ]       
;===============================================================================  