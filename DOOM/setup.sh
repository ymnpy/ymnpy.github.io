#!/usr/bin/env bash
# =============================================================
# doom-blog setup: downloads the compiled binary files you need
# Run this once from inside the doom-blog/ folder:
#   chmod +x setup.sh && ./setup.sh
# =============================================================

set -e
cd "$(dirname "$0")"

echo ""
echo "=== DOOM Blog Setup ==="
echo ""

# ---------------------------------------------------------------
# 1. doom1.wad — shareware, freely distributable
# ---------------------------------------------------------------
if [ ! -f doom1.wad ]; then
  echo "[1/3] Downloading doom1.wad (shareware, ~4 MB)..."
  curl -L --progress-bar \
    "https://distro.ibiblio.org/pub/linux/distributions/slitaz/sources/packages/d/doom1.wad" \
    -o doom1.wad
  echo "      doom1.wad OK"
else
  echo "[1/3] doom1.wad already present, skipping."
fi

# ---------------------------------------------------------------
# 2. websockets-doom.js — compiled Emscripten JS glue (~2 MB)
#    Source: cloudflare/doom-wasm (GPL-2.0)
#    Mirror: we pull from the silentspacemarine deployment
# ---------------------------------------------------------------
if [ ! -f websockets-doom.js ]; then
  echo "[2/3] Downloading websockets-doom.js (~2 MB)..."
  curl -L --progress-bar \
    "https://silentspacemarine.com/websockets-doom.js" \
    -o websockets-doom.js
  echo "      websockets-doom.js OK"
else
  echo "[2/3] websockets-doom.js already present, skipping."
fi

# ---------------------------------------------------------------
# 3. websockets-doom.wasm — the WebAssembly binary (~4 MB)
# ---------------------------------------------------------------
if [ ! -f websockets-doom.wasm ]; then
  echo "[3/3] Downloading websockets-doom.wasm (~4 MB)..."
  curl -L --progress-bar \
    "https://silentspacemarine.com/websockets-doom.wasm" \
    -o websockets-doom.wasm
  echo "      websockets-doom.wasm OK"
else
  echo "[3/3] websockets-doom.wasm already present, skipping."
fi

echo ""
echo "=== All files ready! ==="
echo ""
echo "Files in this folder:"
ls -lh *.wad *.js *.wasm *.cfg *.html 2>/dev/null
echo ""
echo "Upload ALL these files to the same folder on your blog/server."
echo "Then open index.html in your browser."
echo ""
echo "NOTE: Must be served over HTTP/HTTPS (not file://)."
echo "      A simple local test server:  python3 -m http.server 8080"
echo ""
