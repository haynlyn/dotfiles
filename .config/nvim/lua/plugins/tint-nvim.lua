return {
  "levouh/tint.nvim",
  opts = {
    window_ignore_function = function(winid)
      local floating = vim.api.nvim_win_get_config(winid).relative ~= ""
      return floating
    end,
    highlight_ignore_patterns = { "WinSeparator", "Status.*" },
  },
}
