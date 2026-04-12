all := libndc-tty

LDLIBS-libndc-tty := -lndc -lqmap -lndx

share != find ./htdocs -type f
share-dir := ndc

-include ./../mk/include.mk

CFLAGS += -g \
	-DNDC_PREFIX='"$(PREFIX)"' \
	-DNDC_HTDOCS='"$(PREFIX)/share/ndc/htdocs"'
