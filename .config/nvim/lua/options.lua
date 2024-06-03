local o = vim.opt
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

o.expandtab = true
o.smarttab = true
o.shiftwidth = 4
o.tabstop = 4

o.hlsearch = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true

o.splitbelow = true
o.splitright = true
o.wrap = false

-- Minimal number of screen lines to keep above and below the cursor.
o.scrolloff = 5 
o.fileencoding = "utf-8"
o.termguicolors = true

o.relativenumber = true
o.number = true
o.cursorline = true

o.hidden = true

-- my own shit
o.cmdheight = 1
o.mouse = "a"

-- Don't show the mode, since it's already in status line
o.showmode = false
o.showcmd = true
o.laststatus = 2

o.ruler = true
o.modeline = true

o.backup = false
o.writebackup = false

o.shellcmdflag = "-ic"

-- Preview substitutions live, as you type!
o.inccommand = 'split'

-- Sets how neovim will display certain whitespace in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
o.list = true
o.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Enable break indent
o.breakindent = true

-- Save undo history
o.undofile = true

-- Keep signcolumn on by default
o.signcolumn = 'yes'

-- Decrease update time
o.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
o.timeoutlen = 300

-- to disable highlight of matching parenthesis 
-- vim.g.loaded_matchparen = 1

-- doing this makes startup slower in wsl2 ubuntu not sure about other use cases so we do autocmd magic instead to keep startup fast
-- https://www.reddit.com/r/neovim/comments/1293o2y/vimoptclipboard_unnamedplus_is_very_slow/
-- o.clipboard = 'unnamedplus'
vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
    -- or vim.fn.has("wsl") == 1 this could be here aswell but i dont want to install win32yank so we stick to xclip for wsl2 since it works
      if vim.fn.has("win32") == 1 then
        vim.g.clipboard = {
          copy = {
            ["+"] = "win32yank.exe -i --crlf",
            ["*"] = "win32yank.exe -i --crlf",
          },
          paste = {
            ["+"] = "win32yank.exe -o --lf",
            ["*"] = "win32yank.exe -o --lf",
          },
        }
      elseif vim.fn.has("unix") == 1 then
        if vim.fn.executable("xclip") == 1 then
          vim.g.clipboard = {
            copy = {
              ["+"] = "xclip -selection clipboard",
              ["*"] = "xclip -selection clipboard",
            },
            paste = {
              ["+"] = "xclip -selection clipboard -o",
              ["*"] = "xclip -selection clipboard -o",
            },
          }
        elseif vim.fn.executable("xsel") == 1 then
          vim.g.clipboard = {
            copy = {
              ["+"] = "xsel --clipboard --input",
              ["*"] = "xsel --clipboard --input",
            },
            paste = {
              ["+"] = "xsel --clipboard --output",
              ["*"] = "xsel --clipboard --output",
            },
          }
        end
      end
      o.clipboard = "unnamedplus"
    end,
    desc = "Lazy load clipboard",
})