#!/bin/bash
# Trigger and monitor workflow

cat << 'EOF'
# =================================================================
#   TRIGGER WORKFLOW
# =================================================================

# Commit and push workflow
git add .github/workflows/
git commit -m "feat: add upload workflow"
git push

# List available workflows
gh workflow list

# Trigger workflow from CLI
gh workflow run upload.yml

# Get latest run ID
RUN_ID=$(gh run list --limit 1 --json databaseId --jq '.[0].databaseId')

# Watch progress in real-time
gh run watch $RUN_ID

# View results
gh run view $RUN_ID
EOF
