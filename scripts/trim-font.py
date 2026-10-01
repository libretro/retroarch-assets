#!/usr/bin/env python3
# Trims a TrueType font for pkg/ without changing a pixel RetroArch draws
# from it: every codepoint the font maps keeps its glyph, outline,
# hinting and metrics, and the font's own bounding box is kept as it was
# (RetroArch's FreeType path sizes its glyph cells from it). What goes is
# what neither RetroArch's own TrueType reader nor FreeType nor Core Text
# reads when drawing a glyph: the layout tables (RetroArch does no
# shaping), kerning (it asks for no pairs), vertical metrics (it lays text
# out horizontally), glyph names, and the glyphs only the layout tables
# could reach.
#
# Usage: scripts/trim-font.py in.ttf out.ttf   (needs fontTools)

import sys, os
from fontTools.ttLib import TTFont
from fontTools import subset
src, dst = sys.argv[1], sys.argv[2]
f = TTFont(src, recalcBBoxes=False, recalcTimestamp=False)
o = subset.Options()
o.layout_features = []
o.layout_scripts = []
o.legacy_kern = False
o.glyph_names = False          # post format 3
o.hinting = True               # keep fpgm/prep/cvt/instructions, gasp
o.hinting_tables = ['*']       # keep hdmx, VDMX, LTSH and the like
o.notdef_glyph = True
o.notdef_outline = True
o.recommended_glyphs = True
o.name_IDs = ['*']
o.name_legacy = True
o.name_languages = ['*']
o.recalc_bounds = False
o.recalc_timestamp = False
o.prune_unicode_ranges = False
o.prune_codepage_ranges = False
o.canonical_order = True
o.drop_tables = list(o.drop_tables) + ['GSUB', 'GPOS', 'GDEF', 'JSTF', 'BASE',
      'MATH', 'kern', 'vhea', 'vmtx', 'FFTM', 'DSIG', 'morx', 'kerx']
s = subset.Subsetter(options=o)
s.populate(unicodes=list(f.getBestCmap().keys()))
s.subset(f)
f.save(dst)
print("%-28s %8d -> %8d bytes (%.1f%%)" % (os.path.basename(src), os.path.getsize(src), os.path.getsize(dst),
      100.0 * (os.path.getsize(src) - os.path.getsize(dst)) / os.path.getsize(src)))
