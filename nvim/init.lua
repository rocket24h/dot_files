-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.g.zenbones_darken_comments = 45
-- setup must be called before loading
vim.cmd("set termguicolors")
vim.cmd("set background=dark")
-- vim.cmd("let g:everforest_better_performance = 1")
--vim.cmd("let g:everforest_background = 'hard'")
vim.cmd.colorscheme("zenbones")
