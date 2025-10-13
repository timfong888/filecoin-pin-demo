#!/bin/bash
# Check wallet status - Style 5 with green equals

cat << 'EOF'
# =================================================================
#   CHECK WALLET STATUS
# =================================================================

# Load wallet credentials
source ~/.filecoin-pin-env

# Check payment status
filecoin-pin payments status

# Expected output:
# ━━━ Current Status ━━━
# Address: 0xD8106706EF440B48ACfc1F0cB542E8f5Dc5F058e
# Network: calibration
#
# Wallet
#   54.99 tFIL
#   200.0000 USDFC
#
# Storage Deposit
#   0.0000 USDFC deposited
EOF
