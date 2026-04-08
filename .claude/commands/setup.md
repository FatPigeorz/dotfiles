Set up this dotfiles repo on the current machine.

1. Read CLAUDE.md to understand the full configuration
2. Detect OS (`uname -s`), package manager, and shell (`$SHELL`)
3. Ask the user which categories to set up (or all)
4. Install missing packages via the detected package manager
5. For each tool: read the reference config in this repo, read the machine's current config (if any), diff, confirm with user, then write
6. Set up language toolchains (Rust nightly, Python uv) if needed
7. Apply theme by reading `theme/README.md`
8. Verify configs are in place and tools work
