;===============================================================================
; Objeto 0x25 - Anéis - Este objeto só é utilizado no debug e no painel de fim 
; [ Início ]            de fase para exibir as estrelas     
;===============================================================================  
Offset_0x011EE8:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x011EF6(PC, D0), D1
                jmp     Offset_0x011EF6(PC, D1)
Offset_0x011EF6:
                dc.w    Offset_0x011F00-Offset_0x011EF6
                dc.w    Offset_0x011F34-Offset_0x011EF6
                dc.w    Offset_0x011F42-Offset_0x011EF6
                dc.w    Offset_0x011F54-Offset_0x011EF6
                dc.w    Offset_0x011F62-Offset_0x011EF6
Offset_0x011F00:
                addq.b  #$02, $0024(A0)
                move.w  $0008(A0), $0032(A0)
                move.l  #Rings_Mappings, $0004(A0)             ; Offset_0x012328
                move.w  #$26BC, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$02, $0018(A0)
                move.b  #$47, $0020(A0)
                move.b  #$08, $0019(A0)
Offset_0x011F34:
                move.b  ($FFFFFEA3).w, $001A(A0)
                move.w  $0032(A0), D0
                bra     MarkObjGone_2                          ; Offset_0x016390
Offset_0x011F42:
                addq.b  #$02, $0024(A0)
                move.b  #$00, $0020(A0)
                move.b  #$01, $0018(A0)
                bsr.s   Add_Rings                              ; Offset_0x011F66
Offset_0x011F54:
                lea     (Rings_Animate_Data), A1               ; Offset_0x012320
                bsr     AnimateSprite                          ; Offset_0x0164CA
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x011F62:
                bra     DeleteObject                           ; Offset_0x01646C
;===============================================================================
; Objeto 0x25 - Anéis - Este objeto só é utilizado no debug e no painel de fim
; [ Término ]           de fase para exibir as estrelas
;===============================================================================  