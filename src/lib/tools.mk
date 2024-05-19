# Guard against including same makefile several times
#
# ifeq (1,$(includecount))
# ...
# endif
includecount=$(words $(filter $(lastword $(MAKEFILE_LIST)),$(MAKEFILE_LIST)))
