return {
   "echasnovski/mini.nvim",
   version = false, -- Use the latest version
   config = function()
      require("mini.animate").setup({
         resize = {
            enable = false, -- Disable resize animations
         },
         open = {
            enable = false, -- Disable open animations
         },
         close = {
            enable = false, -- Disable close animations
         },
         scroll = {
            enable = false, -- Disable scroll animations
         },
      })
   end,
}
