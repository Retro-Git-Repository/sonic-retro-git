;===============================================================================
; Objeto 0x1C - Miscelânea de objetos - Suporte das pontes na Emerald Hill,
; [ Início ]        postes na Hill Top, etc...
;===============================================================================  
Offset_0x011184:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x011192(PC, D0), D1
                jmp     Offset_0x011192(PC, D1)
Offset_0x011192:
                dc.w    Offset_0x011254-Offset_0x011192
                dc.w    Offset_0x01129C-Offset_0x011192
Offset_0x011196:
                dc.l    Mz_Misc_Mappings                       ; Offset_0x011504
                dc.w    $43FD
                dc.b    $04, $06
                dc.l    ($01<<$18)|Mz_Misc_Mappings            ; Offset_0x011504
                dc.w    $43FD
                dc.b    $04, $06 
                dc.l    ($01<<$18)|EHz_Bridge_Mappings         ; Offset_0x00FC5E
                dc.w    $43B6
                dc.b    $04, $01
                dc.l    ($02<<$18)|Mz_Misc_Mappings            ; Offset_0x011504
                dc.w    $23FD
                dc.b    $10, $06
                dc.l    ($03<<$18)|Teleferics_Mappings         ; Offset_0x021E42 
                dc.w    $43E6
                dc.b    $08, $04
                dc.l    ($04<<$18)|Teleferics_Mappings         ; Offset_0x021E42 
                dc.w    $43E6
                dc.b    $08, $04
                dc.l    ($01<<$18)|Teleferics_Mappings         ; Offset_0x021E42 
                dc.w    $43E6
                dc.b    $20, $01
                dc.l    HTz_Misc_Mappings                      ; Offset_0x011388
                dc.w    $4000
                dc.b    $08, $01
                dc.l    ($01<<$18)|HTz_Misc_Mappings           ; Offset_0x011388
                dc.w    $4000
                dc.b    $08, $01
                dc.l    Offset_0x0113A0
                dc.w    $4428
                dc.b    $04, $04
                dc.l    OOz_Misc_Mappings                      ; Offset_0x0113B8
                dc.w    $4346
                dc.b    $04, $04
                dc.l    ($01<<$18)|OOz_Misc_Mappings           ; Offset_0x0113B8
                dc.w    $4346
                dc.b    $04, $04
                dc.l    ($02<<$18)|OOz_Misc_Mappings           ; Offset_0x0113B8
                dc.w    $4346
                dc.b    $04, $04
                dc.l    ($03<<$18)|OOz_Misc_Mappings           ; Offset_0x0113B8
                dc.w    $4346
                dc.b    $04, $04
                dc.l    ($04<<$18)|OOz_Misc_Mappings           ; Offset_0x0113B8
                dc.w    $4346
                dc.b    $04, $04
                dc.l    ($05<<$18)|OOz_Misc_Mappings           ; Offset_0x0113B8
                dc.w    $4346
                dc.b    $04, $04
                dc.l    OOz_Misc_Mappings_01                   ; Offset_0x011460
                dc.w    $4346
                dc.b    $18, $04
                dc.l    ($01<<$18)|OOz_Misc_Mappings_01        ; Offset_0x011460
                dc.w    $4346
                dc.b    $18, $04                         
                dc.l    ($02<<$18)|OOz_Misc_Mappings_01        ; Offset_0x011460
                dc.w    $4346
                dc.b    $08, $04
                dc.l    ($03<<$18)|OOz_Misc_Mappings_01        ; Offset_0x011460
                dc.w    $4346
                dc.b    $08, $04
                dc.l    ($04<<$18)|OOz_Misc_Mappings_01        ; Offset_0x011460
                dc.w    $4346
                dc.b    $08, $04   
Offset_0x01123E:
                dc.b    $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $00, $30, $40, $60
                dc.b    $00, $00, $30, $40, $50, $00   
Offset_0x011254:
                addq.b  #$02, $0024(A0)
                moveq   #$00, D0
                move.b  $0028(A0), D0
                move.w  D0, D1
                lsl.w   #$03, D0
                lea     Offset_0x011196(PC), A1
                lea     $00(A1, D0), A1
                move.b  (A1), $001A(A0)
                move.l  (A1)+, $0004(A0)
                move.w  (A1)+, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                ori.b   #$04, $0001(A0)
                move.b  (A1)+, $0019(A0)
                move.b  (A1)+, $0018(A0)
                lea     Offset_0x01123E(PC), A1
                move.b  $00(A1, D1), D1
                beq.s   Offset_0x01129C
                move.b  D1, $0016(A0)
                bset    #$04, $0001(A0)
Offset_0x01129C:
                bra     MarkObjGone                            ; Offset_0x016358                                                                                                                                                                                                                 
;===============================================================================
; Objeto 0x1C - Miscelânea de objetos - Suporte das pontes na Emerald Hill,
; [ Término ]       postes na Hill Top, etc...
;===============================================================================  