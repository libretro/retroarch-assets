PREFIX := /usr
INSTALLDIR := $(PREFIX)/share/libretro/assets

all:
	@echo "Nothing to make for retroarch-assets."

install:
	mkdir -p $(DESTDIR)$(INSTALLDIR)
	cp -ar * $(DESTDIR)$(INSTALLDIR)
	rm -rf $(DESTDIR)$(INSTALLDIR)/Makefile \
		$(DESTDIR)$(INSTALLDIR)/COPYING \
		$(DESTDIR)$(INSTALLDIR)/configure \
		$(DESTDIR)$(INSTALLDIR)/xmb/monochrome/src \
		$(DESTDIR)$(INSTALLDIR)/xmb/flatui/src \
		$(DESTDIR)$(INSTALLDIR)/xmb/dot-art/src

test-install: all
	DESTDIR=/tmp/build $(MAKE) install
