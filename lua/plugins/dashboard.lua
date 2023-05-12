require("dashboard").setup {
    theme = 'doom',
    config = {
        header = {
            "",
            "",
            "",
            "",
            "",
            " ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗",
            " ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║",
            " ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║",
            " ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║",
            " ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║",
            " ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
        },
        center = {
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find File           ',
                desc_hl = 'String',
                key = 'a',
                key_hl = 'Number',
                action = 'Telescope find_files'
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Git UI',
                desc_hl = 'String',
                key = 'b',
                key_hl = 'Number',
                action = 'FloatermNew lazygit'
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Recent Files',
                desc_hl = 'String',
                key = 'c',
                key_hl = 'Number',
                action = 'Telescope oldfiles'
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Find Word',
                desc_hl = 'String',
                key = 'd',
                key_hl = 'Number',
                action = 'Telescope live_grep'
            },
            {
                icon = ' ',
                icon_hl = 'Title',
                desc = 'Configuration',
                desc_hl = 'String',
                key = 'e',
                key_hl = 'Number',
                action = ':e ~/.config/nvim/init.lua'
            },
        },
        hide = {
            tabline = false,
        },
    }
}
