;===============================================================================
; Objeto 0x74 - Barreira invisível utilizada para bloquear passagens nas fases
; [ Início ]
;=============================================================================== 
Offset_0x020E16:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x020E24(PC, D0), D1
                jmp     Offset_0x020E24(PC, D1)
Offset_0x020E24:
                dc.w    Offset_0x020E28-Offset_0x020E24
                dc.w    Offset_0x020E66-Offset_0x020E24
Offset_0x020E28:
                addq.b  #$02, $0024(A0)
                move.l  #Invisible_Block_Mappings, $0004(A0)   ; Offset_0x020E9E
                move.w  #$8680, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  $0028(A0), D0
                move.b  D0, D1
                andi.w  #$00F0, D0
                addi.w  #$0010, D0
                lsr.w   #$01, D0
                move.b  D0, $0019(A0)
                andi.w  #$000F, D1
                addq.w  #$01, D1
                lsl.w   #$03, D1
                move.b  D1, $0016(A0)
Offset_0x020E66:
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                bsr     SolidObject_2                          ; Offset_0x0196E6
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                bne.s   Offset_0x020E9C
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     J_DeleteObject                         ; Offset_0x0213F0
Offset_0x020E9C:
                rts
;-------------------------------------------------------------------------------                
Invisible_Block_Mappings: ; Offset_0x020E9E:
                dc.w    Offset_0x020EA4-Invisible_Block_Mappings
                dc.w    Offset_0x020EC6-Invisible_Block_Mappings
                dc.w    Offset_0x020EE8-Invisible_Block_Mappings
Offset_0x020EA4:
                dc.w    $0004
                dc.l    $F005001C, $000EFFF0, $F005001C, $000E0000
                dc.l    $0005001C, $000EFFF0, $0005001C, $000E0000
Offset_0x020EC6:
                dc.w    $0004
                dc.l    $E005001C, $000EFFC0, $E005001C, $000E0030
                dc.l    $1005001C, $000EFFC0, $1005001C, $000E0030
Offset_0x020EE8:
                dc.w    $0004
                dc.l    $E005001C, $000EFF80, $E005001C, $000E0070
                dc.l    $1005001C, $000EFF80, $1005001C, $000E0070
;===============================================================================
; Objeto 0x74 - Barreira invisível utilizada para bloquear passagens nas fases
; [ Término ]
;===============================================================================  