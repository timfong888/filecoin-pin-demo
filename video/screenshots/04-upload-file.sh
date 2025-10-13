#!/bin/bash
# Upload file with auto-funding

cat << 'EOF'
# =================================================================
#   UPLOAD FILE TO FILECOIN
# =================================================================

# Create test file
echo "Hello Filecoin!" > demo.txt

# Upload with auto-funding (calculates cost for configured days)
filecoin-pin add --auto-fund demo.txt

# Output:
# ✓ Funding requirements met (deposited X USDFC for ~10 days)
# ✓ File packed with root CID: bafybe...
# ✓ IPFS content loaded
#
# Filecoin Storage:
#   Piece CID: bafkzci...
#   Data Set ID: 325
#   Provider: ezpdpz-calib
#   Transaction: 0x...
EOF
