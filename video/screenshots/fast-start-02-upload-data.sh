#!/bin/bash
# Fast Start 02: Upload Data

cat << 'EOF'
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#   02. UPLOAD DATA
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

echo "Hello Filecoin!" > demo.txt
filecoin-pin add --auto-fund demo.txt

# Output:
# ✓ Auto-fund: Deposited 2.1234 USDFC (runway: ~10 days)
# ✓ Directory validated
# ✓ File packed
# ✓ IPFS content loaded with root CID
# ✓ Piece created (CommP computed)
# ✓ Piece registered on Filecoin
#
# Root CID: bafybeibh422kjvgfmymx6nr7jandwngrown6ywomk4vplayl4de2x553t4
# Piece CID: bafkzcibcfab4grpgq6e6rva4kfuxfcvibdzx3kn2jdw6q3zqgwt5cou7j6k4wfq
# Size: 239.0 B
# Data Set ID: 325
# Transaction: 0xabc...def
EOF
