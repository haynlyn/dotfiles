-- Detect filetypes for backup files by stripping backup suffixes
-- and re-deriving the filetype from the underlying filename.
--
-- Supported patterns:
--    *.bk                    (e.g. foo.py.bk)
--    *.bk.{description}      (e.g. foo.py.bk.old_version or foo.py.bk.20260101)
--    *.baka                  (e.g., foo.py.baka)
--    *.baka.{description}    (e.g. foo.py.baka.before_refactor or foo.py.baka.20240512)

local backup_suffixes = { "bk", "baka" }

local function detect_backup_filetype(path, bufnr)
  for _, suffix in ipairs(backup_suffixes) do
    local base = path:match("^(.+)%." .. suffix .. "%.[%w_-]+$")
      or path:match("^(.+)%." .. suffix .. "$")
    if base then
      return vim.filetype.match({ filename = base, buf = bufnr })
    end
  end
end

-- Neovim wraps pattern keys with ^ and $ automatically, so do not add our own anchors.
vim.filetype.add({
  pattern = {
    -- .bk / .bk.{description}
    [".*%.bk"] = detect_backup_filetype,
    [".*%.bk%..*"] = detect_backup_filetype,
    -- .baka / .baka.{description}
    [".*%.baka"] = detect_backup_filetype,
    [".*%.baka%..*"] = detect_backup_filetype,
  },
})
