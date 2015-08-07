$(PKG_DIR)/atpg/$(BIN_DIR)/$(MODE)/atpg : $(TMP_TOP)/$(MODE)/$(TMP_OBJ)/$(TMP_STA)/$(PKG_DIR)/atpg/$(SRC_DIR)/main.cpp.o $(call get_ar_objs,$(call get_dep_pkgs,atpg))
	@if [ ! -d $(dir $@) ]; then \
		mkdir -p $(dir $@); \
	fi
	$(AT)rm -f $@
	@echo "    LD $(notdir $@) $(PRT_MODE)"
	$(AT)$(LD) $(addprefix -L,$(MAIN_atpg/main.cpp_MODE_$(MODE)_LD_PATHS)) $(addprefix -L,$(MAIN_atpg/main.cpp_LD_PATHS)) $(addprefix -L,$(PKG_atpg_MODE_$(MODE)_LD_PATHS)) $(addprefix -L,$(PKG_atpg_LD_PATHS)) $(MODE_LD_PATHS) $(if $(MAIN_atpg/main.cpp_MODE_$(MODE)_LD_FLAGS),$(MAIN_atpg/main.cpp_MODE_$(MODE)_LD_FLAGS),$(if $(MAIN_atpg/main.cpp_LD_FLAGS),$(MAIN_atpg/main.cpp_LD_FLAGS),$(if $(PKG_atpg_MODE_$(MODE)_LD_FLAGS),$(PKG_atpg_MODE_$(MODE)_LD_FLAGS),$(if $(PKG_atpg_LD_FLAGS),$(PKG_atpg_LD_FLAGS),$(if $(MODE_$(MODE)_LD_FLAGS),$(MODE_$(MODE)_LD_FLAGS),$(CMN_LD_FLAGS)))) )) -o $@ $^ $(addprefix -l,$(if $(MAIN_atpg/main.cpp_MODE_$(MODE)_LD_LIBS),$(MAIN_atpg/main.cpp_MODE_$(MODE)_LD_LIBS),$(if $(MAIN_atpg/main.cpp_LD_LIBS),$(MAIN_atpg/main.cpp_LD_LIBS),$(if $(PKG_atpg_MODE_$(MODE)_LD_LIBS),$(PKG_atpg_MODE_$(MODE)_LD_LIBS),$(if $(PKG_atpg_LD_LIBS),$(PKG_atpg_LD_LIBS),$(if $(MODE_$(MODE)_LD_LIBS),$(MODE_$(MODE)_LD_LIBS),$(CMN_LD_LIBS)))) )) ) 

