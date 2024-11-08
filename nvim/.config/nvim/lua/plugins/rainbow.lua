return {
    "hiphish/rainbow-delimiters.nvim",
    config = function()
        vim.api.nvim_set_hl(0, "CustomRainbowYellow",    {default = true, fg = "#FFD701", ctermfg= "Yellow" })
        vim.api.nvim_set_hl(0, "CustomRainbowMagenta",   {default = true, fg = "#DA71D6", ctermfg= "Magenta" })
        vim.api.nvim_set_hl(0, "CustomRainbowLightBlue", {default = true, fg = "#15A0FF", ctermfg= "LightBlue"})
        require("rainbow-delimiters.setup").setup{
            query = {
                [""] = "rainbow-delimiters",
                tsx = "rainbow-custom",
            },
            highlight = {
                "CustomRainbowYellow",
                "CustomRainbowMagenta",
                "CustomRainbowLightBlue",
            },
        }
    end,
}

-- Default rainbow 
-- "RainbowDelimiterRed",
-- "RainbowDelimiterYellow",
-- "RainbowDelimiterBlue",
-- "RainbowDelimiterOrange",
-- "RainbowDelimiterGreen",
-- "RainbowDelimiterViolet",
-- "RainbowDelimiterCyan",
