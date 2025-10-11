# Context Note: v0.7.3 Update - Auto-Fund Feature

**Date**: 2025-10-10
**Updated Files**:
- `DEMO_WALKTHROUGH.md` - Corrected --auto-fund documentation
- `v0.7.3-auto-fund-context.md` - Detailed technical documentation
- `.github/workflows/upload-to-filecoin.yml` - Added version check

## What Changed

### Upgraded filecoin-pin Version
- **From**: v0.6.0
- **To**: v0.7.3 (latest)
- **How**: `npm install -g filecoin-pin@latest`
- **Verify**: `filecoin-pin -V` returns `0.7.3`

### New Feature: --auto-fund Flag

**Location**: Available on `add` and `import` commands (NOT on `payments setup`)

**Syntax**:
```bash
filecoin-pin add --auto-fund <file>
filecoin-pin import --auto-fund <car-file>
```

**What it does**:
- Pre-flight checks payment runway BEFORE each upload
- Calculates exact funding needed for 10-day minimum runway
- Accounts for new file's lockup + ongoing storage costs
- Automatically deposits if insufficient funds
- Continues with upload seamlessly

**Key Implementation Details** (from source code analysis):

1. **Function**: `autoFund()` in `src/payments/fund.ts`
2. **Constant**: `MIN_RUNWAY_DAYS = 10` (hardcoded, cannot override)
3. **Calculation**: `computeAdjustmentForExactDaysWithFile(status, MIN_RUNWAY_DAYS, fileSize, pricePerTiBPerEpoch)`
4. **Behavior**:
   - Only deposits (never withdraws)
   - Non-interactive (no confirmation prompts)
   - Returns `FundingAdjustmentResult` with `adjusted: boolean`

## What Was Wrong in Previous Documentation

### ❌ Incorrect (v0.6.0 docs):
- Claimed `payments setup --auto-fund` exists (it doesn't)
- Said auto-fund is a "conservative estimate" that can't predict needs
- Implied it's not in current release
- Suggested it's just an initial setup feature

### ✅ Correct (v0.7.3+ docs):
- `add --auto-fund` and `import --auto-fund` (NOT on setup command)
- Auto-fund DOES know file sizes - it calculates for the specific upload
- Available in v0.7.0+ (not v0.6.0)
- It's a per-upload feature, not a setup feature

## Updated Documentation Sections

### Command 2b: Automatic Funding with --auto-fund Flag
- Correct syntax and examples
- Accurate description of behavior
- Comparison table: auto-fund vs manual fund
- When to use / when not to use guidance

### Command 2c: Manual Payment Runway Adjustment
- Retitled from "Adjust Payment Runway After Uploading Files"
- Clarified as alternative to --auto-fund
- Kept existing fund command documentation

### When to Use Setup vs Fund vs Auto-Fund
- Removed incorrect `setup --auto-fund` row
- Added "Automated uploads (CI/CD)" with `add --auto-fund`
- Two workflow options: automatic (with --auto-fund) or manual (without)
- GitHub Actions examples for both approaches

### Quick Reference
- Removed `payments setup --auto-fund` line
- Added `add --auto-fund <file>` with version note
- Added `import --auto-fund <car>` with version note
- Simplified `payments fund` commands (removed `--exact-` prefix)

## GitHub Workflow Update

### `.github/workflows/upload-to-filecoin.yml`

**Added version check step**:
```yaml
- name: Check filecoin-pin version
  run: |
    VERSION=$(filecoin-pin -V)
    echo "filecoin-pin version: $VERSION"
```

**Why**: Provides visibility into which version is running in CI/CD

## Testing Notes

**Could not test locally** because:
- No access to PRIVATE_KEY environment variable
- Private key is stored in GitHub secrets only
- Local environment doesn't have credentials set up

**Instead**:
- Analyzed source code directly from `/external/filecoin-project/filecoin-pin`
- Read `fund.ts`, `upload-flow.ts`, `add.ts`, `constants.ts`
- Verified CLI help output: `filecoin-pin add --help`
- Documented based on actual implementation

## Source Code References

All documentation is based on analysis of these files:

```
/Users/timfong/Dropbox/Filecoin/external/filecoin-project/filecoin-pin/
├── src/
│   ├── payments/fund.ts (lines 139-218: autoFund function)
│   ├── common/upload-flow.ts (lines 60-100: performAutoFunding)
│   ├── common/constants.ts (line 4: MIN_RUNWAY_DAYS = 10)
│   ├── commands/add.ts (line 13: --auto-fund option)
│   └── commands/import.ts (line 13: --auto-fund option)
```

## Files Created

1. **`v0.7.3-auto-fund-context.md`**
   - Comprehensive technical documentation
   - Source code analysis
   - Usage patterns and examples
   - Version availability notes

2. **`CONTEXT_v0.7.3_update.md`** (this file)
   - Summary of changes
   - What was wrong vs what's correct
   - Testing notes and source references

## Next Steps for Testing

When you have access to PRIVATE_KEY:

1. Test basic auto-fund:
   ```bash
   filecoin-pin add --auto-fund test.txt
   ```

2. Test with insufficient funds:
   ```bash
   # Ensure minimal deposit, then upload large file
   filecoin-pin add --auto-fund large-file.dat
   ```

3. Test in GitHub Actions:
   ```bash
   gh workflow run upload-to-filecoin.yml
   ```

4. Capture actual output and update example outputs in DEMO_WALKTHROUGH.md

## Summary

✅ **Completed**:
- Upgraded to v0.7.3
- Analyzed source code for --auto-fund implementation
- Corrected all incorrect documentation
- Added accurate technical documentation
- Updated Quick Reference
- Updated GitHub workflow with version check

❌ **Not completed** (requires credentials):
- Live testing of --auto-fund functionality
- Capturing real CLI output for examples
- Verifying exact output format

**Status**: Documentation is accurate based on source code analysis. Ready for live testing when credentials are available.
