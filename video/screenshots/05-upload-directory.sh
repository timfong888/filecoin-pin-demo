#!/bin/bash
# Upload directory with auto-funding

cat << 'EOF'
# =================================================================
#   UPLOAD DIRECTORY WITH AUTO-FUNDING
# =================================================================

# Create directory with files
mkdir my-data
echo "File 1" > my-data/file1.txt
echo "File 2" > my-data/file2.txt

# Upload with auto-funding (v0.7.0+)
filecoin-pin add --auto-fund my-data/

# Output:
# ✓ Funding requirements met
# ✓ Directory packed: bafybe...
# ✓ Size: 433.0 B
# ✓ Transaction: 0x...
EOF
