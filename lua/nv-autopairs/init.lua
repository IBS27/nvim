local status_ok, _ = pcall(require, "nvim-autopairs")
if not status_ok then
  return
end

local npairs = require "nvim-autopairs"
local Rule = require "nvim-autopairs.rule"

npairs.setup {
  check_ts = true,
  ts_config = {
    lua = { "string" },
    javascript = { "template_string" },
    java = false,
  },
}

require("nvim-treesitter.configs").setup {
  autopairs = { enable = true },
}

local ts_conds = require "nvim-autopairs.ts-conds"

npairs.add_rules {
  Rule("%", "%", "lua"):with_pair(ts_conds.is_ts_node { "string", "comment" }),
  Rule("$", "$", "lua"):with_pair(ts_conds.is_not_ts_node { "function" }),
}
