-- General settings
vim.o.number = true
vim.o.relativenumber = true
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.termguicolors = true
vim.g.mapleader = " "
vim.o.winborder = "rounded"
vim.o.clipboard = "unnamedplus"
vim.o.pumheight = 10

-- Keymaps
vim.keymap.set('n', '<leader>o', ':update<CR> :source<CR>')
vim.keymap.set('n', '<leader>w', ':write<CR>')
vim.keymap.set('n', '<leader>q', ':quit<CR>')

vim.keymap.set({ 'n' }, '<leader>d', function() 
    vim.diagnostic.open_float(nil, { focus = false })
end, { desc = "Show diagnostics under cursor" })

-- Tab keymaps
vim.keymap.set('n', '<leader>tn', ':tabnext<CR>')
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>')
vim.keymap.set('n', '<leader>tc', ':tabnew<CR>')

vim.keymap.set('n', '<leader>x', ':bdelete<CR>')

-- Window Split Keymaps
vim.keymap.set('n', '<S-UP>', ':split<CR>')
vim.keymap.set('n', '<S-DOWN>', ':split<CR><C-W><DOWN>')
vim.keymap.set('n', '<S-LEFT>', ':vsplit<CR>')
vim.keymap.set('n', '<S-RIGHT>', ':vsplit<CR><C-W><RIGHT>')

-- Native plugin manager
vim.pack.add(
    {
        -- Colorschemes
        { src = "https://github.com/vague2k/vague.nvim" },
        { src = "https://github.com/rebelot/kanagawa.nvim" },
        { src = "https://github.com/ellisonleao/gruvbox.nvim" },
        { src = "https://github.com/RRethy/base16-nvim" },
        { src = "https://github.com/tomasiser/vim-code-dark" },
        { src = "https://github.com/sainnhe/gruvbox-material" },
        { src = "https://github.com/luisiacc/gruvbox-baby" },

        -- File explorer
        { src = "https://github.com/stevearc/oil.nvim" },
        { src = "https://github.com/echasnovski/mini.pick" },
        
        -- LSP
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/hrsh7th/vim-vsnip" },
        { src = "https://github.com/hrsh7th/nvim-cmp" },
        { src = "https://github.com/onsails/lspkind.nvim" },
        { src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
        { src = "https://github.com/hrsh7th/cmp-vsnip" },
        { src = "https://github.com/hrsh7th/cmp-path" },

        -- MISC 
        { src = "https://github.com/altermo/ultimate-autopair.nvim" }, -- autopairs
        { src = "https://github.com/echasnovski/mini.icons" },         -- mini icons for nvim-cmp
        { src = "https://github.com/NMAC427/guess-indent.nvim" },      -- indendation
        
        -- Compile
        { src = "https://github.com/pohlrabi404/compile.nvim" },

        -- Git
        { src = "https://github.com/nvim-lua/plenary.nvim" },
        { src = "https://github.com/lewis6991/gitsigns.nvim" },        
        { src = "https://github.com/tpope/vim-fugitive" }
    }
)

-- Lsp Attach 
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
	end,
})

vim.cmd("set completeopt+=noselect")

-- Plugin setup
require "gitsigns".setup()
require "mini.pick".setup()
require "mini.icons".setup()
require "oil".setup()
require "guess-indent".setup()
require "nvim-treesitter.configs".setup({
	ensure_installed = { "c", "cpp", "python", "asm", "haskell" },
	highlight = { enable = true }
})
require "ultimate-autopair".setup()

require "compile".setup()

vim.cmd("set statusline+=%{get(b:,'vgit_status','')}")


-- Keybindings for plugins
vim.keymap.set('n', '<leader>f', ':Pick files<CR>')
vim.keymap.set('n', '<leader>lf', vim.lsp.buf.format)
vim.keymap.set('n', '<leader>e', ":Oil<CR>")
vim.keymap.set('n', '<leader>gp', function()
    require("gitsigns").preview_hunk()
end, { desc = "Preview hunk" })
-- Lsp enables
vim.lsp.enable({ "clangd" })

-- Colorscheme / UI
vim.cmd("colorscheme codedark")
-- vim.cmd(":hi statusline guibg=NONE")

-- nvim-cmp setup for autocomplete
local cmp = require("cmp")
cmp.setup({
    snippet = {
       expand = function(args)
          vim.fn["vsnip#anonymous"](args.body)
       end,
    },
    mapping = {
       ["<C-p>"] = cmp.mapping.select_prev_item(),
       ["<C-n>"] = cmp.mapping.select_next_item(),
       ["<C-d>"] = cmp.mapping.scroll_docs(-4),
       ["<C-f>"] = cmp.mapping.scroll_docs(4),
       ["<C-Space>"] = cmp.mapping.complete(),
       ["<C-e>"] = cmp.mapping.close(),
       ["<CR>"] = cmp.mapping.confirm({
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
       }),
       ["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s" }),
       ["<S-Tab>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s" }),
    },
    formatting = {
       format = function(_, vim_item)
          vim.cmd("packadd lspkind-nvim")
          vim_item.kind = require("lspkind").presets.codicons[vim_item.kind]
          .. "  "
          .. vim_item.kind
          return vim_item
       end,
    },
    sources = {
       { name = "nvim_lsp" },
       { name = "vsnip" },
       { name = "path" },
       { name = "buffer", max_item_count = 7 },
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    }

 })

 

