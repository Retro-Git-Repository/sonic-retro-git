;===============================================================================
; Objeto 0x44 - Mola circular com estrela na Casino Night
; [ Início ]
;===============================================================================  
Offset_0x01F6A8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x01F6B6(PC, D0), D1
                jmp     Offset_0x01F6B6(PC, D1)
Offset_0x01F6B6:
                dc.w    Offset_0x01F6BA-Offset_0x01F6B6
                dc.w    Offset_0x01F6EA-Offset_0x01F6B6
Offset_0x01F6BA:
                addq.b  #$02, $0024(A0)
                move.l  #Red_Ball_Bumper_Mappings, $0004(A0)   ; Offset_0x01F7D8
                move.w  #$439A, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  #$D7, $0020(A0)
Offset_0x01F6EA:
                move.b  $0021(A0), D0
                beq     Offset_0x01F7B8
                lea     ($FFFFB000).w, A1
                bclr    #$00, $0021(A0)
                beq.s   Offset_0x01F700
                bsr.s   Offset_0x01F716
Offset_0x01F700:
                lea     ($FFFFB040).w, A1
                bclr    #$01, $0021(A0)
                beq.s   Offset_0x01F70E
                bsr.s   Offset_0x01F716
Offset_0x01F70E:
                clr.b   $0021(A0)
                bra     Offset_0x01F7B8
Offset_0x01F716:
                move.w  $0008(A0), D1
                move.w  $000C(A0), D2
                sub.w   $0008(A1), D1
                sub.w   $000C(A1), D2
                jsr     (CalcAngle)                            ; Offset_0x003608
                move.b  ($FFFFFE04).w, D1
                andi.w  #$0003, D1
                add.w   D1, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                muls.w  #$F900, D1
                asr.l   #$08, D1
                move.w  D1, $0010(A1)
                muls.w  #$F900, D0
                asr.l   #$08, D0
                move.w  D0, $0012(A1)
                bset    #$01, $0022(A1)
                bclr    #$04, $0022(A1)
                bclr    #$05, $0022(A1)
                clr.b   $003C(A1)
                move.b  #$01, $001C(A0)
                move.w  #Bumper_Sfx, D0         ; $00B4
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                lea     ($FFFFFC00).w, A2
                moveq   #$00, D0
                move.b  $0023(A0), D0
                beq.s   Offset_0x01F78E
                cmpi.b  #$8A, $02(A2, D0)
                bcc.s   Offset_0x01F7B6
                addq.b  #$01, $02(A2, D0)
Offset_0x01F78E:
                moveq   #$01, D0
                move.w  A1, A3
                jsr     (Add_Points)                           ; Offset_0x040A98
                bsr     SingleObjectLoad                       ; Offset_0x017F48
                bne.s   Offset_0x01F7B6
                move.b  #$29, $0000(A1)   ; Carrega o objeto 0x29 - bonificação de pontos
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$04, $001A(A1)
Offset_0x01F7B6:
                rts
Offset_0x01F7B8:
                lea     (Red_Ball_Bumper_Animate_Data), A1     ; Offset_0x01F7CA
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------
Red_Ball_Bumper_Animate_Data: ; Offset_0x01F7CA:
                dc.w    Offset_0x01F7CE-Red_Ball_Bumper_Animate_Data
                dc.w    Offset_0x01F7D2-Red_Ball_Bumper_Animate_Data
Offset_0x01F7CE:
                dc.b    $0F, $00, $FF, $00
Offset_0x01F7D2:
                dc.b    $03, $01, $00, $01, $FD, $00
;-------------------------------------------------------------------------------
Red_Ball_Bumper_Mappings: ; Offset_0x01F7D8:
                dc.w    Offset_0x01F7DC-Red_Ball_Bumper_Mappings
                dc.w    Offset_0x01F7EE-Red_Ball_Bumper_Mappings
Offset_0x01F7DC:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0, $F0070800, $08000000
Offset_0x01F7EE:
                dc.w    $0004
                dc.l    $EC0B0008, $0004FFE8, $EC0B0808, $08040000
                dc.l    $0C050014, $000AFFF0, $0C050814, $080A0000          
;===============================================================================
; Objeto 0x44 - Mola circular com estrela na Casino Night
; [ Término ]
;===============================================================================  