return {
  "nvim-treesitter/nvim-treesitter",
  enabled = true,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {"lua", "vimdoc"},
      auto_install = true,
      indent = { enable = true, disable = { "ruby" } },
      modules = {},
      sync_install = false,
      ignore_install = {},

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "ruby" },

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        disable = function(lang, buf)
          local max_filesize = 100 * 1024 -- 100 KB
          local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
      }
    })
  end
}
