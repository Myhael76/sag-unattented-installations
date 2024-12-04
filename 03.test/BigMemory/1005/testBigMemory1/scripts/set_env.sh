#!/bin/sh

# commonFunctions variables
export SUIF_ONLINE_MODE=${SUIF_ONLINE_MODE:-0}
export SUIF_AUDIT_BASE_DIR=${SUIF_AUDIT_BASE_DIR:-"/tmp"}

# setupFunctions Variables
export SUIF_INSTALL_INSTALLER_BIN=${SUIF_INSTALL_INSTALLER_BIN:-"/tmp/installer.bin"}
export SUIF_INSTALL_IMAGE_FILE=${SUIF_INSTALL_IMAGE_FILE:-"/tmp/product.image.zip"}
export SUIF_INSTALL_INSTALL_DIR=${SUIF_INSTALL_INSTALL_DIR:-"/opt/sag/products"}
export SUIF_INSTALL_SPM_HTTPS_PORT=${SUIF_INSTALL_SPM_HTTPS_PORT:-"9083"}
export SUIF_INSTALL_SPM_HTTP_PORT=${SUIF_INSTALL_SPM_HTTP_PORT:-"9082"}

export SUIF_PATCH_SUM_BOOTSTRAP_BIN=${SUIF_PATCH_SUM_BOOTSTRAP_BIN:-"/tmp/sum-bootstrap.bin"}
export SUIF_PATCH_FIXES_IMAGE_FILE=${SUIF_PATCH_FIXES_IMAGE_FILE:-"/tmp/fixes.image.zip"}

# Specific product setup variables
export SUIF_SETUP_TEMPLATE_TES_LICENSE_FILE=${SUIF_INSTALL_TES_License_Path:-"/tmp/terracotta-license.key"}

# Post setup template specifics
export SUIF_POST_TC_SERVER_LOGS_DIR=${SUIF_TC_SERVER_LOGS_DIR:-"./logs"}
export SUIF_POST_TC_SERVER_DATA_DIR=${SUIF_TC_SERVER_DATA_DIR:-"./data"}
export SUIF_POST_TC_SERVER_PORT=${SUIF_TC_SERVER_PORT:-"9510"}
export SUIF_POST_TC_SERVER_GROUP_PORT=${SUIF_TC_SERVER_GROUP_PORT:-"9540"}
export SUIF_POST_TC_SERVER_OFFHEAP_MEM_DATA_SIZE=${SUIF_TC_SERVER_OFFHEAP_MEM_DATA_SIZE:-"2048m"}

env | grep SUIF | sort