set -e

# Colors
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
RED="\033[1;31m"
RESET="\033[0m"
# Check dependencies
if ! command -v go >/dev/null 2>&1; then
    echo -e "${RED}❌ Go is not installed. Please install Go first.${RESET}"
    exit 1
fi

if ! command -v sudo >/dev/null 2>&1; then
    echo -e "${RED}❌ 'sudo' is required to move binaries globally.${RESET}"
    exit 1
fi

echo -e "${BLUE}🔧 Starting installation for ${GREEN}lattice-code${RESET}..."
sleep 0.5
# ──────────────────────────────────────────────
# Build lattice-code-runner
# ──────────────────────────────────────────────
echo -e "${YELLOW}→ Building lattice-code-runner from .d/mcp...${RESET}"
go build -o lattice-code-runner ./mcp/main.go || { echo -e "${RED}❌ Failed to build lattice-code-runner.${RESET}"; exit 1; }

echo -e "${BLUE}→ Moving binary to /usr/local/bin...${RESET}"
sudo mv lattice-code-runner /usr/local/bin/ || { echo -e "${RED}❌ Failed to move lattice-code-runner.${RESET}"; exit 1; }
