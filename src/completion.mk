PREFIXED_TARGETS=$(addprefix build/,$(TARGETS))

# Create dummy targets for all targets specified, to speed up autocompletion
$(PREFIXED_TARGETS):

clean:
