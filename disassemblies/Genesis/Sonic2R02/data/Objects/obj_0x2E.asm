;===============================================================================
; Objeto 0x2E - Objeto utilizado para determinar qual ação tomar ao se destruir
; [ Início ]           um monitor de acordo com o subtipo.
;=============================================================================== 
Offset_0x0127EE:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x0127FC(PC, D0), D1
                jmp     Offset_0x0127FC(PC, D1)
Offset_0x0127FC:
                dc.w    Offset_0x012802-Offset_0x0127FC
                dc.w    Offset_0x012878-Offset_0x0127FC
                dc.w    Offset_0x012C5C-Offset_0x0127FC
Offset_0x012802:
                addq.b  #$02, $0024(A0)
                move.w  #$8680, $0002(A0)
                bsr     ModifySpriteAttr_2P                    ; Offset_0x016CFA
                move.b  #$24, $0001(A0)
                move.b  #$03, $0018(A0)
                move.b  #$08, $0019(A0)
                move.w  #$FD00, $0012(A0)
                moveq   #$00, D0
                move.b  $001C(A0), D0
                tst.w   (Two_Player_Flag).w                          ; $FFFFFFB8
                beq.s   Offset_0x012860
                move.w  ($FFFFFE04).w, D0
                andi.w  #$0007, D0
                addq.w  #$01, D0
                tst.w   ($FFFFFF7E).w
                beq.s   Offset_0x012846
                moveq   #$08, D0
Offset_0x012846:
                cmpi.w  #$0008, D0
                bne.s   Offset_0x01285C
                move.b  ($FFFFFE1E).w, D1
                add.b   ($FFFFFECA).w, D1
                cmpi.b  #$02, D1
                beq.s   Offset_0x01285C
                moveq   #$07, D0
Offset_0x01285C:
                move.b  D0, $001C(A0)
Offset_0x012860:
                addq.b  #$01, D0
                move.b  D0, $001A(A0)
                move.l  #Monitors_Mappings, A1                 ; Offset_0x012CD0
                add.b   D0, D0
                adda.w  $00(A1, D0), A1
                addq.w  #$02, A1
                move.l  A1, $0004(A0)
Offset_0x012878:
                bsr.s   Offset_0x01287E
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x01287E:
                tst.w   $0012(A0)
                bpl     Offset_0x012892
                bsr     SpeedToPos                             ; Offset_0x016332
                addi.w  #$0018, $0012(A0)
                rts
Offset_0x012892:
                addq.b  #$02, $0024(A0)
                move.w  #$001D, $001E(A0)
                move.w  $003E(A0), A1
                lea     ($FFFFFEF4).w, A2
                cmpa.w  #$B000, A1
                beq.s   Offset_0x0128AE
                lea     ($FFFFFEF6).w, A2
Offset_0x0128AE:
                moveq   #$00, D0
                move.b  $001C(A0), D0
                add.w   D0, D0
                move.w  Monitor_Subroutines(PC, D0), D0        ; Offset_0x0128BE
                jmp     Monitor_Subroutines(PC, D0)            ; Offset_0x0128BE
Monitor_Subroutines: ; Offset_0x0128BE:
                dc.w    Monitor_Static-Monitor_Subroutines        ; Offset_0x0128D2
                dc.w    Monitor_SonicLife-Monitor_Subroutines     ; Offset_0x0128D8
                dc.w    Monitor_MilesLife-Monitor_Subroutines     ; Offset_0x0128EE
                dc.w    Monitor_Robotnik-Monitor_Subroutines      ; Offset_0x0128D2
                dc.w    Monitor_Rings-Monitor_Subroutines         ; Offset_0x012904
                dc.w    Monitor_Shoes-Monitor_Subroutines         ; Offset_0x01297A
                dc.w    Monitor_Shield-Monitor_Subroutines        ; Offset_0x0129C6
                dc.w    Monitor_Invincibility-Monitor_Subroutines ; Offset_0x0129F6
                dc.w    Monitor_Teleport-Monitor_Subroutines      ; Offset_0x012A40
                dc.w    Monitor_Random-Monitor_Subroutines        ; Offset_0x012C58
Monitor_Static: ; 
Monitor_Robotnik: ; Offset_0x0128D2:
                addq.w  #$01, (A2)
                bra     Hurt_Player_A1                         ; Offset_0x015A1A
Monitor_SonicLife: ; Offset_0x0128D8:
                addq.w  #$01, ($FFFFFEF4).w
                addq.b  #$01, ($FFFFFE12).w
                addq.b  #$01, ($FFFFFE1C).w
                move.w  #Extra_Life_Snd, D0     ; $0098
                jmp     (Play_Music)                           ; Offset_0x00131A
Monitor_MilesLife: ; Offset_0x0128EE:
                addq.w  #$01, ($FFFFFEF6).w
                addq.b  #$01, ($FFFFFEC6).w
                addq.b  #$01, ($FFFFFEC8).w
                move.w  #Extra_Life_Snd, D0     ; $0098
                jmp     (Play_Music)                           ; Offset_0x00131A
Monitor_Rings: ; Offset_0x012904:
                addq.w  #$01, (A2)
                lea     ($FFFFFE20).w, A2
                lea     ($FFFFFE1D).w, A3
                lea     ($FFFFFE1B).w, A4
                lea     ($FFFFFEF0).w, A5
                cmpa.w  #$B000, A1
                beq.s   Offset_0x01292C
                lea     ($FFFFFED0).w, A2
                lea     ($FFFFFEC9).w, A3
                lea     ($FFFFFEC7).w, A4
                lea     ($FFFFFEF2).w, A5
Offset_0x01292C:
                addi.w  #$000A, (A5)
                cmpi.w  #$03E7, (A5)
                bcs.s   Offset_0x01293A
                move.w  #$03E7, (A5)
Offset_0x01293A:
                addi.w  #$000A, (A2)
                cmpi.w  #$03E7, (A2)
                bcs.s   Offset_0x012948
                move.w  #$03E7, (A2)
Offset_0x012948:
                ori.b   #$01, (A3)
                cmpi.w  #$0064, (A2)
                bcs.s   Offset_0x012964
                bset    #$01, (A4)
                beq.s   Offset_0x01296E
                cmpi.w  #$00C8, (A2)
                bcs.s   Offset_0x012964
                bset    #$02, (A4)
                beq.s   Offset_0x01296E
Offset_0x012964:
                move.w  #Ring_Sfx, D0           ; $00B5
                jmp     (Play_Music)                           ; Offset_0x00131A
Offset_0x01296E:
                cmpa.w  #$B000, A1
                beq     Monitor_SonicLife                      ; Offset_0x0128D8
                bra     Monitor_MilesLife                      ; Offset_0x0128EE
Monitor_Shoes: ; Offset_0x01297A:
                addq.w  #$01, (A2)
                bset    #$02, $002B(A1)
                move.w  #$04B0, $0034(A1)
                cmpa.w  #$B000, A1
                bne.s   Miles_Fast_Speed                       ; Offset_0x0129AA
                cmpi.w  #$0002, (Player_Selected_Flag).w             ; $FFFFFF7A
                beq.s   Miles_Fast_Speed                       ; Offset_0x0129AA
                move.w  #$0C00, ($FFFFF760).w
                move.w  #$0018, ($FFFFF762).w
                move.w  #$0080, ($FFFFF764).w
                bra.s   Monitor_Shoes_Fast_Sound               ; Offset_0x0129BC
Miles_Fast_Speed: ; Offset_0x0129AA:
                move.w  #$0C00, (Miles_Max_Speed).w                  ; $FFFFFEC0
                move.w  #$0018, (Miles_Acceleration).w               ; $FFFFFEC2
                move.w  #$0080, (Miles_Deceleration).w               ; $FFFFFEC4
Monitor_Shoes_Fast_Sound: ; Offset_0x0129BC:
                move.w  #Fast_Sound, D0         ; $00FB
                jmp     (Play_Music)                           ; Offset_0x00131A
Monitor_Shield: ; Offset_0x0129C6:
                addq.w  #$01, (A2)
                bset    #$00, $002B(A1)
                move.w  #Shield_Sfx, D0         ; $00AF
                jsr     (Play_Music)                           ; Offset_0x00131A
                tst.b   $003F(A0)
                bne.s   Offset_0x0129EA
                move.b  #$38, ($FFFFD180).w     ; Carrega o objeto 0x38 - Escudo
                move.w  A1, ($FFFFD1BE).w
                rts
Offset_0x0129EA:
                move.b  #$38, ($FFFFD1C0).w     ; Carrega o objeto 0x38 - Escudo
                move.w  A1, ($FFFFD1FE).w
                rts
Monitor_Invincibility: ; Offset_0x0129F6:
                addq.w  #$01, (A2)
                tst.b   ($FFFFFE19).w
                bne.s   Offset_0x012A3E
                bset    #$01, $002B(A1)
                move.w  #$04B0, $0032(A1)
                tst.b   ($FFFFF7AA).w
                bne.s   Offset_0x012A22
                cmpi.b  #$0C, $0028(A1)
                bls.s   Offset_0x012A22
                move.w  #Invincibility_Snd, D0  ; $0097
                jsr     (Play_Music)                           ; Offset_0x00131A
Offset_0x012A22:
                tst.b   $003F(A0)
                bne.s   Offset_0x012A34
                move.b  #$35, ($FFFFD200).w     ; Carrega o objeto 0x35 - Invencibilidade
                move.w  A1, ($FFFFD23E).w
                rts
Offset_0x012A34:
                move.b  #$35, ($FFFFD300).w     ; Carrega o objeto 0x35 - Invencibilidade
                move.w  A1, ($FFFFD33E).w
Offset_0x012A3E:
                rts
Monitor_Teleport: ; Offset_0x012A40:
                addq.w  #$01, (A2)
                cmpi.b  #$06, ($FFFFB024).w
                bcc.s   Offset_0x012A52
                cmpi.b  #$06, ($FFFFB064).w
                bcs.s   Offset_0x012A54
Offset_0x012A52:
                rts
Offset_0x012A54:
                lea     (Teleport_Swap_Data), A3               ; Offset_0x012BEC
                moveq   #$11, D2
Offset_0x012A5C:
                move.w  (A3)+, A1
                move.w  (A3)+, A2
                move.w  (A3)+, D1
Offset_0x012A62:
                move.w  (A1), D0
                move.w  (A2), (A1)+
                move.w  D0, (A2)+
                dbra    D1, Offset_0x012A62
                dbra    D2, Offset_0x012A5C
                move.b  #$01, ($FFFFB01D).w
                move.b  #$01, ($FFFFB05D).w
                move.b  #$00, ($FFFFB01A).w
                move.b  #$00, ($FFFFB05A).w
                move.b  #$FF, ($FFFFF766).w
                move.b  #$FF, ($FFFFF7DE).w
                move.b  #$FF, ($FFFFF7DF).w
                lea     ($FFFFF786).w, A1
                lea     ($FFFFF789).w, A2
                moveq   #$02, D1
Offset_0x012AA4:
                move.b  (A1), D0
                move.b  (A2), (A1)+
                move.b  D0, (A2)+
                dbra    D1, Offset_0x012AA4
                subi.w  #$0180, ($FFFFEE04).w
                subi.w  #$0180, ($FFFFEE24).w
                move.w  ($FFFFB002).w, D0
                andi.w  #$7FFF, ($FFFFB002).w
                tst.w   ($FFFFB042).w
                bpl.s   Offset_0x012AD0
                ori.w   #$8000, ($FFFFB002).w
Offset_0x012AD0:
                andi.w  #$7FFF, ($FFFFB042).w
                tst.w   D0
                bpl.s   Offset_0x012AE0
                ori.w   #$8000, ($FFFFB042).w
Offset_0x012AE0:
                move.b  #$01, ($FFFFEEDE).w
                lea     ($FFFFB400).w, A1
                moveq   #$6F, D1
Offset_0x012AEC:
                cmpi.b  #$84, (A1)
                beq.s   Offset_0x012AF8
                cmpi.b  #$03, (A1)
                bne.s   Offset_0x012B06
Offset_0x012AF8:
                move.b  $0034(A1), D0
                move.b  $0035(A1), $0034(A1)
                move.b  D0, $0035(A1)
Offset_0x012B06:
                cmpi.b  #$D6, (A1)
                bne.s   Offset_0x012B1A
                move.l  $0030(A1), D0
                move.l  $0034(A1), $0030(A1)
                move.l  D0, $0034(A1)
Offset_0x012B1A:
                cmpi.b  #$85, (A1)
                bne.s   Offset_0x012B2E
                move.b  $0036(A1), D0
                move.b  $0037(A1), $0036(A1)
                move.b  D0, $0037(A1)
Offset_0x012B2E:
                lea     $0040(A1), A1
                dbra    D1, Offset_0x012AEC
                lea     ($FFFFB000).w, A1
                move.b  #$38, ($FFFFD180).w     ; Carrega o objeto 0x38 - Escudo
                move.w  A1, ($FFFFD1BE).w
                move.b  #$35, ($FFFFD200).w     ; Carrega o objeto 0x35 - Invencibilidade
                move.w  A1, ($FFFFD23E).w
                btst    #$02, $0022(A1)
                bne.s   Offset_0x012B62
                move.b  #$13, $0016(A1)
                move.b  #$09, $0017(A1)
Offset_0x012B62:
                btst    #$03, $0022(A1)
                beq.s   Offset_0x012B86
                moveq   #$00, D0
                move.b  $003D(A1), D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A2
                bclr    #$04, $0022(A2)
                bset    #$03, $0022(A2)
Offset_0x012B86:
                lea     ($FFFFB040).w, A1
                move.b  #$38, ($FFFFD1C0).w     ; Carrega o objeto 0x38 - Escudo
                move.w  A1, ($FFFFD1FE).w
                move.b  #$35, ($FFFFD300).w     ; Carrega o objeto 0x35 - Invencibilidade
                move.w  A1, ($FFFFD33E).w
                btst    #$02, $0022(A1)
                bne.s   Offset_0x012BB2
                move.b  #$0F, $0016(A1)
                move.b  #$09, $0017(A1)
Offset_0x012BB2:
                btst    #$03, $0022(A1)
                beq.s   Offset_0x012BD6
                moveq   #$00, D0
                move.b  $003D(A1), D0
                lsl.w   #$06, D0
                addi.l  #$FFFFB000, D0
                move.l  D0, A2
                bclr    #$03, $0022(A2)
                bset    #$04, $0022(A2)
Offset_0x012BD6:
                move.b  #$40, ($FFFFF622).w
                move.b  #$01, ($FFFFF623).w
                move.w  #Teleport_Sfx, D0       ; $00EC
                jmp     (Play_Music)                           ; Offset_0x00131A
;-------------------------------------------------------------------------------
; Dados utilizados para troca de itens entre os jogadores durante o teletransporte
; Formato   Word1, Word2, Word3
; Word 1 => Primeiro endereço de troca
; Word 2 => Segundo endereço de troca
; Word 3 => Quantidade de dados (Words) a serem trocados entre os jogadores   
;-------------------------------------------------------------------------------                 
Teleport_Swap_Data: ; Offset_0x012BEC:
                dc.w    $B008, $B048, $001B
                dc.w    $F76E, $F78C, $0000
                dc.w    $FC00, $F78E, $0000
                dc.w    $F770, $F778, $0003
                dc.w    $F760, $FEC0, $0002
                dc.w    $F712, $F716, $0001
                dc.w    $F71C, $F724, $0003
                dc.w    $EE00, $EE20, $000F
                dc.w    $F7DA, $F7DC, $0000
                dc.w    $EEC8, $EEF8, $0003
                dc.w    $EED0, $EED4, $0001
                dc.w    $EED8, $EEDA, $0000
                dc.w    $EE40, $EE48, $0003
                dc.w    $EE50, $EE58, $0003
                dc.w    $EE60, $EE80, $000F
                dc.w    $EEA0, $EEA8, $0003
                dc.w    $EEB0, $EEB8, $0001
                dc.w    $E500, $E600, $007F
;-------------------------------------------------------------------------------                
Monitor_Random: ; Offset_0x012C58:
                addq.w  #$01, (A2)
                rts
Offset_0x012C5C:
                subq.w  #$01, $001E(A0)
                bmi     DeleteObject                           ; Offset_0x01646C
                bra     DisplaySprite                          ; Offset_0x01647A             
;===============================================================================
; Objeto 0x2E - Objeto utilizado para determinar qual ação tomar ao se destruir
; [ Término ]          um monitor de acordo com o subtipo.
;===============================================================================  