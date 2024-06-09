ARCH=x86_64
GO=cargo
TEST_FLAGS=xtest
RUST_BUILD=$(GO) xbuild
RUST_FLAGS=--target $(ARCH).json 
IMAGE=target/$(ARCH)/debug/bootimage-kernel.bin
QEMU=qemu-system-x86_64 -drive format=raw,file=$(IMAGE)

build: src/main.rs
	$(RUST_BUILD) $(RUST_FLAGS)

boot: 
	$(GO) bootimage

run: boot
	$(QEMU)

test:
	$(GO) $(TEST_FLAGS)

clean:
	$(GO) clean

all: boot
