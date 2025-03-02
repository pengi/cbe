ifeq (1,$(includecount))
LANG_GCC:=$(moduledir)

################################################################################
# Process paths
################################################################################

OBJS += \
	$(patsubst %.c, $(TMPDIR)/%.o, \
	$(patsubst %.s, $(TMPDIR)/%.o, \
	$(patsubst %.S, $(TMPDIR)/%.o, \
	$(SRC) \
	)))

CFLAGS += \
	$(addprefix -I,$(INC))

################################################################################
# Common flags
################################################################################

# Enable debug symbols
CFLAGS += -g

# Optimization level
GCC_OPTIMIZE ?= 3
CFLAGS += -O$(GCC_OPTIMIZE)

################################################################################
# Dependency tracking
################################################################################

CFLAGS += -MMD
-include ${OBJS:.o=.d}

################################################################################
# Build rules
################################################################################

$(TMPDIR)/%.o: %.c
	$(call TRACE,COMPILE)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

$(TMPDIR)/%.o: %.s
	$(call TRACE,COMPILE)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

$(TMPDIR)/%.o: %.S
	$(call TRACE,COMPILE)
	@mkdir -p $(@D)
	$(CC) $(CFLAGS) -c -o $@ $<

endif
