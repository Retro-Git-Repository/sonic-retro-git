;===============================================================================
; Objeto 0x0E - Estrelas que aparecem antes da tela título e Sonic e Miles
; [ Início ]    durante a tela título
;===============================================================================  
Offset_0x012DB0:
                moveq   #$00, D0
                move.b  $0024(A0), D0
                move.w  Offset_0x012DBE(PC, D0), D1
                jmp     Offset_0x012DBE(PC, D1)
Offset_0x012DBE:
                dc.w    Offset_0x012DD0-Offset_0x012DBE
                dc.w    Offset_0x012DF0-Offset_0x012DBE
                dc.w    Offset_0x013002-Offset_0x012DBE
                dc.w    Offset_0x013070-Offset_0x012DBE
                dc.w    Offset_0x0130E6-Offset_0x012DBE
                dc.w    Offset_0x01319E-Offset_0x012DBE         
                dc.w    Offset_0x013232-Offset_0x012DBE         
                dc.w    Offset_0x0130AE-Offset_0x012DBE
                dc.w    Offset_0x0131EA-Offset_0x012DBE         
Offset_0x012DD0:
                addq.b  #$02, $0024(A0)
                move.l  #TS_Sonic_Miles_Mappings, $0004(A0)    ; Offset_0x013650
                move.w  #$0150, $0002(A0)
                move.b  #$04, $0018(A0)
                move.b  $0028(A0), $0024(A0)
                bra.s   Offset_0x012DB0
Offset_0x012DF0:
                addq.w  #$01, $0034(A0)
                cmpi.w  #$0120, $0034(A0)
                bcc.s   Offset_0x012E00
                bsr     Offset_0x01345A
Offset_0x012E00:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x012E0E(PC, D0), D1
                jmp     Offset_0x012E0E(PC, D1)
Offset_0x012E0E:
                dc.w    Offset_0x012E22-Offset_0x012E0E
                dc.w    Offset_0x012E5C-Offset_0x012E0E
                dc.w    Offset_0x012E84-Offset_0x012E0E
                dc.w    Offset_0x012EB4-Offset_0x012E0E
                dc.w    Offset_0x012EEE-Offset_0x012E0E
                dc.w    Offset_0x012EFC-Offset_0x012E0E
                dc.w    Offset_0x012F18-Offset_0x012E0E
                dc.w    Offset_0x012F36-Offset_0x012E0E
                dc.w    Offset_0x012F72-Offset_0x012E0E
                dc.w    Offset_0x012FB0-Offset_0x012E0E
Offset_0x012E22:
                addq.b  #$02, $0025(A0)
                move.b  #$05, $001A(A0)
                move.w  #$0110, $0008(A0)
                move.w  #$00E0, $000A(A0)
                lea     ($FFFFB0C0).w, A1
                move.b  #$0E, (A1)         ; Nova instância do objeto na memória
                move.b  #$08, $0028(A1)
                lea     ($FFFFB140).w, A1
                move.b  #$0E, (A1)         ; Nova instância do objeto na memória
                move.b  #$06, $0028(A1)
                moveq   #Flashing_Stars_Sfx, D0 ; $A7
                jmp     (Play_Sfx)                             ; Offset_0x00132C
Offset_0x012E5C:
                cmpi.w  #$0038, $0034(A0)
                bcc.s   Offset_0x012E66
                rts
Offset_0x012E66:
                addq.b  #$02, $0025(A0)
                lea     ($FFFFB100).w, A1
                move.b  #$C9, (A1)         ; Carrega o objeto 0xC9 - Manipulador das paleta da tela título
                move.b  #$00, $0028(A1)
                st      $0030(A0)
                moveq   #Title_Screen_Snd, D0   ; $99
                jmp     (Play_Music)                           ; Offset_0x00131A
Offset_0x012E84:
                cmpi.w  #$0080, $0034(A0)
                bcc.s   Offset_0x012E8E
                rts
Offset_0x012E8E:
                addq.b  #$02, $0025(A0)
                lea     (Offset_0x01338A), A1
                lea     ($FFFFFB00).w, A2
                moveq   #$0F, D6
Offset_0x012E9E:                
                move.w  (A1)+, (A2)+
                dbra    D6, Offset_0x012E9E
Offset_0x012EA4:                
                lea     ($FFFFB180).w, A1
                move.b  #$0E, (A1)         ; Nova instância do objeto na memória
                move.b  #$0E, $0028(A1)   
                rts
Offset_0x012EB4:
                moveq   #$24, D2
                lea     (Offset_0x012FE2), A1
Offset_0x012EBC:                
                move.w  $002A(A0), D0
                addq.w  #$01, D0
                move.w  D0, $002A(A0)
                andi.w  #$0003, D0
                bne.s   Offset_0x012EEA
                move.w  $002C(A0), D1
                addq.w  #$04, D1
                cmp.w   D2, D1
                bcc     Offset_0x0130A6
                move.w  D1, $002C(A0)
                move.l  -$04(A1, D1), D0        ; $FC
                move.w  D0, $000A(A0)
                swap.w  D0
                move.w  D0, $0008(A0)
Offset_0x012EEA:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012EEE:
                lea     (Offset_0x01362E), A1
                bsr     AnimateSprite                          ; Offset_0x0164CA
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012EFC:
                addq.b  #$02, $0025(A0)
                move.b  #$12, $001A(A0)
                lea     ($FFFFB1C0).w, A1
                move.b  #$0E, (A1)         ; Nova instância do objeto na memória
                move.b  #$0A, $0028(A1)
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012F18:
                cmpi.w  #$00C0, $0034(A0)
                bcs.s   Offset_0x012F32
                addq.b  #$02, $0025(A0)
                lea     ($FFFFB080).w, A1
                move.b  #$0E, (A1)         ; Nova instância do objeto na memória
                move.b  #$04, $0028(A1)
Offset_0x012F32:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012F36:
                cmpi.w  #$0120, $0034(A0)
                bcs.s   Offset_0x012F6E
                addq.b  #$02, $0025(A0)
                clr.w   $002C(A0)
                st      $002F(A0)
                lea     ($FFFFFB40).w, A1
                move.w  #$0EEE, D0
                moveq   #$0F, D6
Offset_0x012F54:                
                move.w  D0, (A1)+
                dbra    D6, Offset_0x012F54
                lea     ($FFFFB240).w, A1
                move.b  #$C9, (A1)         ; Carrega o objeto 0xC9 - Manipulador das paleta da tela título
                move.b  #$02, $0028(A1)
                move.b  #$0F, ($FFFFB400).w
Offset_0x012F6E:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012F72:
                btst    #$06, ($FFFFFFD8).w
                beq.s   Offset_0x012F86
                cmpi.w  #$0190, $0034(A0)
                beq.s   Offset_0x012F92
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012F86:
                cmpi.w  #$01D0, $0034(A0)
                beq.s   Offset_0x012F92
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012F92:
                lea     ($FFFFB440).w, A1
                move.b  #$0E, (A1)         ; Nova instância do objeto na memória
                move.b  #$0C, $0028(A1)
                addq.b  #$02, $0025(A0)
                lea     ($FFFFB180).w, A1
                bsr     Delete_A1_Object                       ; Offset_0x01646E
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x012FB0:
                move.b  ($FFFFFE0F).w, D0
                andi.b  #$07, D0
                bne.s   Offset_0x012FD2
                move.w  $002C(A0), D0
                addq.w  #$02, D0
                cmpi.w  #$000C, D0
                bcs.s   Offset_0x012FC8
                moveq   #$00, D0
Offset_0x012FC8:
                move.w  D0, $002C(A0)
                move.w  Offset_0x012FD6(PC, D0), ($FFFFFB4A).w
Offset_0x012FD2:
                bra     DisplaySprite                          ; Offset_0x01647A  
;-------------------------------------------------------------------------------  
Offset_0x012FD6:
                dc.w    $0E64, $0E86, $0E64, $0EA8, $0E64, $0ECA   
;-------------------------------------------------------------------------------                 
Offset_0x012FE2:
                dc.w    $0108, $00D0, $0100, $00C0, $00F8, $00B0, $00F6, $00A6
                dc.w    $00FA, $009E, $0100, $009A, $0104, $0099, $0108, $0098  
;-------------------------------------------------------------------------------
Offset_0x013002:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x013010(PC, D0), D1
                jmp     Offset_0x013010(PC, D1)
Offset_0x013010:
                dc.w    Offset_0x01301A-Offset_0x013010
                dc.w    Offset_0x013032-Offset_0x013010
                dc.w    Offset_0x012EEE-Offset_0x013010
                dc.w    Offset_0x01303E-Offset_0x013010
                dc.w    Offset_0x013050-Offset_0x013010
Offset_0x01301A:
                addq.b  #$02, $0025(A0)
                move.w  #$00D8, $0008(A0)
                move.w  #$00D8, $000A(A0)
                move.b  #$01, $001C(A0)
                rts                                 
Offset_0x013032:
                moveq   #$20, D2
                lea     (Offset_0x013054), A1
                bra     Offset_0x012EBC
Offset_0x01303E:
                addq.b  #$02, $0025(A0)
                lea     ($FFFFB200).w, A1
                move.b  #$0E, (A1)
                move.b  #$10, $0028(A1)
Offset_0x013050:
                bra     DisplaySprite                          ; Offset_0x01647A             
;-------------------------------------------------------------------------------
Offset_0x013054:
                dc.w    $00D7, $00C8, $00D3, $00B8, $00CE, $00AC, $00CC, $00A6
                dc.w    $00CA, $00A2, $00C9, $00A1, $00C8, $00A0  
;-------------------------------------------------------------------------------   
Offset_0x013070:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x01307E(PC, D0), D1
                jmp     Offset_0x01307E(PC, D1)
Offset_0x01307E:
                dc.w    Offset_0x013082-Offset_0x01307E
                dc.w    Offset_0x0130AA-Offset_0x01307E
Offset_0x013082:
                move.b  #$0B, $001A(A0)
                tst.b   ($FFFFFFD8).w
                bmi.s   Offset_0x013094
                move.b  #$0A, $001A(A0)
Offset_0x013094:
                move.b  #$02, $0018(A0)
                move.w  #$0120, $0008(A0)
                move.w  #$00E8, $000A(A0)
Offset_0x0130A6:
                addq.b  #$02, $0025(A0)
Offset_0x0130AA:
                bra     DisplaySprite                          ; Offset_0x01647A                    
Offset_0x0130AE:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0130BC(PC, D0), D1
                jmp     Offset_0x0130BC(PC, D1)
Offset_0x0130BC:
                dc.w    Offset_0x0130C0-Offset_0x0130BC
                dc.w    Offset_0x0130E2-Offset_0x0130BC
Offset_0x0130C0:
                addq.b  #$02, $0025(A0)
                move.w  #$0000, $0002(A0)
                move.b  #$11, $001A(A0)
                move.b  #$02, $0018(A0)
                move.w  #$0100, $0008(A0)
                move.w  #$00F0, $000A(A0)
Offset_0x0130E2:
                bra     DisplaySprite                          ; Offset_0x01647A
                
Offset_0x0130E6:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0130F4(PC, D0), D1
                jmp     Offset_0x0130F4(PC, D1)                              
Offset_0x0130F4:
                dc.w    Offset_0x0130FC-Offset_0x0130F4
                dc.w    Offset_0x012EEE-Offset_0x0130F4
                dc.w    Offset_0x01312C-Offset_0x0130F4
                dc.w    Offset_0x01313A-Offset_0x0130F4                 
Offset_0x0130FC:
                addq.b  #$02, $0025(A0)
                move.b  #$0C, $001A(A0)
                ori.w   #$8000, $0002(A0)
                move.b  #$02, $001C(A0)
                move.b  #$01, $0018(A0)
                move.w  #$0100, $0008(A0)
                move.w  #$00A8, $000A(A0)
                move.w  #$0004, $002A(A0)
                rts
Offset_0x01312C:
                subq.w  #$01, $002A(A0)
                bmi.s   Offset_0x013134
                rts 
Offset_0x013134:
                addq.b  #$02, $0025(A0)
                rts
Offset_0x01313A:
                move.b  #$02, $0025(A0)
                move.b  #$00, $001B(A0)
                move.b  #$00, $001E(A0)
                move.w  #$0006, $002A(A0)
                move.w  $002C(A0), D0
                addq.w  #$04, D0
                cmpi.w  #$0028, D0
                bcc     DeleteObject                           ; Offset_0x01646C
                move.w  D0, $002C(A0)
                move.l  Offset_0x01317A-$04(PC, D0), D0
                move.w  D0, $000A(A0)
                swap.w  D0
                move.w  D0, $0008(A0)
                moveq   #Flashing_Stars_Sfx, D0 ; $A7
                jmp     (Play_Sfx)                             ; Offset_0x00132C
;-------------------------------------------------------------------------------                  
Offset_0x01317A:
                dc.w    $00DA, $00F2, $0170, $00F8, $0132, $0131, $019E, $00A2
                dc.w    $00C0, $00E3, $0180, $00E0, $010D, $013B, $00C0, $00AB
                dc.w    $0165, $0107     
;-------------------------------------------------------------------------------  
Offset_0x01319E:
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0131AC(PC, D0), D1
                jmp     Offset_0x0131AC(PC, D1)
Offset_0x0131AC:
                dc.w    Offset_0x0131B2-Offset_0x0131AC
                dc.w    Offset_0x0131D2-Offset_0x0131AC
                dc.w    Offset_0x0131CE-Offset_0x0131AC
Offset_0x0131B2:
                addq.b  #$02, $0025(A0)
                move.b  #$09, $001A(A0)
                move.b  #$03, $0018(A0)
                move.w  #$0145, $0008(A0)
                move.w  #$00BF, $000A(A0)
Offset_0x0131CE:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x0131D2:
                moveq   #$10, D2
                lea     (Offset_0x0131DE), A1
                bra     Offset_0x012EBC
Offset_0x0131DE:
;-------------------------------------------------------------------------------      
                dc.b    $01, $43, $00, $C1, $01, $40, $00, $C2, $01, $41, $00, $C1
;-------------------------------------------------------------------------------                
Offset_0x0131EA: 
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x0131F8(PC, D0), D1
                jmp     Offset_0x0131F8(PC, D1)
Offset_0x0131F8:
                dc.w    Offset_0x0131FE-Offset_0x0131F8
                dc.w    Offset_0x01321E-Offset_0x0131F8
                dc.w    Offset_0x01321A-Offset_0x0131F8
Offset_0x0131FE:
                addq.b  #$02, $0025(A0)
                move.b  #$13, $001A(A0)
                move.b  #$03, $0018(A0)
                move.w  #$010F, $0008(A0)
                move.w  #$00D5, $000A(A0)
Offset_0x01321A:
                bra     DisplaySprite                          ; Offset_0x01647A
Offset_0x01321E:
                moveq   #$0C, D2
                lea     (Offset_0x01322A), A1
                bra     Offset_0x012EBC
;-------------------------------------------------------------------------------                    
Offset_0x01322A:
                dc.b    $01, $0C, $00, $D0, $01, $0D, $00, $D1
;-------------------------------------------------------------------------------                             
Offset_0x013232: 
                moveq   #$00, D0
                move.b  $0025(A0), D0
                move.w  Offset_0x013240(PC, D0), D1
                jmp     Offset_0x013240(PC, D1)
Offset_0x013240:
                dc.w    Offset_0x013244-Offset_0x013240
                dc.w    Offset_0x013270-Offset_0x013240
Offset_0x013244:
                addq.b  #$02, $0025(A0)
                move.b  #$0C, $001A(A0)
                move.b  #$05, $0018(A0)
                move.w  #$0170, $0008(A0)
                move.w  #$0080, $000A(A0)
                move.b  #$03, $001C(A0)
                move.w  #$008C, $002A(A0)
                bra     DisplaySprite                          ; Offset_0x01647A 
Offset_0x013270:
                subq.w  #$01, $002A(A0)
                bmi     DeleteObject                           ; Offset_0x01646C
                subq.w  #$02, $0008(A0)
                addq.w  #$01, $000A(A0)
                lea     (Offset_0x01362E), A1
                bsr     AnimateSprite                          ; Offset_0x0164CA
                bra     DisplaySprite                          ; Offset_0x01647A                                                                                                                                                                                                                                                                                                                                                                                                   
;===============================================================================
; Objeto 0x0E - Estrelas que aparecem antes da tela título e Sonic e Miles
; [ Término ]   durante a tela título
;===============================================================================  