DESTDIR := /tmp/retroarch-assets

all:
	@echo "Nothing to make for retroarch-assets."

install:
	mkdir -p $(DESTDIR)/libretro/assets
	cp -ar * $(DESTDIR)/libretro/assets
	rm $(DESTDIR)/libretro/assets/COPYING
	rm $(DESTDIR)/libretro/assets/Makefile
	mkdir -p $(DESTDIR)/doc/retroarch-assets
	cp COPYING $(DESTDIR)/doc/retroarch-assets
