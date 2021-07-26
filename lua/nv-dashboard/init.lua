local g = vim.g

g.dashboard_default_executive = "telescope"

g.dashboard_custom_section = {
  a = {
    description = { "      Find File          " },
    command = "Telescope find_files",
  },
  b = {
    description = { "      Recently Used Files" },
    command = "Telescope oldfiles",
  },
  c = {
    description = { "      Find Word          " },
    command = "Telescope live_grep",
  },
  d = {
    description = { "      Settings           " },
    command = ":e ~/.config/nvim/init.lua",
  },
}

g.dashboard_custom_header = {
  "",
  " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
  " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
  " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
  " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
  " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
  " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
  "",
}

vim.cmd "let packages = len(globpath('~/.local/share/nvim/site/pack/packer/start', '*', 0, 1))"

vim.api.nvim_exec(
  [[
    let g:dashboard_custom_footer = ['NeoVim loaded '..packages..' plugins ']
]],
  false
)
