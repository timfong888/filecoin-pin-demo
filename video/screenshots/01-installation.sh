#!/bin/bash
# Installation steps

cat << 'EOF'
# =================================================================
#   INSTALLATION
# =================================================================

# Install Node.js 22+
nvm install 22
nvm use 22

# Install CLI tools globally
npm install -g filecoin-pin
npm install -g ipfs-car

# Install Foundry (for cast commands)
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Install GitHub CLI
brew install gh

# Verify installations
filecoin-pin --version
ipfs-car --version
cast --version
gh --version
node --version
EOF
