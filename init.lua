-- init.lua
-- Basic Neovim configuration for version 0.11+
-- Location: ~/.config/nvim/init.lua (Linux/macOS)
--           ~/AppData/Local/nvim/init.lua (Windows)
--

-- Output a message to confirm the file is loaded (optional, good for debugging)
print("Neovim config (init.lua) loaded!")

--[[---------------------------------------------------------------------------
--  Core Editor Settings
---------------------------------------------------------------------------]] --
-- @note I elected not to change this for now since backspace is what I am used to as the default
-- Set leader key. The leader key is a prefix for custom shortcuts.
-- For example, if leader is <Space>, then <Space>w could be a shortcut to save.
-- IMPORTANT: Set this before any mappings that use it!
vim.g.mapleader = " "       -- Sets the global leader key to Space
vim.g.maplocalleader = " "  -- Sets the local (buffer-specific) leader to Space

vim.keymap.set({'n','v'},'<Space>','<Nop>',{silent = true})
vim.keymap.set("n", "<leader>gl", function()
  require("snacks").lazygit.open()
end, { desc = "Open LazyGit (Snacks)" })

--vertical scroll and center

local opts = {noremap = true,silent = true}
vim.keymap.set('n','<C-d>','<C-d>zz',opts)
vim.keymap.set('n','<C-u>','<C-u>zz',opts)

--find and center 
vim.keymap.set('n','n','nzzzv',opts)
vim.keymap.set('n','N','Nzzzv',opts)

--tabs to buffer
vim.keymap.set('n','<Tab>',':bnext<CR>',opts)
vim.keymap.set('n','<S-Tab>',':bprevious<CR>',opts)
vim.keymap.set('n','<Leader>x','bdelete!<CR>',opts)

-- Encoding and Filetype
vim.opt.encoding = "utf-8"           -- Set default encoding to UTF-8
vim.opt.fileencoding = "utf-8"       -- Set file encoding to UTF-8
vim.cmd("filetype plugin indent on") -- Enable filetype detection, plugins, and indenting

-- Set Language to English for Neovim messages
-- This helps ensure UI messages are in English, regardless of system locale.
-- You can also use "en_GB.UTF-8" or just "en" depending on desired specificity and system support.
vim.cmd("language messages en_US.UTF-8")

-- Indentation
vim.opt.tabstop = 4        -- Number of visual spaces per tab
vim.opt.softtabstop = 4    -- Number of spaces for tab character when editing
vim.opt.shiftwidth = 4     -- Number of spaces to use for autoindent
vim.opt.expandtab = true   -- Use spaces instead of tabs
vim.opt.autoindent = true  -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Insert indents automatically in certain cases

-- Appearance and UI
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show relative line numbers (hybrid mode)
vim.opt.cursorline = true -- Highlight the current line
vim.opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
vim.opt.signcolumn = "yes" -- Always show the sign column, otherwise it would shift the text
vim.opt.scrolloff = 8 -- Keep 8 lines of context above/below the cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns of context left/right of the cursor
vim.opt.showmode = false -- Don't show mode in command line (we'll use a statusline for this)
vim.opt.splitright = true -- When splitting vertically, new window goes to the right
vim.opt.splitbelow = true -- When splitting horizontally, new window goes below
vim.opt.wrap = false -- Do not wrap lines by default
vim.opt.linebreak = true -- Wrap long lines at characters in 'breakat'
vim.opt.showbreak = "↪ " -- Character to show before wrapped lines
vim.opt.list = true -- Show invisible characters (tabs, EOL, etc.)
vim.opt.listchars = {
  tab = '▸ ', -- Character for tab
  trail = '·', -- Character for trailing whitespace
  nbsp = '␣', -- Character for non-breaking space
  extends = '⟩', -- Character for lines extending past the screen
  precedes = '⟨', -- Character for lines preceding the screen
  --eol = '¬', -- Character for end of line (use ' ' if too noisy)
}
vim.opt.fillchars = { eob = " " } -- Remove the `~` from end of buffer


-- Searching
vim.opt.hlsearch = true   -- Highlight all matches on search
vim.opt.incsearch = true  -- Show incremental search results
vim.opt.ignorecase = true -- Ignore case in search patterns
vim.opt.smartcase = true  -- Override 'ignorecase' if search pattern contains uppercase letters

-- Performance and Behavior
vim.opt.hidden = true       -- Allow buffers to be hidden without saving
vim.opt.backup = false      -- No backup files
vim.opt.writebackup = false -- No backup files during write
vim.opt.swapfile = false    -- No swap files (can be useful for recovery, but many prefer it off)
vim.opt.undofile = true     -- Enable persistent undo
--
-- To set the undo directory (optional, create the directory first):
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.updatetime = 300                 -- Faster completion (default is 4000ms)
vim.opt.timeoutlen = 500                 -- Time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.completeopt = "menuone,noselect" -- Autocompletion options

-- Mouse
vim.opt.mouse = "a" -- Enable mouse support in all modes

--[[---------------------------------------------------------------------------
--  Key Mappings (Examples)
---------------------------------------------------------------------------]] --
-- For more information on mappings, see: :help map
-- Modes:
--   n - Normal mode
--   i - Insert mode
--   v - Visual mode
--   x - Visual block mode
--   c - Command-line mode
--   o - Operator pending mode
--   t - Terminal mode

vim.g.python3_host_prog = 'C:/Python312/python.exe'

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Normal Mode Mappings
-- Navigate between windows
map("n", "<C-h>", "<C-w>h", opts) -- Move to left window
map("n", "<C-j>", "<C-w>j", opts) -- Move to bottom window
map("n", "<C-k>", "<C-w>k", opts) -- Move to top window
map("n", "<C-l>", "<C-w>l", opts) -- Move to right window

-- Resize windows
map("n", "<Leader>+", ":resize +5<CR>", opts)          -- Increase window height
map("n", "<Leader>-", ":resize -5<CR>", opts)          -- Decrease window height
map("n", "<Leader>>", ":vertical resize +5<CR>", opts) -- Increase window width
map("n", "<Leader><", ":vertical resize -5<CR>", opts) -- Decrease window width

-- Buffer navigation
map("n", "<S-l>", ":bnext<CR>", opts)        -- Next buffer
map("n", "<S-h>", ":bprevious<CR>", opts)    -- Previous buffer
map("n", "<Leader>bd", ":bdelete<CR>", opts) -- Close current buffer

-- Clear search highlighting
map("n", "<Leader>sc", ":noh<CR>", opts)

-- Save file
map("n", "<Leader>w", ":w<CR>", opts)
map("n", "<Leader>q", ":q<CR>", opts)
map("n", "<Leader>wq", ":wq<CR>", opts)

-- Insert Mode Mappings
-- Quickly escape insert mode
map("i", "jk", "<ESC>", opts) -- Type 'jk' quickly to escape insert mode
map("i", "kj", "<ESC>", opts) -- Type 'kj' quickly to escape insert mode

-- Visual Mode Mappings
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

-- Move selected lines up/down
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Telescope Key Mappings
-- These require the Telescope plugin to be installed and the leader key to be set.
-- Using functions for cleaner integration with Lua modules.
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end, opts_noremap_silent)
map("n", "<leader>fg", function() require("telescope.builtin").live_grep() end, opts_noremap_silent)
map("n", "<leader>fb", function() require("telescope.builtin").buffers() end, opts_noremap_silent)
map("n", "<leader>fh", function() require("telescope.builtin").help_tags() end, opts_noremap_silent)

--adding jai as a valid filetype
vim.filetype.add({
  extension = {
    jai = "jai",  
}})


--[[---------------------------------------------------------------------------
--  Plugin Management (lazy.nvim)
---------------------------------------------------------------------------]] --
--local capabilities = require('cmp_nvim_lsp').default_capabilities() -- If using nvim-cmp later
--local capabilities = vim.lsp.protocol.make_client_capabilities()
 

-- Common on_attach function for LSP servers
local on_attach = function(client, bufnr)
  print("LSP attached to buffer: " .. bufnr .. " Client: " .. client.name)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap = true, silent = true}
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts) -- Changed from <space>sh to avoid conflict
  vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<Leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts) -- Format code

  -- Set autocommands for formatting on save (optional)
  -- if client.supports_method("textDocument/formatting") then
  --   local augroup_format = vim.api.nvim_create_augroup("LspFormatting", {clear = true})
  --   vim.api.nvim_create_autocmd("BufWritePre", {
  --     group = augroup_format,
  --     buffer = bufnr,
  --     callback = function() vim.lsp.buf.format({ bufnr = bufnr }) end
  --   })
  -- end
end

--lazy.nvim setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Installing lazy.nvim...")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require("lazy").setup({
    --snacks
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        ---@type snacks.Config
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            --explorer = { enabled = true },
            indent = { enabled = true },
            --input = { enabled = true },
            --picker = { enabled = true },
            git = {enabled = true},
            lazygit = {enable = true},
            --notifier = { enabled = true },
            scope = {enabled = true},
            quickfile = { enabled = true },
            scope = { enabled = true },
            --scroll = { enabled = true },
            --statuscolumn = { enabled = true },
            words = { enabled = true },
        },
    },
    --lualine status bar
    {
        'nvim-lualine/lualine.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local mode = {
                'mode',
                fmt = function(str)
                    return ' ' .. str
                    -- return ' ' .. str:sub(1, 1) -- displays only the first character of the mode
                end,
            }

            local filename = {
                'filename',
                file_status = true, -- displays file status (readonly status, modified status)
                path = 0, -- 0 = just filename, 1 = relative path, 2 = absolute path
            }

            local hide_in_width = function()
                return vim.fn.winwidth(0) > 100
            end

            local diagnostics = {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                sections = { 'error', 'warn' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                colored = false,
                update_in_insert = false,
                always_visible = false,
                cond = hide_in_width,
            }

            local diff = {
                'diff',
                colored = false,
                symbols = { added = ' ', modified = ' ', removed = ' ' }, -- changes diff symbols
                cond = hide_in_width,
            }

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'nord', -- Set theme based on environment variable
                    -- Some useful glyphs:
                    -- https://www.nerdfonts.com/cheat-sheet
                    --        
                    section_separators = { left = '', right = '' },
                    component_separators = { left = '', right = '' },
                    disabled_filetypes = { 'alpha', 'neo-tree' },
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = { mode },
                    lualine_b = { 'branch' },
                    lualine_c = { filename },
                    lualine_x = { diagnostics, diff, { 'encoding', cond = hide_in_width }, { 'filetype', cond = hide_in_width } },
                    lualine_y = { 'location' },
                    lualine_z = { 'progress' },
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = { { 'location', padding = 0 } },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = { 'fugitive' },
            }
        end,
    },

    --bufferline
    {'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = {
            'nvim-tree/nvim-web-devicons',
            'moll/vim-bbye',
        },
        config = function()
            require('bufferline').setup{
                options = {
                    mode = 'buffers',
                    themeable = true,
                    numbers = 'none',
                }
            }
        end

    },

    --neotree
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        lazy = false, -- neo-tree will lazily load itself
        ---@module "neo-tree"
        ---@type neotree.Config?
        opts = {
            -- fill any relevant options here
        },
    },

  --telescope.nvim for fuzzy finding and file searching
    {'nvim-telescope/telescope.nvim', tag = '0.1.8',
      dependencies = { 'nvim-lua/plenary.nvim' }
    },
    
  -- Mason for managing LSP servers, DAP, linters, formatters
  {
    "mason-org/mason.nvim",
    dependencies = {
    },
    config = function()
      -- Setup mason.nvim (core)
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        },
        registries = {
            "github:mason-org/mason-registry",
            "github:Crashdummyy/mason-registry",
        },
      })

    end,
  },

  -- Roslyn.nvim for C# specific enhancements and LSP setup
  {
    "seblyng/roslyn.nvim",
    ft = { "cs" }, -- Load only for C# files (you had "cs", can add "vb" if needed)
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    config = {
      settings = {
          ["csharp|background_analysis"] = {
              csharp_enable_background_analysis = true,
              csharp_enable_background_analysis_for_open_files = true,
              csharp_enable_background_analysis_for_all_files = true,
              csharp_enable_background_analysis_for_workspace = true,
          },
          ["csharp|diagnostics"] = {
              csharp_enable_diagnostic_logging = true,
              csharp_enable_diagnostic_logging_for_open_files = true,
              csharp_enable_diagnostic_logging_for_all_files = true,
              csharp_enable_diagnostic_logging_for_workspace = true,
          },
          ["csharp|formatting"] = {
              csharp_enable_formatting = true,
              csharp_enable_formatting_for_open_files = true,
              csharp_enable_formatting_for_all_files = true,
              csharp_enable_formatting_for_workspace = true,
          },
          ["csharp|signature_help"] = {
              csharp_enable_signature_help = true,
              csharp_enable_signature_help_for_open_files = true,
              csharp_enable_signature_help_for_all_files = true,
              csharp_enable_signature_help_for_workspace = true,
          },
          ["csharp|completion"] = {
              csharp_enable_completion = true,
              csharp_enable_completion_for_open_files = true,
              csharp_enable_completion_for_all_files = true,
              csharp_enable_completion_for_workspace = true,
          },
          ["csharp|hover"] = {
              csharp_enable_hover = true,
              csharp_enable_hover_for_open_files = true,
              csharp_enable_hover_for_all_files = true,
              csharp_enable_hover_for_workspace = true,
          },
          ["csharp|references"] = {
              csharp_enable_references = true,
              csharp_enable_references_for_open_files = true,
              csharp_enable_references_for_all_files = true,
              csharp_enable_references_for_workspace = true,
          },
          ["csharp|rename"] = {
              csharp_enable_rename = true,
              csharp_enable_rename_for_open_files = true,
              csharp_enable_rename_for_all_files = true,
              csharp_enable_rename_for_workspace = true,
          },
          ["csharp|code_actions"] = {
              csharp_enable_code_actions = true,
              csharp_enable_code_actions_for_open_files = true,
              csharp_enable_code_actions_for_all_files = true,
              csharp_enable_code_actions_for_workspace = true,
          },
          ["csharp|inlay_hints"] = {
              csharp_enable_inlay_hints_for_implicit_object_creation = true,
              csharp_enable_inlay_hints_for_implicit_variable_types = true,
              csharp_enable_inlay_hints_for_lambda_parameter_types = true,
              csharp_enable_inlay_hints_for_types = true,
              dotnet_enable_inlay_hints_for_indexer_parameters = true,
              dotnet_enable_inlay_hints_for_literal_parameters = true,
              dotnet_enable_inlay_hints_for_object_creation_parameters = true,
              dotnet_enable_inlay_hints_for_other_parameters = true,
              dotnet_enable_inlay_hints_for_parameters = true,
              dotnet_suppress_inlay_hints_for_parameters_that_differ_only_by_suffix = true,
              dotnet_suppress_inlay_hints_for_parameters_that_match_argument_name = true,
              dotnet_suppress_inlay_hints_for_parameters_that_match_method_intent = true,
          },
          ["csharp|code_lens"] = {
              dotnet_enable_references_code_lens = true,
          },
      },
  },
  },
-- jails lsp
  {
    "rluba/jai.vim",
    ft = { "jai" }, -- Load only for Jai files
  },
  -- LSP configuration and setup
  {
    "neovim/nvim-lspconfig", -- LSP configuration plugin
    dependencies = {
      -- Optional: for better UI for LSP messages
      { "folke/lazydev.nvim",  opts = {} },            -- Helps with Neovim Lua development (good to have)
      { "folke/trouble.nvim",  cmd = "TroubleToggle" }, -- A pretty list for diagnostics
    },
    config = function()
      
      require("mason").setup({
        registries = {
          "github:mason-org/mason-registry",
          "github:Crashdummyy/mason-registry",
        },
      })

      local lspconfig = require("lspconfig")
      -- Example: Setup for other LSPs (e.g., Lua for Neovim config itself)
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        --capabilities = capabilities,
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false },
          },
        },
      })

      -- Configure diagnostics (icons for errors, warnings, etc.)
      vim.diagnostic.config({
        virtual_text = true, -- Show diagnostics inline
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      --local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
      --for type, icon in pairs(signs) do
       --- local hl = "DiagnosticSign" .. type
        --vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      --end
    end,
    opts = {
      servers = {
        -- Ensure mason installs the server
        clangd = {
          keys = {
            { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
          },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(
              "Makefile",
              "configure.ac",
              "configure.in",
              "config.h.in",
              "meson.build",
              "meson_options.txt",
              "build.ninja"
            )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
              fname
            ) or require("lspconfig.util").find_git_ancestor(fname)
          end,
          capabilities = {
            offsetEncoding = { "utf-16" },
          },
          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--header-insertion=iwyu",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--fallback-style=llvm",
          },
          init_options = {
            usePlaceholders = true,
            completeUnimported = true,
            clangdFileStatus = true,
          },
        },
      },
      setup = {
        clangd = function(_, opts)
          local clangd_ext_opts = LazyVim.opts("clangd_extensions.nvim")
          require("clangd_extensions").setup(vim.tbl_deep_extend("force", clangd_ext_opts or {}, { server = opts }))
          return false
        end,
      },
    },
  },

  --treesitter for syntax highlighting and more
  {
    "nvim-treesitter/nvim-treesitter", -- For syntax highlighting and more
    build = ":TSUpdate",               -- Installs/updates parsers
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "c_sharp", "lua", "vim", "vimdoc" }, -- Add "c_sharp"
        sync_install = false,                                     -- install parsers synchronously (blocks UI)
        auto_install = true,                                      -- automatically install missing parsers when entering buffer
        highlight = {
          enable = true,                                          -- false will disable the whole extension
          -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
          -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
          -- Using this option may slow down your editor, and you may see some duplicate highlights.
          -- Instead of true it can also be a list of languages
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        -- Other modules: context_commentstring, incremental_selection, etc.
      })
      print("nvim-treesitter configured with C# parser.")
    end,
  },

  -- Optional: A nice theme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme "catppuccin-macchiato" -- Or latte, frappe, mocha
    end
  },

  -- Optional: For autocompletion (nvim-cmp) - highly recommended
  {
      'hrsh7th/nvim-cmp',
      dependencies = {
          'hrsh7th/cmp-nvim-lsp',
          'hrsh7th/cmp-buffer',
          'hrsh7th/cmp-path',
          'hrsh7th/cmp-cmdline',
          'L3MON4D3/LuaSnip', -- Snippet engine
          'saadparwaiz1/cmp_luasnip', -- Snippet source for nvim-cmp
      },
      config = function()
          local cmp = require('cmp')
          local luasnip = require('luasnip')
          cmp.setup({
              snippet = {
                  expand = function(args)
                      luasnip.lsp_expand(args.body)
                  end,
              },
              mapping = cmp.mapping.preset.insert({
                  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                  ['<C-f>'] = cmp.mapping.scroll_docs(4),
                  ['<C-Space>'] = cmp.mapping.complete(),
                  ['<C-e>'] = cmp.mapping.abort(),
                  ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
                  ["<Tab>"] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                          cmp.select_next_item()
                      elseif luasnip.expand_or_jumpable() then
                          luasnip.expand_or_jump()
                      else
                          fallback()
                      end
                  end, { "i", "s" }),
                  ["<S-Tab>"] = cmp.mapping(function(fallback)
                      if cmp.visible() then
                          cmp.select_prev_item()
                      elseif luasnip.jumpable(-1) then
                          luasnip.jump(-1)
                      else
                          fallback()
                      end
                  end, { "i", "s" }),
              }),
              sources = cmp.config.sources({
                  { name = 'nvim_lsp' },
                  { name = 'luasnip' },
              }, {
                      { name = 'buffer' },
                      { name = 'path' },
                  })
          })
          --     -- If you're using nvim-cmp, you'll need this for LSP capabilities
          --     -- local capabilities = require('cmp_nvim_lsp').default_capabilities()
          --     -- And pass `capabilities` to lspconfig setups
      end
  },
  {
    "folke/trouble.nvim",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
    keys = {
      {
        "<leader>xx",
        "<cmd>Trouble diagnostics toggle<cr>",
        desc = "Diagnostics (Trouble)",
      },
      {
        "<leader>xX",
        "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
        desc = "Buffer Diagnostics (Trouble)",
      },
      {
        "<leader>cs",
        "<cmd>Trouble symbols toggle focus=false<cr>",
        desc = "Symbols (Trouble)",
      },
      {
        "<leader>cl",
        "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
        desc = "LSP Definitions / references / ... (Trouble)",
      },
      {
        "<leader>xL",
        "<cmd>Trouble loclist toggle<cr>",
        desc = "Location List (Trouble)",
      },
      {
        "<leader>xQ",
        "<cmd>Trouble qflist toggle<cr>",
        desc = "Quickfix List (Trouble)",
      },
    },
  }
    -- Add other plugins here as you discover them
  -- e.g., telescope.nvim for fuzzy finding, gitsigns.nvim for git integration

}, {
  -- lazy.nvim options
  ui = {
    border = "rounded", -- or "single", "double", "none"
  },
})

vim.lsp.config.jedi_language_server = {
	on_attach = on_attach,
	settings = {
		jedi = {
			completion = {
				disableSnippets = true
			}
		}
	}
}

vim.lsp.config.roslyn = {
  on_attach = on_attach,
  --capabilities = capabilities,
  settings = {
    roslyn = {
      enable_formatting = true,
      enable_rename_on_type = true,
      enable_signature_help = true,
      enable_code_actions = true,
      enable_completion = true,
    },
  },
}

vim.lsp.config.clangd = {
  on_attach = on_attach,
  --capabilities = capabilities,
  settings = {
    clangd = {
      enable_formatting = true,
      enable_rename_on_type = true,
      enable_signature_help = true,
      enable_code_actions = true,
      enable_completion = true,
    },
  },
}

vim.lsp.config.jails = {
  cmd = { "jails.exe" },
  filetypes = { "jai" },
  root_dir = vim.fn.getcwd(),
  on_attach = on_attach,
  
  --capabilities = capabilities,
  settings = {
    jails = {
      enable_formatting = true,
      enable_rename_on_type = true,
      enable_signature_help = true,
      enable_code_actions = true,
      enable_completion = true,
    },
  },
}

vim.lsp.enable({'jedi_language_server'})
vim.lsp.enable({'roslyn'})
vim.lsp.enable({'clangd'})
vim.lsp.enable({'jails'})

--[[---------------------------------------------------------------------------
--  Autocommands (Examples)
---------------------------------------------------------------------------]] --
-- Autocommands perform actions automatically on certain events.
-- See :help autocmd

-- Example: Highlight yanked text briefly
local augroup_yank = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  group = augroup_yank,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})


--[[---------------------------------------------------------------------------
--  End of basic configuration
---------------------------------------------------------------------------]] --
print("Basic Neovim configuration (init.lua) applied.")
-- You can add more sections for LSP, completion, themes, specific plugins, etc.
--require('lua.user.keymaps')
