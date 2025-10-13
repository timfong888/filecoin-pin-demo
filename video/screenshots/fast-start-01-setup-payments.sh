#!/bin/bash
# Fast Start 01: Setup Payments

cat << 'EOF'
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#   01. SETUP PAYMENTS
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

filecoin-pin payments setup --auto

# Expected output:
# ✓ WarmStorage permissions configured
# ✓ Ready to upload
#
# Status:
#   Storage Deposit: 0.0000 USDFC
#   Payment Rails: No active rails
#   WarmStorage: Ready to upload
#
# Use --auto-fund when uploading to handle deposits automatically
EOF
