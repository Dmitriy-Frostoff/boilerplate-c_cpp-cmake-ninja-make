# compilers and flags
CC := clang
CXX := clang++
CFLAGS := -Wall -Wextra -g -std=c23
CXXFLAGS := -Wall -Wextra -g -std=c++23
AR := ar
ARFLAGS := ruv
LDFLAGS := -fuse-ld=lld

# paths
OBJ_DIR := build
BIN_DIR := $(OBJ_DIR)/bin
LIB_DIR := $(OBJ_DIR)/lib

MAIN_SRC_DIR := src
MATH_LIB_SRC_DIR := src/math_lib

MATH_LIB := $(LIB_DIR)/math_lib.a
PROGRAM := $(BIN_DIR)/main
HELLOWORLD_CPP := $(BIN_DIR)/helloworld_cpp

include src/Makefile.mk
include src/math_lib/Makefile.mk

$(OBJ_DIR):
	mkdir -p $@

$(BIN_DIR):
	mkdir -p $@

$(LIB_DIR):
	mkdir -p $@

# targets
.PHONY: all dev build run clean

all: $(MATH_LIB) $(PROGRAM) $(HELLOWORLD_CPP) $(TEST_PROGRAM)

dev:
	cmake -G Ninja -DCMAKE_BUILD_TYPE=Debug -S . -B build && ninja -C build

build:
	cmake -G Ninja -DCMAKE_BUILD_TYPE=Release -S . -B build && ninja -C build

clean:
	rm -rf $(OBJ_DIR)/

.DEFAULT_GOAL := all
