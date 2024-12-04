#!/bin/sh

# Depends on framework commons
if ! command -V "logI" 2>/dev/null | grep function >/dev/null; then
    echo "Need the function urlencode(), sourcing commonFunctions.sh "
    if [ ! -f "$SUIF_CACHE_HOME/01.scripts/commonFunctions.sh" ]; then
        echo "Panic, framework issue!"
        exit 244
    fi
    . "$SUIF_CACHE_HOME/01.scripts/commonFunctions.sh"
fi

# Section 1 - the caller MUST provide
## Framework - Install
export SUIF_INSTALL_INSTALLER_BIN=${SUIF_INSTALL_INSTALLER_BIN:-"/path/to/installer.bin"}
export SUIF_INSTALL_IMAGE_FILE=${SUIF_INSTALL_IMAGE_FILE:-"/path/to/install/product.image.zip"}
## Framework - Patch
export SUIF_PATCH_SUM_BOOTSTRAP_BIN=${SUIF_PATCH_SUM_BOOTSTRAP_BIN:-"/path/to/sum-bootstrap.bin"}
export SUIF_PATCH_FIXES_IMAGE_FILE=${SUIF_PATCH_FIXES_IMAGE_FILE:-"/path/to/install/fixes.image.zip"}
## Current Template
export SUIF_SETUP_TEMPLATE_TES_LICENSE_FILE=${SUIF_SETUP_TEMPLATE_TES_LICENSE_FILE:-"/provide/path/to/terracotta-license.key"}

# Section 2 - the caller MAY provide
## Framework - Install
export SUIF_INSTALL_INSTALL_DIR=${SUIF_INSTALL_INSTALL_DIR:-"/opt/sag/products"}
export SUIF_INSTALL_SPM_HTTPS_PORT=${SUIF_INSTALL_SPM_HTTPS_PORT:-"9083"}
export SUIF_INSTALL_SPM_HTTP_PORT=${SUIF_INSTALL_SPM_HTTP_PORT:-"9082"}
## Framework - Patch
export SUIF_SUM_HOME=${SUIF_SUM_HOME:-"/opt/sag/sum"}

## Section 3 - Post processing
## eventually provided values are overwritten!
export SUIF_SETUP_TEMPLATE_TES_LICENSE_UrlEncoded=$(urlencode ${SUIF_SETUP_TEMPLATE_TES_LICENSE_FILE})
