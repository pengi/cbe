include $(CBE)/src/lib/tools.mk
include $(CBE)/src/lib/verbosity.mk

TARGET:=$(patsubst build/%,%,$(MAKECMDGOALS))
DISPLAYNAME:=$(TARGET)

TMPDIR:=build/tmp/$(TARGET)
include make/$(TARGET).mk

.PHONY: all
