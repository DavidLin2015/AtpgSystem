$(BIN_TOP)/$(MODE)/atpg : $(PKG_DIR)/atpg/$(BIN_DIR)/$(MODE)/atpg
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CP $(notdir $@) $(PRT_MODE)"
	$(AT)cp -f $< $@

