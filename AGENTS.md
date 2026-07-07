# AGENTS.md

- This is a personal Neovim Lua config. Keep changes small and follow the existing `lua/user/*.lua` plugin-spec pattern.
- Plugins are registered from `init.lua` with `spec "user.<module>"`; lazy.nvim setup lives in `lua/user/lazy.lua`.
- The active colorscheme is `IBS27/kanagawa.nvim` with the Dragon variant. Theme color changes should be made in that fork, not as local highlight overrides, unless the issue is clearly config-specific.
- Lualine uses the built-in Kanagawa lualine theme from the theme fork. Preserve default theme colors unless asked otherwise.
- `lazy-lock.json` is intentionally ignored locally; do not add it unless explicitly requested.
- Validate config changes with `nvim --headless +qa` and run `git diff --check` before committing.
