;===============================================================================
; Objeto 0x41 - Molas amarelas / vermelhas - diagonal / horizontal / vertical 
; [ Início ]
;===============================================================================
Offset_0x0187F6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01880A(PC, D0), D1
                jsr     Offset_0x01880A(PC, D1)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x01880A:
                dc.w    Offset_0x018816-Offset_0x01880A
                dc.w    Offset_0x0188EE-Offset_0x01880A
                dc.w    Offset_0x0189DE-Offset_0x01880A
                dc.w    Offset_0x018BEE-Offset_0x01880A
                dc.w    Offset_0x018CD8-Offset_0x01880A
                dc.w    Offset_0x018E0C-Offset_0x01880A
Offset_0x018816:
                addq.b  #$02, $0024(A0)
                move.l  #Springs_Mappings, $0004(A0)           ; Offset_0x018F8C
                move.w  #$045C, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                move.b  $0028(A0), D0
                lsr.w   #$03, D0
                andi.w  #$000E, D0
                move.w  Offset_0x01884C(PC, D0), D0
                jmp     Offset_0x01884C(PC, D0)
Offset_0x01884C:
                dc.w    Offset_0x0188C2-Offset_0x01884C
                dc.w    Offset_0x018856-Offset_0x01884C
                dc.w    Offset_0x018876-Offset_0x01884C
                dc.w    Offset_0x01888A-Offset_0x01884C
                dc.w    Offset_0x0188A4-Offset_0x01884C
Offset_0x018856:
                move.b  #$04, $0024(A0)
                move.b  #$02, $001C(A0)
                move.b  #$03, $001A(A0)
                move.w  #$0470, $0002(A0)
                move.b  #$08, $0019(A0)
                bra.s   Offset_0x0188C2
Offset_0x018876:
                move.b  #$06, $0024(A0)
                move.b  #$06, $001A(A0)
                bset    #$01, $0022(A0)
                bra.s   Offset_0x0188C2
Offset_0x01888A:
                move.b  #$08, $0024(A0)
                move.b  #$04, $001C(A0)
                move.b  #$07, $001A(A0)
                move.w  #$043C, $0002(A0)
                bra.s   Offset_0x0188C2
Offset_0x0188A4:
                move.b  #$0A, $0024(A0)
                move.b  #$04, $001C(A0)
                move.b  #$0A, $001A(A0)
                move.w  #$043C, $0002(A0)
                bset    #$01, $0022(A0)
Offset_0x0188C2:
                move.b  $0028(A0), D0
                andi.w  #$0002, D0
                move.w  Offset_0x0188EA(PC, D0), $0030(A0)
                btst    #$01, D0
                beq.s   Offset_0x0188E4
                bset    #$05, $0002(A0)
                move.l  #Springs_Mappings_01, $0004(A0)        ; Offset_0x018FA2
Offset_0x0188E4:
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                rts
;-------------------------------------------------------------------------------                  
Offset_0x0188EA:
                dc.w    $F000, $F600
;-------------------------------------------------------------------------------                  
Offset_0x0188EE:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0010, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_2_A1                       ; Offset_0x0196FC
                btst    #$03, $0022(A0)
                beq.s   Offset_0x018916
                bsr.s   Offset_0x018938
Offset_0x018916:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                bsr     SolidObject_2_A1                       ; Offset_0x0196FC
                btst    #$04, $0022(A0)
                beq.s   Offset_0x01892E
                bsr.s   Offset_0x018938
Offset_0x01892E:
                lea     (Springs_Animate_Data), A1             ; Offset_0x018F50
                bra     AnimateSprite                          ; Offset_0x0164CA
Offset_0x018938:
                move.w  #$0100, $001C(A0)
                addq.w  #$08, $000C(A1)
                move.w  $0030(A0), $0012(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$10, $001C(A1)
                move.b  #$02, $0024(A1)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x01896C
                move.w  #$0000, $0010(A1)
Offset_0x01896C:
                btst    #$00, D0
                beq.s   Offset_0x0189AC
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$00, $002C(A1)
                move.b  #$04, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x01899C
                move.b  #$01, $002C(A1)
Offset_0x01899C:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x0189AC
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x0189AC:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x0189C2
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x0189C2:
                cmpi.b  #$08, D0
                bne.s   Offset_0x0189D4
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x0189D4:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x0189DE:
                move.w  #$0013, D1
                move.w  #$000E, D2
                move.w  #$000F, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_2_A1                       ; Offset_0x0196FC
                btst    #$05, $0022(A0)
                beq.s   Offset_0x018A1E
                move.b  $0022(A0), D1
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcs.s   Offset_0x018A16
                eori.b  #$01, D1
Offset_0x018A16:
                andi.b  #$01, D1
                bne.s   Offset_0x018A1E
                bsr.s   Offset_0x018A5C
Offset_0x018A1E:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                bsr     SolidObject_2_A1                       ; Offset_0x0196FC
                btst    #$06, $0022(A0)
                beq.s   Offset_0x018A4E
                move.b  $0022(A0), D1
                move.w  $0008(A0), D0
                sub.w   $0008(A1), D0
                bcs.s   Offset_0x018A46
                eori.b  #$01, D1
Offset_0x018A46:
                andi.b  #$01, D1
                bne.s   Offset_0x018A4E
                bsr.s   Offset_0x018A5C
Offset_0x018A4E:
                bsr     Offset_0x018B34
                lea     (Springs_Animate_Data), A1             ; Offset_0x018F50
                bra     AnimateSprite                          ; Offset_0x0164CA
Offset_0x018A5C:
                move.w  #$0300, $001C(A0)
                move.w  $0030(A0), $0010(A1)
                addq.w  #$08, $0008(A1)
                bset    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x018A8A
                bclr    #$00, $0022(A1)
                subi.w  #$0010, $0008(A1)
                neg.w   $0010(A1)
Offset_0x018A8A:
                move.w  #$000F, $002E(A1)
                move.w  $0010(A1), $0014(A1)
                btst    #$02, $0022(A1)
                bne.s   Offset_0x018AA4
                move.b  #$00, $001C(A1)
Offset_0x018AA4:
                move.b  $0028(A0), D0
                bpl.s   Offset_0x018AB0
                move.w  #$0000, $0012(A1)
Offset_0x018AB0:
                btst    #$00, D0
                beq.s   Offset_0x018AF0
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$01, $002C(A1)
                move.b  #$08, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x018AE0
                move.b  #$03, $002C(A1)
Offset_0x018AE0:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x018AF0
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x018AF0:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x018B06
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x018B06:
                cmpi.b  #$08, D0
                bne.s   Offset_0x018B18
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x018B18:
                bclr    #$05, $0022(A0)
                bclr    #$06, $0022(A0)
                bclr    #$05, $0022(A1)
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x018B34:
                cmpi.b  #$03, $001C(A0)
                beq     Offset_0x018BEC
                move.w  $0008(A0), D0
                move.w  D0, D1
                addi.w  #$0028, D1
                btst    #$00, $0022(A0)
                beq.s   Offset_0x018B56
                move.w  D0, D1
                subi.w  #$0028, D0
Offset_0x018B56:
                move.w  $000C(A0), D2
                move.w  D2, D3
                subi.w  #$0018, D2
                addi.w  #$0018, D3
                lea     ($FFFFB000).w, A1
                btst    #$01, $0022(A1)
                bne.s   Offset_0x018BAA
                move.w  $0014(A1), D4
                btst    #$00, $0022(A0)
                beq.s   Offset_0x018B7E
                neg.w   D4
Offset_0x018B7E:
                tst.w   D4
                bmi.s   Offset_0x018BAA
                move.w  $0008(A1), D4
                cmp.w   D0, D4
                bcs     Offset_0x018BAA
                cmp.w   D1, D4
                bcc     Offset_0x018BAA
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs     Offset_0x018BAA
                cmp.w   D3, D4
                bcc     Offset_0x018BAA
                move.w  D0, -(A7)
                bsr     Offset_0x018A5C
                move.w  (A7)+, D0
Offset_0x018BAA:
                lea     ($FFFFB040).w, A1
                btst    #$01, $0022(A1)
                bne.s   Offset_0x018BEC
                move.w  $0014(A1), D4
                btst    #$00, $0022(A0)
                beq.s   Offset_0x018BC4
                neg.w   D4
Offset_0x018BC4:
                tst.w   D4
                bmi.s   Offset_0x018BEC
                move.w  $0008(A1), D4
                cmp.w   D0, D4
                bcs     Offset_0x018BEC
                cmp.w   D1, D4
                bcc     Offset_0x018BEC
                move.w  $000C(A1), D4
                cmp.w   D2, D4
                bcs     Offset_0x018BEC
                cmp.w   D3, D4
                bcc     Offset_0x018BEC
                bsr     Offset_0x018A5C
Offset_0x018BEC:
                rts
Offset_0x018BEE:
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0010, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_2_A1                       ; Offset_0x0196FC
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x018C14
                bsr.s   Offset_0x018C34
Offset_0x018C14:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                bsr     SolidObject_2_A1                       ; Offset_0x0196FC
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x018C2A
                bsr.s   Offset_0x018C34
Offset_0x018C2A:
                lea     (Springs_Animate_Data), A1             ; Offset_0x018F50
                bra     AnimateSprite                          ; Offset_0x0164CA
Offset_0x018C34:
                move.w  #$0100, $001C(A0)
                subq.w  #$08, $000C(A1)
                move.w  $0030(A0), $0012(A1)
                neg.w   $0012(A1)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x018C54
                move.w  #$0000, $0010(A1)
Offset_0x018C54:
                btst    #$00, D0
                beq.s   Offset_0x018C94
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$00, $002C(A1)
                move.b  #$04, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x018C84
                move.b  #$01, $002C(A1)
Offset_0x018C84:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x018C94
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x018C94:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x018CAA
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x018CAA:
                cmpi.b  #$08, D0
                bne.s   Offset_0x018CBC
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x018CBC:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x018CD8:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  $0008(A0), D4
                lea     Offset_0x018F18(PC), A2
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_3_A1                       ; Offset_0x019754
                btst    #$03, $0022(A0)
                beq.s   Offset_0x018D00
                bsr.s   Offset_0x018D22
Offset_0x018D00:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                bsr     SolidObject_3_A1                       ; Offset_0x019754
                btst    #$04, $0022(A0)
                beq.s   Offset_0x018D18
                bsr.s   Offset_0x018D22
Offset_0x018D18:
                lea     (Springs_Animate_Data), A1             ; Offset_0x018F50
                bra     AnimateSprite                          ; Offset_0x0164CA
Offset_0x018D22:
                btst    #$00, $0022(A0)
                bne.s   Offset_0x018D38
                move.w  $0008(A0), D0
                subq.w  #$04, D0
                cmp.w   $0008(A1), D0
                bcs.s   Offset_0x018D46
                rts
Offset_0x018D38:
                move.w  $0008(A0), D0
                addq.w  #$04, D0
                cmp.w   $0008(A1), D0
                bcc.s   Offset_0x018D46
                rts
Offset_0x018D46:
                move.w  #$0500, $001C(A0)
                move.w  $0030(A0), $0012(A1)
                move.w  $0030(A0), $0010(A1)
                addq.w  #$06, $000C(A1)
                addq.w  #$06, $0008(A1)
                bset    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x018D7E
                bclr    #$00, $0022(A1)
                subi.w  #$000C, $0008(A1)
                neg.w   $0010(A1)
Offset_0x018D7E:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$10, $001C(A1)
                move.b  #$02, $0024(A1)
                move.b  $0028(A0), D0
                btst    #$00, D0
                beq.s   Offset_0x018DDA
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$01, $002C(A1)
                move.b  #$08, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x018DCA
                move.b  #$03, $002C(A1)
Offset_0x018DCA:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x018DDA
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x018DDA:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x018DF0
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x018DF0:
                cmpi.b  #$08, D0
                bne.s   Offset_0x018E02
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x018E02:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x018E0C:
                move.w  #$001B, D1
                move.w  #$0010, D2
                move.w  $0008(A0), D4
                lea     Offset_0x018F34(PC), A2
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                bsr     SolidObject_3_A1                       ; Offset_0x019754
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x018E32
                bsr.s   Offset_0x018E54
Offset_0x018E32:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                bsr     SolidObject_3_A1                       ; Offset_0x019754
                cmpi.w  #$FFFE, D4
                bne.s   Offset_0x018E48
                bsr.s   Offset_0x018E54
Offset_0x018E48:
                lea     (Springs_Animate_Data), A1             ; Offset_0x018F50
                bra     AnimateSprite                          ; Offset_0x0164CA
                rts
Offset_0x018E54:
                move.w  #$0500, $001C(A0)
                move.w  $0030(A0), $0012(A1)
                neg.w   $0012(A1)
                move.w  $0030(A0), $0010(A1)
                subq.w  #$06, $000C(A1)
                addq.w  #$06, $0008(A1)
                bset    #$00, $0022(A1)
                btst    #$00, $0022(A0)
                bne.s   Offset_0x018E90
                bclr    #$00, $0022(A1)
                subi.w  #$000C, $0008(A1)
                neg.w   $0010(A1)
Offset_0x018E90:
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$02, $0024(A1)
                move.b  $0028(A0), D0
                btst    #$00, D0
                beq.s   Offset_0x018EE6
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$01, $002C(A1)
                move.b  #$08, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x018ED6
                move.b  #$03, $002C(A1)
Offset_0x018ED6:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x018EE6
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x018EE6:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x018EFC
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x018EFC:
                cmpi.b  #$08, D0
                bne.s   Offset_0x018F0E
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x018F0E:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------                   
Offset_0x018F18:
                dc.b    $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $10, $0E, $0C, $0A, $08
                dc.b    $06, $04, $02, $00, $FE, $FC, $FC, $FC, $FC, $FC, $FC, $FC
;-------------------------------------------------------------------------------                
Offset_0x018F34:
                dc.b    $F4, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F0, $F2, $F4, $F6, $F8
                dc.b    $FA, $FC, $FE, $00, $02, $04, $04, $04, $04, $04, $04, $04
;-------------------------------------------------------------------------------
Springs_Animate_Data: ; Offset_0x018F50:
                dc.w    Offset_0x018F5C-Springs_Animate_Data
                dc.w    Offset_0x018F60-Springs_Animate_Data
                dc.w    Offset_0x018F6C-Springs_Animate_Data
                dc.w    Offset_0x018F70-Springs_Animate_Data
                dc.w    Offset_0x018F7C-Springs_Animate_Data
                dc.w    Offset_0x018F80-Springs_Animate_Data
Offset_0x018F5C:
                dc.b    $0F, $00, $FF, $00
Offset_0x018F60:
                dc.b    $00, $01, $00, $00, $02, $02, $02, $02, $02, $02, $FD, $00
Offset_0x018F6C:
                dc.b    $0F, $03, $FF, $00
Offset_0x018F70:
                dc.b    $00, $04, $03, $03, $05, $05, $05, $05, $05, $05, $FD, $02
Offset_0x018F7C:
                dc.b    $0F, $07, $FF, $00
Offset_0x018F80:
                dc.b    $00, $08, $07, $07, $09, $09, $09, $09, $09, $09, $FD, $04
;-------------------------------------------------------------------------------
Springs_Mappings: ; Offset_0x018F8C:
                dc.w    Offset_0x018FB8-Springs_Mappings
                dc.w    Offset_0x018FCA-Springs_Mappings
                dc.w    Offset_0x018FD4-Springs_Mappings
                dc.w    Offset_0x018FE6-Springs_Mappings
                dc.w    Offset_0x018FF8-Springs_Mappings
                dc.w    Offset_0x019002-Springs_Mappings
                dc.w    Offset_0x019014-Springs_Mappings
                dc.w    Offset_0x019026-Springs_Mappings
                dc.w    Offset_0x019048-Springs_Mappings
                dc.w    Offset_0x019062-Springs_Mappings
                dc.w    Offset_0x019084-Springs_Mappings
Springs_Mappings_01: ; Offset_0x018FA2:
                dc.w    Offset_0x018FB8-Springs_Mappings_01
                dc.w    Offset_0x018FCA-Springs_Mappings_01
                dc.w    Offset_0x018FD4-Springs_Mappings_01
                dc.w    Offset_0x018FE6-Springs_Mappings_01
                dc.w    Offset_0x018FF8-Springs_Mappings_01
                dc.w    Offset_0x019002-Springs_Mappings_01
                dc.w    Offset_0x019014-Springs_Mappings_01
                dc.w    Offset_0x0190A6-Springs_Mappings_01
                dc.w    Offset_0x0190C8-Springs_Mappings_01
                dc.w    Offset_0x0190E2-Springs_Mappings_01
                dc.w    Offset_0x019104-Springs_Mappings_01                
Offset_0x018FB8:
                dc.w    $0002
                dc.l    $F00D0000, $0000FFF0, $00050008, $0004FFF8
Offset_0x018FCA:
                dc.w    $0001
                dc.l    $F80D0000, $0000FFF0
Offset_0x018FD4:
                dc.w    $0002
                dc.l    $E00D0000, $0000FFF0, $F007000C, $0006FFF8
Offset_0x018FE6:
                dc.w    $0002
                dc.l    $F0030000, $00000000, $F8010004, $0002FFF8
Offset_0x018FF8:
                dc.w    $0001
                dc.l    $F0030000, $0000FFF8
Offset_0x019002:
                dc.w    $0002
                dc.l    $F0030000, $00000010, $F8090006, $0003FFF8
Offset_0x019014:
                dc.w    $0002
                dc.l    $000D1000, $1000FFF0, $F0051008, $1004FFF8
Offset_0x019026:
                dc.w    $0004
                dc.l    $F00D0000, $0000FFF0, $00050008, $00040000
                dc.l    $FB05000C, $0006FFF6, $0005201C, $200EFFF0
Offset_0x019048:
                dc.w    $0003
                dc.l    $F60D0000, $0000FFEA, $06050008, $0004FFFA
                dc.l    $0005201C, $200EFFF0
Offset_0x019062:
                dc.w    $0004
                dc.l    $E60D0000, $0000FFFB, $F6050008, $0004000B
                dc.l    $F30B0010, $0008FFF6, $0005201C, $200EFFF0
Offset_0x019084:
                dc.w    $0004
                dc.l    $000D1000, $1000FFF0, $F0051008, $10040000
                dc.l    $F505100C, $1006FFF6, $F005301C, $300EFFF0
Offset_0x0190A6:
                dc.w    $0004
                dc.l    $F00D0000, $0000FFF0, $00050008, $00040000
                dc.l    $FB05000C, $0006FFF6, $0005001C, $000EFFF0
Offset_0x0190C8:
                dc.w    $0003
                dc.l    $F60D0000, $0000FFEA, $06050008, $0004FFFA
                dc.l    $0005001C, $000EFFF0
Offset_0x0190E2:
                dc.w    $0004
                dc.l    $E60D0000, $0000FFFB, $F6050008, $0004000B
                dc.l    $F30B0010, $0008FFF6, $0005001C, $000EFFF0
Offset_0x019104:
                dc.w    $0004
                dc.l    $000D1000, $1000FFF0, $F0051008, $10040000
                dc.l    $F505100C, $1006FFF6, $F005101C, $100EFFF0                                                                     
;===============================================================================
; Objeto 0x41 - Molas amarelas / vermelhas - diagonal / horizontal / vertical 
; [ Término ]
;===============================================================================  