return {
    "nvimtools/none-ls.nvim",
    lazy = false,
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.diagnostics.mypy,
                -- null_ls.builtins.diagnostics.mypy.with({
                --     prefer_local = ".venv/bin",
                -- }),
                -- null_ls.builtins.formatting.prettier,
                -- null_ls.builtins.diagnostics.eslint,
            },
        })


        vim.keymap.set("n", "<leader>nt", function()
            vim.ui.input({ prompt = "Enter null-ls source to toggle: "}, function(input)
                if input == "" or input == nil then
                    return
                end
                null_ls.toggle(input)
            end)
        end, {desc = "[N]ull-ls [T]oggle"})
    end,
    keys = {
        {"<leader>cf", vim.lsp.buf.format, desc = "[C]ode [F]ormat"},
    },
}
