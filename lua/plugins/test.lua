return {
  { "nvim-neotest/neotest-go" },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-go"] = {
          args = { "-tags=unit,integration" },
        },
      },
    },
  },
}
