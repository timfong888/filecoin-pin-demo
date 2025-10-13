#!/bin/bash
# Generate all screenshots using carbon-now-cli

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo "Generating screenshots..."

# Array of screenshot files
screenshots=(
  "00-summary"
  "01-installation"
  "02-wallet-status"
  "03-payment-setup"
  "04-upload-file"
  "05-upload-directory"
  "06-verify-storage"
  "07-check-datasets"
  "08-check-proofs"
  "09-blockchain-verify"
  "10-github-actions"
  "11-trigger-workflow"
  "12-github-actions-logs"
)

# Generate each screenshot by running the script and piping output
for name in "${screenshots[@]}"; do
  echo "→ Generating ${name}.png..."
  chmod +x "${name}.sh"
  ./"${name}.sh" | carbon-now \
    --target "$SCRIPT_DIR" \
    --save-as "$name" \
    --skip-display
  echo "✓ ${name}.png created"
done

echo ""
echo "✓ All screenshots generated!"
echo "Location: $SCRIPT_DIR"
ls -lh *.png | grep -E "^-" | grep -v "test\|header-styles"
