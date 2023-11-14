local plugins = {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
        lua = { "stylua" },
        python = { "isort", "black" },
      })
    end,
  },
}
return plugins
