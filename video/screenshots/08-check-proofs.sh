#!/bin/bash
# Check PDP proofs for your data

cat << 'SCRIPT_EOF'
# =================================================================
#   CHECK PROOF OF DATA POSSESSION (PDP)
# =================================================================

# Get detailed data set info (includes proof rail ID)
filecoin-pin data-set 325

# Expected output:
# Data Set #325 • live
#   Pieces stored: 2
#   Total size: 672.0 B
#   Provider: ezpdpz-calib (ID 3)
#   PDP rail ID: 631                    # Active proof rail
#   Next proof challenge: ~2 hours
#   Proofs submitted: 47 (all passed)

# Open PDP Explorer in browser for visual proof history
open https://pdp-explorer.filecoin.io/dataset/325

# Or query blockchain directly for latest proof event
cast logs --address 0x... --from-block latest -n 1 \
  --rpc-url https://api.calibration.node.glif.io/rpc/v1

# Proof events show cryptographic verification that
# your data is being stored correctly
SCRIPT_EOF
