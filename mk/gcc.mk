
CC$(sm)		:= $(CROSS_COMPILE_$(sm))gcc
CXX$(sm)	:= $(CROSS_COMPILE_$(sm))g++
CPP$(sm)	:= $(CROSS_COMPILE_$(sm))cpp
LD$(sm)		:= $(CROSS_COMPILE_$(sm))ld.bfd
AR$(sm)		:= $(CROSS_COMPILE_$(sm))ar
NM$(sm)		:= $(CROSS_COMPILE_$(sm))nm
OBJCOPY$(sm)	:= $(CROSS_COMPILE_$(sm))objcopy
OBJDUMP$(sm)	:= $(CROSS_COMPILE_$(sm))objdump
READELF$(sm)	:= $(CROSS_COMPILE_$(sm))readelf

nostdinc$(sm)	:= 

# nostdinc$(sm)	:= -nostdinc -isystem $(shell $(CC$(sm)) \
# 			-print-file-name=include 2> /dev/null) \
			# -isystem /optee/optee-qemu-v8/toolchains/aarch64/bin/../lib/gcc/aarch64-none-linux-gnu/10.2.1/../../../../aarch64-none-linux-gnu/include \
			# -isystem /optee/optee-qemu-v8/toolchains/aarch64/bin/../lib/gcc/aarch64-none-linux-gnu/10.2.1/../../../../aarch64-none-linux-gnu/include/c++/10.2.1 \
			# -isystem /optee/optee-qemu-v8/toolchains/aarch64/bin/../lib/gcc/aarch64-none-linux-gnu/10.2.1/../../../../aarch64-none-linux-gnu/include/c++/10.2.1/aarch64-none-linux-gnu \
			# -isystem /optee/optee-qemu-v8/toolchains/aarch64/bin/../lib/gcc/aarch64-none-linux-gnu/10.2.1/../../../../aarch64-none-linux-gnu/include/c++/10.2.1/backward

# Get location of libgcc from gcc
libgcc$(sm)  	:= $(shell $(CC$(sm)) $(CFLAGS$(arch-bits-$(sm))) \
			-print-libgcc-file-name 2> /dev/null)
libstdc++$(sm)	:= --start-group \
			$(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) -print-file-name=libstdc++.a 2> /dev/null) \
			$(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) -print-file-name=libc.a 2> /dev/null) \
			$(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) -print-file-name=libnosys.a 2> /dev/null) \
			$(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) -print-file-name=crti.o 2> /dev/null) \
			--end-group
			
# libgcc_eh$(sm)	:= $(shell $(CXX$(sm)) $(CXXFLAGS$(arch-bits-$(sm))) $(comp-cxxflags$(sm)) \
# 			-print-file-name=libgcc_eh.a 2> /dev/null)
libgcc_eh$(sm)	:=

# Define these to something to discover accidental use
CC		:= false
CXX		:= false
CPP		:= false
LD		:= false
AR		:= false
NM		:= false
OBJCOPY		:= false
OBJDUMP		:= false
READELF		:= false
nostdinc	:= --bad-nostdinc-variable
libgcc  	:= --bad-libgcc-variable


