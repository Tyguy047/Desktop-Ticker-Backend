# Makefile for Go Monero Price API

# Project settings
BINARY_NAME = desktop-ticker-backend
BIN_DIR = bin

# Go build flags for production
BUILD_FLAGS = -ldflags "-s -w"

# ----------------------------------
# Default target: build all platforms
# ----------------------------------
all: build

# ----------------------------------
# Build all platforms
# ----------------------------------
build: build-amd64 build-mac build-pi5
	@echo "All binaries built in $(BIN_DIR)/"

# ----------------------------------
# Individual builds
# ----------------------------------
amd64:
	@echo "Building $(BINARY_NAME) for Linux AMD64..."
	@mkdir -p $(BIN_DIR)
	GOOS=linux GOARCH=amd64 go build $(BUILD_FLAGS) -o $(BIN_DIR)/$(BINARY_NAME)-amd64
	@echo "Done: $(BIN_DIR)/$(BINARY_NAME)-amd64"

mac:
	@echo "Building $(BINARY_NAME) for Mac ARM64..."
	@mkdir -p $(BIN_DIR)
	GOOS=darwin GOARCH=arm64 go build $(BUILD_FLAGS) -o $(BIN_DIR)/$(BINARY_NAME)-mac
	@echo "Done: $(BIN_DIR)/$(BINARY_NAME)-mac"

pi5:
	@echo "Building $(BINARY_NAME) for Raspberry Pi 5..."
	@mkdir -p $(BIN_DIR)
	GOOS=linux GOARCH=arm64 go build $(BUILD_FLAGS) -o $(BIN_DIR)/$(BINARY_NAME)-pi5
	@echo "Done: $(BIN_DIR)/$(BINARY_NAME)-pi5"

# ----------------------------------
# Clean all binaries
# ----------------------------------
clean:
	@echo "Cleaning all binaries..."
	rm -rf $(BIN_DIR)
	@echo "Done."

# Individual clean targets
clean-amd64:
	@echo "Cleaning AMD64 binary..."
	rm -f $(BIN_DIR)/$(BINARY_NAME)-amd64
	@echo "Done."

clean-mac:
	@echo "Cleaning Mac binary..."
	rm -f $(BIN_DIR)/$(BINARY_NAME)-mac
	@echo "Done."

clean-pi5:
	@echo "Cleaning Pi5 binary..."
	rm -f $(BIN_DIR)/$(BINARY_NAME)-pi5
	@echo "Done."

# ----------------------------------
# Phony targets
# ----------------------------------
.PHONY: all build build-amd64 build-mac build-pi5 clean clean-amd64 clean-mac clean-pi5
