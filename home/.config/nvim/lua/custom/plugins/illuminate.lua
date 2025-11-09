return {
  "RRethy/vim-illuminate",
  config = function()
    require("illuminate").configure({
      providers = {
        "treesitter",
        "lsp",
        "regex",
      },
      delay = 100,
      filetypes_denylist = { "NvimTree", "dashboard" },
    })
  end,
}
