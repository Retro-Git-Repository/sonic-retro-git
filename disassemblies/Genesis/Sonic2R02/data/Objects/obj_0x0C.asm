;===============================================================================
; Objeto 0x0C - Objeto desconhecido
; [ Início ]
;=============================================================================== 
Offset_0x020160:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x02016E(PC, D0), D1
                jmp     Offset_0x02016E(PC, D1)
Offset_0x02016E:
                dc.w    Offset_0x020172-Offset_0x02016E
                dc.w    Offset_0x0201D4-Offset_0x02016E
Offset_0x020172:
                addq.b  #$02, $0024(A0)
                move.l  #Obj_0x0C_Mappings, $0004(A0)          ; Offset_0x02024E
                move.w  #$E418, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                move.w  $000C(A0), D0
                subi.w  #$0010, D0
                move.w  D0, $003A(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$00F0, D0
                addi.w  #$0010, D0
                move.w  D0, D1
                subq.w  #$01, D0
                move.w  D0, $0030(A0)
                move.w  D0, $0032(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                move.b  D0, $003E(A0)
                move.b  D0, $003F(A0)
Offset_0x0201D4:
                move.b  $003C(A0), D0
                beq.s   Offset_0x020212
                cmpi.b  #$80, D0
                bne.s   Offset_0x020222
                move.b  $003D(A0), D1
                bne.s   Offset_0x0201F4
                subq.b  #$01, $003E(A0)
                bpl.s   Offset_0x0201F4
                move.b  $003F(A0), $003E(A0)
                bra.s   Offset_0x020222
Offset_0x0201F4:
                addq.b  #$01, $003D(A0)
                move.b  D1, D0
                jsr     (CalcSine)                             ; Offset_0x003370
                addq.w  #$08, D0
                asr.w   #$06, D0
                subi.w  #$0010, D0
                add.w   $003A(A0), D0
                move.w  D0, $000C(A0)
                bra.s   Offset_0x020238
Offset_0x020212:
                move.w  ($FFFFFE0E).w, D1
                andi.w  #$03FF, D1
                bne.s   Offset_0x020226
                move.b  #$01, $003D(A0)
Offset_0x020222:
                addq.b  #$01, $003C(A0)
Offset_0x020226:
                jsr     (CalcSine)                             ; Offset_0x003370
                addq.w  #$08, D1
                asr.w   #$04, D1
                add.w   $003A(A0), D1
                move.w  D1, $000C(A0)
Offset_0x020238:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                moveq   #$09, D3
                move.w  $0008(A0), D4
                bsr     Platform_Object                        ; Offset_0x019BA0
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Obj_0x0C_Mappings: ; Offset_0x02024E:
                dc.w    Offset_0x020250-Obj_0x0C_Mappings
Offset_0x020250:
                dc.w    $0001
                dc.l    $F80D0000, $0000FFF0
;===============================================================================
; Objeto 0x0C - Objeto desconhecido
; [ Término ]
;===============================================================================  