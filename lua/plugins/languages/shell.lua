-- lazyvim has some shell things configured, so I have to check it doesn't exist before adding to avoid duplicates
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        local languages = { "bash", "fish" }
        for _, lang in ipairs(languages) do
          if not vim.list_contains(opts.ensure_installed, lang) then
            table.insert(opts.ensure_installed, lang)
          end
        end
      end
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "shellcheck", "bash-language-server" })
      if not vim.list_contains(opts.ensure_installed, "shfmt") then
        table.insert(opts.ensure_installed, "shfmt")
      end
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        bashls = {},
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        fish = { "fish_indent" },
        sh = { "shfmt", "shellcheck" },
      },
    },
  },
}
