language en_US
" Enable folding
set foldmethod=indent
set foldlevel=99
autocmd BufEnter * silent! :lcd%:p:h
" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on

" Turn syntax highlighting on.
syntax on

" Add numbers to each line on the left-hand side.
set number

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Allow the cursor to move past the new line character for insertion
set virtualedit=onemore

" Highlight cursor line underneath the cursor vertically.
"set cursorcolumn

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap
set ttyfast                 " Speed up scrolling in Vim

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

filetype plugin indent on

" show existing tab with 4 spaces width
set tabstop=4

" when indenting with '>', use 4 spaces width
set shiftwidth=4

set noexpandtab
" On pressing tab, insert 4 spaces
"set expandtab
set relativenumber
set autoindent              " indent a new line the same amount as the line just typed
filetype plugin indent on   "allow auto-indenting depending on file type
" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
let g:ale_linters_ignore = {'cpp': ['cpplint']}

"inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"
" Show commits for every source line
"nnoremap <Leader>gb :Gblame<CR>  " git blame

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" PLUGINS ---------------------------------------------------------------- {{{

" Plugin code goes here.
call plug#begin('~/.config/nvim')
	"Plug 'dense-analysis/ale'
	Plug 'preservim/nerdtree'
"	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/nvim-lsp-installer'
	Plug 'OmniSharp/omnisharp-vim'
	"Plug 'prabirshrestha/asyncomplete.vim'	
    "Plug 'airblade/vim-gitgutter'
    "Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'

    "Plug 'tpope/vim-rhubarb'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	"Theme
    Plug 'joshdick/onedark.vim'
	Plug 'rebelot/kanagawa.nvim'

	"changes the root dir but why?
    Plug 'airblade/vim-rooter' 
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'Tetralux/odin.vim'
    
    " For luasnip users.
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

    " For ultisnips users.
    " Plug 'SirVer/ultisnips'
    " Plug 'quangnguyen30192/cmp-nvim-ultisnips'

    " For snippy users.
    " Plug 'dcampos/nvim-snippy'
    " Plug 'dcampos/cmp-snippy'

	" Plug 'm-pilia/vim-ccls'

    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'

    " For vsnip users.
"    Plug 'hrsh7th/cmp-vsnip'
"    Plug 'hrsh7th/vim-vsnip'
	Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }       
	Plug 'rafamadriz/friendly-snippets'
	Plug 'tpope/vim-unimpaired'

	"easy motion
	Plug 'easymotion/vim-easymotion'
	" github copilot
	Plug 'github/copilot.vim'
	
	"Lazygit integration
	Plug 'kdheepak/lazygit.nvim'

	Plug 'lukas-reineke/indent-blankline.nvim'
	"Plug 'nvimdev/dashboard-nvim'
	" vim-plug
	Plug 'rluba/jai.vim'

call plug#end()

" }}}
"COLOR SCHEME\
"set background=dark
colorscheme kanagawa

"lua require('user.options')
"lua print('this also works')
lua require('user.options')
lua require('user.keymaps')
"set makeprg=odin\ build\ main.odin\ -debug\ -o:minimal
"set errorformat=%f(%l:%c)\ %*[^:]:\ %m
"Odin error format TODO(Ray):Figure out how to get this to be Odin only.
"set errorformat=%f(%l:%c)\ %m

au BufRead * try | execute "compiler ".&filetype | catch /./ | endtry
"autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
"LuaSnipSetup
" press <Tab> to expand or jump in a snippet. These can also be mapped separately
"via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>' 
" -1 for jumping backwards.
inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

" For changing choices in choiceNodes (not strictly necessary for a basic setup).
imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

let Hello = luaeval('require("user.keymaps")').OpenWindow

"nn <C-d> :lua require("user.keymaps").OpenWindow()<CR>
nnoremap <silent> <Leader>c :<C-u>call Hello()<CR>
set completeopt=menu,menuone,noselect

" setup mapping to call :LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

lua <<EOF
vim.g.python3_host_prog = 'C:/Python312/python.exe'

vim.filetype.add({
  extension = {
    jai = "jai",  
}})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_snipmate").load() -- Load s./nippets from my-snippets folder
-- If path is not specified, luasnip will look for the `snippets` directory in rtp (for custom-snippet probably
-- `~/.config/nvim/snippets`).

-- You dont need to set any of these options. These are the default ones. Only
    -- the loading is important
    require('telescope').setup {
      extensions = {
        fzf = {
          fuzzy = true,                    -- false will only do exact matching
          override_generic_sorter = true,  -- override the generic sorter
          override_file_sorter = true,     -- override the file sorter
          case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        }
      }
    }
    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')  

    -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
--        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.

        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
--        { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

--Setup odin autocomplete with OLS
local lspconfig = require'lspconfig'
local configs = require'lspconfig.configs'

-- Check if it's already defined for when reloading this file.
if not lspconfig.ols then
	configs.ols = {
		default_config = {
			cmd = {'ols'};
			filetypes = {'odin'};
			root_dir = function(fname)
				return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
			end;
			settings = {};
		};
	}
end

lspconfig.ols.setup{
	root_dir = lspconfig.util.root_pattern("ols.json");
}

--local lspconfig = require'lspconfig'
--local configs = require'lspconfig/configs'
--Setup odin autocomplete with ails for jai
configs.jails = {
	default_config = {
		cmd = { "jails.exe" },
		filetypes = { "jai" },
		--root_dir = lspconfig.util.path.dirname,
		root_dir = function(fname)
			return lspconfig.util.find_git_ancestor(fname) or vim.loop.os_homedir()
		end;
		--root_dir = lspconfig.util.root_pattern("jails.json", ".git"), -- Adjust to find the project root
		-- Optional: Define settings if necessary
		settings = {}, -- You can add specific settings if required by the LSP server
		settings = {
			jails = {
				enabled = { "jai" },
			}
		}
	};
}

lspconfig.jails.setup{
	on_attach = function(client, bufnr)
		if client.server_capabilities.semanticTokensProvider then
			vim.lsp.buf.semantic_tokens_full()
		end
	end,
	root_dir = lspconfig.util.root_pattern("jails.json"), -- Look for jails.json in the root
}

configs.omnisharp = {
	default_config = {
		--cmd = {
			--'C:/ProgramData/chocolatey/bin/OmniSharp.exe', -- <<<--- UPDATE THIS LINE IF YOUR PATH IS DIFFERENT
			--'--languageserver', -- Tells OmniSharp to start in LSP mode
			--'--hostPID', tostring(vim.fn.getpid()) -- Helps OmniSharp manage its process lifecycle
		--},
		cmd = {
			'dotnet',
			'C:/Users/ray.garner/AppData/Local/nvim-data/lsp_servers/omnisharp/omnisharp/OmniSharp.dll',
			'--languageserver',
			'--hostPID', tostring(vim.fn.getpid())
		},
		--cmd = {"C:/Users/ray.garner/AppData/Local/nvim-data/lsp_servers/omnisharp/omnisharp/OmniSharp.exe"},
		--cmd = { "C:/ProgramData/chocolatey/bin/OmniSharp.exe" },
		--cmd = { "OmniSharp" },
		filetypes = { "cs"}, -- Add "vb" if you use VB.NET
		root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"), -- Adjust to find the project root
		--settings = {}, -- You can add specific settings if required by the LSP server
	};
}

lspconfig.omnisharp.setup{
	on_attach = function(client, bufnr)
		if client.server_capabilities.semanticTokensProvider then
			vim.lsp.buf.semantic_tokens_full()
		end
	end,
	root_dir = lspconfig.util.root_pattern("*.sln", "*.csproj", ".git"), -- Look for solution or project files in the root
}

local nvim_lsp = require('lspconfig') -- Note: lspconfig is already required above. nvim_lsp is now an alias for it.

-- Use jedi-language-server only
nvim_lsp.jedi_language_server.setup {
	on_attach = function(client, bufnr)
		-- Your existing on_attach configuration (currently empty, global on_attach will likely be used due to the loop setup below)
	end,
	settings = {
		jedi = {
			completion = {
				disableSnippets = true
			}
		}
	}
}

--require'lspconfig'.clangd.setup{}
--local lspconfig = require('lspconfig')
--lspconfig.clangd.setup({
--  cmd = {'clangd', '--background-index'},
--  init_options = {
--    fallbackFlags = { '-std=c++17' },
--  },
--})

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', { noremap = true, silent = true })
end

-- lspconfig is already required and assigned to 'lspconfig' and 'nvim_lsp'
-- local lspconfig = require('lspconfig') -- This is redundant

--lspconfig.ccls.setup {
--  filetypes = { "h","c", "cpp", "objc", "objcpp" },
--  init_options = {
--    root_dir = lspconfig.util.root_pattern("compile_commands.json", ".git"), -- Ensure proper root detection
--    compilationDatabaseDirectory = "build", -- Adjust based on your project
--    index = {
--      threads = 2; -- Number of threads for indexing
--    },
--    clang = {
--    },
--    log = {
--        verbose = true; -- Enable verbose logging
--    },
--  },
  -- Optional: Customize LSP key mappings
--  on_attach = function(client, bufnr)
--    local bufopts = { noremap=true, silent=true, buffer=bufnr }
--    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts) -- Go to definition
--    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)      -- Hover
--  end,
--}
--require('lspconfig').clangd.setup {
 --   cmd = { "clangd" },
  --  filetypes = { "c", "cpp", "objc", "objcpp" },
  --  root_dir = require('lspconfig').util.root_pattern("compile_commands.json", ".git"),
--}

--require'lspconfig'.lua_ls.setup{} -- Assuming you want default setup for lua_ls. If it's in the loop, this might be redundant.
-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
-- Added 'omnisharp' to this list
local servers = { 'jails','jedi_language_server','tsserver','ols','lua_ls','clangd', 'omnisharp' }
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
    -- If you plan to use nvim-cmp capabilities, you would define 'capabilities'
    -- (like your commented out section at the end) and pass it here:
    -- capabilities = capabilities_variable,
  }
end
--[[
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.jai = {
    install_info = {
        -- path to tree-sitter repository
        url = vim.fn.stdpath("config") .. "/external/tree-sitter-jai/",
        files = { "src/parser.c" },
    },
    filetype = "jai",
    filetype_to_parsername = "jai",
    indent = {
        enable = true
    }
}

require('nvim-treesitter.configs').setup {
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    ensure_installed = {"jai"}, -- Add "jai" here if needed, or leave it empty
}
vim.filetype.add({
    extension = {
        jai = "jai",
    },
})
--]]


    -- Set configuration for specific filetype.
 -- cmp.setup.filetype('gitcommit', {
 --  sources = cmp.config.sources({
 --      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.  
 --    }, {
 --      { name = 'buffer' },
 --    })
 -- })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline('/', {
--    sources = {
--      { name = 'buffer' }
--    }
--  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--  cmp.setup.cmdline(':', {
--    sources = cmp.config.sources({
--      { name = 'path' }
--    }, {
--      { name = 'cmdline' }
--    })
--  })

  -- Setup lspconfig.
--  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  --require('lspconfig')['<YOUR_LSP_SERVER>'].setup {
  --  capabilities = capabilities
  --}
EOF

