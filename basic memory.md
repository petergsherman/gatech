---
title: basic memory
type: note
permalink: brain/basic-memory
---

# Basic Memory + Vault Sync — New Workstation Setup

Get the git-backed Obsidian vault **and** basic-memory running on a fresh Windows
machine by pulling from GitHub. Assumes the vault already lives at
`github.com/JasonSonith/vault`. Do everything from **PowerShell** (not WSL —
Claude Desktop and file-watching need to be on the Windows side).

> Key mental model: **git syncs the Markdown, one machine to the next. Basic
> Memory does NOT sync — each workstation builds its own local index from
> whatever Markdown git pulled down.** The files are the source of truth.

---

## Before you start

Check what's already installed:

```powershell
git --version
uv --version
```

Install whatever's missing, then **close and reopen PowerShell** (PATH won't
update in the current window):

```powershell
winget install --id Git.Git -e
powershell -ExecutionPolicy ByPass -c "irm https://astral.sh/uv/install.ps1 | iex"
```

---

## 1. Clone the vault from GitHub

Pick a plain, **non-synced** path. ⚠️ **Do NOT clone into OneDrive / Dropbox /
iCloud** — a second sync engine fights git over the `.git` folder and corrupts
the repo.

```powershell
New-Item -ItemType Directory -Path "C:\Users\$env:USERNAME\Vaults" -Force
Set-Location "C:\Users\$env:USERNAME\Vaults"
git clone https://github.com/JasonSonith/vault.git Jason
```

(SSH instead, if this machine has your key: `git clone git@github.com:JasonSonith/vault.git Jason`)

First push over HTTPS will prompt for auth — use a **Personal Access Token with
`repo` scope**, not your account password. Set a variable for the rest:

```powershell
$vault = "C:\Users\$env:USERNAME\Vaults\Jason"
```

---

## 2. Open it in Obsidian

Obsidian → **Open folder as vault** → `$vault`.

Your plugins and their settings came *with* the clone (everything under
`.obsidian/` except the workspace files is version-controlled), so **obsidian-git
is likely already installed and configured** — you'll just enable it in step 6.

---

## 3. Install basic-memory + register the vault

```powershell
uv tool install basic-memory
bm project add brain "$vault"
bm project list
```

`bm project list` should show **brain → your vault path**, route `local`, MCP
`stdio`. (`bm` is the shorthand for `basic-memory`.)

The index lives in `~/.basic-memory` and is **per-machine** — it rebuilds itself
from the Markdown. Nothing to copy between workstations.

---

## 4. Connect Claude Desktop

Open the config:

```powershell
notepad "$env:APPDATA\Claude\claude_desktop_config.json"
```

If the file is empty, this whole thing works:

```json
{ "mcpServers": { "basic-memory": { "command": "uvx", "args": ["basic-memory","mcp","--project","brain"] } } }
```

If it already has content (e.g. an `MCP_DOCKER` block), add the `basic-memory`
entry **inside the existing `mcpServers` object** — mind the comma between
entries. Then validate:

```powershell
Get-Content "$env:APPDATA\Claude\claude_desktop_config.json" | ConvertFrom-Json
```

No error = valid JSON.

⚠️ **uvx PATH gotcha:** Claude Desktop launches with its own environment and
often can't find `uvx`. If basic-memory doesn't appear after restart, get the
absolute path:

```powershell
(Get-Command uvx).Source
```

and replace `"uvx"` with that full path, **doubling the backslashes**:
`"command": "C:\\Users\\<user>\\.local\\bin\\uvx.exe"`.

Then **fully quit Claude Desktop from the system tray** (closing the window
leaves it running and won't reload the config) and reopen.

---

## 5. Verify basic-memory

```powershell
bm status
```

A clean sync report = vault indexed.

> **There is no `sync --watch` on the current version.** The MCP server that
> Claude Desktop launches handles initialization and file sync automatically.
> If files look unprocessed, `bm reindex` forces a rebuild.

Then in a fresh Claude Desktop chat: *"list my basic-memory projects"* →
*"what have I been working on lately?"* Naming `brain` with real detail from the
notes = live.

---

## 6. Turn on obsidian-git (so this machine auto-syncs too)

Obsidian → Settings → Community plugins → (toggle off Restricted mode if on) →
find **Git** (Vinzent03 — likely already present from the clone) → **Enable**. It
auto-detects the cloned repo and its remote.

Settings:

| Setting | Value |
|---|---|
| Auto commit-and-sync interval | 10 min |
| Auto commit-and-sync after stopping edits | on |
| Auto pull interval | 10 min |
| **Pull on startup** | **on** ← prevents cross-machine conflicts |
| Merge strategy | Merge |
| Commit message | `vault backup: {{date}}` |

Verify: `Ctrl+P` → **"Git: Commit-and-sync"** → check GitHub for a new commit.
Auth reuses the PAT/SSH key from the clone.

---

## How multi-machine sync actually works

- **Git (via GitHub) is the one sync channel** for the Markdown. Every machine
  runs obsidian-git with **pull-on-startup ON**, so it grabs the latest before
  you edit — that's what keeps machines from conflicting.
- **Basic Memory does not sync across machines.** Each workstation keeps its own
  index in `~/.basic-memory` and rebuilds it from whatever Markdown git pulled.
- **The rule on every machine:** pull before you work (automatic on startup), let
  commit-and-sync push when you stop. Don't leave edits uncommitted when you
  switch machines, or the next machine pulls stale files.

---

## Gotchas (all learned the hard way)

- ⚠️ **Never keep the vault in OneDrive/Dropbox/iCloud.** Two sync engines fight
  over `.git` and corrupt it. Plain local path only; git *is* the sync.
- ⚠️ **Don't run git against this repo from both Windows and WSL** — they
  disagree on filemode/line-endings and every file shows as modified. Pick
  Windows.
- ⚠️ **Reopen PowerShell** after installing `uv`/`git` so PATH updates.
- ⚠️ **Quit Claude Desktop from the tray**, not the window, to reload the config.
- ⚠️ **HTTPS auth = PAT with `repo` scope**, not your account password. Or use SSH.