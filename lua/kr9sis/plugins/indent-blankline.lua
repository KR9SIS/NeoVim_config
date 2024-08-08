return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile", "VeryLazy" },
  main = "ibl",
  opts = {
    indent = { char = "┊" },
  },
}
