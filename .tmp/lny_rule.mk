$(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.l.cpp : $(PKG_DIR)/atpg/$(SRC_DIR)/%.l
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    LEX $(notdir $@) $(PRT_MODE)"
	$(AT)$(LEX) $(if $(PKG_atpg_MODE_$(MODE)_L_FLAGS),$(PKG_atpg_MODE_$(MODE)_L_FLAGS),$(if $(PKG_atpg_L_FLAGS),$(PKG_atpg_L_FLAGS),$(if $(MODE_$(MODE)_L_FLAGS),$(MODE_$(MODE)_L_FLAGS),$(CMN_L_FLAGS)))) -o$@ -P$(patsubst %.l.cpp,%,$(notdir $@)) $<

$(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.y.cpp : $(PKG_DIR)/atpg/$(SRC_DIR)/%.y
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    YACC $(notdir $@) $(PRT_MODE)"
	$(AT)$(YACC) $(if $(PKG_atpg_MODE_$(MODE)_Y_FLAGS),$(PKG_atpg_MODE_$(MODE)_Y_FLAGS),$(if $(PKG_atpg_Y_FLAGS),$(PKG_atpg_Y_FLAGS),$(if $(MODE_$(MODE)_Y_FLAGS),$(MODE_$(MODE)_Y_FLAGS),$(CMN_Y_FLAGS)))) -p $(patsubst %.y.cpp,%,$(notdir $@)) -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp.d : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/atpg/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp.o : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(if $(PKG_atpg_C_FLAGS),$(PKG_atpg_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp.o : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/atpg/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(PKG_atpg_MODE_$(MODE)_C_FLAGS),$(if $(PKG_atpg_C_FLAGS),$(PKG_atpg_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/atpg/$(INC_DIR)) $(addprefix -I,$(PKG_atpg_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_atpg_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/core/$(SRC_DIR)/%.l.cpp : $(PKG_DIR)/core/$(SRC_DIR)/%.l
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    LEX $(notdir $@) $(PRT_MODE)"
	$(AT)$(LEX) $(if $(PKG_core_MODE_$(MODE)_L_FLAGS),$(PKG_core_MODE_$(MODE)_L_FLAGS),$(if $(PKG_core_L_FLAGS),$(PKG_core_L_FLAGS),$(if $(MODE_$(MODE)_L_FLAGS),$(MODE_$(MODE)_L_FLAGS),$(CMN_L_FLAGS)))) -o$@ -P$(patsubst %.l.cpp,%,$(notdir $@)) $<

$(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/core/$(SRC_DIR)/%.y.cpp : $(PKG_DIR)/core/$(SRC_DIR)/%.y
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    YACC $(notdir $@) $(PRT_MODE)"
	$(AT)$(YACC) $(if $(PKG_core_MODE_$(MODE)_Y_FLAGS),$(PKG_core_MODE_$(MODE)_Y_FLAGS),$(if $(PKG_core_Y_FLAGS),$(PKG_core_Y_FLAGS),$(if $(MODE_$(MODE)_Y_FLAGS),$(MODE_$(MODE)_Y_FLAGS),$(CMN_Y_FLAGS)))) -p $(patsubst %.y.cpp,%,$(notdir $@)) -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp.d : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/core/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp.o : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_core_MODE_$(MODE)_C_FLAGS),$(PKG_core_MODE_$(MODE)_C_FLAGS),$(if $(PKG_core_C_FLAGS),$(PKG_core_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp.o : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/core/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_core_MODE_$(MODE)_C_FLAGS),$(PKG_core_MODE_$(MODE)_C_FLAGS),$(if $(PKG_core_C_FLAGS),$(PKG_core_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/core/$(INC_DIR)) $(addprefix -I,$(PKG_core_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_core_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.l.cpp : $(PKG_DIR)/cmd/$(SRC_DIR)/%.l
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    LEX $(notdir $@) $(PRT_MODE)"
	$(AT)$(LEX) $(if $(PKG_cmd_MODE_$(MODE)_L_FLAGS),$(PKG_cmd_MODE_$(MODE)_L_FLAGS),$(if $(PKG_cmd_L_FLAGS),$(PKG_cmd_L_FLAGS),$(if $(MODE_$(MODE)_L_FLAGS),$(MODE_$(MODE)_L_FLAGS),$(CMN_L_FLAGS)))) -o$@ -P$(patsubst %.l.cpp,%,$(notdir $@)) $<

$(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.y.cpp : $(PKG_DIR)/cmd/$(SRC_DIR)/%.y
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    YACC $(notdir $@) $(PRT_MODE)"
	$(AT)$(YACC) $(if $(PKG_cmd_MODE_$(MODE)_Y_FLAGS),$(PKG_cmd_MODE_$(MODE)_Y_FLAGS),$(if $(PKG_cmd_Y_FLAGS),$(PKG_cmd_Y_FLAGS),$(if $(MODE_$(MODE)_Y_FLAGS),$(MODE_$(MODE)_Y_FLAGS),$(CMN_Y_FLAGS)))) -p $(patsubst %.y.cpp,%,$(notdir $@)) -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_DEP)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp.d : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    DEP $(notdir $@) $(PRT_MODE)"
	$(AT)$(CXX) -MM $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) $< > $@.$$$$; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ > $@; \
	sed 's,\($*\)\.o[ :]*,$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/cmd/$(SRC_DIR)/$(notdir $<).o $@ : ,g' < $@.$$$$ >> $@; \
	rm $@.$$$$

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp.o : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE)"
	$(AT)$(CXX) $(if $(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(if $(PKG_cmd_C_FLAGS),$(PKG_cmd_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

$(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_DYN)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp.o : $(TMP_TOP)/$(MODE)/$(TMP_LNY)/$(PKG_DIR)/cmd/$(SRC_DIR)/%.cpp
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    CXX $(notdir $<) $(PRT_MODE) ($(C_DYN_FLAGS))"
	$(AT)$(CXX) $(C_DYN_FLAGS) $(if $(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(PKG_cmd_MODE_$(MODE)_C_FLAGS),$(if $(PKG_cmd_C_FLAGS),$(PKG_cmd_C_FLAGS),$(if $(MODE_$(MODE)_C_FLAGS),$(MODE_$(MODE)_C_FLAGS),$(CMN_C_FLAGS)))) $(addprefix -I,$(PKG_DIR)) $(addprefix -I,$(PKG_DIR)/cmd/$(INC_DIR)) $(addprefix -I,$(PKG_cmd_MODE_$(MODE)_INCS)) $(addprefix -I,$(PKG_cmd_INCS)) $(MODE_INCS) -c -o $@ $<

