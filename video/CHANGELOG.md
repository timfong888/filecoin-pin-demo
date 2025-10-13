# Video Demo Changelog

## 2025-10-13 Update 5 - Auto-Funding & GitHub Logs

### Showcasing Auto-Funding Feature + GitHub Actions Logs

**Payment Changes:**
- Removed hardcoded `--deposit 50` from all examples
- Now shows `filecoin-pin payments setup --auto` (no manual deposit)
- All uploads use `--auto-fund` flag
- Updated DEMO_SCRIPT.md with auto-funding workflow

**New Screenshot:**
- Added `11-github-actions-logs.png` - Shows markdown-formatted upload results
- Displays job summary with Root CID, Piece CID, Data Set ID, Transaction
- Demonstrates CI/CD integration output

**Script Updates:**
- Added "View Upload Logs" section to DEMO_SCRIPT.md
- Includes transition to live GitHub Actions UI
- Total: 12 screenshots (was 11)

## 2025-10-13 Update 4 - Style 5 Headers with Green Equals

### Clean Headers with Green Separator Lines

**Header Style:**
- Switched from ━━━ lines to **=== equals signs** (render in green)
- Format: `# ===...===` / `#   TITLE` / `# ===...===`
- Green separators + cyan title = high visibility
- Style 5 from header-styles demo
- No distracting EOF markers in screenshots

**What Changed:**
- Updated all 11 .sh scripts to use equals sign headers
- Regenerated all screenshots with clean output
- Scripts now pipe output (not file content) to carbon-now
- Result: Professional, presentation-ready screenshots

## 2025-10-13 Update 3 - Optimized for 16:9 Display

### Final Optimization for Landscape Orientation

**Carbon Config - Final Settings:**
- Width: 6800px (forces wider layout)
- Font size: 28px (large, readable on screens)
- Line height: 118% (compact but readable)
- Padding: 25px vertical, 260px horizontal
- Result: All screenshots landscape-oriented (1.14-1.99 ratio)

**Screenshot Aspect Ratios:**
- 4 screenshots: 1.68-1.88 (excellent 16:9 fit)
- 2 screenshots: 1.58-1.68 (good fit)
- 5 screenshots: 1.14-1.45 (acceptable landscape)
- All screenshots wider than tall ✓
- Suitable for full-screen 16:9 display ✓

## 2025-10-13 Update 2 - Aligned with New Context

### Updated for Better Presentation

**Changes Made:**
- **Carbon Config**: Initial optimization attempt
  - Width: 20000px → 1600px
  - Font size: 18px → 20px
  - Padding: Increased to 60px vertical, 80px horizontal
  - Result: Screenshots too square (needed more width)

- **DEMO_SCRIPT.md**: Added v0.7.0+ features
  - Added auto-funding section with `--auto-fund` flag
  - Updated command summary with payment management
  - Added provider information to output examples

- **Screenshot Scripts**: More concise and presentation-friendly
  - `00-summary.sh`: Streamlined workflow with auto-fund example
  - `04-upload-file.sh`: Simplified output format
  - `05-upload-directory.sh`: Demonstrates auto-funding

**Screenshots Regenerated:**
All 11 screenshots regenerated with new configuration:
- Better proportions for 16:9 displays
- Larger, more readable fonts
- Cleaner, more concise content
- Includes latest CLI features (v0.7.0+)

**Alignment with DEMO_WALKTHROUGH.md:**
- Script now covers key features from detailed walkthrough
- Maintains conciseness for video presentation format
- Follows bash/node.js coloring conventions
- Suitable for full-screen presentation

## 2025-10-13 - Created Video Demo Materials

**Tools Used:**
- `carbon-now-cli` - Code screenshot generation tool
  - Installation: `npm install -g carbon-now-cli`
  - Command: `cat script.sh | carbon-now --target <dir> --save-as <name>`
  - Used to generate 11 screenshots for video demo sections

**Files Created:**

**Demo Script:**
- `DEMO_SCRIPT.md` - Complete video script with voiceover and terminal commands
  - Duration: ~9-10 minutes
  - Sections: Installation, Wallet Status, Payment Setup, Upload, Verify, Blockchain, GitHub Actions
  - Excludes wallet generation (starts with existing funded wallet)

**Screenshot Scripts (in screenshots/):**
- `00-summary.sh` - Overview with major steps and commands
- `01-installation.sh` - Installation commands
- `02-wallet-status.sh` - Check wallet and payment status
- `03-payment-setup.sh` - Configure payments with auto mode
- `04-upload-file.sh` - Upload single file to Filecoin
- `05-upload-directory.sh` - Upload directory with multiple files
- `06-verify-storage.sh` - Download and verify CAR files
- `07-check-datasets.sh` - List and inspect data sets
- `08-blockchain-verify.sh` - Blockchain transaction verification
- `09-github-actions.sh` - GitHub Actions setup with secrets
- `10-trigger-workflow.sh` - Trigger and monitor workflows

**Generated Screenshots (in screenshots/):**
- `00-summary.png` (362K) - Overview screenshot
- `01-installation.png` (199K)
- `02-wallet-status.png` (205K)
- `03-payment-setup.png` (176K)
- `04-upload-file.png` (179K)
- `05-upload-directory.png` (228K)
- `06-verify-storage.png` (276K)
- `07-check-datasets.png` (191K)
- `08-blockchain-verify.png` (250K)
- `09-github-actions.png` (347K)
- `10-trigger-workflow.png` (250K)

**Helper Scripts:**
- `generate-all.sh` - Automated script to regenerate all screenshots

**Screenshot Generation Process:**
1. Created shell scripts containing code snippets for each section
2. Used `carbon-now-cli` to convert scripts to formatted PNG screenshots
3. Default theme applied (night-owl preset not available, used default)
4. All screenshots saved to `video/screenshots/` directory

**Usage:**
```bash
# Regenerate all screenshots
cd video/screenshots
./generate-all.sh

# Generate single screenshot
cat 01-installation.sh | carbon-now --target . --save-as 01-installation
```

**Notes:**
- Screenshots use default carbon.now.sh theme
- Dark background with syntax highlighting
- Ideal for video overlays and section transitions
- Each screenshot represents 3-5 seconds of video content
