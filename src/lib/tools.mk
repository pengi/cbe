# Guard against including same makefile several times
#
# ifeq (1,$(includecount))
# ...
# endif
includecount=$(words $(filter $(lastword $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))

# Get directory of current makefile
#
# Needs to be called before any other makefiles are included. Store the result
# in a temporary variable using := in the beginning of the file

makefile_dir=$(shell echo "$(lastword $(MAKEFILE_LIST))" | xargs dirname)
