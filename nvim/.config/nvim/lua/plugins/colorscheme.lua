return {
    "gmr458/vscode_modern_theme.nvim",
    enabled = true,
    lazy = false,
    priority = 1000,
    config = function()
        require("vscode_modern").setup({
            cursorline = true,
            transparent_background = false,
            nvim_tree_darker = true,
        })
        vim.cmd.colorscheme("vscode_modern")
        -- cterm is for the left indicator/cursor while gui is for the right hand or closing parenthesis
        vim.cmd("hi MatchParen ctermbg=white ctermfg=None guibg=black guifg=grey")
        -- lil fix to stop the statusline for current selected window to be filled with ^^^^^^^^^ (colors are unchanged)
        -- https://vi.stackexchange.com/questions/15873/carets-in-status-line 
        -- vim.cmd("highlight StatusLine   cterm=none ctermfg=white ctermbg=black guifg=#858585 guibg=#131313")
        -- vim.cmd("highlight StatusLineNC cterm=none ctermfg=black ctermbg=black guifg=white guibg=white")
        vim.api.nvim_set_hl(0, "StatusLine", {fg = "#858585", bg = "#131313", ctermfg = white, ctermbg = black, cterm = none})
        vim.api.nvim_set_hl(0, "StatusLineNC", {fg = white, bg = white, ctermfg = black, ctermbg = black, cterm = none})

        -- to enable the border around telescope
        --[[ local TelescopeColor = {
            TelescopeMatching = { fg = "white" },
            TelescopeSelection = { fg = "white", bold = true },

            TelescopePromptBorder = { fg = "grey" },
            TelescopeResultsBorder = { fg = "grey" },
            TelescopePreviewBorder = { fg = "grey" },

            TelescopePromptTitle = { fg = "white" },
            TelescopeResultsTitle = { fg = "white" },
            TelescopePreviewTitle = { fg = "white" },
        }

        for hl, col in pairs(TelescopeColor) do
            vim.api.nvim_set_hl(0, hl, col)
        end ]]
    end,
}

-- return {
--     "rebelot/kanagawa.nvim",
--     lazy = false,
--     priority = 1000,
--     config = function()
--         -- require("vscode_modern").setup({
--         --     cursorline = true,
--         --     transparent_background = false,
--         --     nvim_tree_darker = true,
--         -- })
--         -- vim.cmd.colorscheme("vscode_modern")
--         require("kanagawa").load("dragon")
--     end,
-- }
