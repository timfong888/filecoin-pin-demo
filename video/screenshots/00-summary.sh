#!/bin/bash
# Filecoin Pin CLI - Complete Workflow

cat << 'EOF'
# =================================================================
#   UPLOAD IPFS FILES TO FILECOIN
# =================================================================

# Install
npm install -g filecoin-pin

# Setup Payments (one-time)
filecoin-pin payments setup --auto

# Upload Files with auto-funding
filecoin-pin add --auto-fund demo.txt
filecoin-pin add --auto-fund my-data/

# Verify Storage & Proofs
filecoin-pin data-set --ls
curl -o demo.car https://provider/piece/bafkzci...
ipfs-car unpack demo.car

# Automate with GitHub Actions
gh secret set FILECOIN_PRIVATE_KEY
gh workflow run upload.yml
EOF
