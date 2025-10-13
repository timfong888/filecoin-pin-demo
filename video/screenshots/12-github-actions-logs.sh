#!/bin/bash
# GitHub Actions markdown logs output

cat << 'SCRIPT_EOF'
# =================================================================
#   GITHUB ACTIONS LOGS - UPLOAD RESULTS
# =================================================================

# View logs from latest run
gh run view $RUN_ID --log

# Sample markdown output in job summary:
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
# ## Filecoin Upload Results
# 
# ### Upload Summary
# - **File**: file.txt
# - **Root CID**: bafybeigdyrzt5sfp7udm7hu76uh7y26nf3efuylqabf3oclgtqy55fbzdi
# - **Status**: ✅ Success
# 
# ### Storage Details
# | Field | Value |
# |-------|-------|
# | Piece CID | bafkzcibca...vq7kq |
# | Data Set ID | 428 |
# | Provider | ezpdpz-calib |
# | Transaction | 0x8f2a... |
# 
# 🎉 **Upload Complete!**
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
SCRIPT_EOF
