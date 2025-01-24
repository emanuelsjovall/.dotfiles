return {
    "hiphish/rainbow-delimiters.nvim",
    enabled = true,
    config = function()
        vim.api.nvim_set_hl(0, "CustomRainbowYellow",    {default = true, fg = "#FFD701", ctermfg= "Yellow" })
        vim.api.nvim_set_hl(0, "CustomRainbowMagenta",   {default = true, fg = "#DA71D6", ctermfg= "Magenta" })
        vim.api.nvim_set_hl(0, "CustomRainbowLightBlue", {default = true, fg = "#15A0FF", ctermfg= "LightBlue"})
        require("rainbow-delimiters.setup").setup{
            query = {
                [""] = "rainbow-delimiters",
                tsx = "rainbow-custom",
                go = "rainbow-custom",
            },
            highlight = {
                "CustomRainbowYellow",
                "CustomRainbowMagenta",
                "CustomRainbowLightBlue",
            },
        }
    end,
}

-- :Inspect to show the highlight groups under the cursor
-- :InspectTree to show the parsed syntax tree ("TSPlayground")
-- :EditQuery to open the Live Query Editor (Nvim 0.10+)

-- Default rainbow 
-- "RainbowDelimiterRed",
-- "RainbowDelimiterYellow",
-- "RainbowDelimiterBlue",
-- "RainbowDelimiterOrange",
-- "RainbowDelimiterGreen",
-- "RainbowDelimiterViolet",
-- "RainbowDelimiterCyan",
