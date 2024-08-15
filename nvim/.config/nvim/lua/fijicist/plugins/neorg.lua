return {
  "nvim-neorg/neorg",
  --  dependencies = { "luarocks.nvim", "nvim-treesitter" },
  lazy = false,
  version = "*",
  config = function()
    require("neorg").setup({
      load = {
        ["core.defaults"] = {},
        ["core.itero"] = {},
        ["core.keybinds"] = {},
        ["core.concealer"] = {},
        ["core.dirman"] = {
          config = {
            workspaces = {
              second_brain = "~/second-brain/",
            },
            default_workspace = "second_brain",
          },
        },
        ["core.completion"] = {
          config = {
            engine = "nvim-cmp",
          },
        },
        ["core.export"] = {},
        ["core.export.markdown"] = {
          config = {
            extensions = "all",
          },
        },
        ["core.journal"] = {
          config = {
            strategy = "flat",
          },
        },
      },
    })

    vim.wo.foldlevel = 99
    vim.wo.conceallevel = 2
  end,
}
