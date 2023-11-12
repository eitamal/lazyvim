local os = require("utils.os")

---@type table<os_types, string>
local os_api_cmds = {
  [os.types.WINDOWS] = "op read op://Development/openai-chatgpt.nvim/credential --no-newline",
  [os.types.WSL] = "pass show openai/chatgpt.nvim",
}

local wk = require("which-key")
wk.register({
  C = {
    name = "ChatGPT",
    c = { "<cmd>ChatGPT<CR>", "ChatGPT" },
    e = { "<cmd>ChatGPTEditWithInstruction<CR>", "Edit with instruction", mode = { "n", "v" } },
    g = { "<cmd>ChatGPTRun grammar_correction<CR>", "Grammar Correction", mode = { "n", "v" } },
    t = { "<cmd>ChatGPTRun translate<CR>", "Translate", mode = { "n", "v" } },
    k = { "<cmd>ChatGPTRun keywords<CR>", "Keywords", mode = { "n", "v" } },
    d = { "<cmd>ChatGPTRun docstring<CR>", "Docstring", mode = { "n", "v" } },
    a = { "<cmd>ChatGPTRun add_tests<CR>", "Add Tests", mode = { "n", "v" } },
    o = { "<cmd>ChatGPTRun optimize_code<CR>", "Optimize Code", mode = { "n", "v" } },
    s = { "<cmd>ChatGPTRun summarize<CR>", "Summarize", mode = { "n", "v" } },
    f = { "<cmd>ChatGPTRun fix_bugs<CR>", "Fix Bugs", mode = { "n", "v" } },
    x = { "<cmd>ChatGPTRun explain_code<CR>", "Explain Code", mode = { "n", "v" } },
    l = { "<cmd>ChatGPTRun code_readability_analysis<CR>", "Code Readability Analysis", mode = { "n", "v" } },
  },
}, { prefix = "<leader>" })
return {
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      api_key_cmd = os_api_cmds[os.os],
      openai_params = {
        model = "gpt-4-1106-preview",
        frequency_penalty = 0.7,
        presence_penalty = 0.4,
        temperature = 0.6,
        top_p = 1,
        max_tokens = 2048,
      },
      openai_edit_params = {
        model = "gpt-3.5-turbo-1106",
        frequency_penalty = 0.8,
        presence_penalty = 0.6,
        temperature = 0,
        top_p = 1,
        max_tokens = 2048,
      },
    },
  },
}
