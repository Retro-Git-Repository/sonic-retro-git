;===============================================================================
; Objeto 0x13 - Cachoeiras na Hidden Palace
; [ Início ]
;===============================================================================   
Offset_0x0202DE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0202EC(PC, D0), D1
                jmp     Offset_0x0202EC(PC, D1)
Offset_0x0202EC:
                dc.w    Offset_0x0202F2-Offset_0x0202EC
                dc.w    Offset_0x0203BC-Offset_0x0202EC
                dc.w    Offset_0x020448-Offset_0x0202EC
Offset_0x0202F2:
                addq.b  #$02, $0024(A0)
                move.l  #Hpz_Waterfalls_Mappings, $0004(A0)    ; Offset_0x020462
                move.w  #$E315, $0002(A0)
                jsr     (ModifySpriteAttr_2P)                  ; Offset_0x016CFA
                move.b  #$04, $0001(A0)
                move.b  #$10, $0019(A0)
                move.b  #$01, $0018(A0)
                move.b  #$12, $001A(A0)
                bsr.s   Offset_0x02035C
                move.b  #$A0, $0016(A1)
                bset    #$04, $0001(A1)
                move.l  A1, $0038(A0)
                move.w  $000C(A0), $0034(A0)
                move.w  $000C(A0), $0036(A0)
                cmpi.b  #$10, $0028(A0)
                bcs.s   Offset_0x0203A2
                bsr.s   Offset_0x02035C
                move.l  A1, $003C(A0)
                move.w  $000C(A0), $000C(A1)
                addi.w  #$0098, $000C(A1)
                bra.s   Offset_0x0203A2
Offset_0x02035C:
                jsr     (SingleObjectLoad_2)                   ; Offset_0x017F68
                bne.s   Offset_0x0203A0
                move.b  #$13, $0000(A1)
                addq.b  #$04, $0024(A1)
                move.w  $0008(A0), $0008(A1)
                move.w  $000C(A0), $000C(A1)
                move.l  #Hpz_Waterfalls_Mappings, $0004(A1)    ; Offset_0x020462
                move.w  #$E315, $0002(A1)
                jsr     (Modify_A1_SpriteAttr_2P)              ; Offset_0x016D16
                move.b  #$04, $0001(A1)
                move.b  #$10, $0019(A1)
                move.b  #$01, $0018(A1)
Offset_0x0203A0:
                rts
Offset_0x0203A2:
                moveq   #$00, D1
                move.b  $0028(A0), D1
                move.w  $0034(A0), D0
                subi.w  #$0078, D0
                lsl.w   #$04, D1
                add.w   D1, D0
                move.w  D0, $000C(A0)
                move.w  D0, $0034(A0)
Offset_0x0203BC:
                move.l  $0038(A0), A1
                move.b  #$12, $001A(A0)
                move.w  $0034(A0), D0
                move.w  ($FFFFF646).w, D1
                cmp.w   D0, D1
                bcc.s   Offset_0x0203D4
                move.w  D1, D0
Offset_0x0203D4:
                move.w  D0, $000C(A0)
                sub.w   $0036(A0), D0
                addi.w  #$0080, D0
                bmi.s   Offset_0x020428
                lsr.w   #$04, D0
                move.w  D0, D1
                cmpi.w  #$000F, D0
                bcs.s   Offset_0x0203EE
                moveq   #$0F, D0
Offset_0x0203EE:
                move.b  D0, $001A(A1)
                cmpi.b  #$10, $0028(A0)
                bcs.s   Offset_0x02040E
                move.l  $003C(A0), A1
                subi.w  #$000F, D1
                bcc.s   Offset_0x020406
                moveq   #$00, D1
Offset_0x020406:
                addi.w  #$0013, D1
                move.b  D1, $001A(A1)
Offset_0x02040E:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Obj_0x13_DeleteObject                  ; Offset_0x0207FE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
Offset_0x020428:
                moveq   #$13, D0
                move.b  D0, $001A(A0)
                move.b  D0, $001A(A1)
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Obj_0x13_DeleteObject                  ; Offset_0x0207FE
                rts
Offset_0x020448:
                move.w  $0008(A0), D0
                andi.w  #$FF80, D0
                sub.w   ($FFFFF7DA).w, D0
                cmpi.w  #$0280, D0
                bhi     Obj_0x13_DeleteObject                  ; Offset_0x0207FE
                jmp     (DisplaySprite)                        ; Offset_0x01647A
;-------------------------------------------------------------------------------                
Hpz_Waterfalls_Mappings: ; Offset_0x020462:
                dc.w    Offset_0x02049C-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0204A6-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0204B8-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0204CA-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0204E4-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0204FE-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020520-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020542-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x02056C-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020596-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0205C8-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0205FA-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020634-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x02066E-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0206B0-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0206F2-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x02073C-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x02073C-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x02073C-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x02049A-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x02074E-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020758-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020762-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020774-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x020786-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0207A0-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0207BA-Hpz_Waterfalls_Mappings
                dc.w    Offset_0x0207DC-Hpz_Waterfalls_Mappings 
Offset_0x02049A:
                dc.w    $0000
Offset_0x02049C:
                dc.w    $0001
                dc.l    $800C0010, $0008FFF0
Offset_0x0204A6:
                dc.w    $0002
                dc.l    $800C0010, $0008FFF0, $880D002D, $0016FFF0
Offset_0x0204B8:
                dc.w    $0002
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
Offset_0x0204CA:
                dc.w    $0003
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80D002D, $0016FFF0
Offset_0x0204E4:
                dc.w    $0003
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0
Offset_0x0204FE:
                dc.w    $0004
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80D002D, $0016FFF0
Offset_0x020520:
                dc.w    $0004
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
Offset_0x020542:
                dc.w    $0005
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80D002D, $0016FFF0
Offset_0x02056C:
                dc.w    $0005
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0
Offset_0x020596:
                dc.w    $0006
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0, $080D002D, $0016FFF0
Offset_0x0205C8:
                dc.w    $0006
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0, $080F0000, $0000FFF0
Offset_0x0205FA:
                dc.w    $0007
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0, $080F0000, $0000FFF0
                dc.l    $280D002D, $0016FFF0
Offset_0x020634:
                dc.w    $0007
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0, $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0
Offset_0x02066E:
                dc.w    $0008
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0, $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0, $480D002D, $0016FFF0
Offset_0x0206B0:
                dc.w    $0008
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0, $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0, $480F0000, $0000FFF0
Offset_0x0206F2:
                dc.w    $0009
                dc.l    $800C0010, $0008FFF0, $880F0000, $0000FFF0
                dc.l    $A80F0000, $0000FFF0, $C80F0000, $0000FFF0
                dc.l    $E80F0000, $0000FFF0, $080F0000, $0000FFF0
                dc.l    $280F0000, $0000FFF0, $480F0000, $0000FFF0
                dc.l    $680D002D, $0016FFF0
Offset_0x02073C:
                dc.w    $0002
                dc.l    $F00A0018, $000CFFE8, $F00A0818, $080C0000
Offset_0x02074E:
                dc.w    $0001
                dc.l    $E00D002D, $0016FFF0
Offset_0x020758:
                dc.w    $0001
                dc.l    $E00F0000, $0000FFF0
Offset_0x020762:
                dc.w    $0002
                dc.l    $E00F0000, $0000FFF0, $000D002D, $0016FFF0
Offset_0x020774:
                dc.w    $0002
                dc.l    $E00F0000, $0000FFF0, $000F0000, $0000FFF0
Offset_0x020786:
                dc.w    $0003
                dc.l    $E00F0000, $0000FFF0, $000F0000, $0000FFF0
                dc.l    $200D002D, $0016FFF0
Offset_0x0207A0:
                dc.w    $0003
                dc.l    $E00F0000, $0000FFF0, $000F0000, $0000FFF0
                dc.l    $200F0000, $0000FFF0
Offset_0x0207BA:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFF0, $000F0000, $0000FFF0
                dc.l    $200F0000, $0000FFF0, $400D002D, $0016FFF0
Offset_0x0207DC:
                dc.w    $0004
                dc.l    $E00F0000, $0000FFF0, $000F0000, $0000FFF0
                dc.l    $200F0000, $0000FFF0, $400F0000, $0000FFF0
;-------------------------------------------------------------------------------   
Obj_0x13_DeleteObject: ; Offset_0x0207FE:
                jmp     (DeleteObject)                         ; Offset_0x01646C                  
;===============================================================================
; Objeto 0x13 - Cachoeiras na Hidden Palace
; [ Término ]
;===============================================================================  