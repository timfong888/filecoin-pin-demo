# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
#   03. GET DATA OVER GATEWAY
# ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

# Option 1: Using curl
ROOT_CID="bafybeibh422kjvgfmymx6nr7jandwngrown6ywomk4vplayl4de2x553t4"
curl "https://ipfs.io/ipfs/${ROOT_CID}/demo.txt"

# Output:
# Hello Filecoin!

# Option 2: Visit in browser
echo "Visit: https://ipfs.io/ipfs/${ROOT_CID}/demo.txt"

# Gateway alternatives:
# - https://ipfs.io/ipfs/<CID>
# - https://<CID>.ipfs.dweb.link/
# - https://gateway.pinata.cloud/ipfs/<CID>
