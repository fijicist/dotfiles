return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  branch = 'master',
  lazy = false,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- Specify a custom installation directory for treesitter parsers
    require'nvim-treesitter'.setup {
      -- Directory to install parsers and queries to
      install_dir = vim.fn.stdpath('data') .. '/site'
    }

    -- Ensure treesitter install directory is in runtimepath
    vim.opt.runtimepath:prepend(vim.fn.stdpath("data") .. "/site")

    -- import nvim-treesitter plugin
    local treesitter = require("nvim-treesitter")

    -- configure treesitter
    treesitter.setup({ -- enable syntax highlighting
      highlight = {
        enable = true,
      },
      -- enable indentation
      indent = { enable = true },
      -- enable autotagging (w/ nvim-ts-autotag plugin)
      autotag = {
        enable = true,
      },
      -- ensure these language parsers are installed
      ensure_installed = {
        "bash",
        "regex",
        "diff",
        "norg",
        "bibtex",
        "cmake",
        "csv",
        "cuda",
        "fortran",
        "python",
        "rust",
        "ruby",
        "json",
        "yaml",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
        "c",
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<C-space>",
          node_incremental = "<C-space>",
          scope_incremental = false,
          node_decremental = "<bs>",
        },
      },
    })
  end,
}
