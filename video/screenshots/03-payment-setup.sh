#!/bin/bash
# Payment setup with auto-funding options

cat << 'EOF'
# =================================================================
#   SETUP PAYMENTS
# =================================================================

# Option 1: Auto mode (funds ~10 days per upload)
filecoin-pin payments setup --auto

# Option 2: Exact mode (funds N days per upload)
filecoin-pin payments setup --exact --days 30

# Expected output:
# ✓ WarmStorage permissions configured
# ✓ Auto-funding enabled
# Status: Ready to upload
#
# Note: No deposit made at setup!
# Funding happens automatically when you upload with --auto-fund
# Amount calculated based on file size + configured days

# Verify setup complete
filecoin-pin payments status
EOF
