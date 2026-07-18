return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  branch = "master",
  lazy = false,
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  config = function()
    -- NOTE: on the master branch (v0.10.x) configuration goes through
    -- `nvim-treesitter.configs`, NOT `require("nvim-treesitter").setup(...)`.
    -- Using the wrong module silently ignored highlight/indent/ensure_installed,
    -- so no parsers were ever installed (which broke treesitter highlighting
    -- and gcc/gc commenting).
    local treesitter = require("nvim-treesitter.configs")

    treesitter.setup({
      -- enable syntax highlighting
      highlight = { enable = true },
      -- enable indentation
      indent = { enable = true },
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

    -- autotagging is configured through its own plugin now, not via the
    -- treesitter `autotag` module.
    require("nvim-ts-autotag").setup()
  end,
}
