
SHELL := /usr/bin/env bash

# ZIGROOT :=
ZIGROOT := /opt/zig-dev/zig-linux-x86_64-0.13.0-dev.386+3964b2a31/

ZCC := $(ZIGROOT)zig cc
ZBE := $(ZIGROOT)zig build-exe

LOD := llvm-objdump
LRE := llvm-readelf
LOC := llvm-objcopy

UF := /opt/ti/uniflash/dslite.sh
GDBSRVR := /opt/ti/ccs1271/ccs/ccs_base/common/uscif/gdb_agent_console

TRGTF := -target armeb-freestanding -mcpu=cortex_r4f
# TRGTF := -target arm-freestanding -mcpu=cortex_r4f

ZCF := $(TRGTF) -g3 -O0 -Wno-unused-command-line-argument
ZBEF := $(TRGTF) -O Debug

SRCDIR := ./src

AUX_SRCDIR := ../src

DISDIR := ./dis
OUTDIR := ./zig-bin

SRCASM := sys_intvecs.s \
          sys_core.s

SRCZIG := main.zig

AUX_SRCZIG := system.zig \
              gio.zig \
              vim.zig

ZIG_ROOT_MODULE := $(SRCDIR)/$(word 1, $(SRCZIG))

DEPS := $(addprefix --dep , $(AUX_SRCZIG))

# Lazy evaluation intentional here ...
AUX_MODULES_1 = $(addprefix -M, $(1))
AUX_MODULES_2 = $(addprefix $(AUX_SRCDIR)/, $(1))
pair = $(AUX_MODULES_1)=$(AUX_MODULES_2)

AUX_MODULES := $(foreach x,$(AUX_SRCZIG),$(call pair,$(x)))

LD_SCRIPT := ../misc/lt_link.ld

MC_CFG := ../misc/TMS570LS1224.ccxml
GDBSRVR_CFG := $(realpath ../misc/testBoard.dat)

OBJ := $(addprefix $(OUTDIR)/, $(SRCASM:.s=.o))
BINARY := $(OUTDIR)/blink-rti.elf

MKDIRS := $(OUTDIR) $(DISDIR)

VPATH := $(SRCDIR) $(AUX_SRCDIR)

.PHONY: all flash launchgdb clean


all: $(MKDIRS) $(BINARY)


flash: $(MKDIRS) $(BINARY)
	$(UF) -c $(MC_CFG) -e -v -r 0 -f $(BINARY)


launchgdb:
	-$(GDBSRVR) $(GDBSRVR_CFG)


$(MKDIRS):
	mkdir $@


$(BINARY): $(SRCZIG) $(AUX_SRCZIG) $(OBJ) $(LD_SCRIPT)
	$(ZBE) $(ZBEF) --name $(notdir $@) --script $(LD_SCRIPT) \
           --verbose-link \
           $(DEPS) -Mroot=$(ZIG_ROOT_MODULE) $(AUX_MODULES) $(OBJ)
	mv $(notdir $@).o $(notdir $@) $(dir $@)
	$(LOD) -S $(addsuffix .o, $@) > \
           $(DISDIR)/$(addsuffix .o.dis, $(notdir $@)) 2>&1
	$(LOD) -S $@ > $(DISDIR)/$(addsuffix .dis, $(notdir $@)) 2>&1
	$(LRE) -a $@ > $(DISDIR)/elf-summary.txt 2>&1
	$(LOC) -O ihex $@ $(subst .elf,.hex, $@)
	$(LOC) -O binary $@ $(subst .elf,.bin, $@)
	chmod -x $@ $(subst .elf,.hex, $@) $(subst .elf,.bin, $@)


$(OUTDIR)/%.o: %.s
	$(ZCC) $(ZCF) -c $< -o $@
	$(LOD) -S $@ > $(DISDIR)/$(addsuffix .dis, $(notdir $<)) 2>&1


clean:
	-rm -rf $(MKDIRS)

