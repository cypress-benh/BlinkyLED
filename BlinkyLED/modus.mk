#
# This file has two purposes.  The first purpose is to provide information
# to the makefile build system.  The second purpose is to provide information
# to any IDE about the example.  Therefore, this file should not contain any
# thing other than make variables.  Any other more complex make file magic
# should go into some other file.
#

#
# The toolchain we are using.  This is not the specific version, but just
# the general type (e.g. GCC, IAR, CLAGS, etc.)
#
TOOLCHAIN = GCC
CYGCCVER = gcc-7.2.1-1.0
OPTIMIZATION = Og
CONFIG = DEBUG

#
# The target platform for the example.  A platform is a set of hardware that
# is targeted by this example.  Many examples work with multiple PLATFORM
# values and can be retargeted to a new PLATFORM by just including the
# new PLATFORM value as part of the make invocation.  Some platforms require
# additional information and this must be provided as well
#
# Examples of the PSoC 6 based platform
#    PLATFORM=PSOC64343W
#    DEVICE=CY8C6247BZI-D54
#
PLATFORMS_VERSION=1.0
PLATFORM = PSOC6_DUAL_CORE
DEVICE = CY8C6247BZI-D54

#
# The name of this example.  This is used as a default name for
# any IDE that is creating a new project based on this example
#
CY_EXAMPLE_NAME = BlinkyLED

#
# For an IDE, this is the description of the example project to display
#
CY_EXAMPLE_DESCRIPTION = Sample dual core blinky application

#
# If this is true, this example is shown as part of the new project dialog
# process in and IDE.  If this is false, this is not shown
#
CY_SHOW_NEW_PROJECT = true

#
# This is the list of valid platforms for this example
#
CY_VALID_PLATFORMS = PSOC6_DUAL_CORE

#
# This is the required SDK for this example
#
CY_REQUIRED_SDK = Cypress SDK[1.0]

#
# The list of valid devices for this example.  If this is empty
# there this example works for all devices
#
CY_VALID_DEVICES =

#
# The source code for the CM0+ application
#
CY_APP_CM0P_SOURCE = \
	prj_CM0p/main.c\

#
# The source code for the CM4 application
#
CY_APP_CM4_SOURCE = \
	prj_CM4/main.c\
	prj_CM4/cycfg_init.c

#
# Includes specific to the CM0+ application
#
APP_MAINAPP_CM0P_INCLUDES = \
	-IGeneratedSource\
	-Iprj_CM0p\
	-I$(CY_GENERATED_DIR)/$(CYMAINAPP_CM0P_NAME)/prj_CM0p

#
# Includes specific to the CM4 application
#
APP_MAINAPP_CM4_INCLUDES = \
	-IGeneratedSource\
	-Iprj_CM4\
	-I$(CY_GENERATED_DIR)/$(CYMAINAPP_CM4_NAME)/prj_CM4

#
# Flags specific to the CM0+ application
#
APP_MAINAPP_CM0P_FLAGS =

#
# Flags specific to the CM4 application
#
APP_MAINAPP_CM4_FLAGS = \
	-mfloat-abi=softfp\
	-mfpu=fpv4-sp-d16

#
# Defines specific to the CM0+ application
#
APP_MAINAPP_CM0P_DEFINES = \
	-DAPP_NAME='"$(CY_EXAMPLE_NAME)_cm0p"'\
	-D$(CONFIG)

#
# Defines specific to the CM4 application
#
APP_MAINAPP_CM4_DEFINES = \
	-DAPP_NAME='"$(CY_EXAMPLE_NAME)_cm4"'\
	-D$(CONFIG)

#
# Any software (middleware) components needed by CM0+
#
CY_MAINAPP_CM0P_SWCOMP_USED = \

#
# Any software (middleware) components needed by CM4
#
CY_MAINAPP_SWCOMP_USED = \

#
# The path to the design.modus file
#
CYCONFIG_DESIGN_MODUS = design.modus

#
# The set of generated source files
#
CYCONFIG_GENERATED_SOURCES = \

#
# Check to be sure we can find the SDK.  The SDK is found via the
# CYSDK environment variable
#
ifndef CYSDK
$(error The SDK must be defined via the CYSDK environment variable)
endif

#
# Include the main makefile for building this type of example
#
include $(CYSDK)/libraries/platforms-$(PLATFORMS_VERSION)/$(PLATFORM).mk
