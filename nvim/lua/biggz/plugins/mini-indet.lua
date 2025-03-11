return {
  "echasnovski/mini.indentscope",
  version = false, -- Usa la última versión
  event = "BufReadPre",
  opts = {
    draw = {
      animation = require("mini.indentscope").gen_animation.none(),
    },
    symbol = "│", -- Puedes cambiarlo por otro símbolo
  },
  config = function(_, opts)
    require("mini.indentscope").setup(opts)
  end,
}
