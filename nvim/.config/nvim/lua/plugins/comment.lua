return {
    {
        'numToStr/Comment.nvim',
        enabled = true,
        opts = {},
        event = "VimEnter",
    },
    {
        'folke/todo-comments.nvim',
        enabled = true,
        event = 'VimEnter',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = { signs = false }
    },
}
