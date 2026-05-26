ifeq (1,$(includecount))

ifeq ($(RUST_LIBNAME),)
$(error RUST_LIBNAME needs to be set)
endif

ifeq ($(RUST_DIR),)
$(error RUST_DIR needs to be set)
endif

CARGO=cargo

CARGO_MODE=release
CARGO_BUILD_ARGS+=\
	--release

ifneq ($(RUST_TRIPLE),)
CARGO_BUILD_ARGS+=\
	--target=$(RUST_TRIPLE)
endif

RUST_LDFLAGS=\
	--relocatable \
	--whole-archive \
	-z noexecstack

# Always invoke cargo to check if rebuild is needed
build/$(TARGET): $(RUST_DIR) FORCE
	$(call TRACE,CARGO)
	@mkdir -p $@
	$(Q)cd $< && CARGO_TARGET_DIR=$(abspath $(TMPDIR)) HEADER_DIR=$(abspath $@) $(CARGO) build $(CARGO_BUILD_ARGS)
	$(Q)$(LD) $(RUST_LDFLAGS) -o build/$(TARGET)/$(RUST_LIBNAME).o $(TMPDIR)/$(CARGO_MODE)/lib$(RUST_LIBNAME).rlib

endif
