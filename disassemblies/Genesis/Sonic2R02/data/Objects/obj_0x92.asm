;===============================================================================
; Objeto 0x92 - Inimigo Spiker na Hill Top 
; [ Início ]
;===============================================================================   
Offset_0x036966:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x036974(PC, D0), D1
                jmp     Offset_0x036974(PC, D1)
Offset_0x036974:
                dc.w    Offset_0x03697C-Offset_0x036974
                dc.w    Offset_0x036994-Offset_0x036974
                dc.w    Offset_0x0369C8-Offset_0x036974
                dc.w    Offset_0x0369F4-Offset_0x036974
Offset_0x03697C:
                bsr     ObjectSettings                         ; Offset_0x03601A
                move.b  #$40, $002A(A0)
                move.w  #$0080, $0010(A0)
                bchg    #00, $0022(A0)
                rts
Offset_0x036994:
                bsr     Spiker_Sub                             ; Offset_0x036AAC
                bne.s   Offset_0x0369A0
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0369B8
Offset_0x0369A0:
                jsr     (SpeedToPos)                           ; Offset_0x016332
                lea     (Spiker_Animate_Data), A1              ; Offset_0x036AF4
                jsr     (AnimateSprite)                        ; Offset_0x0164CA
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0369B8:
                addq.b  #$02, $0024(A0)
                move.b  #$10, $002A(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0369C8:
                bsr     Spiker_Sub                             ; Offset_0x036AAC
                bne.s   Offset_0x0369D4
                subq.b  #$01, $002A(A0)
                bmi.s   Offset_0x0369DA
Offset_0x0369D4:
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0369DA:
                subq.b  #$02, $0024(A0)
                move.b  #$40, $002A(A0)
                neg.w   $0010(A0)
                bchg    #00, $0022(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x0369F4:
                move.b  $002E(A0), D0
                cmpi.b  #$08, D0
                beq.s   Offset_0x036A0A
                subq.b  #$01, D0
                move.b  D0, $002E(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358
Offset_0x036A0A:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x036A44
                st      $002B(A0)
                move.b  #$93, $0000(A1) ; Carrega o objeto 0x93 - Broca lançada pelo inimigo
                move.b  $0028(A0), $0028(A1)
                move.w  A0, $002C(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.b  #$04, $001A(A1)
                move.b  #$02, $001A(A0)
                move.b  #$01, $001C(A0)
Offset_0x036A44:
                move.b  $002F(A0), $0024(A0)
                jmp     (MarkObjGone)                          ; Offset_0x016358                                                                                                                        
;===============================================================================
; Objeto 0x92 - Inimigo Spiker na Hill Top 
; [ Término ]
;===============================================================================