WarpTileListPointers:
	dw .FacingDownWarpTiles
	dw .FacingUpWarpTiles
	dw .FacingLeftWarpTiles
	dw .FacingRightWarpTiles

MACRO warp_carpet_tiles
	IF _NARG
		db \# ; all args
	ENDC
	db -1 ; end
ENDM

.FacingDownWarpTiles:
	warp_carpet_tiles $01, $0B, $12, $16, $23, $17, $3D, $04, $18, $33, $51, $52

.FacingUpWarpTiles:
	warp_carpet_tiles $01, $34, $36, $5C, $5F, 

.FacingLeftWarpTiles:
	warp_carpet_tiles $1A, $4B

.FacingRightWarpTiles:
	warp_carpet_tiles $0F, $4E
