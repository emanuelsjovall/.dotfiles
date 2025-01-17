return {
    'nvim-lualine/lualine.nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        require('lualine').setup({
            options = {
                component_separators = {'', ''},
                section_separators = {'', ''},    -- maybe change idk
            }
        })
    end
}
