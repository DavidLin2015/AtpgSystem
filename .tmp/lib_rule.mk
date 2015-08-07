$(LIB_TOP)/$(MODE)/libcore.a : $(call get_ar_objs,$(call get_dep_pkgs,$(LIB_core_PKGS)))
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    AR $(notdir $@) $(PRT_MODE)"
	$(AT)$(AR) $(AR_FLAGS) $@ $^
	$(AT)$(RANLIB) $@

$(LIB_TOP)/$(MODE)/libcmd.a : $(call get_ar_objs,$(call get_dep_pkgs,$(LIB_cmd_PKGS)))
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    AR $(notdir $@) $(PRT_MODE)"
	$(AT)$(AR) $(AR_FLAGS) $@ $^
	$(AT)$(RANLIB) $@

