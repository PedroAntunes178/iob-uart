# (c) 2022-Present IObundle, Lda, all rights reserved
#
# This makefile segment lists all hardware header and source files 
#
# It is always included in submodules/LIB/Makefile for populating the
# build directory
#
ifeq ($(filter UART, $(HW_MODULES)),)

#add itself to HW_MODULES list
HW_MODULES+=UART

#import lib hardware
include $(LIB_DIR)/hardware/include/hw_setup.mk
include $(LIB_DIR)/hardware/iob_reg/hw_setup.mk

UART_INC_DIR:=$(UART_DIR)/hardware/include
UART_SRC_DIR:=$(UART_DIR)/hardware/src

#HEADERS

SRC+=$(BUILD_VSRC_DIR)/iob_uart_swreg_gen.vh $(BUILD_VSRC_DIR)/iob_uart_swreg_def.vh

$(BUILD_VSRC_DIR)/iob_uart_swreg_%.vh: iob_uart_swreg_%.vh 
	mv $< $@

iob_uart_swreg_def.vh iob_uart_swreg_gen.vh: $(UART_DIR)/mkregs.conf
	$(LIB_DIR)/scripts/mkregs.py iob_uart $(UART_DIR) HW

endif