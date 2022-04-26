local present, feline = pcall(require, "feline")
if not present then
  return
end

local colors = {
  white = "#fff9e8",
  darker_black = "#252d33",
  black = "#2b3339", --  nvim bg
  black2 = "#323a40",
  one_bg = "#333b41",
  one_bg2 = "#363e44",
  one_bg3 = "#3a4248",
  grey = "#4a5258",
  grey_fg = "#50585e",
  grey_fg2 = "#545c62",
  light_grey = "#586066",
  red = "#e67e80",
  baby_pink = "#ce8196",
  pink = "#ff75a0",
  line = "#3a4248", -- for lines like vertsplit
  green = "#83c092",
  vibrant_green = "#a7c080",
  nord_blue = "#78b4ac",
  blue = "#7fbbb3",
  yellow = "#dbbc7f",
  sun = "#d1b171",
  purple = "#b4bbc8",
  dark_purple = "#d699b6",
  teal = "#69a59d",
  orange = "#e69875",
  cyan = "#95d1c9",
  -- statusline_bg = "#323D41",
  -- lightbg2 = "#2e363c",
  statusline_bg = "#2e363c",
  lightbg = "#3d454b",
  lightbg2 = "#333b41",
}

local default = {
  colors = colors,
  lsp = require "feline.providers.lsp",
  lsp_severity = vim.diagnostic.severity,
}

default.icon_styles = {
  default = {
    left = "",
    right = " ",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },
  arrow = {
    left = "",
    right = "",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },

  block = {
    left = " ",
    right = " ",
    main_icon = "   ",
    vi_mode_icon = "  ",
    position_icon = "  ",
  },

  round = {
    left = "",
    right = "",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },

  slant = {
    left = " ",
    right = " ",
    main_icon = "  ",
    vi_mode_icon = " ",
    position_icon = " ",
  },
}

-- statusline style
default.statusline_style = default.icon_styles["round"]

-- show short statusline on small screens
default.shortline = false

-- Initialize the components table
default.components = {
  active = {},
}

default.main_icon = {
  provider = default.statusline_style.main_icon,

  hl = {
    fg = default.colors.statusline_bg,
    bg = default.colors.nord_blue,
  },

  right_sep = {
    str = default.statusline_style.right,
    hl = {
      fg = default.colors.nord_blue,
      bg = default.colors.lightbg,
    },
  },
}

default.file_name = {
  provider = function()
    local filename = vim.fn.expand "%:t"
    local extension = vim.fn.expand "%:e"
    local icon = require("nvim-web-devicons").get_icon(filename, extension)
    if icon == nil then
      icon = " "
      return icon
    end
    return " " .. icon .. " " .. filename .. " "
  end,
  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = {
    fg = default.colors.white,
    bg = default.colors.lightbg,
  },

  right_sep = {
    str = default.statusline_style.right,
    hl = { fg = default.colors.lightbg, bg = default.colors.lightbg2 },
  },
}

default.dir_name = {
  provider = function()
    local dir_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
    return "   " .. dir_name .. " "
  end,

  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 80
  end,

  hl = {
    fg = default.colors.grey_fg2,
    bg = default.colors.lightbg2,
  },
  right_sep = {
    str = default.statusline_style.right,
    hi = {
      fg = default.colors.lightbg2,
      bg = default.colors.statusline_bg,
    },
  },
}

default.diff = {
  add = {
    provider = "git_diff_added",
    hl = {
      fg = default.colors.grey_fg2,
      bg = default.colors.statusline_bg,
    },
    icon = "  ",
  },

  change = {
    provider = "git_diff_changed",
    hl = {
      fg = default.colors.grey_fg2,
      bg = default.colors.statusline_bg,
    },
    icon = "  ",
  },

  remove = {
    provider = "git_diff_removed",
    hl = {
      fg = default.colors.grey_fg2,
      bg = default.colors.statusline_bg,
    },
    icon = "  ",
  },
}

default.git_branch = {
  provider = "git_branch",
  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = {
    fg = default.colors.grey_fg2,
    bg = default.colors.statusline_bg,
  },
  icon = "  ",
}

default.diagnostic = {
  error = {
    provider = "diagnostic_errors",
    enabled = function()
      return default.lsp.diagnostics_exist(default.lsp_severity.ERROR)
    end,

    hl = { fg = default.colors.red },
    icon = "  ",
  },

  warning = {
    provider = "diagnostic_warnings",
    enabled = function()
      return default.lsp.diagnostics_exist(default.lsp_severity.WARN)
    end,
    hl = { fg = default.colors.yellow },
    icon = "  ",
  },

  hint = {
    provider = "diagnostic_hints",
    enabled = function()
      return default.lsp.diagnostics_exist(default.lsp_severity.HINT)
    end,
    hl = { fg = default.colors.grey_fg2 },
    icon = "  ",
  },

  info = {
    provider = "diagnostic_info",
    enabled = function()
      return default.lsp.diagnostics_exist(default.lsp_severity.INFO)
    end,
    hl = { fg = default.colors.green },
    icon = "  ",
  },
}

default.lsp_progress = {
  provider = function()
    local Lsp = vim.lsp.util.get_progress_messages()[1]

    if Lsp then
      local msg = Lsp.message or ""
      local percentage = Lsp.percentage or 0
      local title = Lsp.title or ""
      local spinners = {
        "",
        "",
        "",
      }

      local success_icon = {
        "",
        "",
        "",
      }

      local ms = vim.loop.hrtime() / 1000000
      local frame = math.floor(ms / 120) % #spinners

      if percentage >= 70 then
        return string.format(" %%<%s %s %s (%s%%%%) ", success_icon[frame + 1], title, msg, percentage)
      end

      return string.format(" %%<%s %s %s (%s%%%%) ", spinners[frame + 1], title, msg, percentage)
    end

    return ""
  end,
  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 80
  end,
  hl = { fg = default.colors.green },
}

default.lsp_icon = {
  provider = function()
    if next(vim.lsp.buf_get_clients()) ~= nil then
      return "  LSP"
    else
      return ""
    end
  end,
  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 70
  end,
  hl = { fg = default.colors.grey_fg2, bg = default.colors.statusline_bg },
}

default.mode_colors = {
  ["n"] = { "NORMAL", default.colors.red },
  ["no"] = { "N-PENDING", default.colors.red },
  ["i"] = { "INSERT", default.colors.dark_purple },
  ["ic"] = { "INSERT", default.colors.dark_purple },
  ["t"] = { "TERMINAL", default.colors.green },
  ["v"] = { "VISUAL", default.colors.cyan },
  ["V"] = { "V-LINE", default.colors.cyan },
  -- ["CTRL-V"] = { "V-BLOCK", default.colors.cyan }, --FIXME vblock error
  ["R"] = { "REPLACE", default.colors.orange },
  ["Rv"] = { "V-REPLACE", default.colors.orange },
  ["s"] = { "SELECT", default.colors.nord_blue },
  ["S"] = { "S-LINE", default.colors.nord_blue },
  ["CTRl-S"] = { "S-BLOCK", default.colors.nord_blue },
  ["c"] = { "COMMAND", default.colors.pink },
  ["cv"] = { "COMMAND", default.colors.pink },
  ["ce"] = { "COMMAND", default.colors.pink },
  ["r"] = { "PROMPT", default.colors.teal },
  ["rm"] = { "MORE", default.colors.teal },
  ["r?"] = { "CONFIRM", default.colors.teal },
  ["!"] = { "SHELL", default.colors.green },
}

default.chad_mode_hl = function()
  return {
    fg = default.mode_colors[vim.fn.mode()][2],
    bg = default.colors.one_bg,
  }
end

default.empty_space = {
  provider = " " .. default.statusline_style.left,
  hl = {
    fg = default.colors.one_bg2,
    bg = default.colors.statusline_bg,
  },
}

-- this matches the vi mode color
default.empty_spaceColored = {
  provider = default.statusline_style.left,
  hl = function()
    return {
      fg = default.mode_colors[vim.fn.mode()][2],
      bg = default.colors.one_bg2,
    }
  end,
}

default.mode_icon = {
  provider = default.statusline_style.vi_mode_icon,
  hl = function()
    return {
      fg = default.colors.statusline_bg,
      bg = default.mode_colors[vim.fn.mode()][2],
    }
  end,
}

default.empty_space2 = {
  provider = function()
    return " " .. default.mode_colors[vim.fn.mode()][1] .. " "
  end,
  hl = default.chad_mode_hl,
}

default.separator_right = {
  provider = default.statusline_style.left,
  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,
  hl = {
    fg = default.colors.grey,
    bg = default.colors.one_bg,
  },
}

default.separator_right2 = {
  provider = default.statusline_style.left,
  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,
  hl = {
    fg = default.colors.green,
    bg = default.colors.grey,
  },
}

default.position_icon = {
  provider = default.statusline_style.position_icon,
  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,
  hl = {
    fg = default.colors.black,
    bg = default.colors.green,
  },
}

default.current_line = {
  provider = function()
    local current_line = vim.fn.line "."
    local total_line = vim.fn.line "$"

    if current_line == 1 then
      return " Top "
    elseif current_line == vim.fn.line "$" then
      return " Bot "
    end
    local result, _ = math.modf((current_line / total_line) * 100)
    return " " .. result .. "%% "
  end,

  enabled = default.shortline or function(winid)
    return vim.api.nvim_win_get_width(tonumber(winid) or 0) > 90
  end,

  hl = {
    fg = default.colors.green,
    bg = default.colors.one_bg,
  },
}

local function add_table(a, b)
  table.insert(a, b)
end

local M = {}
M.setup = function(override_flag)
  if override_flag then
    default = require("core.utils").tbl_override_req("feline", default)
  end
  -- components are divided in 3 sections
  default.left = {}
  default.middle = {}
  default.right = {}

  -- left
  add_table(default.left, default.main_icon)
  add_table(default.left, default.file_name)
  add_table(default.left, default.dir_name)
  add_table(default.left, default.diff.add)
  add_table(default.left, default.diff.change)
  add_table(default.left, default.diff.remove)
  add_table(default.left, default.diagnostic.error)
  add_table(default.left, default.diagnostic.warning)
  add_table(default.left, default.diagnostic.hint)
  add_table(default.left, default.diagnostic.info)

  add_table(default.middle, default.lsp_progress)

  -- right
  add_table(default.right, default.lsp_icon)
  add_table(default.right, default.git_branch)
  add_table(default.right, default.empty_space)
  add_table(default.right, default.empty_spaceColored)
  add_table(default.right, default.mode_icon)
  add_table(default.right, default.empty_space2)
  add_table(default.right, default.separator_right)
  add_table(default.right, default.separator_right2)
  add_table(default.right, default.position_icon)
  add_table(default.right, default.current_line)

  default.components.active[1] = default.left
  default.components.active[2] = default.middle
  default.components.active[3] = default.right

  feline.setup {
    theme = {
      bg = default.colors.statusline_bg,
      fg = default.colors.fg,
    },
    components = default.components,
  }
end

return M
