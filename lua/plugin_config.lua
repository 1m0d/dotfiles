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
    triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k", "y" },
    },
}

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

local wk = require("which-key")
wk.register({
    f = {
      name = "find",
      f = { "<cmd>Ag<cr>", "in Files" },
      t = { "<cmd>Tags<cr>", "Tags" },
      b = { "<cmd>Buffers<cr>", "Buffers" },
      h = { "<cmd>History<cr>", "History" },
      r = { "<cmd>RG<cr>", "Ripgrep with regex" },
      x = { "<cmd>Executables<cr>", "eXecutables" },
      n = {
        name = "nvim",
        e = { "<cmd>NvimrcEdit<cr>", "Edit init.vim"},
        r = { "<cmd>NvimrcReload<cr>", "Reload init.vim" },
        p = { "<cmd>PlugInstall<cr>", "install Plugins" }
      }
    },

    F = {
      name = "Format",
      p = { "<cmd>FormatParanthesis<cr>", "Format Paranthesis" }
    },

    q = {
      name = "quickfix",
      q = { "<cmd>cclose<cr>", "Quit list" },
      n = { "<cmd>cnext<cr>", "Next" },
      p = { "<cmd>cprev<cr>", "Previous" },
      g = { "<cdm>cfirst<cr>", "First" },
      G = { "<cmd>clast<cr>", "Last" },
      s = { ":cdo s//g | update <c-b><S-Right><right><right><right>", "Substitute", silent=false }
    },

    ["<space>"] = {
      name = "Hop",
      w = { "<cmd>HopWord<cr>", "Word" },
      f = { "<cmd>HopChar1<cr>", "Char" }
    },
    s = { ":%s//g <left><left><left>", "Substitute", silent=false },
    S = { '"hyiw:%s/<C-r>h//g<left><left>', "Substitute inner word", silent=false },
    d = { ":w !diff -y --suppress-common-lines % - <cr>", "Diff since save", silent=false },
    y = {
      name = "Yank",
      f = {'<cmd>let @+=expand("%:p")<CR>', "yank File path" },
      F = {'<cmd>let @+=expand("%:t")<CR>', "yank File name" }
    },
    t = {
      name = "test",
      n = { "<cmd>UltestNearest<CR>", "Test Nearest" },
      t = { "<cmd>UltestSummary<CR>", "Test Tab" },
      f = { "<cmd>Ultest<CR>", "Test File" }
    },
    C = {
      name = "Copilot",
      l = { "<cmd>Copilot panel<CR>", "Copilot List"}
    },
    m = {
      name = "magma",
      i = { "<cmd>MagmaInit<CR>", "Initialize" },
      l = { "<cmd>MagmaEvaluateLine<CR>", "evaluate Line" },
      v = { "<cmd>MagmaEvaluateVisual<CR>", "evaluate Visual" },
      r = { "<cmd>MagmaReEvaluateCell<CR>", "Reevaluate cell" }
    }
  }, { prefix = "<leader>" })

  wk.register(
    {
      m = {
        name = "magma",
        v = { "<cmd>MagmaEvaluateVisual<CR>", "evaluate Visual" },
      }
    },
    {mode = "v"}
  )

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

local iron = require("iron.core")

iron.setup {
    config = {
      -- Whether a repl should be discarded or not
      scratch_repl = true,
      -- Your repl definitions come here
      repl_definition = {
        sh = {
          command = {"zsh"}
        },
        python = {
          command = {"ipython"},
          format = require("iron.fts.common").bracketed_paste,
        }
      },
      -- How the repl window will be displayed
      -- See below for more information
      repl_open_cmd = require('iron.view').bottom(30),
    },
    -- Iron doesn't set keymaps by default anymore.
    -- You can set them here or manually add keymaps to the functions in iron.core
    keymaps = {
      send_motion = "<space>sc",
      visual_send = "<space>sc",
      send_file = "<space>sf",
      send_line = "<space>sl",
      send_mark = "<space>sm",
      mark_motion = "<space>mc",
      mark_visual = "<space>mc",
      remove_mark = "<space>md",
      cr = "<space>s<cr>",
      interrupt = "<space>s<space>",
      exit = "<space>sq",
      clear = "<space>cl",
    },
    -- If the highlight is on, you can change how it looks
    -- For the available options, check nvim_set_hl
    highlight = {
      italic = true
    }
  }

require('leap')
vim.keymap.set('n', '-', '<Plug>(leap-forward)', {})

require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

require("distant"):setup()

