; super rod encounters
SuperRodData:
	; map, fishing group
	dbw PALLET_TOWN,                    .Group1
	dbw VIRIDIAN_CITY,                  .Group1
	dbw CERULEAN_CITY,                  .Group2
	dbw VERMILION_CITY,                 .Group4
	dbw CELADON_CITY,                   .Group13
	dbw FUCHSIA_CITY,                   .Group6
	dbw CINNABAR_ISLAND,                .Group9
	dbw CITRINE_CITY,                   .Group11
	dbw ROUTE_4,                        .Group2
	dbw ROUTE_6,                        .Group2
	dbw ROUTE_10,                       .Group5
	dbw ROUTE_11,                       .Group4
	dbw ROUTE_12,                       .Group5
	dbw ROUTE_13,                       .Group6
	dbw ROUTE_17,                       .Group6
	dbw ROUTE_18,                       .Group6
	dbw ROUTE_19,                       .Group9
	dbw ROUTE_20,                       .Group9
	dbw ROUTE_21,                       .Group9
	dbw ROUTE_22,                       .Group1
	dbw ROUTE_23,                       .Group6
	dbw ROUTE_24,                       .Group2
	dbw ROUTE_25,                       .Group3
	dbw BRUNSWICK_TRAIL,                .Group11
	dbw VERMILION_DOCK,                 .Group4
	dbw VERMILION_FERRY_DOCK,           .Group4
	dbw CITRINE_FERRY_DOCK,             .Group11
	dbw SEAFOAM_ISLANDS_B3F,            .Group9
	dbw SEAFOAM_ISLANDS_B4F,            .Group9
	dbw SAFARI_ZONE_EAST,               .Group7
	dbw SAFARI_ZONE_NORTH,              .Group7
	dbw SAFARI_ZONE_WEST,               .Group7
	dbw SAFARI_ZONE_CENTER,             .Group7
	dbw CERULEAN_CAVE_2F,               .Group12
	dbw CERULEAN_CAVE_B1F,              .Group12
	dbw CERULEAN_CAVE_1F,               .Group12
	dbw SILPH_GAUNTLET_5F,              .Group7
	dbw ROCK_TUNNEL_1F,                 .Group5
	dbw CELADON_UNIVERSITY_OUTSIDE,     .Group13
	dbw MT_MOON_CRATER,                 .Group12
	dbw DIGLETTS_CAVE,                  .Group14
	dbw BILLS_GARDEN,                   .Group8
	dbw UNDERWATER_TUNNEL,              .Group10
	dbw GARNET_CAVERN_1F,               .Group11
	dbw GARNET_CAVERN_2F,               .Group11
	dbw GARNET_CAVERN_B1F,              .Group11
	dbw CINNABAR_VOLCANO_FLOORS,        .Group15
	dbw CINNABAR_VOLCANO,               .Group15
	db -1 ; end

; fishing groups
; number of monsters, followed by level/monster pairs

.Group1:	; Pallet, Viridian & Route 22
	db 4
	db 5, MAGIKARP
	db 7, MAGIKARP
	db 5, ORFRY
	db 7, ORFRY

.Group2:	; Route 4, Cerulean, Route 24, Route 6
	db 4
	db 12, MAGIKARP
	db 12, POLIWAG
	db 12, ORFRY
	db 12, PSYDUCK

.Group3:	; Route 25
	db 4
	db 12, MAGIKARP
	db 12, POLIWAG
	db 12, ORFRY
	db 12, CHEEP
	
.Group4:	; Route 11, Vermilion
	db 4
	db 15, BLOTTLE
	db 15, MAGIKARP
	db 15, TENTACOOL
	db 15, CHEEP

.Group5:	; Route 10, Route 12, Rock Tunnel
	db 4
	db 20, RIBBITO
	db 20, POLIWAG
	db 20, SLOWPOKE
	db 20, KRABBY

.Group6:	; Route 13, Route 17, Route 18, Fuchsia, Route 23
	db 4
	db 25, HORSEA
	db 25, POLIWHIRL
	db 25, KRABBY
	db 25, BLOTTLE

.Group7:	; Safari Zone
	db 4
	db 15, DRATINI
	db 20, SLOWPOKE
	db 25, KRABBY
	db 25, WEIRDUCK

.Group8:	; Bill's Garden
	db 4
	db 50, SQUIRTLE
	db 50, SQUIRTLE
	db 50, DRATINI
	db 50, DRATINI

.Group9:	; Cinnabar, Route 19-21, Seafoam Islands
	db 4
	db 30, STARYU
	db 30, HORSEA
	db 30, SHELLDER
	db 30, GOLDEEN

.Group10:	; Underwater Tunnel
	db 4
	db 35, SHELLDER
	db 35, STARYU
	db 35, CROAKOZUNA
	db 35, GOLDUCK

.Group11:	; Citrine, Brunswick, Garnet
	db 4
	db 50, KINGLER
	db 50, SEADRA
	db 50, PENDRAKEN
	db 50, GYARADOS

.Group12:	; Cerulean Cave, Mt Moon Crater
	db 4
	db 50, SLOWBRO
	db 50, SEAKING
	db 50, GYARADOS
	db 50, CROAKOZUNA

.Group13:	; Celadon
	db 4
	db 10, MAGIKARP
	db 15, MAGIKARP
	db 20, MAGIKARP
	db 20, GRIMER

.Group14:	; Diglett's Cave
	db 4
	db 17, WIGLETT
	db 18, WIGLETT
	db 19, WIGLETT
	db 20, WIGLETT

.Group15:	; Cinnabar Volcano
	db 3
	db 35, MAGMAR
	db 37, MAGMAR
	db 40, MAGMAR
