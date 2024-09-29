ifeq (1,$(includecount))
include $(CBE)/lang/gcc/obj.mk

build/$(TARGET): $(OBJS)
	$(call TRACE,LINK)
	@mkdir -p $(@D)
	$(Q)$(CC) $(LDFLAGS) $(CFLAGS) -o $@ $^

endif
