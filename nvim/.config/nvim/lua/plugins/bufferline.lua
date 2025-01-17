--broken in nvim 0.10 so disable for now might not even want to use in the future
return {
    'akinsho/bufferline.nvim',
    enabled = false,
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup{
            options = {
                diagnostics = "nvim_lsp", -- show diagnostics in bufferline
                diagnostics_indicator = function(count, level, diagnostics_dict, context)
                    return "(" .. count .. ")"
                end, -- custom function to display diagnostics
                offsets = { { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", text_align = "left" } }, -- offsets for specific filetypes
                separator_style = "thin", -- separator style between buffers
            },
        }
        vim.keymap.set("n", "<M-h>", "<Cmd>bprev<CR>", { desc = "[M]eta prev buffer" })
        vim.keymap.set("n", "<M-l>", "<Cmd>bnext<CR>", { desc = "[M]eta next buffer" })
    end,
}
