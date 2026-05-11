# DOOM on your blog — self-hosted setup

All traffic stays on **your domain**. No external game servers.

---

## Files in this folder

| File | What it is | Size |
|------|-----------|------|
| `index.html` | The page your visitors open | — |
| `default.cfg` | DOOM key/settings config | included |
| `websockets-doom.js` | Compiled JS glue (Emscripten) | ~2 MB |
| `websockets-doom.wasm` | WebAssembly DOOM binary | ~4 MB |
| `doom1.wad` | Shareware game data (legal to share) | ~4 MB |

The last three are **not included** — run `setup.sh` to download them.

---

## Step 1 — Download the binary files

```bash
chmod +x setup.sh
./setup.sh
```

This downloads `doom1.wad`, `websockets-doom.js`, and `websockets-doom.wasm`
from their public sources (~10 MB total).

---

## Step 2 — Upload everything to your blog

Upload **all 5 files** into the same folder on your server:

```
your-blog.com/doom/
  index.html
  default.cfg
  websockets-doom.js
  websockets-doom.wasm
  doom1.wad
```

That's it. Visit `https://your-blog.com/doom/` and click Play.

---

## Testing locally

Must be served over HTTP, not opened as a `file://` URL:

```bash
python3 -m http.server 8080
# then open http://localhost:8080
```

---

## Controls

| Key | Action |
|-----|--------|
| Arrow keys | Move / turn |
| Ctrl | Shoot |
| Space | Open door / activate |
| Alt + ← / → | Strafe |
| Shift | Run |
| F | Toggle fullscreen |
| Esc | Menu |
| 1–7 | Switch weapons |

---

## Why this works as a firewall bypass

Every request your visitor's browser makes goes to **your domain only**:
- `your-blog.com/doom/index.html`
- `your-blog.com/doom/websockets-doom.js`
- `your-blog.com/doom/websockets-doom.wasm`
- `your-blog.com/doom/doom1.wad`
- `your-blog.com/doom/default.cfg`

If your blog is reachable, DOOM is reachable.

---

## Credits & license

- [cloudflare/doom-wasm](https://github.com/cloudflare/doom-wasm) — WebAssembly port (GPL-2.0)
- [Chocolate Doom](https://github.com/chocolate-doom/chocolate-doom) — source port
- DOOM shareware WAD — freely distributable since 1993
- DOOM® is a registered trademark of ZeniMax Media Inc.
