return {
  { "luisiacc/gruvbox-baby" },
  { "navarasu/onedark.nvim" },
  { "rebelot/kanagawa.nvim" },
  { "Mofiqul/vscode.nvim" },
  { "EdenEast/nightfox.nvim" },
  { "navarasu/onedark.nvim" },
  { "elianiva/gruvy.nvim" },
  { "vague2k/vague.nvim" },
  { "romainl/Apprentice" },
  { "savq/melange-nvim" },
  {
    "gmr458/vscode_modern_theme.nvim",
    lazy = false,
    config = function()
      require("vscode_modern").setup({
        cursorLine = true,
        nvim_tree_darker = true,
        transparent_background = false,
      })
    end,
  },
  {
    "luisiacc/gruvbox-baby",
    config = function()
      vim.g.gruvbox_baby_keyword_style = "NONE"
    end,
  },
  { "santos-gabriel-dario/darcula-solid.nvim" },
  { "rktjmp/lush.nvim" },
  { "ellisonleao/gruvbox.nvim", priority = 1000, config = true },
  {
    "projekt0n/github-nvim-theme",
    name = "github-theme",
    lazy = false,
    priority = 10000,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
    },
  },
}
