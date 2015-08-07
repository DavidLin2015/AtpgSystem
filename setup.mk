#############################################################################
# File       [ setup.mk ]
# Author     [ littleshamoo ]
# Synopsis   [ package and library setup and customization ]
# Date       [ 2010/11/30 ]
#############################################################################


### modes ###################################################################
# MODES                - available modes
# MODE                 - current mode
# MODE_<MODE>_INCS     - include locations for MODE
# MODE_<MODE>_LD_PATHS - link paths for MODE
# MODE_<MODE>_LD_LIBS  - link libraries for MODE
# MODE_<MODE>_<FLAG>   - compiler flags for MODE
#############################################################################
MODES = opt dbg
MODE = dbg
MODE_opt_C_FLAGS = -O2
MODE_dbg_C_FLAGS = -g
MODE_$(MODE)_LD_PATHS = $(LIB_TOP)/$(MODE)

### packages ################################################################
# PKGS                           - packages to be compiled
# PKG_<PKG>_DEPS                 - package dependencies
# PKG_<PKG>_MAINS                - package main function files
# PKG_<PKG>_INCS                 - package include locations
# PKG_<PKG>_LD_PATHS             - package link locations
# PKG_<PKG>_LD_LIBS              - package link libraries
# PKG_<PKG>_<FLAGS>              - package compiler flags
# PKG_<PKG>_MODE_<MODE>_INCS     - package include locations for MODE
# PKG_<PKG>_MODE_<MODE>_LD_PATHS - package link locations for MODE
# PKG_<PKG>_MODE_<MODE>_LD_LIBS  - package link libraries for MODE
# PKG_<PKG>_MODE_<MODE>_<FLAGS>  - package compiler flags for MODE
#############################################################################
PKGS = atpg core cmd
PKG_atpg_MAINS = main.cpp

PKG_atpg_DEP = cmd
PKG_atpg_LD_LIBS = core cmd

PKG_cmd_DEP = core
PKG_cmd_INCS = 3rd_party
PKG_cmd_LD_LIBS = core

### main functions ##########################################################
# MAIN_<PKG>/<MAIN>_BIN                  - binary name
# MAIN_<PKG>/<MAIN>_LD_PATHS             - link paths
# MAIN_<PKG>/<MAIN>_LD_LIBS              - link libraries
# MAIN_<PKG>/<MAIN>_LD_FLAGS             - link flags
# MAIN_<PKG>/<MAIN>_MODE_<MODE>_LD_PATHS - link paths for MODE
# MAIN_<PKG>/<MAIN>_MODE_<MODE>_LD_LIBS  - link libraries for MODE
# MAIN_<PKG>/<MAIN>_MODE_<MODE>_LD_FLAGS - link flags for MODE
#############################################################################
MAIN_atpg/main.cpp_BIN = atpg

### libraries ###############################################################
# STA_LIBS        - static archived libraries
# DYN_LIBS        - dynamic loaded shared libraries
# LIB_$(LIB)_PKGS - library packages
#############################################################################

STA_LIBS = core cmd
LIB_core_PKGS = core 
LIB_cmd_PKGS = cmd
