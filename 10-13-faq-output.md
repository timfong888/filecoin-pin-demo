# Filecoin Pin Launch – Public FAQ

###  What is Filecoin Pin?
Filecoin Pin stores IPFS content on the Filecoin Network of decentralized Storage Providers. It enables developers to programmatically pay for storage and retrieval with Filecoin Pay. When SPs prove storage, they are paid from the developers Filecoin Pay Account.

### How can I use Filecoin Pin today?
Two paths are available:

**Website:** Upload files in your browser. Uses a pre-funded test wallet.

**CLI:** Upload files from your terminal. Fund storage from your own wallet.

Both run on Calibration testnet. They use tFIL and USDFC. Data has no persistence guarantees while on Calibnet.

### What do I need to get started?

- You can find different links related to Filecoin Pin here: https://docs.filecoin.io/builder-cookbook/filecoin-pin/

### How do payments and approvals work?

**Website:** The demo wallet handles payments. It has been prefunded with testnet USDFC and FIL. Users don't need to connect their own wallet.

**CLI:** Your test wallet handles payments. You approve and deposit funds through Filecoin Pay.

Storage providers receive payment after cryptographically proving data possession.

### How does auto-funding work?

Use `--auto-fund` when uploading. The CLI calculates storage costs automatically. It deposits the right amount of USDFC to your payment rail.

No manual deposit calculations needed. The system handles it.

### How long is my data stored?
This runs on Calibration testnet only. Treat it as a demo. No duration guarantees exist for Website or CLI.

Mainnet will offer persistence guarantees. Data persists while you maintain deposits. The CLI supports auto-funding for storage.

### What is a Data Set?

A Data Set groups your uploads together. Each upload becomes a "piece" within the Data Set. Multiple files you upload share the same payment rail.

Check your Data Set with `filecoin-pin data-set <id>`.

### How do I retrieve my data?

Three methods:

**IPFS Gateways:** Use public gateways with your root CID: `https://gateway.example.com/ipfs/<root-cid>`

**Direct from Storage Provider:** Get the direct download URL from `filecoin-pin data-set <id>`

**IPFS Tools:** Use Kubo, Helia, IPFS Desktop with your root CID.

### What is a piece CID vs root CID?

**Root CID** (bafybei...) is your IPFS content identifier. Use this to retrieve your data.

**Piece CID** (bafkzci...) is the Filecoin commitment. Storage Providers prove they store this piece.

Both are linked cryptographically on-chain.

### How do I verify my data is actually stored?

Two ways to verify:

**CLI:** Run `filecoin-pin data-set <id>` to see on-chain verification. Check proof status and piece details.

**PDP Explorer:** Visit `https://pdp.vxb.ai/calibration/dataset/{datasetID}` to view proofs in your browser.

Both methods show CommP and proof state directly from blockchain state.

### How do I access the code for the dApp and CLI?

See the repos as reference implementations and to fork for my own project?

- Website: https://github.com/filecoin-project/filecoin-pin-website
- CLI: https://github.com/filecoin-project/filecoin-pin

---

## References
- Filecoin Pin Docs: [https://docs.filecoin.io/builder-cookbook/filecoin-pin/](https://docs.filecoin.io/builder-cookbook/filecoin-pin)
- Filecoin Pin dApp Repo: https://github.com/filecoin-project/filecoin-pin-website
- Synapse SDK: https://github.com/FilOzone/synapse-sdk
- USDFC documentation: https://docs.secured.finance/usdfc-stablecoin/getting-started 

