# Go parameters
GOBASE := $(shell pwd)
GOPATH := $(shell go env GOPATH)
# GOBIN  := $(GOPATH)/bin # Changed to local bin directory
GOFILES := $(wildcard *.go)

# Binary name
BINARY_NAME := protoc-gen-mcpgo
BINARY_DIR := $(GOBASE)/bin

.PHONY: all build clean install uninstall

all: build

# Build the binary
build:
	@echo "Building $(BINARY_NAME) into $(BINARY_DIR)/..."
	@mkdir -p $(BINARY_DIR)
	@go build -o $(BINARY_DIR)/$(BINARY_NAME) $(GOFILES)

# Clean the binary
clean:
	@echo "Cleaning..."
	@if [ -d $(BINARY_DIR) ] ; then rm -r $(BINARY_DIR) ; fi

# Install the binary
install:
	@echo "Installing $(BINARY_NAME) to $(GOPATH)/bin/..."
	@go install

# Uninstall the binary
uninstall:
	@echo "Uninstalling $(BINARY_NAME) from $(GOPATH)/bin/..."
	@if [ -f $(GOPATH)/bin/$(BINARY_NAME) ] ; then rm $(GOPATH)/bin/$(BINARY_NAME) ; fi