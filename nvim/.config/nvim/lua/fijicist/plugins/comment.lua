return {
  "numToStr/Comment.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      opts = {
        enable_autocmd = true, -- Fixes the CursorHold crash
      },
    },
  },
  config = function()
    -- import comment plugin safely
    local comment = require("Comment")

    local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

    -- for commenting tsx, jsx, svelte, html files
    local ts_pre_hook = ts_context_commentstring.create_pre_hook()

    -- enable comment
    comment.setup({
      -- Guard the context-commentstring hook: it errors when a buffer has no
      -- active treesitter parser (e.g. yaml), which otherwise aborts gcc/gc
      -- entirely. On error we return nil so Comment.nvim falls back to the
      -- buffer's own 'commentstring'.
      pre_hook = function(ctx)
        local ok, result = pcall(ts_pre_hook, ctx)
        if ok then
          return result
        end
        return nil
      end,
    })
  end,
}


-- return {
--   "numToStr/Comment.nvim",
--   event = { "BufReadPre", "BufNewFile" },
--   dependencies = {
--     "JoosepAlviste/nvim-ts-context-commentstring",
--   },
--   config = function()
--     -- import comment plugin safely
--     local comment = require("Comment")
--
--     local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")
--
--     -- enable comment
--     comment.setup({
--       -- for commenting tsx, jsx, svelte, html files
--       pre_hook = ts_context_commentstring.create_pre_hook(),
--     })
--   end,
-- }
