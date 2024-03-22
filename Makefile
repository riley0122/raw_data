CC := gcc
RUSTC := rustc

SRC_DIR := src
C_LIB_DIR := src/c_lib
LIB_DIR := lib

C_SRC := $(wildcard $(C_LIB_DIR)/*.c)
C_LIB := $(LIB_DIR)/libprovider.so
RUST_LIB := target/debug/raw-data.a

.PHONY: all clean

all: $(C_LIB) $(RUST_LIB)

test: all
	@echo "Running tests..."
	( LD_LIBRARY_PATH="./lib" cargo test )

$(C_LIB): $(C_SRC) | $(LIB_DIR)
	$(CC) -shared -o $@ $^

$(RUST_LIB):
	cargo build

$(LIB_DIR):
	mkdir -p $(LIB_DIR)

clean:
	rm -f $(C_LIB)
	cargo clean
