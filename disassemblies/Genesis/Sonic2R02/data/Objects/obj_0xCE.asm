;===============================================================================
; Objeto 0xCE - Sonic / Miles na seqüência do final antes dos créditos
; [ Início ]
;===============================================================================   
Offset_0x00A860:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00A86E(PC, D0), D1
                jmp     Offset_0x00A86E(PC, D1)
Offset_0x00A86E:
                dc.w    Offset_0x00A876-Offset_0x00A86E
                dc.w    Offset_0x00A8D0-Offset_0x00A86E
                dc.w    Offset_0x00A908-Offset_0x00A86E
                dc.w    Offset_0x00A8F4-Offset_0x00A86E
Offset_0x00A876:
                lea     (Obj_0xB3_Ptr), A1                     ; Offset_0x03AF76
                jsr     (ObjectSettings_A1)                    ; Offset_0x036028
                move.l  #Offset_0x00AD9E, $0004(A0)
                move.w  #$8000, $0002(A0)
                move.b  #$01, $0018(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$0C, $001A(A0)
                cmpi.w  #$0004, ($FFFFF750).w
                bne.s   Offset_0x00A8B6
                move.b  #$0F, $001A(A0)
                move.w  #$A000, $0002(A0)
Offset_0x00A8B6:
                move.w  #$00E8, D0
                move.w  D0, $0008(A0)
                move.w  D0, $0030(A0)
                move.w  #$0118, D0
                move.w  D0, $000C(A0)
                move.w  D0, $0032(A0)
                rts
Offset_0x00A8D0:
                move.w  $002C(A0), A1
                btst    #$03, $0022(A1)
                bne.s   Offset_0x00A8FA
Obj_0xCF_Sub: ; Offset_0x00A8DC:                              
                move.w  $0030(A0), D0
                add.w   ($FFFFE000).w, D0
                move.w  D0, $0008(A0)
                move.w  $0032(A0), D0
                sub.w   ($FFFFF616).w, D0
                move.w  D0, $000C(A0)                                      
Offset_0x00A8F4:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00A8FA:
                addq.b  #$02, $0024(A0)
                clr.w   $003C(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00A908:
                subq.w  #$01, $003C(A0)
                bpl.s   Offset_0x00A946
                move.w  #$0004, $003C(A0)
                move.w  $0034(A0), D0
                cmpi.w  #$0004, D0
                bcc.s   Offset_0x00A94C
                addq.w  #$02, $0034(A0)
                lea     Offset_0x00A956(PC, D0), A1
                cmpi.w  #$0002, ($FFFFF750).w
                bne.s   Offset_0x00A932
                lea     Offset_0x00A956+$04(PC, D0), A1
Offset_0x00A932:
                move.b  (A1)+, D0
                ext.w   D0
                add.w   D0, $0008(A0)
                move.b  (A1)+, D0
                ext.w   D0
                add.w   D0, $000C(A0)
                addq.b  #$01, $001A(A0)
Offset_0x00A946:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00A94C:
                addq.b  #$02, $0024(A0)
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------
Offset_0x00A956:
                dc.w    $F800, $BCC8, $F800, $B0C0                
;===============================================================================
; Objeto 0xCE - Sonic / Miles na seqüência do final antes dos créditos
; [ Término ]
;===============================================================================  