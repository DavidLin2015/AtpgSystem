$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cu.d : $(PKG_DIR)/atpg/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	@$(NVCC) -M $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/atpg/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cu.o : $(PKG_DIR)/atpg/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    NVCC $(notdir $<) $(PRT_MODE)"
	$(AT)$(NVCC) $(if $(PKG_atpg_MODE_$(MODE)_NV_FLAGS),$(PKG_atpg_MODE_$(MODE)_NV_FLAGS),$(if $(PKG_atpg_NV_FLAGS),$(PKG_atpg_NV_FLAGS),$(if $(MODE_$(MODE)_NV_FLAGS),$(MODE_$(MODE)_NV_FLAGS),$(CMN_NV_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cu.o : $(PKG_DIR)/atpg/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    NVCC $(notdir $<) $(PRT_MODE) ($(NV_DYN_FLAGS))"
	$(AT)$(NVCC) $(NV_DYN_FLAGS) $(if $(PKG_atpg_MODE_$(MODE)_NV_FLAGS),$(PKG_atpg_MODE_$(MODE)_NV_FLAGS),$(if $(PKG_atpg_NV_FLAGS),$(PKG_atpg_NV_FLAGS),$(if $(MODE_$(MODE)_NV_FLAGS),$(MODE_$(MODE)_NV_FLAGS),$(CMN_NV_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/core/$(SRC_DIR)/%.cu.d : $(PKG_DIR)/core/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	@$(NVCC) -M $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/core/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/%.cu.o : $(PKG_DIR)/core/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    NVCC $(notdir $<) $(PRT_MODE)"
	$(AT)$(NVCC) $(if $(PKG_core_MODE_$(MODE)_NV_FLAGS),$(PKG_core_MODE_$(MODE)_NV_FLAGS),$(if $(PKG_core_NV_FLAGS),$(PKG_core_NV_FLAGS),$(if $(MODE_$(MODE)_NV_FLAGS),$(MODE_$(MODE)_NV_FLAGS),$(CMN_NV_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/core/$(SRC_DIR)/%.cu.o : $(PKG_DIR)/core/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    NVCC $(notdir $<) $(PRT_MODE) ($(NV_DYN_FLAGS))"
	$(AT)$(NVCC) $(NV_DYN_FLAGS) $(if $(PKG_core_MODE_$(MODE)_NV_FLAGS),$(PKG_core_MODE_$(MODE)_NV_FLAGS),$(if $(PKG_core_NV_FLAGS),$(PKG_core_NV_FLAGS),$(if $(MODE_$(MODE)_NV_FLAGS),$(MODE_$(MODE)_NV_FLAGS),$(CMN_NV_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cu.d : $(PKG_DIR)/cmd/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	@$(NVCC) -M $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/cmd/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cu.o : $(PKG_DIR)/cmd/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    NVCC $(notdir $<) $(PRT_MODE)"
	$(AT)$(NVCC) $(if $(PKG_cmd_MODE_$(MODE)_NV_FLAGS),$(PKG_cmd_MODE_$(MODE)_NV_FLAGS),$(if $(PKG_cmd_NV_FLAGS),$(PKG_cmd_NV_FLAGS),$(if $(MODE_$(MODE)_NV_FLAGS),$(MODE_$(MODE)_NV_FLAGS),$(CMN_NV_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cu.o : $(PKG_DIR)/cmd/$(SRC_DIR)/%.cu
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    NVCC $(notdir $<) $(PRT_MODE) ($(NV_DYN_FLAGS))"
	$(AT)$(NVCC) $(NV_DYN_FLAGS) $(if $(PKG_cmd_MODE_$(MODE)_NV_FLAGS),$(PKG_cmd_MODE_$(MODE)_NV_FLAGS),$(if $(PKG_cmd_NV_FLAGS),$(PKG_cmd_NV_FLAGS),$(if $(MODE_$(MODE)_NV_FLAGS),$(MODE_$(MODE)_NV_FLAGS),$(CMN_NV_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

