# Guard against including same makefile several times
#
# ifeq (1,$(includecount))
# ...
# endif
includecount=$(words $(filter $(lastword $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))

# Get dir of module
#
# A module is the directory in the path one level above the "make" directory
#
# Needs to be evaluated before any upcoming includes, and useful to get the
# root directory of a library
#
# TODO: This needs to be made better. For now, it only works in subdirectories,
# and not if the top level directory is called make/, and therefore is only
# suitable for libraries
moduledir=$(shell echo "$(lastword $(MAKEFILE_LIST))" | sed -E "s:(/|^)make/.*$$::")
