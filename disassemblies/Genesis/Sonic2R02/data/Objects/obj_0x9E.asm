;===============================================================================
; Objeto 0x9E - Inimigo Crawlton na Mystic Cave
; [ Início ]
;===============================================================================     
Offset_0x0378FE:
                moveq   #$00, D0
                move.b  $003B(A0), D0
                move.w  Offset_0x03790C(PC, D0), D1
                jmp     Offset_0x03790C(PC, D1)
Offset_0x03790C:
                dc.w    Offset_0x037918-Offset_0x03790C
                dc.w    Offset_0x03792A-Offset_0x03790C
                dc.w    Offset_0x037984-Offset_0x03790C
                dc.w    Offset_0x0379A6-Offset_0x03790C
                dc.w    Offset_0x0379CA-Offset_0x03790C
                dc.w    Offset_0x0379F6-Offset_0x03790C
Offset_0x037918:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$80, $0016(A0)
                addq.b  #$02, $003B(A0)
                bra     Offset_0x037A6E
Offset_0x03792A:
                bsr     Offset_0x0360FC
                move.w  D2, D4
                move.w  D3, D5
                addi.w  #$0080, D2
                cmpi.w  #$0100, D2
                bcc.s   Offset_0x037946
                addi.w  #$0080, D3
                cmpi.w  #$0100, D3
                bcs.s   Offset_0x03794C
Offset_0x037946:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x03794C:
                addq.b  #$02, $003B(A0)
                move.b  #$10, $003A(A0)
                bclr    #$00, $0001(A0)
                tst.w   D0
                beq.s   Offset_0x037966
                bset    #$00, $0001(A0)
Offset_0x037966:
                neg.w   D4
                lsl.w   #$03, D4
                andi.w  #$FF00, D4
                move.w  D4, $0010(A0)
                neg.w   D5
                lsl.w   #$03, D5
                andi.w  #$FF00, D5
                move.w  D5, $0012(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037984:
                subq.b  #$01, $003A(A0)
                bmi.s   Offset_0x037990
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x037990:
                addq.b  #$02, $003B(A0)
                move.b  #$08, $0039(A0)
                move.b  #$1C, $003A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0379A6:
                subq.b  #$01, $003A(A0)
                beq.s   Offset_0x0379B8
                jsr     (SpeedToPos)                           ; Offset_0x016332
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0379B8:
                move.b  $0039(A0), $003B(A0)
                move.b  #$20, $003A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0379CA:
                subq.b  #$01, $003A(A0)
                beq.s   Offset_0x0379D6
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0379D6:
                move.b  #$06, $003B(A0)
                move.b  #$02, $0039(A0)
                move.b  #$1C, $003A(A0)
                neg.w   $0010(A0)
                neg.w   $0012(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0379F6:
                move.w  $003E(A0), A1
                cmpi.b  #$9E, (A1)
                bne     J_DeleteObject_01                      ; Offset_0x036344
                bclr    #$00, $0001(A0)
                btst    #$00, $0001(A1)
                beq.s   Offset_0x037A16
                bset    #$00, $0001(A0)
Offset_0x037A16:
                move.b  #$80, $0014(A0)
                move.w  $0008(A1), $0008(A0)
                move.w  $000C(A1), $000C(A0)
                cmpi.b  #$06, $003B(A1)
                bne.s   Offset_0x037A64
                move.w  $0010(A1), D2
                asr.w   #$08, D2
                move.w  $0012(A1), D3
                asr.w   #$08, D3
                lea     $0010(A0), A2
                move.b  $003A(A1), D0
                moveq   #$18, D1
                moveq   #$06, D6
Offset_0x037A48:
                move.w  (A2), D4
                move.w  $0002(A2), D5
                cmp.b   D1, D0
                bcc.s   Offset_0x037A56
                add.w   D2, D4
                add.w   D3, D5
Offset_0x037A56:
                move.w  D4, (A2)+
                move.w  D5, (A2)+
                subq.b  #$04, D1
                bcs.s   Offset_0x037A64
                addq.w  #$02, A2
                dbra    D6, Offset_0x037A48
Offset_0x037A64:
                move.w  #$0280, D0
                jmp     (DisplaySprite_Param)                  ; Offset_0x0164B6
Offset_0x037A6E:
                jsr     (SingleObjectLoad)                     ; Offset_0x017F48
                bne.s   Offset_0x037AE2
                move.b  #$9E, $0000(A1)    ; Nova instância do objeto na memória
                move.b  $0001(A0), $0001(A1)
                bset    #$06, $0001(A1)
                move.l  $0004(A0), $0004(A1)
                move.w  $0002(A0), $0002(A1)
                move.b  #$0A, $003B(A1)
                move.b  #$00, $000B(A1)
                move.b  #$80, $000E(A1)
                move.b  #$07, $000F(A1)
                move.w  A0, $003E(A1)
                move.w  $0008(A0), D2
                move.w  D2, $0008(A1)
                move.w  $000C(A0), D3
                move.w  D3, $000C(A1)
                move.b  #$80, $0014(A1)
                bset    #$04, $0001(A1)
                lea     $0010(A1), A2
                moveq   #$06, D6
Offset_0x037AD2:
                move.w  D2, (A2)+
                move.w  D3, (A2)+
                move.w  #$0002, (A2)+
                addi.w  #$0010, D1
                dbra    D6, Offset_0x037AD2
Offset_0x037AE2:
                rts
;-------------------------------------------------------------------------------                 
Obj_0x9E_Ptr: ; Offset_0x037AE4:                
                dc.l    Crawlton_Mappings                      ; Offset_0x037AEE
                dc.w    $23C0
                dc.b    $04, $04, $80, $0B
;-------------------------------------------------------------------------------                  
Crawlton_Mappings: ; Offset_0x037AEE:
                dc.w    Offset_0x037AF4-Crawlton_Mappings
                dc.w    Offset_0x037AF4-Crawlton_Mappings
                dc.w    Offset_0x037AFE-Crawlton_Mappings
Offset_0x037AF4:
                dc.w    $0001
                dc.l    $F8090000, $0000FFF0
Offset_0x037AFE:
                dc.w    $0001
                dc.l    $F8050006, $0003FFF8                                                                            
;===============================================================================
; Objeto 0x9E - Inimigo Crawlton na Mystic Cave
; [ Término ]
;===============================================================================