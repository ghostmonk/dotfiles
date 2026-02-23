-- Python provider (dedicated venv)
vim.g.python3_host_prog = vim.fn.expand("~/.pyenv/versions/neovim/bin/python")

-- Basic UI
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true

-- Indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true

-- Plugins (bootstrap lazy.nvim)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git","clone","--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git", lazypath
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  { "nvim-lualine/lualine.nvim" },
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "windwp/nvim-autopairs" },
  { "numToStr/Comment.nvim" },
  { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown" } },
  { "hrsh7th/nvim-cmp", dependencies = {
      "hrsh7th/cmp-nvim-lsp","hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path","saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip","rafamadriz/friendly-snippets"
    }
  },
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },
  { "stevearc/oil.nvim" },
  { "lewis6991/gitsigns.nvim" },
  { "folke/which-key.nvim", event = "VeryLazy" },
  { "williamboman/mason.nvim" },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl" },
  { "goolord/alpha-nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },
}, {
  rocks = { enabled = false },
})

-- Set colorscheme (guarded)
local ok_cat, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not ok_cat then
  -- fallback: do nothing (default colors)
end

-- Treesitter (guarded)
local ok_ts, ts_configs = pcall(require, "nvim-treesitter.configs")
if ok_ts then
  ts_configs.setup({
    ensure_installed = { "markdown","markdown_inline","python","typescript","javascript","lua","vim" },
    highlight = { enable = true },
    indent = { enable = true },
  })
end

-- Lualine (guarded)
local ok_lualine, lualine = pcall(require, "lualine")
if ok_lualine then lualine.setup() end

-- Comment (guarded)
local ok_comment, comment = pcall(require, "Comment")
if ok_comment then comment.setup() end

-- initialize nvim-tree
local ok, nvim_tree = pcall(require, "nvim-tree")
if ok then
  nvim_tree.setup({})
end

local ok_oil, oil = pcall(require, "oil")
if ok_oil then
  oil.setup({ default_file_explorer = true })
end

-- Gitsigns (guarded)
local ok_gs, gitsigns = pcall(require, "gitsigns")
if ok_gs then gitsigns.setup() end

-- Which-key (guarded)
local ok_wk, wk = pcall(require, "which-key")
if ok_wk then wk.setup() end

-- Mason (guarded)
local ok_mason, mason = pcall(require, "mason")
if ok_mason then mason.setup() end

-- Indent-blankline (guarded)
local ok_ibl, ibl = pcall(require, "ibl")
if ok_ibl then ibl.setup() end

-- Alpha dashboard (guarded)
local ok_alpha, alpha = pcall(require, "alpha")
if ok_alpha then
  local dashboard = require("alpha.themes.dashboard")

  dashboard.section.header.val = {
    [[                                   .:;+*%##%*+;,        ]],
    [[                                ,+*%%#########@@#*:     ]],
    [[                             .:*%%%####@@@@@@@@@@@@%:   ]],
    [[                            .;+*%%%%%#######@##@@@@@#*, ]],
    [[                            :;+**************%%%#@@@@#%,]],
    [[                           .;;:+;;++;;;;;;;;;++*%%#@@#%;]],
    [[                           ,;;:+;;+***++;:;;+*%%####@%%;]],
    [[                           ,;;:+**+;,::;;;;;;;:;*#@@#*%+]],
    [[                           ,::++:,.. ...,..,:,   .:+%**;]],
    [[                           .,:,        ..;;,,       .+*,]],
    [[                           .,:,        ,:*%+,       ,**,]],
    [[                            ,:;:.   .,,;:.,**:,.  ..+%*.]],
    [[                            :;;:,,,.,,:,   .;:,,,,:;+**,]],
    [[                            .:,.... .:.     .::.  .,;+, ]],
    [[                             ..  .,,:+:,,,,,:*+:,., .,  ]],
    [[                                  .;+*+;;:+++*%+,       ]],
    [[                                  .,,;;;;:+:++;;,       ]],
    [[                                   ..,,,,,,,:,..        ]],
    [[                                                        ]],
    [[   ________               __                        __  ]],
    [[  / ____/ /_  ____  _____/ /_____ ___  ____  ____  / /__]],
    [[ / / __/ __ \/ __ \/ ___/ __/ __ `__ \/ __ \/ __ \/ //_/]],
    [[/ /_/ / / / / /_/ (__  ) /_/ / / / / / /_/ / / / / ,<   ]],
    [[\____/_/ /_/\____/____/\__/_/ /_/ /_/\____/_/ /_/_/|_|  ]],
  }

  dashboard.section.buttons.val = {
    dashboard.button("f", "  Find file",       ":Telescope find_files<CR>"),
    dashboard.button("r", "  Recent files",    ":Telescope oldfiles<CR>"),
    dashboard.button("g", "  Grep text",       ":Telescope live_grep<CR>"),
    dashboard.button("e", "  New file",        ":ene <BAR> startinsert<CR>"),
    dashboard.button("c", "  Config",          ":e ~/.config/nvim/init.lua<CR>"),
    dashboard.button("q", "  Quit",            ":qa<CR>"),
  }

  dashboard.section.footer.val = "ghostmonk"

  alpha.setup(dashboard.config)
end

-- Autopairs (guarded)
local ok_pairs, pairs = pcall(require, "nvim-autopairs")
if ok_pairs then pairs.setup() end

-- CMP (guarded)
local ok_cmp, cmp = pcall(require, "cmp")
if ok_cmp then
  local ok_snip, luasnip = pcall(require, "luasnip")
  cmp.setup({
    snippet = {
      expand = function(args)
        if ok_snip then luasnip.lsp_expand(args.body) end
      end
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" }, { name = "buffer" }, { name = "path" },
    }),
  })
end

-- LSP (Neovim 0.11+ with nvim-cmp capabilities)
local ok_cmp, cmp_lsp = pcall(require, "cmp_nvim_lsp")
local capabilities = ok_cmp and cmp_lsp.default_capabilities() or nil

vim.lsp.config("pyright", { capabilities = capabilities })
vim.lsp.config("ts_ls", { capabilities = capabilities })

vim.lsp.enable({ "pyright", "ts_ls" })

