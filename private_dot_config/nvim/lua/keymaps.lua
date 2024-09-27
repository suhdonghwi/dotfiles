local wk = require("which-key")

-- vim.keymap.set("n", "<C-d>", "10<C-e>")
-- vim.keymap.set("n", "<C-u>", "10<C-y>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Keymaps for switching between tabs next and previous
wk.add({
  {
    "[t",
    ":tabprevious<CR>",
    desc = "Previous tab",
  },
  {
    "]t",
    ":tabnext<CR>",
    desc = "Next tab",
  },
})
