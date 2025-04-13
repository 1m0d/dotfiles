require("which-key").setup{
    plugins = {
      registers = true
    },
    presets = {
      operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
      motions = false, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
}

require("which-key").add(
  {
    { "<leader><space>", group = "Hop" },
    { "<leader><space>f", "<cmd>HopChar1<cr>", desc = "Char" },
    { "<leader><space>w", "<cmd>HopWord<cr>", desc = "Word" },
    { "<leader>C", group = "Copilot" },
    { "<leader>Cl", "<cmd>Copilot panel<CR>", desc = "Copilot List" },
    { "<leader>F", group = "Format" },
    { "<leader>Fp", "<cmd>FormatParanthesis<cr>", desc = "Format Paranthesis" },
    { "<leader>S", '"hyiw:%s/<C-r>h//g<left><left>', desc = "Substitute inner word", silent = false },
    { "<leader>d", ":w !diff -y --suppress-common-lines % - <cr>", desc = "Diff since save", silent = false },
    { "<leader>f", group = "find" },
    { "<leader>fb", "<cmd>Buffers<cr>", desc = "Buffers" },
    { "<leader>ff", "<cmd>Ag<cr>", desc = "in Files" },
    { "<leader>fh", "<cmd>History<cr>", desc = "History" },
    { "<leader>fn", group = "nvim" },
    { "<leader>fne", "<cmd>NvimrcEdit<cr>", desc = "Edit init.vim" },
    { "<leader>fnp", "<cmd>PlugInstall<cr>", desc = "install Plugins" },
    { "<leader>fnr", "<cmd>NvimrcReload<cr>", desc = "Reload init.vim" },
    { "<leader>fr", "<cmd>RG<cr>", desc = "Ripgrep with regex" },
    { "<leader>ft", "<cmd>Tags<cr>", desc = "Tags" },
    { "<leader>fx", "<cmd>Executables<cr>", desc = "eXecutables" },
    { "<leader>m", group = "magma" },
    { "<leader>mi", "<cmd>MagmaInit<CR>", desc = "Initialize" },
    { "<leader>ml", "<cmd>MagmaEvaluateLine<CR>", desc = "evaluate Line" },
    { "<leader>mr", "<cmd>MagmaReEvaluateCell<CR>", desc = "Reevaluate cell" },
    { "<leader>mv", "<cmd>MagmaEvaluateVisual<CR>", desc = "evaluate Visual" },
    { "<leader>q", group = "quickfix" },
    { "<leader>qG", "<cmd>clast<cr>", desc = "Last" },
    { "<leader>qg", "<cdm>cfirst<cr>", desc = "First" },
    { "<leader>qn", "<cmd>cnext<cr>", desc = "Next" },
    { "<leader>qp", "<cmd>cprev<cr>", desc = "Previous" },
    { "<leader>qq", "<cmd>cclose<cr>", desc = "Quit list" },
    { "<leader>qs", ":cdo s//g | update <c-b><S-Right><right><right><right>", desc = "Substitute", silent = false },
    { "<leader>s", ":%s//g <left><left><left>", desc = "Substitute", silent = false },
    { "<leader>t", group = "test" },
    { "<leader>tf", "<cmd>Ultest<CR>", desc = "Test File" },
    { "<leader>tn", "<cmd>UltestNearest<CR>", desc = "Test Nearest" },
    { "<leader>tt", "<cmd>UltestSummary<CR>", desc = "Test Tab" },
    { "<leader>y", group = "Yank" },
    { "<leader>yF", '<cmd>let @+=expand("%:t")<CR>', desc = "yank File name" },
    { "<leader>yf", '<cmd>let @+=expand("%:p")<CR>', desc = "yank File path" },
  }
)

require'hop'.setup()

local dap = require('dap')
dap.adapters.python = {
    type = 'executable';
    command = '/home/domi/.envs/debugpy/bin/python';
    args = { '-m', 'debugpy.adapter' };
}
dap.configurations.python = {
    {
      -- The first three options are required by nvim-dap
      type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
      request = 'launch';
      name = "Launch file";

      -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

      program = "${file}"; -- This configuration will launch the current file if used.
      pythonPath = function()
        -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
        -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
        -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
        local cwd = vim.fn.getcwd()
        if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
          return cwd .. '/venv/bin/python'
        elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
          return cwd .. '/.venv/bin/python'
        else
          return '/usr/bin/python'
        end
      end;
    },
}

require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "comment", "dockerfile", "gitignore", "make", "regex", "sql", "vim", "yaml", "http", "query"},
  auto_install = true,
  highlight = {
    enable = true,
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("trouble").setup {}

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require("distant"):setup()

require('avante_lib').load()
require('avante').setup ({
      provider = "copilot",
      model = "claude-3-5-sonnet-20241022"
})
