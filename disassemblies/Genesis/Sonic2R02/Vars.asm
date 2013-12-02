; constants

; z80 RAM
Z80_RAM_Start           equ $00A00000 ; start of Z80 RAM
Z80_Port_1_Control      equ $00A10008
Z80_Expansion_Control   equ $00A1000C
Z80_Bus_Request         equ $00A11100
Z80_Reset               equ $00A11200

; VDP
VDP_Data_Port           equ $00C00000
VDP_Control_Port        equ $00C00004 
Color_RAM_Address       equ $C0000000

; M68k RAM
StackPointer            equ $00FFFE00   
Fg_Mem_Start_Address    equ $FFFF8000
Bg_Mem_Start_Address    equ $FFFF8080
Blocks_Mem_Address      equ $FFFF9000
Miles_Level_Limite      equ $FFFFEEF8
Miles_Level_Limite_X    equ $FFFFEEFA
Miles_Floor_Detect      equ $FFFFEEFE
Game_Mode               equ $FFFFF600 
VBlank_Index            equ $FFFFF62A 
Refresh_Level_Layout    equ $FFFFF72C
Water_Level_Flag        equ $FFFFF730
Boss_Flag               equ $FFFFF7AA
Debug_Mode_Flag_Index   equ $FFFFFE08
Level_Id                equ $FFFFFE10
Act_Id                  equ $FFFFFE11
Stage_Id                equ $FFFFFE16
Super_Sonic_Flag        equ $FFFFFE19
HUD_Rings_Refresh_Flag  equ $FFFFFE1D
HUD_Timer_Refresh_Flag  equ $FFFFFE1E
HUD_Score_Refresh_Flag  equ $FFFFFE1F
Saved_Level_Flag        equ $FFFFFE30
Miles_Max_Speed         equ $FFFFFEC0
Miles_Acceleration      equ $FFFFFEC2
Miles_Deceleration      equ $FFFFFEC4
Sound_Test_Sound        equ $FFFFFF64 ; Som selecionado no Sound Test "*00*"
Level_Music_Buffer      equ $FFFFFF70
Player_Selected_Flag    equ $FFFFFF7A
Player_Select_Flag      equ $FFFFFF7C   
Two_Player_Items_Mode   equ $FFFFFF7E ; Item selecionado no modo 2 jogadores "All Kinds Items" / "Teleport Only" 
Emeralds_Count          equ $FFFFFF91
End_Level_Flag          equ $FFFFFFA8    
Two_Player_Flag         equ $FFFFFFB8
Hardware_Id             equ $FFFFFFD8   
Debug_Mode_Active       equ $FFFFFFDA

; Game Modes
gm_SegaScreen           equ  $00
gm_TitleScreen          equ  $04
gm_DemoMode             equ  $08
gm_PlayMode             equ  $0C  
gm_SpecialStage         equ  $10
gm_Continue             equ  $14
gm_Two_Player_Results   equ  $18  
gm_Versus_Mode_Menu     equ  $1C
gm_Ending_Sequence      equ  $20
gm_Options_Menu         equ  $24
gm_Level_Select_Menu    equ  $28

; Sounds  
Main_Menu_Snd           equ  $0091
Special_Stage_Snd       equ  $0092
Boss_Snd                equ  $0093
End_Sequence_Snd        equ -$006B ; $0095
Super_Sonic_Snd         equ  $0096 
Invincibility_Snd       equ  $0097 
Extra_Life_Snd          equ  $0098 
Title_Screen_Snd        equ -$0067 ; $0099
Results_Snd             equ  $009A
Time_Game_Over_Snd      equ  $009B 
Continue_Snd            equ  $009C
Emerald_Snd             equ  $009D 
Credits_Snd             equ -$0062 ; $009E
Panic_Snd               equ  $009F 
 
; Sfx (Efeitos sonoros)
Jump_Sfx                equ  $00A0
; Star_Post_Touch_Sfx   equ  $00A1
Check_Point_Sfx         equ  $00A1
Enemy_Touch_Sfx         equ  $00A3
Stopping_Sfx            equ  $00A4
Spike_Touch_Sfx         equ  $00A6
Flashing_Stars_Sfx      equ -$0059 ; $00A7 
Water_Splash_Sfx        equ  $00AA
Boss_Hit_Sfx            equ  $00AC
Collect_Oxygen_Sfx      equ  $00AD
Lava_Sfx                equ  $00AE
Shield_Sfx              equ  $00AF
Drowning_Sfx            equ  $00B2
Bumper_Sfx              equ  $00B4
Ring_Sfx                equ  $00B5
Spike_Moving_Sfx        equ  $00B6
Collapse_Sfx            equ  $00B9
Door_Sfx                equ  $00BB
Spindash_Release_Sfx    equ  $00BC
Spin_Sfx                equ  $00BE
Extra_Continue_Sfx      equ  $00BF
Object_Hit_Sfx          equ  $00C1
Underwater_Sfx          equ  $00C2
Explosion_Sfx           equ  $00C4
Results_Ring_Sfx        equ  $00C5
Ring_Lost_Sfx           equ  $00C6
; Ring_Out_Sfx          equ  $00C6
Hidden_Bonus_Sfx        equ  $00C9
Special_Stage_Sfx       equ  $00CA
Break_Wall_Sfx          equ  $00CB
Spring_Sfx              equ  $00CC
Select_Sfx              equ -$0033 ; $00CD
Add_Point_Sfx           equ  $00CD
Switch_Pressed_Sfx      equ  $00CD
Panel_Spinning_Sfx      equ  $00CF
Vs_Level_Clear_Sfx      equ  $00D3
Metal_Colision_Sfx      equ  $00D5
Platform_Colision_Sfx   equ  $00D7
Bumper_Touch_Sfx        equ  $00D9
Worms_Out_Sfx           equ  $00DA
Super_Sonic_Change_Sfx  equ  $00DF   
Spindash_Sfx            equ  $00E0
Earthquake_Sfx          equ  $00E1
Teleferics_Move_Sfx     equ  $00E4
Leaves_Sfx              equ  $00E5
Teleport_Sfx            equ  $00EC

; Flags especiais 
Volume_Down             equ  $00F9
Sega_Sound              equ  $00FA
Fast_Sound              equ  $00FB
Normal_Sound            equ  $00FC
Stop_Sound              equ  $00FD

; Variaveis para selecionar qual letra dos Title Cards devem ser carregadas para
; a VRAM
TC_A                    equ  $0004
TC_B                    equ  $0404
TC_C                    equ  $0804
TC_D                    equ  $0C04
TC_F                    equ  $1004
TC_G                    equ  $1404
TC_H                    equ  $1804
TC_I                    equ  $1C02
TC_J                    equ  $1E04
TC_K                    equ  $2204
TC_L                    equ  $2604
TC_M                    equ  $2A06
TC_P                    equ  $3004
TC_Q                    equ  $3404
TC_R                    equ  $3804
TC_S                    equ  $3C04
TC_T                    equ  $4004
TC_U                    equ  $4404
TC_V                    equ  $4804
TC_W                    equ  $4C06
TC_X                    equ  $5204
TC_Y                    equ  $5604  
TCpt                    equ  $5A02   ; "." 
TC_Break                equ  $FFFF

; Copyright na tela título
___                     equ  $0000
__1                     equ  $0681 
__2                     equ  $0682              
__9                     equ  $0689 
_Cp                     equ  $068B  ; (C)
__A                     equ  $068E  
__E                     equ  $0692
__G                     equ  $0694
__S                     equ  $06A0     

; Variaveis para os menus exceto seleção de fases que é comprimido
__                      equ  $00
_0                      equ  $10
_1                      equ  $11
_2                      equ  $12
_st                     equ  $1A  ; estrela no sound test
_A                      equ  $1E
_B                      equ  $1F 
_C                      equ  $20
_D                      equ  $21
_E                      equ  $22
_F                      equ  $23
_G                      equ  $24
_H                      equ  $25 
_I                      equ  $26
_J                      equ  $27
_K                      equ  $28
_L                      equ  $29
_M                      equ  $2A 
_N                      equ  $2B 
_O                      equ  $2C
_P                      equ  $2D
_Q                      equ  $2E
_R                      equ  $2F
_S                      equ  $30
_T                      equ  $31
_U                      equ  $32
_V                      equ  $33
_W                      equ  $34
_X                      equ  $35
_Y                      equ  $36
_Z                      equ  $37  
                        
; String para localizar ponteiro em hexadecimal depois de compilado
Debug                   equ  'Neto'                        