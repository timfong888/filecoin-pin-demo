# Filecoin Pin CLI - Video Demo Materials

This directory contains all materials needed to create a video demo for the Filecoin Pin CLI.

## Contents

### DEMO_SCRIPT.md
Complete video script with:
- Voiceover narration (short sentences)
- Terminal commands to execute
- Expected outputs
- Section timing (total ~9-10 minutes)
- Technical production notes

**Key Features:**
- Starts with existing funded wallet (no wallet generation shown)
- Covers full workflow: install → setup → upload → verify → automate
- Aligned with DEMO_WALKTHROUGH.md
- Production-ready with timing and transitions

### screenshots/
Directory containing code screenshots for video overlays.

**Screenshot Files (11 total):**
- `00-summary.png` - Overview of all major steps
- `01-installation.png` - Tool installation
- `02-wallet-status.png` - Wallet verification
- `03-payment-setup.png` - Payment configuration
- `04-upload-file.png` - Single file upload
- `05-upload-directory.png` - Directory upload
- `06-verify-storage.png` - Download and verify
- `07-check-datasets.png` - Data set inspection
- `08-blockchain-verify.png` - Blockchain verification
- `09-github-actions.png` - GitHub Actions setup
- `10-trigger-workflow.png` - Workflow automation

**Source Scripts:**
Each `.png` has a corresponding `.sh` script with the code used to generate it.

**Helper Script:**
- `generate-all.sh` - Regenerate all screenshots

### CHANGELOG.md
Documentation of:
- Tools used (carbon-now-cli)
- Files created
- Screenshot generation process
- Usage instructions

## Quick Start

### View the Demo Script
```bash
open DEMO_SCRIPT.md
```

### View Screenshots
```bash
open screenshots/
```

### Regenerate Screenshots
```bash
cd screenshots
./generate-all.sh
```

## Video Production Workflow

1. **Review Script**
   - Read `DEMO_SCRIPT.md`
   - Note timing for each section
   - Review voiceover text

2. **Prepare Terminal**
   - Set up clean terminal window
   - Use dark theme for consistency with screenshots
   - Set font size for visibility

3. **Record Sections**
   - Show screenshot at start of each section (3-5 seconds)
   - Execute commands in terminal
   - Pause 2 seconds after major completions

4. **Post-Production**
   - Add voiceover narration
   - Use screenshots as section dividers
   - Add quick transitions (0.5s fade)

## Demo Structure

**Part 1: Installation** (45 seconds)
- Install Node.js, filecoin-pin, Foundry, gh CLI

**Part 2: Wallet Status** (30 seconds)
- Check funded wallet balance

**Part 3: Payment Setup** (1 minute)
- Configure payment system with auto mode

**Part 4: Upload Files** (2 minutes)
- Upload single file
- Upload directory

**Part 5: Verify Storage** (1.5 minutes)
- Download and unpack CAR files
- Check data sets

**Part 6: Blockchain Verification** (1 minute)
- Verify transactions
- Compare balance methods

**Part 7: GitHub Actions** (2 minutes)
- Set up secrets
- Create workflow
- Trigger and monitor

**Closing** (30 seconds)
- Summary and call-to-action

## Technical Notes

**Screen Layout:**
- Terminal: 70% of screen
- Captions: Bottom 15% (optional)
- Progress: Top right

**Font:**
- Monospace (Fira Code recommended)
- Large enough for visibility

**Theme:**
- Dark background
- High contrast
- Consistent throughout

**Pacing:**
- Moderate speed
- Allow time to read commands
- Pause after important outputs

## Requirements

**Software:**
- `carbon-now-cli` for screenshot generation
- Video editor (for final production)
- Screen recorder (for terminal capture)

**Installation:**
```bash
npm install -g carbon-now-cli
```

## Alignment with DEMO_WALKTHROUGH.md

This video demo is aligned with the full walkthrough document:
- Same command structure
- Same expected outputs
- Same verification steps
- Condensed for video format (10 minutes vs full tutorial)

## Next Steps

1. Review and approve script
2. Set up recording environment
3. Do a dry run following the script
4. Record terminal sessions
5. Record voiceover
6. Edit and produce final video
