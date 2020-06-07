#
# Makefile
#
# Makefile for sample workspace
#

.PHONY: clean all

clean all:
	$(MAKE) -C devices $(MAKECMDGOALS)
