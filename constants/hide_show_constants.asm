DEF HIDE EQU $11
DEF SHOW EQU $15

; MissableObjects indexes (see data/maps/hide_show_data.asm)
; this is a list of the sprites that can be enabled/disabled during the game
; sprites marked with an X are constants that are never used
; because those sprites are not (de)activated in a map's script
; (they are either items or sprites that deactivate after battle
; and are detected in wMissableObjectList)
; However, these constants are still required to synchronise properly
; Factoring in the hide/show list, so you can't just remove them.

	const_def
	const HS_PALLET_TOWN_OAK               ; 00
	const HS_LYING_OLD_MAN                 ; 01
	const HS_OLD_MAN                       ; 02
	const HS_MUSEUM_GUY                    ; 03
	const HS_GYM_GUY                       ; 04
	const HS_CERULEAN_RIVAL                ; 05
	const HS_CERULEAN_ROCKET               ; 06
	const HS_CERULEAN_GUARD_1              ; 07
	const HS_CERULEAN_CAVE_GUY             ; 08
	const HS_CERULEAN_GUARD_2              ; 09
	const HS_VERMILION_JENNY               ; 0A
	const HS_SAFFRON_CITY_1                ; 0B
	const HS_SAFFRON_CITY_2                ; 0C
	const HS_SAFFRON_CITY_3                ; 0D
	const HS_SAFFRON_CITY_4                ; 0E
	const HS_SAFFRON_CITY_5                ; 0F
	const HS_SAFFRON_CITY_6                ; 10
	const HS_SAFFRON_CITY_7                ; 11
	const HS_SAFFRON_CITY_8                ; 12
	const HS_SAFFRON_CITY_9                ; 13
	const HS_SAFFRON_CITY_A                ; 14
	const HS_SAFFRON_CITY_B                ; 15
	const HS_SAFFRON_CITY_C                ; 16
	const HS_SAFFRON_CITY_D                ; 17
	const HS_SAFFRON_CITY_E                ; 18
	const HS_SAFFRON_CITY_F                ; 19
	const HS_ROUTE_1_OAK                   ; 1A
	const HS_ROUTE_2_ITEM_1                ; 1B X
	const HS_ROUTE_2_ITEM_2                ; 1C X
	const HS_ROUTE_4_ITEM                  ; 1D X
	const HS_ROUTE_9_ITEM                  ; 1E X
	const HS_ROUTE_12_SNORLAX              ; 1F
	const HS_ROUTE_12_ITEM_1               ; 20 X
	const HS_ROUTE_12_ITEM_2               ; 21 X
	const HS_ROUTE_15_ITEM                 ; 22 X
	const HS_ROUTE_16_SNORLAX              ; 23
	const HS_ROUTE_22_RIVAL_1              ; 24
	const HS_ROUTE_22_RIVAL_2              ; 25
	const HS_NUGGET_BRIDGE_GUY             ; 26
	const HS_ROUTE_24_ITEM                 ; 27 X
	const HS_DAMIEN                        ; 28
	const HS_ROUTE_25_ITEM                 ; 29 X
	const HS_CACTUS                        ; 2A
	const HS_BRUNSWICK_ZAPDOS_G_1          ; 2B
	const HS_BRUNSWICK_TRAIL_ITEM1
	const HS_DAISY_SITTING                 ; 2C
	const HS_DAISY_WALKING                 ; 2D
	const HS_TOWN_MAP                      ; 2E
	const HS_OAKS_LAB_RIVAL                ; 2F
	const HS_STARTER_BALL_1                ; 30
	const HS_STARTER_BALL_2                ; 31
	const HS_STARTER_BALL_3                ; 32
	const HS_OAKS_LAB_OAK_1                ; 33
	const HS_STARTER_BALL_4                ; 34, was dex, pikachu
	const HS_STARTER_BALL_5                ; 35, was dex, eevee
	const HS_OAKS_LAB_OAK_2                ; 36
	const HS_VIRIDIAN_GYM_GIOVANNI         ; 37
	const HS_VIRIDIAN_GYM_ITEM             ; 38 X
	const HS_OLD_AMBER                     ; 39
	const HS_CERULEAN_CAVE_1F_ITEM_1       ; 3A X
	const HS_CERULEAN_CAVE_1F_ITEM_2       ; 3B X
	const HS_CERULEAN_CAVE_1F_ITEM_3       ; 3C X
	const HS_MOLTRES_G                     ; 3D X
	const HS_POKEMON_TOWER_2F_RIVAL        ; 3E
	const HS_BRUNSWICK_ZAPDOS_G_2          ; 3F
	const HS_POKEMON_TOWER_5F_ITEM         ; 40 X
	const HS_POKEMON_TOWER_6F_ITEM_1       ; 41 X
	const HS_POKEMON_TOWER_6F_ITEM_2       ; 42 X
	const HS_POKEMON_TOWER_7F_JESSIE       ; 43
	const HS_POKEMON_TOWER_7F_JAMES        ; 44
	const HS_POKEMON_TOWER_7F_MR_FUJI      ; 45
	const HS_MR_FUJIS_HOUSE_MR_FUJI        ; 46
	const HS_MORIMOTO
	const HS_CELADON_MANSION_EEVEE_GIFT    ; 47
	const HS_GAME_CORNER_ROCKET            ; 48
	const HS_WARDENS_HOUSE_ITEM            ; 49 X
	const HS_POKEMON_MANSION_1F_ITEM_1     ; 4A X
	const HS_POKEMON_MANSION_1F_ITEM_2     ; 4B X
	const HS_FIGHTING_DOJO_GIFT_1          ; 4C
	const HS_FIGHTING_DOJO_GIFT_2          ; 4D
	const HS_FIGHTING_DOJO_GIFT_3          ; 4E
	const HS_SILPH_CO_1F_RECEPTIONIST      ; 4F
	const HS_VOLTORB_1                     ; 50 X
	const HS_VOLTORB_2                     ; 51 X
	const HS_VOLTORB_3                     ; 52 X
	const HS_ELECTRODE_1                   ; 53 X
	const HS_VOLTORB_4                     ; 54 X
	const HS_VOLTORB_5                     ; 55 X
	const HS_ELECTRODE_2                   ; 56 X
	const HS_VOLTORB_6                     ; 57 X
	const HS_ZAPDOS                        ; 58 X
	const HS_POWER_PLANT_ITEM_1            ; 59 X
	const HS_POWER_PLANT_ITEM_2            ; 5A X
	const HS_POWER_PLANT_ITEM_3            ; 5B X
	const HS_POWER_PLANT_ITEM_4            ; 5C X
	const HS_POWER_PLANT_ITEM_5            ; 5D X
	const HS_VICTORY_ROAD_2F_ITEM_0        ; 5E X
	const HS_VICTORY_ROAD_2F_ITEM_1        ; 5F X
	const HS_VICTORY_ROAD_2F_ITEM_2        ; 60 X
	const HS_VICTORY_ROAD_2F_ITEM_3        ; 61 X
	const HS_VICTORY_ROAD_2F_ITEM_4        ; 62 X
	const HS_VICTORY_ROAD_2F_BOULDER       ; 63
	const HS_BILL_POKEMON                  ; 64
	const HS_BILL_1                        ; 65
	const HS_BILL_2                        ; 66
	const HS_BILLS_NIDORINO                ; 67
	const HS_VIRIDIAN_FOREST_ITEM_1        ; 68 X
	const HS_VIRIDIAN_FOREST_ITEM_2        ; 69 X
	const HS_VIRIDIAN_FOREST_ITEM_3        ; 6A X
	const HS_MT_MOON_1F_ITEM_1             ; 6B X
	const HS_MT_MOON_1F_ITEM_2             ; 6C X
	const HS_MT_MOON_1F_ITEM_3             ; 6D X
	const HS_MT_MOON_1F_ITEM_4             ; 6E X
	const HS_MT_MOON_1F_ITEM_5             ; 6F X
	const HS_MT_MOON_1F_ITEM_6             ; 70 X
	const HS_MT_MOON_B2F_JESSIE            ; 71
	const HS_MT_MOON_B2F_JAMES             ; 72
	const HS_MT_MOON_B2F_FOSSIL_1          ; 73
	const HS_MT_MOON_B2F_FOSSIL_2          ; 74
	const HS_MT_MOON_B2F_ITEM_1            ; 75 X
	const HS_MT_MOON_B2F_ITEM_2            ; 76 X
	const HS_SS_ANNE_2F_RIVAL              ; 77
	const HS_SS_ANNE_1F_ROOMS_ITEM         ; 78 X
	const HS_SS_ANNE_2F_ROOMS_ITEM_1       ; 79 X
	const HS_SS_ANNE_2F_ROOMS_ITEM_2       ; 7A X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_1      ; 7B X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_2      ; 7C X
	const HS_SS_ANNE_B1F_ROOMS_ITEM_3      ; 7D X
	const HS_VICTORY_ROAD_3F_ITEM_1        ; 7F X
	const HS_VICTORY_ROAD_3F_ITEM_2        ; 80 X
	const HS_VICTORY_ROAD_3F_BOULDER       ; 81
	const HS_ROCKET_HIDEOUT_B1F_ITEM_1     ; 82 X
	const HS_ROCKET_HIDEOUT_B1F_ITEM_2     ; 83 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_1     ; 84 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_2     ; 85 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_3     ; 86 X
	const HS_ROCKET_HIDEOUT_B2F_ITEM_4     ; 87 X
	const HS_ROCKET_HIDEOUT_B3F_ITEM_1     ; 88 X
	const HS_ROCKET_HIDEOUT_B3F_ITEM_2     ; 89 X
	const HS_ROCKET_HIDEOUT_B4F_GIOVANNI   ; 8A
	const HS_ROCKET_HIDEOUT_B4F_JAMES      ; 8B
	const HS_ROCKET_HIDEOUT_B4F_JESSIE     ; 8C
	const HS_ROCKET_HIDEOUT_B4F_ITEM_1     ; 8D X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_2     ; 8E X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_3     ; 8F X
	const HS_ROCKET_HIDEOUT_B4F_ITEM_4     ; 90
	const HS_ROCKET_HIDEOUT_B4F_ITEM_5     ; 91
	const HS_GARNET_ARTICUNO_G             ; 92
	const HS_GARNET_ITEM_1                 ; 93
	const HS_GARNET_ITEM_2                 ; 94
	const HS_ARTICUNO_G_COPY_1             ; 95
	const HS_ARTICUNO_G_COPY_2             ; 96
	const HS_SILPH_CO_3F_1                 ; 97
	const HS_SILPH_CO_3F_2                 ; 98
	const HS_SILPH_CO_3F_ITEM              ; 99 X
	const HS_SILPH_CO_5F_1                 ; 9A
	const HS_SILPH_CO_5F_2                 ; 9B
	const HS_SILPH_CO_5F_3                 ; 9C
	const HS_SILPH_CO_5F_4                 ; 9D
	const HS_SILPH_CO_5F_ITEM_1            ; 9E X
	const HS_SILPH_CO_5F_ITEM_2            ; 9F X
	const HS_SILPH_CO_5F_ITEM_3            ; A0 X
	const HS_SILPH_CO_7F_1                 ; A1
	const HS_SILPH_CO_7F_2                 ; A2
	const HS_SILPH_CO_7F_3                 ; A3
	const HS_SILPH_CO_7F_4                 ; A4
	const HS_SILPH_CO_7F_RIVAL             ; A5
	const HS_SILPH_CO_7F_ITEM_1            ; A6 X
	const HS_SILPH_CO_7F_ITEM_2            ; A7	X
	const HS_SILPH_CO_11F_1                ; A8
	const HS_SILPH_CO_11F_JAMES            ; A9
	const HS_SILPH_CO_11F_3                ; AA
	const HS_SILPH_CO_11F_JESSIE           ; AB
	const HS_OMEGA                         ; AC
	const HS_OMEGA_2                       ; AD
	const HS_DRAGONITE                     ; AE
	const HS_MOLTRES                       ; AF
	const HS_POKEMON_MANSION_2F_ITEM       ; B0 X
	const HS_POKEMON_MANSION_3F_ITEM_1     ; B1 X
	const HS_POKEMON_MANSION_3F_ITEM_2     ; B2 X
	const HS_POKEMON_MANSION_B1F_ITEM_1    ; B3 X
	const HS_POKEMON_MANSION_B1F_ITEM_2    ; B4 X
	const HS_POKEMON_MANSION_B1F_ITEM_3    ; B5 X
	const HS_POKEMON_MANSION_B1F_ITEM_4    ; B6 X
	const HS_POKEMON_MANSION_B1F_ITEM_5    ; B7 X
	const HS_MANSION_GUARD                 ; B8
	const HS_SAFARI_ZONE_EAST_ITEM_1       ; B9 X
	const HS_SAFARI_ZONE_EAST_ITEM_2       ; BA X
	const HS_SAFARI_ZONE_EAST_ITEM_3       ; BB X
	const HS_SAFARI_ZONE_EAST_ITEM_4       ; BC X
	const HS_SAFARI_ZONE_NORTH_ITEM_1      ; BD X
	const HS_SAFARI_ZONE_NORTH_ITEM_2      ; BE X
	const HS_SAFARI_ZONE_WEST_ITEM_1       ; BF X
	const HS_SAFARI_ZONE_WEST_ITEM_2       ; C0 X
	const HS_SAFARI_ZONE_WEST_ITEM_3       ; C1 X
	const HS_SAFARI_ZONE_WEST_ITEM_4       ; C2 X
	const HS_SAFARI_ZONE_CENTER_ITEM       ; C3 X
	const HS_CERULEAN_CAVE_2F_ITEM_1       ; C4 X
	const HS_CERULEAN_CAVE_2F_ITEM_2       ; C5 X
	const HS_CERULEAN_CAVE_2F_ITEM_3       ; C6 X
	const HS_MEWTWO                        ; C7 X
	const HS_CERULEAN_CAVE_B1F_ITEM_1      ; C8 X
	const HS_CERULEAN_CAVE_B1F_ITEM_2      ; C9 X
	const HS_VICTORY_ROAD_1F_ITEM_1        ; CA X
	const HS_VICTORY_ROAD_1F_ITEM_2        ; CB X
	const HS_CHAMPIONS_ROOM_OAK            ; CC
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_1  ; CD
	const HS_SEAFOAM_ISLANDS_1F_BOULDER_2  ; CE
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_1 ; CF
	const HS_SEAFOAM_ISLANDS_B1F_BOULDER_2 ; D0
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_1 ; D1
	const HS_SEAFOAM_ISLANDS_B2F_BOULDER_2 ; D2
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_1 ; D3
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_2 ; D4
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_3 ; D5
	const HS_SEAFOAM_ISLANDS_B3F_BOULDER_4 ; D6
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_1 ; D7
	const HS_SEAFOAM_ISLANDS_B4F_BOULDER_2 ; D8
	const HS_ARTICUNO                      ; D9
	const HS_MEW                           ; DA
	const HS_POKEMON_MANSION_B2F_ITEM_1    ; DB
	const HS_POKEMON_MANSION_B2F_ITEM_2    ; DC
	const HS_MT_MOON_CRATER_ITEM_1         ; DD
	const HS_MT_MOON_CRATER_ITEM_2         ; DE
	const HS_MT_MOON_CRATER_ITEM_3         ; DF
	const HS_MT_MOON_CRATER_ITEM_4         ; E0
	const HS_GIOVANNIS_ROOM_ITEM_1         ; E1
	const HS_GIOVANNIS_ROOM_ITEM_2         ; E2
	const HS_ROCK_TUNNEL_B1F_DOME          ; E3
	const HS_ROCK_TUNNEL_B1F_HELIX         ; E4
	const HS_ROCK_TUNNEL_B1F_AMBER         ; E5
	const HS_ROCK_TUNNEL_B1F_WING          ; E6
	const HS_MT_MOON_CRATER_GUARD          ; E7
	const HS_DAYCARE_BULBASAUR             ; E8
	const HS_GLADE_GZAP_1                  ; E9
	const HS_GLADE_GZAP_2                  ; EA sports. to the game.
	const HS_GLADE_GZAP_3                  ; EB
	const HS_GLADE_ITEM1                   ; EC
	const HS_GLADE_ITEM2                   ; ED
	const HS_GLADE_ITEM3                   ; EE
	const HS_GLADE_ITEM4                   ; EF
	const HS_CINNABAR_VOLCANO_FLOORS_ITEM  ; F0
DEF NUM_HS_OBJECTS EQU const_value         ; F2 - FE all go unused.
