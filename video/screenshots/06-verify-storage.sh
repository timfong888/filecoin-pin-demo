#!/bin/bash
# Verify storage using ipfs-car

cat << 'EOF'
# =================================================================
#   VERIFY STORAGE
# =================================================================

# Download CAR file from provider
curl -o demo-downloaded.car https://calib.ezpdpz.net/piece/bafkzci...

# Verify CAR file with ipfs-car
ipfs-car roots demo-downloaded.car

# List contents of CAR file
ipfs-car ls demo-downloaded.car

# Unpack the CAR file
ipfs-car unpack demo-downloaded.car --output demo-restored

# Compare with original
diff demo.txt demo-restored/demo.txt
echo "✓ Files are identical!"
EOF
