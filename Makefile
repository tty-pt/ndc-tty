all := libndc-tty
SONAME-libndc-tty := ndc-tty

LDLIBS-libndc-tty := -lndc -lqmap -lndx
LDFLAGS-libndc-tty-Darwin := -undefined dynamic_lookup

share != find ./htdocs -type f
share-dir := ndc

-include ./../mk/include.mk

CFLAGS += -g \
	-DNDC_PREFIX='"$(PREFIX)"' \
	-DNDC_HTDOCS='"$(PREFIX)/share/ndc/htdocs"'
