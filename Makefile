# EzMake Configuration File
#
# Copyright (c) 2018 Kirk Lange
#
# This software is provided 'as-is', without any express or implied
# warranty. In no event will the authors be held liable for any damages
# arising from the use of this software.
#
# Permission is granted to anyone to use this software for any purpose,
# including commercial applications, and to alter it and redistribute it
# freely, subject to the following restrictions:
#
# 1. The origin of this software must not be misrepresented; you must not
#    claim that you wrote the original software. If you use this software
#    in a product, an acknowledgment in the product documentation would be
#    appreciated but is not required.
# 2. Altered source versions must be plainly marked as such, and must not be
#    misrepresented as being the original software.
# 3. This notice may not be removed or altered from any source distribution.



###############################################################################
##############################  Standard Options  #############################
###############################################################################

# Directories within ./src of your library code.
# Each subdirectory gets built into its own shared library, assuming that MODE
# is set to dynamic.
MODULES =

# Similar to MODULES, except PLUGINS are not part of the core application and
# must be dynamically loaded via a shared object (.dll, .so, etc)
PLUGINS = Pong

# Directories within ./src of the apps and tests that you want to build.
MAINS =

# Name of the application(s) you want to test when you call `make test`.
TEST =

# Specifies whether the test input files should be interpreted as command line
# arguments or as program user input.
TEST_INPUT_IS_ARG = true

# Name of the application (singular!) you want to run when you call `make run`.
RUN = EzGL_Main

# When building all, choose whether to build dynamic and/or static mains
# EzGL: For some reason statically built mains have trouble loading plugins
MODES =

# Packages that you want to include in your project.
# If `pkg-config` cannot find the package, `-I$(PREFIX)/include/$(PKG)` and
# `-l$(PKG)` will be added to the build instead, for each PKG in PKGS and for
# each PREFIX in PREFIXES. These are CASE SENSITIVE! Double check the correct
# case for your library. Commented out are examples.
PKGS = #sdl2 SDL2_image SDL2_ttf glfw3

# Needed submodule include and/or source directories within ./sub
SUB_SUBDIRS = json/single_include

# If the submodule has its test source files in the same directory as its
# actual API source files (facepalm), then you may want to manually specify
# individual source files here (including the file extension).
SUB_FILES =

# What the built submodule library will be named. Does not affect the code at
# all, it is just what the shared object and library file will be named.
SUBMODULE =



###############################################################################
##############################  Advanced Options  #############################
###############################################################################

# Compiler
CC = g++

# C-Flags and library (`-l` only) settings
# In many cases the order in which your `-l`s appear matters! One limitation of
# EzMake is that we assume all tests/mains use the same compiler flags. If this
# becomes a big enough issue, this will be amended in a future version.
CF = -std=c++11 -w -O3 -I./sub -I./sub/ezgl/src #-g -pg
LF = -Wl,--allow-multiple-definition

# Include file extensions you want moved to ./include
INC_EXTS = hpp h

# Source file extensions you want compiled.
SRC_EXTS = cpp c

# Location(s) where EzMake should look for `include` and `lib` subdirectories
# No biggie if the directory doesn't exist.
PREFIXES = /usr /mingw64 /mingw32 $$HOME

# WARNING: Changing these may cause a lot of headache!
# Project root directory and submodule directory
ROOT = .
SUB_DIR = sub



###############################################################################
#########################  Initialize EzMake Framework  #######################
###############################################################################

default :
	@echo
	@echo "Run 'make init' if you haven't already to initialize the EzMake" \
		"framework, then run 'make help' for further instruction."
	@echo

init :
	git submodule update --init --remote --force

.SUFFIXES :

FORCE :

-include $(SUB_DIR)/ezmake/script/ezmake.mk
