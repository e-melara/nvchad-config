local M = {}

M.propios = {
  n = {
    ["<C-x>"] = {":q <CR>", "Salir"}
  },
  i = {
    ["jk"] = {"<ESC>", "escape insert mode", opts = { nowait = true }},
    ["<C-S>"] = {"<ESC><cmd>w<CR>", "save file"},
  }
}

return M
