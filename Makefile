# Makefile for tlp

SBIN  = $(DESTDIR)/usr/sbin
BIN   = $(DESTDIR)/usr/bin
PMETC = $(DESTDIR)/etc/pm/power.d
TLIB  = $(DESTDIR)/usr/lib/tlp-pm
TLREL = ../../../usr/lib/tlp-pm
PLIB  = $(DESTDIR)/usr/lib/pm-utils
ULIB  = $(DESTDIR)/lib/udev

all: 
	@/bin/true 

clean:
	@/bin/true 
	
install: 
	install -D -m 755 tlp $(SBIN)/tlp
	install -D -m 755 tlp-rf $(BIN)/bluetooth
	ln -f $(BIN)/bluetooth $(BIN)/wifi
	ln -f $(BIN)/bluetooth $(BIN)/wwan
	install -m 755 tlp-run-on $(BIN)/run-on-ac
	ln -f $(BIN)/run-on-ac $(BIN)/run-on-bat
	install -m 755 tlp-stat $(BIN)/
	install -m 755 tlp-usblist $(BIN)/
	install -D -m 755 tlp-functions $(TLIB)/tlp-functions
	install -m 755 tlp-rf-func $(TLIB)/
	install -m 755 tlp-nop $(TLIB)/
	install -D -m 755 tlp-udev $(ULIB)/tlp-udev
	install -D -m 644 tlp.rules $(ULIB)/rules.d/40-tlp.rules
	[ -f $(DESTDIR)/etc/default/tlp ] || install -D -m 644 default $(DESTDIR)/etc/default/tlp
	install -D -m 755 tlp.init $(DESTDIR)/etc/init.d/tlp
	# install -D -m 755 tlp-ifup $(DESTDIR)/etc/network/if-up.d/tlp-ifup
	install -D -m 755 zztlp $(PLIB)/power.d/zztlp
	install -D -m 755 49wwan $(PLIB)/sleep.d/49wwan
	install -m 755 49bay $(PLIB)/sleep.d/49bay
	install -D -m 644 tlp.desktop $(DESTDIR)/etc/xdg/autostart/tlp.desktop
	install -D -m 644 tlp.bash_completion $(DESTDIR)/etc/bash_completion.d/tlp

uninstall: 
	rm $(SBIN)/tlp
	rm $(BIN)/bluetooth
	rm $(BIN)/wifi
	rm $(BIN)/wwan
	rm $(BIN)/run-on-ac
	rm $(BIN)/run-on-bat
	rm $(BIN)/tlp-stat
	rm $(BIN)/tlp-usblist
	rm $(TLIB)/tlp-functions
	rm $(TLIB)/tlp-rf-func
	rmdir $(TLIB)
#	rm $(DESTDIR)/etc/default/tlp
	rm $(DESTDIR)/etc/init.d/tlp
	rm $(DESTDIR)/etc/network/if-up.d/tlp-ifup
	rm $(PLIB)/power.d/zztlp
	rm $(PLIB)/sleep.d/49wwan
	rm $(PLIB)/sleep.d/49bay
	rm $(DESTDIR)/etc/xdg/autostart/tlp.desktop
	rm $(DESTDIR)/etc/bash_completion.d/tlp
