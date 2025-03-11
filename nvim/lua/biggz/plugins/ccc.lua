return {
  "uga-rosa/ccc.nvim",
  ft = { "cfg", "css", "conf", "lua", "scss", "kdl", "yaml" },
  cmd = "CccPick",
  opts = {
    highlighter = {
      auto_enable = true,
      filetypes = { "cfg", "css", "conf", "lua", "scss", "kdl", "yaml" },
      lsp = false,
    },
  },
  config = function(_, opts)
    local ccc = require("ccc")
    ccc.output.hex.setup({ uppercase = true })
    ccc.output.hex_short.setup({ uppercase = true })
    require("ccc").setup(opts)
  end,
}
