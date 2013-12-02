;===============================================================================
; Objeto 0xD3 - Bola de espinhos usada nos caças níqueis na Casino Night
; [ Início ]
;=============================================================================== 
Offset_0x02B490:
                moveq   #$00, D1
                move.w  $0038(A0), D1
                swap.w  D1
                move.l  $0030(A0), D0
                sub.l   D1, D0
                asr.l   #$04, D0
                sub.l   D0, $0030(A0)
                move.w  $0030(A0), $0008(A0)
                moveq   #$00, D1
                move.w  $003A(A0), D1
                swap.w  D1
                move.l  $0034(A0), D0
                sub.l   D1, D0
                asr.l   #$04, D0
                sub.l   D0, $0034(A0)
                move.w  $0034(A0), $000C(A0)
                subq.w  #$01, $003C(A0)
                bne     Offset_0x02B51A
                move.l  $002A(A0), A1
                subq.w  #$01, (A1)
                cmpi.w  #$0005, ($FFFFFF72).w
                bcs.s   Offset_0x02B4E8
                clr.w   ($FFFFFF72).w
                move.w  #Spike_Touch_Sfx, D0    ; $00A6
                jsr     (Play_Sfx_Stereo)                      ; Offset_0x001332
Offset_0x02B4E8:
                tst.b   $003F(A0)
                beq.s   Offset_0x02B504
                tst.w   ($FFFFFED0).w
                beq.s   Offset_0x02B4FE
                subq.w  #$01, ($FFFFFED0).w
                ori.b   #$81, ($FFFFFEC9).w
Offset_0x02B4FE:
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                bne.s   Offset_0x02B514
Offset_0x02B504:
                tst.w   ($FFFFFE20).w
                beq.s   Offset_0x02B514
                subq.w  #$01, ($FFFFFE20).w
                ori.b   #$81, ($FFFFFE1D).w
Offset_0x02B514:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x02B51A:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
Spikeball_Mappings: ; Offset_0x02B520:
                dc.w    Offset_0x02B522-Spikeball_Mappings
Offset_0x02B522:
                dc.w    $0001
                dc.l    $F8050000, $0000FFF8                                                                        
;===============================================================================
; Objeto 0xD3 - Bola de espinhos usada nos caças níqueis na Casino Night
; [ Término ]
;===============================================================================