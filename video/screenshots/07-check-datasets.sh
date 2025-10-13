#!/bin/bash
# Check data sets

cat << 'EOF'
# =================================================================
#   CHECK DATA SETS
# =================================================================

# List all data sets
filecoin-pin data-set --ls

# Expected output:
# #325 • live • managed
#   Provider: ezpdpz-calib (ID 3)
#   Pieces stored: 2

# Inspect specific data set
filecoin-pin data-set 325

# Expected output:
# Data Set #325 • live
#   Pieces stored: 2
#   Total size: 672.0 B
#   Provider: ezpdpz-calib
EOF
