;===============================================================================
; Objeto 0x47 - Interruptor usado para abrir certas portas nas fases
; [ Início ]
;===============================================================================  
Offset_0x024B8C:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x024B9A(PC, D0), D1
                jmp     Offset_0x024B9A(PC, D1)
Offset_0x024B9A:
                dc.w    Offset_0x024B9E-Offset_0x024B9A
                dc.w    Offset_0x024BCC-Offset_0x024B9A
Offset_0x024B9E:
                addq.b  #$02, $0024(A0)
                move.l  #Switch_Mappings, $0004(A0)            ; Offset_0x024C34
                move.w  #$0424, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$04, $0018(A0)
                addq.w  #$04, $000C(A0)
Offset_0x024BCC:
                tst.b   $0001(A0)
                bpl.s   Offset_0x024C2E
                move.w  #$001B, D1
                move.w  #$0004, D2
                move.w  #$0005, D3
                move.w  $0008(A0), D4
                jsr     (SolidObject)                          ; Offset_0x019686
                move.b  #$00, $001A(A0)
                move.b  $0028(A0), D0
                andi.w  #$000F, D0
                lea     ($FFFFF7E0).w, A3
                lea     $00(A3, D0), A3
                moveq   #$00, D3
                btst    #$06, $0028(A0)
                beq.s   Offset_0x024C0A
                moveq   #$07, D3
Offset_0x024C0A:
                move.b  $0022(A0), D0
                andi.b  #$18, D0
                bne.s   Offset_0x024C18
                bclr    D3, (A3)
                bra.s   Offset_0x024C2E
Offset_0x024C18:
                tst.b   (A3)
                bne.s   Offset_0x024C26
                move.w  #Switch_Pressed_Sfx, D0 ; $00CD
                jsr     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x024C26:
                bset    D3, (A3)
                move.b  #$01, $001A(A0)
Offset_0x024C2E:
                jmp     (MarkObjGone)                          ; Offset_0x016358
;-------------------------------------------------------------------------------                
Switch_Mappings: ; Offset_0x024C34:
                dc.w    Offset_0x024C3A-Switch_Mappings
                dc.w    Offset_0x024C44-Switch_Mappings
                dc.w    Offset_0x024C4E-Switch_Mappings
Offset_0x024C3A:
                dc.w    $0001
                dc.l    $F40D0000, $0000FFF0
Offset_0x024C44:
                dc.w    $0001
                dc.l    $F40D0008, $0004FFF0
Offset_0x024C4E:
                dc.w    $0001
                dc.l    $F80D0000, $0000FFF0
;===============================================================================
; Objeto 0x47 - Interruptor usado para abrir certas portas nas fases
; [ Término ]
;===============================================================================  