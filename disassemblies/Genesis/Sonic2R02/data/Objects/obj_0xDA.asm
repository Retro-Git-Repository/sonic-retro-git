;===============================================================================
; Objeto 0xDA - Contador na tela de continue
; [ Início ]
;=============================================================================== 
Offset_0x0079E6:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0079F4(PC, D0), D1
                jmp     Offset_0x0079F4(PC, D1)
Offset_0x0079F4:
                dc.w    Offset_0x0079FC-Offset_0x0079F4
                dc.w    Offset_0x007A2C-Offset_0x0079F4
                dc.w    Offset_0x007A50-Offset_0x0079F4
                dc.w    Offset_0x007ACA-Offset_0x0079F4
Offset_0x0079FC:
                addq.b  #$02, $0024(A0)
                move.l  #Continue_Counter_Mappings, $0004(A0)  ; Offset_0x007C3A
                move.w  #$8500, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$00, $0001(A0)
                move.b  #$3C, $0019(A0)
                move.w  #$0120, $0008(A0)
                move.w  #$00C0, $000A(A0)
Offset_0x007A2C:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x007A32:
                dc.w    $0116, $012A, $0102, $013E, $00EE, $0152, $00DA, $0166
                dc.w    $00C6, $017A, $00B2, $018E, $009E, $01A2, $008A
Offset_0x007A50:
                move.l  A0, A1
                lea     (Offset_0x007A32), A2
                moveq   #$00, D1
                move.b  ($FFFFFE18).w, D1
                subq.b  #$02, D1
                bcc.s   Offset_0x007A68
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x007A68:
                moveq   #$01, D3
                cmpi.b  #$0E, D1
                bcs.s   Offset_0x007A74
                moveq   #$00, D3
                moveq   #$0E, D1
Offset_0x007A74:
                move.b  D1, D2
                andi.b  #$01, D2
Offset_0x007A7A:
                move.b  #$DA, $0000(A1)    ; Nova instância do objeto na memória
                move.w  (A2)+, $0008(A1)
                tst.b   D2
                beq.s   Offset_0x007A8E
                subi.w  #$000A, $0008(A1)
Offset_0x007A8E:
                move.w  #$00D0, $000A(A1)
                move.b  #$04, $001A(A1)
                move.b  #$06, $0024(A1)
                move.l  #Continue_Counter_Mappings, $0004(A1)  ; Offset_0x007C3A
                move.w  #$8524, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$00, $0001(A1)
                lea     $0040(A1), A1
                dbra    D1, Offset_0x007A7A
                lea     $FFC0(A1), A1
                move.b  D3, $0028(A1)
Offset_0x007ACA:
                tst.b   $0028(A0)
                beq.s   Offset_0x007AEA
                cmpi.b  #$04, ($FFFFB024).w
                bcs.s   Offset_0x007AEA
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$01, D0
                bne.s   Offset_0x007AEA
                tst.w   ($FFFFB010).w
                bne.s   Offset_0x007B00
                rts
Offset_0x007AEA:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$0F, D0
                bne.s   Offset_0x007AFA
                bchg    #00, $001A(A0)
Offset_0x007AFA:
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x007B00:
                jmp     (DeleteObject)                         ; Offset_0x01646C
;===============================================================================
; Objeto 0xDA - Contador na tela de continue
; [ Término ]
;===============================================================================