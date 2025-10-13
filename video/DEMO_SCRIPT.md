# Filecoin Pin CLI - Video Demo Script

## Video Overview (30 seconds)

**[VOICEOVER]**
"Welcome to Filecoin Pin CLI."
"Upload files to decentralized storage."
"Pay with stablecoins."
"Verify with cryptographic proofs."
"Automate with GitHub Actions."

**[SHOW: Summary Screenshot]**

---

## Part 1: Installation (45 seconds)

**[VOICEOVER]**
"First, install the required tools."
"Node.js twenty-two or higher."
"Filecoin Pin CLI from npm."
"Foundry for wallet operations."
"GitHub CLI for automation."

**[SHOW: Installation Screenshot]**

**[TERMINAL]**
```bash
# Install Node.js 22+
nvm install 22

# Install CLI tools globally
npm install -g filecoin-pin
npm install -g ipfs-car

# Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

# Install GitHub CLI
brew install gh
```

**[VOICEOVER]**
"Verify installations."

**[TERMINAL]**
```bash
filecoin-pin --version
ipfs-car --version
cast --version
gh --version
```

---

## Part 2: Check Wallet Status (30 seconds)

**[VOICEOVER]**
"Check your funded wallet."
"Verify FIL and USDFC balances."

**[SHOW: Wallet Status Screenshot]**

**[TERMINAL]**
```bash
# Load wallet credentials
source ~/.filecoin-pin-env

# Check payment status
filecoin-pin payments status
```

**[TERMINAL OUTPUT]**
```
Address: 0xD8106706EF440B48ACfc1F0cB542E8f5Dc5F058e
Network: calibration

Wallet
  54.99 tFIL
  200.0000 USDFC

Storage Deposit
  0.0000 USDFC deposited
```

**[VOICEOVER]**
"Wallet is funded and ready."

---

## Part 3: Payment Setup (1 minute)

**[VOICEOVER]**
"Configure payment system."
"Two options available."

**[SHOW: Payment Setup Screenshot]**

**[VOICEOVER]**
"Auto mode funds ten days per upload."
"Exact mode lets you specify days."
"Important: No deposit at setup."

**[TERMINAL]**
```bash
# Option 1: Auto mode (~10 days per upload)
filecoin-pin payments setup --auto

# Option 2: Exact mode (custom days per upload)
filecoin-pin payments setup --exact --days 30
```

**[VOICEOVER]**
"Using auto mode for this demo."
"Wait for blockchain confirmation."

**[TERMINAL OUTPUT]**
```
✓ WarmStorage permissions configured
✓ Auto-funding enabled
Status: Ready to upload
```

**[VOICEOVER]**
"Setup complete, no funds deposited yet."
"Funding happens when you upload."
"Amount calculated per file."

**[TERMINAL]**
```bash
filecoin-pin payments status
```

---

## Part 4: Upload Files (2 minutes)

### Single File with Auto-Funding

**[VOICEOVER]**
"Create a test file."
"Upload to Filecoin with auto-funding."

**[SHOW: Upload File Screenshot]**

**[TERMINAL]**
```bash
echo "Hello Filecoin!" > demo.txt
filecoin-pin add --auto-fund demo.txt
```

**[TERMINAL OUTPUT]**
```
✓ Funding requirements met
✓ File packed with root CID: bafybe...
✓ Storage context ready

Filecoin Storage
  Piece CID: bafkzci...
  Data Set ID: 325
  Provider: ezpdpz-calib
  Transaction: 0x...
```

**[VOICEOVER]**
"Auto-funding handles payment."
"File uploaded successfully."
"Got IPFS CID and Piece CID."

### Upload Directory with Auto-Funding

**[VOICEOVER]**
"Upload multiple files."
"Create a directory."

**[SHOW: Upload Directory Screenshot]**

**[TERMINAL]**
```bash
mkdir my-data
echo "File 1" > my-data/file1.txt
echo "File 2" > my-data/file2.txt
filecoin-pin add --auto-fund my-data/
```

**[VOICEOVER]**
"Directory uploaded with auto-funding."
"All files preserved."
"Perfect for CI-CD pipelines."

---

## Part 5: Verify Storage (1.5 minutes)

**[VOICEOVER]**
"Verify data stored."
"Download from provider."
"Extract original files."

**[SHOW: Verification Screenshot]**

**[TERMINAL]**
```bash
# Download CAR file
curl -o demo-downloaded.car https://calib.ezpdpz.net/piece/bafkzci...

# Verify CAR file with ipfs-car
ipfs-car roots demo-downloaded.car

# List contents
ipfs-car ls demo-downloaded.car

# Unpack CAR file
ipfs-car unpack demo-downloaded.car --output demo-restored

# Compare files
diff demo.txt demo-restored/demo.txt
```

**[VOICEOVER]**
"Roots show content identifiers."
"Files match exactly."
"Data verified."

### Check Data Sets

**[VOICEOVER]**
"List all data sets."
"View detailed information."

**[TERMINAL]**
```bash
# List all data sets
filecoin-pin data-set --ls

# Inspect specific data set
filecoin-pin data-set 325
```

**[TERMINAL OUTPUT]**
```
Data Set #325 • live
  Pieces stored: 2
  Total size: 672.0 B
  Provider: ezpdpz-calib
```

### Check Proof of Data Possession

**[VOICEOVER]**
"Verify cryptographic proofs."
"PDP rails ensure data integrity."

**[SHOW: Check Proofs Screenshot]**

**[TERMINAL]**
```bash
# Get proof rail information
filecoin-pin data-set 325
```

**[TERMINAL OUTPUT]**
```
Data Set #325 • live
  PDP rail ID: 631
  Next proof challenge: ~2 hours
  Proofs submitted: 47 (all passed)
```

**[VOICEOVER]**
"Forty-seven proofs submitted."
"All passed."
"View in PDP Explorer."

**[SWITCH TO: Browser showing https://pdp-explorer.filecoin.io/dataset/325]**

**[VOICEOVER]**
"Visual proof history."
"Cryptographic verification active."

---

## Part 6: Blockchain Verification (1 minute)

**[VOICEOVER]**
"Verify on blockchain."
"Check transaction status."
"Compare balance methods."

**[SHOW: Blockchain Verification Screenshot]**

**[TERMINAL]**
```bash
# Check transaction
cast receipt 0x... --rpc-url $RPC_URL

# Compare balances
filecoin-pin payments status
cast balance $WALLET_ADDRESS --rpc-url $RPC_URL
```

**[VOICEOVER]**
"Both show same balance."
"CLI queries blockchain directly."
"No cached data."

---

## Part 7: GitHub Actions (2 minutes)

**[VOICEOVER]**
"Automate with GitHub Actions."
"Set up secrets."
"Create workflow."

**[SHOW: GitHub Actions Screenshot]**

**[TERMINAL]**
```bash
# Authenticate
gh auth login

# Set secrets
gh secret set FILECOIN_PRIVATE_KEY
gh secret set FILECOIN_RPC_URL

# Verify secrets
gh secret list
```

**[VOICEOVER]**
"Create upload workflow."

**[TERMINAL]**
```bash
mkdir -p .github/workflows
cat > .github/workflows/upload.yml << 'EOF'
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
EOF
```

**[VOICEOVER]**
"Commit and push."

**[TERMINAL]**
```bash
git add .github/workflows/
git commit -m "feat: add upload workflow"
git push
```

### Trigger Workflow

**[VOICEOVER]**
"Trigger from CLI."
"Watch in real time."

**[TERMINAL]**
```bash
# List workflows
gh workflow list

# Trigger workflow
gh workflow run upload.yml

# Get run ID
RUN_ID=$(gh run list --limit 1 --json databaseId --jq '.[0].databaseId')

# Watch progress
gh run watch $RUN_ID
```

### View Upload Logs

**[VOICEOVER]**
"View the logs."
"Markdown formatted results."
"Shows upload details."

**[SHOW: GitHub Actions Logs Screenshot]**

**[TERMINAL]**
```bash
# View logs with markdown output
gh run view $RUN_ID --log
```

**[VOICEOVER]**
"Job summary shows all details."
"Root CID, Piece CID, Data Set ID."
"Transaction hash for verification."
"Perfect for CI-CD pipelines."

**[SWITCH TO: Live GitHub Actions UI in browser]**

**[VOICEOVER]**
"Here's the live version in GitHub."

---

## Closing (30 seconds)

**[VOICEOVER]**
"You've uploaded to Filecoin."
"Verified with cryptographic proofs."
"Automated with GitHub Actions."
"All from the terminal."
"Visit docs for more."
"Start building today."

**[SHOW: Final Summary Screenshot]**

**[TEXT ON SCREEN]**
```
Documentation: github.com/filecoin-project/filecoin-pin
Get Started: npm install -g filecoin-pin
```

---

## Summary of Major Commands

```bash
# Installation
npm install -g filecoin-pin
npm install -g ipfs-car

# Check Wallet
filecoin-pin payments status

# Payment Setup (first time only)
filecoin-pin payments setup --auto              # Auto mode (~10 days)
filecoin-pin payments setup --exact --days 30   # Exact mode (custom days)

# Upload with auto-funding
filecoin-pin add --auto-fund <file>
filecoin-pin add --auto-fund <directory>

# Verify Storage
ipfs-car roots <file.car>
ipfs-car ls <file.car>
ipfs-car unpack <file.car> --output <dir>

# Data Sets
filecoin-pin data-set --ls
filecoin-pin data-set <id>

# GitHub Actions
gh secret set FILECOIN_PRIVATE_KEY
gh workflow run <workflow>
gh run watch <run-id>
gh run view <run-id> --log
```

---

## Technical Notes for Video Production

**Total Duration:** ~9-10 minutes
**Pace:** Moderate (allow time to read commands)
**Screen Layout:**
- Terminal: 70% of screen
- Voiceover text: Bottom 15% (optional captions)
- Progress indicator: Top right

**Screenshot Timing:**
- Show screenshot for 3-5 seconds before each section
- Use carbon-now-cli for all code screenshots
- Dark theme recommended
- Font: Fira Code or similar monospace

**Transitions:**
- Quick cuts between sections (0.5s fade)
- Highlight important output in terminal
- Pause 2s after each major step completes

**Audio:**
- Clear, measured pace
- Emphasize key terms: "Filecoin", "IPFS", "cryptographic proofs"
- Consistent volume throughout
