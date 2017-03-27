#!/bin/sh

cd '../png'

function copyFirst(){ for i in "${@:2}"; do cp -fv "$1" "$i"; done ;}

copyFirst \
'default.png' \
'Game.png'

copyFirst \
'default-content.png' \
'core.png' \
'Game-content.png'

copyFirst \
'NEC - PC Engine SuperGrafx.png' \
'NEC - PC Engine - TurboGrafx 16.png' \
'NEC - PC Engine CD - TurboGrafx-CD.png'

copyFirst \
'NEC - PC Engine SuperGrafx-content.png' \
'NEC - PC Engine - TurboGrafx 16-content.png'

copyFirst \
'Neo Geo-content.png' \
'NEC - PC Engine CD - TurboGrafx-CD-content.png' \
'NEC - PC-FX-content.png' \
'Sega - Mega-CD - Sega CD-content.png' \
'Sega - Saturn-content.png' \
'Sony - PlayStation-content.png' \
'The 3DO Company - 3DO-content.png'

copyFirst \
'Sega - 32X.png' \
'Sega - Mega Drive - Genesis.png' \
'Sega - Mega-CD - Sega CD.png'

copyFirst \
'Atari - ST-content.png' \
'Commodore Amiga-content.png'

copyFirst \
'Atari - ST.png' \
'Microsoft - MSX.png' \
'Microsoft - MSX2.png'

copyFirst \
'Microsoft - MSX-content.png' \
'Microsoft - MSX2-content.png'

copyFirst \
'Nintendo - Game and Watch.png' \
'Game and Watch.png'

copyFirst \
'Bandai - WonderSwan.png' \
'Bandai - WonderSwan Color.png'

copyFirst \
'Bandai - WonderSwan-content.png' \
'Bandai - WonderSwan Color-content.png'

copyFirst \
'Nintendo - Super Nintendo Entertainment System.png' \
'Nintendo - Satellaview.png' \
'Nintendo - Sufami Turbo.png'

copyFirst \
'Nintendo - Nintendo DS.png' \
'Nintendo - Nintendo DS Decrypted.png'

copyFirst \
'Nintendo - Nintendo DS-content.png' \
'Nintendo - Nintendo DS Decrypted-content.png'

copyFirst \
'Sinclair - ZX Spectrum-content.png' \
'Sinclair - ZX Spectrum +3-content.png' \
'Sinclair - ZX 81-content.png'

copyFirst \
'MAME-content.png' \
'MAME2003-content.png' \
'MAME2010-content.png' \
'FB Alpha - Arcade Games-content.png'

copyFirst \
'SNK - Neo Geo Pocket.png' \
'SNK - Neo Geo Pocket Color.png'

copyFirst \
'SNK - Neo Geo Pocket-content.png' \
'SNK - Neo Geo Pocket Color-content.png'

cd -
