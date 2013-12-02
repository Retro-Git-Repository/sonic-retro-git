;===============================================================================
; Objeto 0x72 - Atributo invisivel das esteiras na Casino Night / Metropolis
; [ Início ]      
;===============================================================================  
Offset_0x0286A6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0286B4(PC, D0), D1
                jmp     Offset_0x0286B4(PC, D1)
Offset_0x0286B4:
                dc.w    Offset_0x0286B8-Offset_0x0286B4
                dc.w    Offset_0x0286EA-Offset_0x0286B4
Offset_0x0286B8:
                addq.b  #$02, $0024(A0)
                move.w  #$0030, $003C(A0)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x0286CE
                move.w  #$0070, $003C(A0)
Offset_0x0286CE:
                andi.b  #$7F, D0
                lsl.b   #$04, D0
                move.b  D0, $0038(A0)
                move.w  #$0002, $0036(A0)
                btst    #$00, $0022(A0)
                beq.s   Offset_0x0286EA
                neg.w   $0036(A0)
Offset_0x0286EA:
                lea     ($FFFFB000).w, A1
                bsr.s   Offset_0x0286FC
                lea     ($FFFFB040).w, A1
                bsr.s   Offset_0x0286FC
                jmp     (MarkObjGone_3)                        ; Offset_0x0163C4
Offset_0x0286FC:
                moveq   #$00, D2
                move.b  $0038(A0), D2
                move.w  D2, D3
                add.w   D3, D3
                move.w  $0008(A1), D0
                sub.w   $0008(A0), D0
                add.w   D2, D0
                cmp.w   D3, D0
                bcc.s   Offset_0x028736
                move.w  $000C(A1), D1
                sub.w   $000C(A0), D1
                move.w  $003C(A0), D0
                add.w   D0, D1
                cmp.w   D0, D1
                bcc.s   Offset_0x028736
                btst    #$01, $0022(A1)
                bne.s   Offset_0x028736
                move.w  $0036(A0), D0
                add.w   D0, $0008(A1)
Offset_0x028736:
                rts
;===============================================================================
; Objeto 0x72 - Atributo invisivel das esteiras na Casino Night / Metropolis
; [ Término ]    
;===============================================================================  