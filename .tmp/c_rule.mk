$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp.d : $(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.c.d : $(PKG_DIR)/atpg/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp.o : $(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(if $(PKG_atpg_C_FLAGS),$(PKG_atpg_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.c.o : $(PKG_DIR)/atpg/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(if $(PKG_atpg_C_FLAGS),$(PKG_atpg_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp.o : $(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(if $(PKG_atpg_C_FLAGS),$(PKG_atpg_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.c.o : $(PKG_DIR)/atpg/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(if $(PKG_atpg_C_FLAGS),$(PKG_atpg_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp.d : $(PKG_DIR)/core/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/core/$(SRC_DIR)/%.c.d : $(PKG_DIR)/core/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp.o : $(PKG_DIR)/core/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_core_MODE_$(MODE)_C_FLAGS),$(PKG_core_MODE_$(MODE)_C_FLAGS),$(if $(PKG_core_C_FLAGS),$(PKG_core_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/%.c.o : $(PKG_DIR)/core/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_core_MODE_$(MODE)_C_FLAGS),$(PKG_core_MODE_$(MODE)_C_FLAGS),$(if $(PKG_core_C_FLAGS),$(PKG_core_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp.o : $(PKG_DIR)/core/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_core_MODE_$(MODE)_C_FLAGS),$(PKG_core_MODE_$(MODE)_C_FLAGS),$(if $(PKG_core_C_FLAGS),$(PKG_core_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/core/$(SRC_DIR)/%.c.o : $(PKG_DIR)/core/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_core_MODE_$(MODE)_C_FLAGS),$(PKG_core_MODE_$(MODE)_C_FLAGS),$(if $(PKG_core_C_FLAGS),$(PKG_core_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp.d : $(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.c.d : $(PKG_DIR)/cmd/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp.o : $(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(if $(PKG_cmd_C_FLAGS),$(PKG_cmd_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.c.o : $(PKG_DIR)/cmd/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(if $(PKG_cmd_C_FLAGS),$(PKG_cmd_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp.o : $(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(if $(PKG_cmd_C_FLAGS),$(PKG_cmd_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.c.o : $(PKG_DIR)/cmd/$(SRC_DIR)/%.c
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(if $(PKG_cmd_C_FLAGS),$(PKG_cmd_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

