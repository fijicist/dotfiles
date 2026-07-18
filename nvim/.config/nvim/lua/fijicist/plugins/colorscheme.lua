return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    config = function()
      local transparent = true -- set to true if you would like to enable transparency

      local coolnight = {
        bg = "#011323",
        bg_dark = "#00111E",
        bg_float = "#00111E",
        bg_highlight = "#012646",
        bg_popup = "#00111E",
        bg_search = "#3E90D7",
        bg_sidebar = "#00111E",
        bg_statusline = "#00111E",
        bg_visual = "#064984",
        fg = "#E3EEF7",
        fg_dark = "#AECBE5",
        fg_float = "#CBDFF0",
        fg_gutter = "#2D4F6C",
        fg_sidebar = "#AECBE5",
        border = "#03447C",
      }

      require("tokyonight").setup({
        style = "storm",
        transparent = transparent,
        styles = {
          sidebars = transparent and "transparent" or "dark",
          floats = transparent and "transparent" or "dark",
        },
        on_colors = function(colors)
          colors.bg = coolnight.bg
          colors.bg_dark = transparent and colors.none or coolnight.bg_dark
          colors.bg_float = transparent and colors.none or coolnight.bg_float
          colors.bg_highlight = coolnight.bg_highlight
          colors.bg_popup = coolnight.bg_popup
          colors.bg_search = coolnight.bg_search
          colors.bg_sidebar = transparent and colors.none or coolnight.bg_sidebar
          colors.bg_statusline = transparent and colors.none or coolnight.bg_statusline
          colors.bg_visual = coolnight.bg_visual
          colors.border = coolnight.border
          colors.fg = coolnight.fg
          colors.fg_dark = coolnight.fg_dark
          colors.fg_float = coolnight.fg_float
          colors.fg_gutter = coolnight.fg_gutter
          colors.fg_sidebar = coolnight.fg_sidebar
        end,
        lualine_bold = true,
      })

      vim.cmd("colorscheme tokyonight")
    end,
  },
  {
    -- "bluz71/vim-nightfly-colors",
    -- name = "nightfly",
    -- priority = 1000,
    -- config = function()
    --   vim.cmd.colorscheme("nightfly")
    -- end,
  },
}
-- return {
--   {
--     "folke/tokyonight.nvim",
--     priority = 1000, -- make sure to load this before all the other start plugins
--     config = function()
--       local transparent = true -- set to true if want transparent background
--
--       local bg = "#011628"
--       local bg_dark = "#011423"
--       local bg_highlight = "#143652"
--       local bg_search = "#0A64AC"
--       local bg_visual = "#275378"
--       local fg = "#CBE0F0"
--       local fg_dark = "#B4D0E9"
--       local fg_gutter = "#627E97"
--       local border = "#547998"
--
--       require("tokyonight").setup({
--         style = "night",
--         transparent = transparent,
--         styles = {
--           sidebars = transparent and "transparent" or "dark",
--           floats = transparent and "transparent" or "dark",
--         },
--         on_colors = function(colors)
--           colors.bg = bg
--           colors.bg_dark = bg_dark and colors.none or bg_dark
--           colors.bg_float = bg_dark and colors.none or bg_dark
--           colors.bg_highlight = bg_highlight
--           colors.bg_popup = bg_dark
--           colors.bg_search = bg_search
--           colors.bg_sidebar = bg_dark and colors.none or bg_dark
--           colors.bg_statusline = bg_dark and colors.none or bg_dark
--           colors.bg_visual = bg_visual
--           colors.border = border
--           colors.fg = fg
--           colors.fg_dark = fg_dark
--           colors.fg_float = fg
--           colors.fg_gutter = fg_gutter
--           colors.fg_sidebar = fg_dark
--         end,
--       })
--       -- load the colorscheme here
--       vim.cmd([[colorscheme tokyonight]])
--     end,
--   },
-- }
