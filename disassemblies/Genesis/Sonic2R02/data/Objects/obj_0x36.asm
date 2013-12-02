;===============================================================================
; Objeto 0x36 - Espinhos
; [ Início ]
;===============================================================================    
Offset_0x015888:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x015896(PC, D0), D1
                jmp     Offset_0x015896(PC, D1)
Offset_0x015896:
                dc.w    Offset_0x0158AE-Offset_0x015896
                dc.w    Offset_0x015920-Offset_0x015896
                dc.w    Offset_0x015970-Offset_0x015896
                dc.w    Offset_0x0159CC-Offset_0x015896             
;-------------------------------------------------------------------------------                
Spikes_Conf: ; Offset_0x01589E:    
                dc.b    $10, $10  ; Largura / Altura do espinho
                dc.b    $20, $10
                dc.b    $30, $10
                dc.b    $40, $10
                dc.b    $10, $10
                dc.b    $10, $20
                dc.b    $10, $30
                dc.b    $10, $40  
;-------------------------------------------------------------------------------  
Offset_0x0158AE:
                addq.b  #$02, $0024(A0)
                move.l  #Spikes_Mappings, $0004(A0)            ; Offset_0x015AF2
                move.w  #$2434, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$04, $0018(A0)
                move.b  $0028(A0), D0
                andi.b  #$0F, $0028(A0)
                andi.w  #$00F0, D0
                lea     (Spikes_Conf), A1                      ; Offset_0x01589E
                lsr.w   #$03, D0
                adda.w  D0, A1
                move.b  (A1)+, $0019(A0)
                move.b  (A1)+, $0016(A0)
                lsr.w   #$01, D0
                move.b  D0, $001A(A0)
                cmpi.b  #$04, D0
                bcs.s   Offset_0x015902
                addq.b  #$02, $0024(A0)
                move.w  #$242C, $0002(A0)
Offset_0x015902:
                btst    #$01, $0022(A0)
                beq.s   Offset_0x015910
                move.b  #$06, $0024(A0)
Offset_0x015910:
                move.w  $0008(A0), $0030(A0)
                move.w  $000C(A0), $0032(A0)
                bra     ModifySpriteAttr_2P                    ; Offset_0x016CFA
Offset_0x015920:
                bsr     Offset_0x015A50
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                bsr     SolidObject                            ; Offset_0x019686
                move.b  $0022(A0), D6
                andi.b  #$18, D6
                beq.s   Offset_0x015968
                move.b  D6, D0
                andi.b  #$08, D0
                beq.s   Offset_0x01595A
                lea     ($FFFFB000).w, A1
                bsr     Hurt_Player_A1                         ; Offset_0x015A1A
Offset_0x01595A:
                andi.b  #$10, D6
                beq.s   Offset_0x015968
                lea     ($FFFFB040).w, A1
                bsr     Hurt_Player_A1                         ; Offset_0x015A1A
Offset_0x015968:
                move.w  $0030(A0), D0
                bra     MarkObjGone_2                          ; Offset_0x016390
Offset_0x015970:
                move.w  $0008(A0), -(A7)
                bsr     Offset_0x015A50
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  (A7)+, D4
                bsr     SolidObject                            ; Offset_0x019686
                swap.w  D6
                andi.w  #$0003, D6
                beq.s   Offset_0x0159C4
                move.b  D6, D0
                andi.b  #$01, D0
                beq.s   Offset_0x0159B0
                lea     ($FFFFB000).w, A1
                bsr     Hurt_Player_A1                         ; Offset_0x015A1A
                bclr    #$05, $0022(A0)
Offset_0x0159B0:
                andi.b  #$02, D6
                beq.s   Offset_0x0159C4
                lea     ($FFFFB040).w, A1
                bsr     Hurt_Player_A1                         ; Offset_0x015A1A
                bclr    #$06, $0022(A0)
Offset_0x0159C4:
                move.w  $0030(A0), D0
                bra     MarkObjGone_2                          ; Offset_0x016390
Offset_0x0159CC:
                bsr     Offset_0x015A50
                moveq   #$00, D1
                move.b  $0019(A0), D1
                addi.w  #$000B, D1
                moveq   #$00, D2
                move.b  $0016(A0), D2
                move.w  D2, D3
                addq.w  #$01, D3
                move.w  $0008(A0), D4
                bsr     SolidObject                            ; Offset_0x019686
                swap.w  D6
                andi.w  #$000C, D6
                beq.s   Offset_0x015A12
                move.b  D6, D0
                andi.b  #$04, D0
                beq.s   Offset_0x015A04
                lea     ($FFFFB000).w, A1
                bsr     Hurt_Player_A1                         ; Offset_0x015A1A
Offset_0x015A04:
                andi.b  #$08, D6
                beq.s   Offset_0x015A12
                lea     ($FFFFB040).w, A1
                bsr     Hurt_Player_A1                         ; Offset_0x015A1A
Offset_0x015A12:
                move.w  $0030(A0), D0
                bra     MarkObjGone_2                          ; Offset_0x016390
;=============================================================================== 
; Sub Rotina para causar danos ao Sonic / Miles
; [ Início ]                         
;===============================================================================   
Hurt_Player_A1: ; Offset_0x015A1A:
                btst    #$01, $002B(A1)
                bne.s   Exit_Hurt_Player_A1                    ; Offset_0x015A4E
                tst.w   $0030(A1)
                bne.s   Exit_Hurt_Player_A1                    ; Offset_0x015A4E
                cmpi.b  #$04, $0024(A1)
                bcc.s   Exit_Hurt_Player_A1                    ; Offset_0x015A4E
                move.l  $000C(A1), D3
                move.w  $0012(A1), D0
                ext.l   D0
                asl.l   #$08, D0
                sub.l   D0, D3
                move.l  D3, $000C(A1)
                move.l  A0, A2
                move.l  A1, A0
                jsr     (Hurt_Player)                          ; Offset_0x03F5E0
                move.l  A2, A0
Exit_Hurt_Player_A1: ; Offset_0x015A4E:
                rts
;=============================================================================== 
; Sub Rotina para causar danos ao Sonic / Miles
; [ Término ]                         
;===============================================================================                 
Offset_0x015A50:
                moveq   #$00, D0
                move.b  $0028(A0), D0
                add.w   D0, D0
                move.w  Offset_0x015A60(PC, D0), D1
                jmp     Offset_0x015A60(PC, D1)
Offset_0x015A60:
                dc.w    Offset_0x015A66-Offset_0x015A60
                dc.w    Offset_0x015A68-Offset_0x015A60
                dc.w    Offset_0x015A7C-Offset_0x015A60
Offset_0x015A66:
                rts
Offset_0x015A68:
                bsr     Offset_0x015A90
                moveq   #$00, D0
                move.b  $0034(A0), D0
                add.w   $0032(A0), D0
                move.w  D0, $000C(A0)
                rts
Offset_0x015A7C:
                bsr     Offset_0x015A90
                moveq   #$00, D0
                move.b  $0034(A0), D0
                add.w   $0030(A0), D0
                move.w  D0, $0008(A0)
                rts
Offset_0x015A90:
                tst.w   $0038(A0)
                beq.s   Offset_0x015AAE
                subq.w  #$01, $0038(A0)
                bne.s   Offset_0x015AF0
                tst.b   $0001(A0)
                bpl.s   Offset_0x015AF0
                move.w  #Spike_Moving_Sfx, D0   ; $00B6
                jsr     (Play_Sfx)                             ; Offset_0x00132C
                bra.s   Offset_0x015AF0
Offset_0x015AAE:
                tst.w   $0036(A0)
                beq.s   Offset_0x015AD0
                subi.w  #$0800, $0034(A0)
                bcc.s   Offset_0x015AF0
                move.w  #$0000, $0034(A0)
                move.w  #$0000, $0036(A0)
                move.w  #$003C, $0038(A0)
                bra.s   Offset_0x015AF0
Offset_0x015AD0:
                addi.w  #$0800, $0034(A0)
                cmpi.w  #$2000, $0034(A0)
                bcs.s   Offset_0x015AF0
                move.w  #$2000, $0034(A0)
                move.w  #$0001, $0036(A0)
                move.w  #$003C, $0038(A0)
Offset_0x015AF0:
                rts
;-------------------------------------------------------------------------------                
Spikes_Mappings: ; Offset_0x015AF2:
                dc.w    Offset_0x015B02-Spikes_Mappings
                dc.w    Offset_0x015B14-Spikes_Mappings
                dc.w    Offset_0x015B36-Spikes_Mappings
                dc.w    Offset_0x015B68-Spikes_Mappings
                dc.w    Offset_0x015BAA-Spikes_Mappings
                dc.w    Offset_0x015BBC-Spikes_Mappings
                dc.w    Offset_0x015BDE-Spikes_Mappings
                dc.w    Offset_0x015C10-Spikes_Mappings
Offset_0x015B02:
                dc.w    $0002
                dc.l    $F0070000, $0000FFF0, $F0070000, $00000000
Offset_0x015B14:
                dc.w    $0004
                dc.l    $F0070000, $0000FFE0, $F0070000, $0000FFF0
                dc.l    $F0070000, $00000000, $F0070000, $00000010
Offset_0x015B36:
                dc.w    $0006
                dc.l    $F0070000, $0000FFD0, $F0070000, $0000FFE0
                dc.l    $F0070000, $0000FFF0, $F0070000, $00000000
                dc.l    $F0070000, $00000010, $F0070000, $00000020
Offset_0x015B68:
                dc.w    $0008
                dc.l    $F0070000, $0000FFC0, $F0070000, $0000FFD0
                dc.l    $F0070000, $0000FFE0, $F0070000, $0000FFF0
                dc.l    $F0070000, $00000000, $F0070000, $00000010
                dc.l    $F0070000, $00000020, $F0070000, $00000030
Offset_0x015BAA:
                dc.w    $0002
                dc.l    $F00D0000, $0000FFF0, $000D0000, $0000FFF0
Offset_0x015BBC:
                dc.w    $0004
                dc.l    $E00D0000, $0000FFF0, $F00D0000, $0000FFF0
                dc.l    $000D0000, $0000FFF0, $100D0000, $0000FFF0
Offset_0x015BDE:
                dc.w    $0006
                dc.l    $D00D0000, $0000FFF0, $E00D0000, $0000FFF0
                dc.l    $F00D0000, $0000FFF0, $000D0000, $0000FFF0
                dc.l    $100D0000, $0000FFF0, $200D0000, $0000FFF0
Offset_0x015C10:
                dc.w    $0008
                dc.l    $C00D0000, $0000FFF0, $D00D0000, $0000FFF0
                dc.l    $E00D0000, $0000FFF0, $F00D0000, $0000FFF0
                dc.l    $000D0000, $0000FFF0, $100D0000, $0000FFF0
                dc.l    $200D0000, $0000FFF0, $300D0000, $0000FFF0                   
;===============================================================================
; Objeto 0x36 - Espinhos
; [ Término ]
;===============================================================================  