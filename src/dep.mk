include $(CBE)/src/lib/tools.mk
include $(CBE)/src/lib/verbosity.mk

TARGET=$(patsubst build/deps/%.d,%,$(MAKECMDGOALS))

include make/$(TARGET).mk

################################################################################
# Top level dependency tracking
################################################################################

build/deps/$(TARGET).d: make/$(TARGET).mk
	mkdir -p $(@D)
	echo 'build/$(TARGET): ' $(addprefix build/,$(DEPEDNS)) > $@

.PHONY: all
