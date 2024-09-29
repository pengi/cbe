# Reduce verbosity for targets
#
# Usage: Add $Q before each line in a step, and add $(TRACE) with a message
# before.
#
# do_stuff:
#     $(call TRACE,STUFF)
#     $(Q)command stuff to do
#     $(Q)other_command more stuff to do
#
ifeq ($(V),1)
TRACE  = @printf -- "----- %-30s %-8s %s\n" $(DISPLAYNAME) $1 $(patsubst $(TMPDIR)%,...%,$@)
Q      =
SILENT =
else
TRACE  = @printf "%-30s %-8s %s\n" $(DISPLAYNAME) $1 $(patsubst $(TMPDIR)%,...%,$@)
Q      = @
SILENT = --silent
endif
