;===============================================================================
; Objeto 0x7B - Molas sobre os tubos na Chemical Plant 
; [ Início ]  
;===============================================================================       
Offset_0x029280:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0292BA(PC, D0), D1
                jsr     Offset_0x0292BA(PC, D1)
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x02929A
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x02929A:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Offset_0x0292B4
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x0292B4:
                jmp     (DeleteObject)                         ; Offset_0x01646C
Offset_0x0292BA:
                dc.w    Offset_0x0292C2-Offset_0x0292BA
                dc.w    Offset_0x0292FA-Offset_0x0292BA
Offset_0x0292BE:
                dc.w    $F000, $F580
Offset_0x0292C2:
                addq.b  #$02, $0024(A0)
                move.l  #Spring_Tubes_Mappings, $0004(A0)      ; Offset_0x029482
                move.w  #$03E0, $0002(A0)
                ori.b   #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  $0028(A0), D0
                andi.w  #$0002, D0
                move.w  Offset_0x0292BE(PC, D0), $0030(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
Offset_0x0292FA:
                cmpi.b  #$01, $001A(A0)
                beq.s   Offset_0x029348
                move.w  #$001B, D1
                move.w  #$0008, D2
                move.w  #$0010, D3
                move.w  $0008(A0), D4
                lea     ($FFFFB000).w, A1
                moveq   #$03, D6
                movem.l D1-D4, -(A7)
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    #$03, $0022(A0)
                beq.s   Offset_0x02932E
                bsr     Offset_0x0293C4
Offset_0x02932E:
                movem.l (A7)+, D1-D4
                lea     ($FFFFB040).w, A1
                moveq   #$04, D6
                jsr     (SolidObject_2_A1)                     ; Offset_0x0196FC
                btst    #$04, $0022(A0)
                beq.s   Offset_0x029348
                bsr.s   Offset_0x0293C4
Offset_0x029348:
                move.w  $0008(A0), D4
                move.w  D4, D5
                subi.w  #$0010, D4
                addi.w  #$0010, D5
                move.w  $000C(A0), D2
                move.w  D2, D3
                addi.w  #$0030, D3
                move.w  ($FFFFB008).w, D0
                cmp.w   D4, D0
                bcs.s   Offset_0x029386
                cmp.w   D5, D0
                bcc.s   Offset_0x029386
                move.w  ($FFFFB00C).w, D0
                cmp.w   D2, D0
                bcs.s   Offset_0x029386
                cmp.w   D3, D0
                bcc.s   Offset_0x029386
                cmpi.b  #$02, $001D(A0)
                beq.s   Offset_0x029386
                move.b  #$02, $001C(A0)
Offset_0x029386:
                move.w  ($FFFFB048).w, D0
                cmp.w   D4, D0
                bcs.s   Offset_0x0293B6
                cmp.w   D5, D0
                bcc.s   Offset_0x0293B6
                move.w  ($FFFFB04C).w, D0
                cmp.w   D2, D0
                bcs.s   Offset_0x0293B6
                cmp.w   D3, D0
                bcc.s   Offset_0x0293B6
                cmpi.w  #$0004, ($FFFFF708).w
                beq     Offset_0x0293B6
                cmpi.b  #$03, $001D(A0)
                beq.s   Offset_0x0293B6
                move.b  #$03, $001C(A0)
Offset_0x0293B6:
                lea     (Spring_Tube_Animate_Data), A1         ; Offset_0x02946A
                jmp     (AnimateSprite)                        ; Offset_0x0164CA
                rts
Offset_0x0293C4:
                move.w  #$0100, $001C(A0)
                addq.w  #$04, $000C(A1)
                move.w  $0030(A0), $0012(A1)
                bset    #$01, $0022(A1)
                bclr    #$03, $0022(A1)
                move.b  #$10, $001C(A1)
                move.b  #$02, $0024(A1)
                move.b  $0028(A0), D0
                bpl.s   Offset_0x0293F8
                move.w  #$0000, $0010(A1)
Offset_0x0293F8:
                btst    #$00, D0
                beq.s   Offset_0x029438
                move.w  #$0001, $0014(A1)
                move.b  #$01, $0027(A1)
                move.b  #$00, $001C(A1)
                move.b  #$00, $002C(A1)
                move.b  #$04, $002D(A1)
                btst    #$01, D0
                bne.s   Offset_0x029428
                move.b  #$01, $002C(A1)
Offset_0x029428:
                btst    #$00, $0022(A1)
                beq.s   Offset_0x029438
                neg.b   $0027(A1)
                neg.w   $0014(A1)
Offset_0x029438:
                andi.b  #$0C, D0
                cmpi.b  #$04, D0
                bne.s   Offset_0x02944E
                move.b  #$0C, $003E(A1)
                move.b  #$0D, $003F(A1)
Offset_0x02944E:
                cmpi.b  #$08, D0
                bne.s   Offset_0x029460
                move.b  #$0E, $003E(A1)
                move.b  #$0F, $003F(A1)
Offset_0x029460:
                move.w  #Spring_Sfx, D0         ; $00CC
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------
Spring_Tube_Animate_Data: ; Offset_0x02946A:
                dc.w    Offset_0x029472-Spring_Tube_Animate_Data
                dc.w    Offset_0x029476-Spring_Tube_Animate_Data
                dc.w    Offset_0x02947A-Spring_Tube_Animate_Data
                dc.w    Offset_0x02947A-Spring_Tube_Animate_Data
Offset_0x029472:
                dc.b    $0F, $00, $FF, $00
Offset_0x029476:
                dc.b    $00, $03, $FD, $00
Offset_0x02947A:
                dc.b    $05, $01, $02, $02, $02, $04, $FD, $00
;-------------------------------------------------------------------------------
Spring_Tubes_Mappings: ; Offset_0x029482:
                dc.w    Offset_0x02948C-Spring_Tubes_Mappings
                dc.w    Offset_0x029496-Spring_Tubes_Mappings
                dc.w    Offset_0x0294A8-Spring_Tubes_Mappings
                dc.w    Offset_0x0294BA-Spring_Tubes_Mappings
                dc.w    Offset_0x029496-Spring_Tubes_Mappings
Offset_0x02948C:
                dc.w    $0001
                dc.l    $F00D0000, $0000FFF0
Offset_0x029496:
                dc.w    $0002
                dc.l    $E0070008, $0004FFF0, $E0070808, $08040000
Offset_0x0294A8:
                dc.w    $0002
                dc.l    $E0070010, $0008FFF0, $E0070810, $08080000
Offset_0x0294BA:
                dc.w    $0001
                dc.l    $F00D0018, $000CFFF0
;===============================================================================
; Objeto 0x7B - Molas sobre os tubos na Chemical Plant
; [ Término ]    
;===============================================================================  