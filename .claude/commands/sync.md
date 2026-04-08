Sync dotfile changes between this machine and the repo.

1. For each tool in CLAUDE.md, diff the machine's current config against the repo's reference config
2. Report any differences found
3. Ask the user which direction to sync:
   - Machine → Repo: update the repo with the machine's config
   - Repo → Machine: update the machine with the repo's config
4. Apply the chosen changes
5. If repo was updated: commit and push to origin/main
