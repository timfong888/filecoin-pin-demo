#!/bin/bash
# GitHub Actions setup

cat << 'EOF'
# =================================================================
#   GITHUB ACTIONS
# =================================================================

# Authenticate with GitHub
gh auth login

# Set secrets for automation
gh secret set FILECOIN_PRIVATE_KEY
gh secret set FILECOIN_RPC_URL

# Verify secrets
gh secret list

# Create workflow file
mkdir -p .github/workflows
cat > .github/workflows/upload.yml << 'WORKFLOW'
name: Upload to Filecoin
on: workflow_dispatch
jobs:
  upload:
    runs-on: ubuntu-22.04
    steps:
      - uses: actions/setup-node@v4
        with:
          node-version: '22'
      - run: npm install -g filecoin-pin
      - run: echo "Hello Actions" > file.txt
      - env:
          PRIVATE_KEY: ${{ secrets.FILECOIN_PRIVATE_KEY }}
          RPC_URL: ${{ secrets.FILECOIN_RPC_URL }}
        run: filecoin-pin add file.txt
WORKFLOW
EOF
