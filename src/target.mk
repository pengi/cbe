include $(CBE)/src/lib/tools.mk
include $(CBE)/src/lib/verbosity.mk

TARGET:=$(patsubst build/%,%,$(MAKECMDGOALS))
DISPLAYNAME:=$(TARGET)

TMPDIR:=build/tmp/$(TARGET)
include targets/$(TARGET).mk

.PHONY: all
