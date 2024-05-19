# Get the directory of load.mk as root for CBE files
CBE:=$(patsubst %/,%,$(dir $(lastword $(MAKEFILE_LIST))))

export CBE
include $(CBE)/src/main.mk
