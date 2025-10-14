## Part 3: Create GitHub Actions from CLI (Optional)

> 💡 **Note**: This section is optional and demonstrates how to automate Filecoin uploads using GitHub Actions. You'll need a GitHub repository and the `gh` CLI tool installed.

### Step 1: Authenticate with GitHub

```bash
gh auth login
```

**Interactive prompts:**
```
? What account do you want to log into? GitHub.com
? What is your preferred protocol for Git operations? HTTPS
? Authenticate Git with your GitHub credentials? Yes
? How would you like to authenticate GitHub CLI? Login with a web browser
```

**Verify:**
```bash
gh auth status
```

**Expected:**
```
github.com
  ✓ Logged in to github.com as your-username
  ✓ Git operations configured to use https
  ✓ Token: gho_****
```

---

### Step 2: Set Up Repository Secrets

```bash
# Navigate to your repository
cd /path/to/your/repo

# Set Filecoin private key (use your own private key, not the demo one)
gh secret set FILECOIN_PRIVATE_KEY
# Paste when prompted: 0x...

# Set RPC URL
gh secret set FILECOIN_RPC_URL --body "https://api.calibration.node.glif.io/rpc/v1"

# Verify secrets
gh secret list
```

**Expected Output:**
```
FILECOIN_PRIVATE_KEY    Updated 2025-10-09
FILECOIN_RPC_URL        Updated 2025-10-09
```

> ⚠️ **Security**: Never commit private keys to git. Always use GitHub secrets or environment variables.

---

### Step 3: Create Workflow - Upload File

>  we have a tracking issue for making extraction from `filecoin-pin add upload.txt 2>&1 | tee result.txt`easier: https://github.com/filecoin-project/filecoin-pin/issues/4

```bash
mkdir -p .github/workflows

cat > .github/workflows/upload-to-filecoin.yml << 'EOF'
name: Upload to Filecoin

on:
  workflow_dispatch:
    inputs:
      content:
        description: 'File content to upload'
        required: true
        default: 'Hello from GitHub Actions!'

jobs:
  upload:
    runs-on: ubuntu-22.04
    steps:
      - name: Setup Node.js 22
        uses: actions/setup-node@v4
        with:
          node-version: '22'

      - name: Install filecoin-pin
        run: npm install -g filecoin-pin

      - name: Create Test File
        run: |
          echo "${{ inputs.content }}" > upload.txt
          echo "File content:"
          cat upload.txt

      - name: Upload to Filecoin
        env:
          PRIVATE_KEY: ${{ secrets.FILECOIN_PRIVATE_KEY }}
          RPC_URL: ${{ secrets.FILECOIN_RPC_URL }}
        run: |
          filecoin-pin add upload.txt 2>&1 | tee result.txt

          # Extract key values
          CID=$(grep 'CID:' result.txt | awk '{print $2}' || echo "N/A")
          COMMP=$(grep 'CommP:' result.txt | awk '{print $2}' || echo "N/A")
          TX=$(grep 'Transaction:' result.txt | awk '{print $2}' || echo "N/A")

          echo "CID=$CID" >> $GITHUB_ENV
          echo "COMMP=$COMMP" >> $GITHUB_ENV
          echo "TX=$TX" >> $GITHUB_ENV

      - name: Upload Results
        uses: actions/upload-artifact@v4
        with:
          name: upload-results
          path: |
            upload.txt
            result.txt

      - name: Create Summary
        run: |
          echo "## Upload Complete! 🎉" >> $GITHUB_STEP_SUMMARY
          echo "" >> $GITHUB_STEP_SUMMARY
          echo "**CID:** \`${{ env.CID }}\`" >> $GITHUB_STEP_SUMMARY
          echo "**CommP:** \`${{ env.COMMP }}\`" >> $GITHUB_STEP_SUMMARY
          echo "**Transaction:** \`${{ env.TX }}\`" >> $GITHUB_STEP_SUMMARY
          echo "" >> $GITHUB_STEP_SUMMARY
          echo "[View on Explorer](https://calibration.filfox.info/tx/${{ env.TX }})" >> $GITHUB_STEP_SUMMARY
EOF
```

---

### Step 4: Create Workflow - Check Payment Status

```bash
cat > .github/workflows/check-payment.yml << 'EOF'
name: Check Payment Status

on:
  workflow_dispatch:

jobs:
  check:
    runs-on: ubuntu-22.04
    steps:
      - name: Setup Node.js 22
        uses: actions/setup-node@v4
        with:
          node-version: '22'

      - name: Install filecoin-pin
        run: npm install -g filecoin-pin

      - name: Check Payment Status
        env:
          PRIVATE_KEY: ${{ secrets.FILECOIN_PRIVATE_KEY }}
          RPC_URL: ${{ secrets.FILECOIN_RPC_URL }}
        run: |
          filecoin-pin payments status | tee payment-status.txt

      - name: Upload Status Report
        uses: actions/upload-artifact@v4
        with:
          name: payment-status
          path: payment-status.txt
EOF
```

---

### Step 5: Create Workflow - List Data Sets

```bash
cat > .github/workflows/list-datasets.yml << 'EOF'
name: List Data Sets

on:
  workflow_dispatch:

jobs:
  list:
    runs-on: ubuntu-22.04
    steps:
      - name: Setup Node.js 22
        uses: actions/setup-node@v4
        with:
          node-version: '22'

      - name: Install filecoin-pin
        run: npm install -g filecoin-pin

      - name: List All Data Sets
        env:
          PRIVATE_KEY: ${{ secrets.FILECOIN_PRIVATE_KEY }}
          RPC_URL: ${{ secrets.FILECOIN_RPC_URL }}
        run: |
          filecoin-pin data-set --ls | tee datasets.txt

      - name: Create Report
        run: |
          {
            echo "# Filecoin Data Sets Report"
            echo ""
            echo "**Generated:** $(date -u)"
            echo ""
            echo '```'
            cat datasets.txt
            echo '```'
          } > report.md

      - name: Upload Report
        uses: actions/upload-artifact@v4
        with:
          name: datasets-report
          path: report.md
EOF
```

---

### Step 6: Commit and Push Workflows

```bash
git add .github/workflows/*.yml

git commit -m "feat: add filecoin-pin workflows"

git push origin main
```

---

## Part 4: Test Workflows from CLI (Optional)

> 💡 **Note**: This section continues from Part 3. It shows how to trigger and monitor GitHub Actions workflows from the command line.

### List Available Workflows

```bash
gh workflow list
```

**Expected Output:**
```
Upload to Filecoin    active  upload-to-filecoin.yml
Check Payment Status  active  check-payment.yml
List Data Sets        active  list-datasets.yml
```

---

### Trigger File Upload

```bash
gh workflow run upload-to-filecoin.yml \
  -f content="Demo upload at $(date)"
```

**Expected:**
```
✓ Created workflow_dispatch event for upload-to-filecoin.yml at main
```

---

### Get Latest Run ID

```bash
RUN_ID=$(gh run list --workflow=upload-to-filecoin.yml --limit 1 --json databaseId --jq '.[0].databaseId')
echo "Run ID: $RUN_ID"
```

---

### Watch Run in Real-Time

```bash
gh run watch $RUN_ID
```

**Expected (updates every 3 seconds):**
```
Refreshing run status every 3 seconds. Press Ctrl+C to quit.

✓ main Upload to Filecoin · 12345678901
Triggered via workflow_dispatch 1 minute ago

JOBS
✓ upload in 1m45s (ID 98765432101)
```

---

### View Run Details

```bash
gh run view $RUN_ID
```

**Expected:**
```
✓ main Upload to Filecoin · 12345678901
Triggered via workflow_dispatch 2 minutes ago

JOBS
✓ upload in 1m45s (ID 98765432101)
  ✓ Setup Node.js 22
  ✓ Install filecoin-pin
  ✓ Create Test File
  ✓ Upload to Filecoin
  ✓ Upload Results
  ✓ Create Summary

View this run on GitHub: https://github.com/your-org/your-repo/actions/runs/12345678901
```

---

### View Workflow Logs

```bash
gh run view $RUN_ID --log
```

**Filter to specific step:**
```bash
gh run view $RUN_ID --log | grep "Upload to Filecoin" -A 10
```

---

### Download Artifacts

```bash
gh run download $RUN_ID --name upload-results
```

**Expected:**
```
✓ Downloaded artifact 'upload-results' to upload-results/
```

**View downloaded files:**
```bash
cat upload-results/result.txt
```

---

### View Run Summary

Open the run in browser to see the formatted summary:

```bash
gh run view $RUN_ID --web
```

---