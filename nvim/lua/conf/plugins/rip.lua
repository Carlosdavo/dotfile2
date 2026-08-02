return {
  "chrisgrieser/nvim-rip-substitute",
  cmd = "RipSubstitute",
  keys = {
    {
      "<leader>rs", -- Cambié de <leader>fs a <leader>rs (rip substitute)
      function()
        require("rip-substitute").sub()
      end,
      mode = { "n", "x" },
      desc = "Rip substitute",
    },
  },
}
