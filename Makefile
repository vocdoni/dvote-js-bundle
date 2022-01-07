SHELL := /bin/bash
PROJECT_NAME=$(shell basename "$(PWD)")

.DEFAULT_GOAL := help
BROWSERIFY := $(PWD)/node_modules/.bin/browserify

BUILD_PATH := $(PWD)/dist

ENTRY_POINT_MAIN := $(PWD)/src/main.js
TARGET_BUNDLE_MAIN := $(BUILD_PATH)/main.js

ENTRY_POINT_VOTING := $(PWD)/src/voting.js
TARGET_BUNDLE_VOTING := $(BUILD_PATH)/voting.js

ENTRY_POINT_CENSUS := $(PWD)/src/census.js
TARGET_BUNDLE_CENSUS := $(BUILD_PATH)/census.js

#-----------------------------------------------------------------------
# HELP
#-----------------------------------------------------------------------

## help: Display this message

.PHONY: help
help:
	@echo
	@echo " Available targets on "$(PROJECT_NAME)":"
	@echo
	@sed -n 's/^##//p' Makefile | column -t -s ':' |  sed -e 's/^/ /'
	@echo

## init: Install the dependencies
.PHONY := init
init:
	npm install

#-----------------------------------------------------------------------
# RECIPES
#-----------------------------------------------------------------------

## :
## all: Compile all the bundles (main, voting, census)
all: main voting census

## main: Bundle the whole library
main: $(TARGET_BUNDLE_MAIN) package.json

## voting: Bundle the voting library
voting: $(TARGET_BUNDLE_VOTING) package.json

## census: Bundle the census library
census: $(TARGET_BUNDLE_CENSUS) package.json

$(TARGET_BUNDLE_MAIN): $(ENTRY_POINT_MAIN)
	mkdir -p $(BUILD_PATH)
	$(BROWSERIFY) $< -o $@

$(TARGET_BUNDLE_VOTING): $(ENTRY_POINT_VOTING)
	mkdir -p $(BUILD_PATH)
	$(BROWSERIFY) $< -o $@

$(TARGET_BUNDLE_CENSUS): $(ENTRY_POINT_CENSUS)
	mkdir -p $(BUILD_PATH)
	$(BROWSERIFY) $< -o $@

## :
## clean: Cleanup the build folder

.PHONY := clean
clean: 
	rm -Rf $(BUILD_PATH)
