;===============================================================================
; Objeto 0xCD - Pássaros na seqüência do final
; [ Início ]
;=============================================================================== 
Offset_0x00AA90:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x00AA9E(PC, D0), D1
                jmp     Offset_0x00AA9E(PC, D1)
Offset_0x00AA9E:                
                dc.w    Offset_0x00AAA2-Offset_0x00AA9E
                dc.w    Offset_0x00AAF2-Offset_0x00AA9E
Offset_0x00AAA2:
                lea     (Obj_0xCD_Ptr), A1                     ; Offset_0x00AD6E
                jsr     (ObjectSettings_A1)                    ; Offset_0x036028
                move.l  ($FFFFF636).w, D0
                ror.l   #$03, D0
                move.l  D0, ($FFFFF636).w
                move.l  D0, D1
                andi.w  #$007F, D0
                move.w  #$FF60, D2
                add.w   D0, D2
                move.w  D2, $0008(A0)
                ror.l   #$03, D1
                andi.w  #$00FF, D1
                moveq   #$08, D2
                add.w   D1, D2
                move.w  D2, $000C(A0)
                move.w  #$0100, $0010(A0)
                moveq   #$20, D0
                cmpi.w  #$0020, D1
                bcs.s   Offset_0x00AAE6
                neg.w   D0
Offset_0x00AAE6:
                move.w  D0, $0012(A0)
                move.w  #$00C0, $003C(A0)
                rts
Offset_0x00AAF2:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x00AB18(PC, D0), D1
                jsr     Offset_0x00AB18(PC, D1)
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Flickies_End_AnimateData), A1         ; Offset_0x00AD78
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x00AB18:
                dc.w    Offset_0x00AB1E-Offset_0x00AB18
                dc.w    Offset_0x00AB46-Offset_0x00AB18
                dc.w    Offset_0x00AB78-Offset_0x00AB18
Offset_0x00AB1E:
                subq.w  #$01, $003C(A0)
                bpl.s   Offset_0x00AB44
                addq.b  #$02, $0025(A0)
                move.w  $0012(A0), $002E(A0)
                clr.w   $0010(A0)
                move.w  $000C(A0), $0032(A0)
                move.w  #$0080, $0012(A0)
                move.w  #$0180, $003C(A0)
Offset_0x00AB44:
                rts
Offset_0x00AB46:
                subq.w  #$01, $003C(A0)
                bmi.s   Offset_0x00AB60
                move.w  $000C(A0), D0
                moveq   #$FFFFFFFC, D1
                cmp.w   $0032(A0), D0
                bcc.s   Offset_0x00AB5A
                neg.w   D1
Offset_0x00AB5A:
                add.w   D1, $0012(A0)
                rts
Offset_0x00AB60:
                addq.b  #$02, $0025(A0)
                move.w  #$FF00, $0010(A0)
                move.w  $002E(A0), $0012(A0)
                move.w  #$00C0, $003C(A0)
                rts
Offset_0x00AB78:
                subq.w  #$01, $003C(A0)
                bmi.s   Offset_0x00AB80
                rts
Offset_0x00AB80:
                addq.w  #$04, A7
Obj_0xCB_DeleteObject: ; Offset_0x00AB82:              
                jmp     (DeleteObject)                         ; Offset_0x01646C
;===============================================================================
; Objeto 0xCD - Pássaros na seqüência do final
; [ Término ]
;===============================================================================  
