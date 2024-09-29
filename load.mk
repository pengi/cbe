# Get the directory of load.mk as root for CBE files
CBE:=$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))
export CBE

ifeq (${__BASH_MAKE_COMPLETION__},1)
include $(CBE)/src/completion.mk
else
include $(CBE)/src/main.mk
endif
