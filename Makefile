DESTDIR := /tmp/retroarch-assets

all:
	@echo "Nothing to make for retroarch-assets."

install:
	mkdir -p $(DESTDIR)
	cp -ar * $(DESTDIR)
	rm -rf $(DESTDIR)/Makefile $(DESTDIR)/configure $(DESTDIR)/xmb/monochrome/src $(DESTDIR)/xmb/flatui/src $(DESTDIR)/xmb/dot-art/src
