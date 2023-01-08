let g:vimspector_enable_mappings = 'HUMAN'

""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin()

"lsp
Plug 'neovim/nvim-lspconfig'
Plug 'p00f/clangd_extensions.nvim'

" null-ls
Plug 'nvim-lua/plenary.nvim'
Plug 'jose-elias-alvarez/null-ls.nvim'

" OmniSharp
Plug 'OmniSharp/omnisharp-vim'

"" deoplete
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim' Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"Plug 'zchee/deoplete-clang'

"""""""""""
" nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For vsnip users.
" Plug 'hrsh7th/cmp-vsnip'
" Plug 'hrsh7th/vim-vsnip'

" For luasnip users.
" Plug 'L3MON4D3/LuaSnip'
" Plug 'saadparwaiz1/cmp_luasnip'

" For ultisnips users.
" Plug 'SirVer/ultisnips'
Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" For snippy users.
" Plug 'dcampos/nvim-snippy'
" Plug 'dcampos/cmp-snippy'

""""""""""" nvim-cmp

Plug 'ncm2/float-preview.nvim'

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'liuchengxu/vim-clap'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'boss14420/vim-snippets'
Plug 'ervandew/supertab'
Plug 'windwp/nvim-autopairs'
Plug 'yssl/QFEnter'
Plug 'numToStr/Comment.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" cpp
Plug 'derekwyatt/vim-fswitch'
Plug 'liuchengxu/vista.vim'

" dap
Plug 'mfussenegger/nvim-dap'
Plug 'rcarriga/nvim-dap-ui'
Plug 'theHamsta/nvim-dap-virtual-text'

"Plug 'puremourning/vimspector', {
"  \ 'do': 'python3 install_gadget.py --enable-cpp'
"  \ }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

" colorscheme
Plug 'overcache/NeoSolarized'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/sonokai'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'navarasu/onedark.nvim'
Plug 'ayu-theme/ayu-vim'

Plug 'Yggdroot/indentLine'

" mason
Plug 'williamboman/mason.nvim'
Plug 'jayp0521/mason-nvim-dap.nvim'

call plug#end()

set completeopt-=preview
set completeopt+=menuone
" set completepopup=highlight:Pmenu,border:off
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" preview
let g:float_preview#docked = 0


""""""""""""""""""""""""""""""""""""
" Basic config
set expandtab
set textwidth=79
set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set wrap
set cc=80
"highlight ColorColumn ctermbg='#EE222222' guibg='#EE222222'
filetype indent on

set number
set relativenumber
autocmd FocusLost * :set norelativenumber
autocmd FocusGained * :set relativenumber
autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

" IndentLine {{
"let g:indentLine_char = ''
"let g:indentLine_first_char = ''
let g:indentLine_char = '|'
let g:indentLine_first_char = '|'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

" Enable true color 启用终端24位色
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" colorscheme

lua require("tokyonight").setup({ transparent = true })
colorscheme tokyonight-night

let g:sonokai_diagnostic_text_highlight = 1
let g:sonokai_style = 'default'
let g:sonokai_better_performance = 1
"colorscheme sonokai

let g:onedark_config = {
  \ 'style': 'deep',
  \ 'toggle_style_key': '<leader>ts',
  \ 'ending_tildes': v:true,
  \ 'diagnostics': {
    \ 'darker': v:false,
    \ 'background': v:false,
  \ },
\ }
"colorscheme onedark


"let ayucolor="light"  " for light version of theme
"let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
"colorscheme ayu

"set background=dark

" disable arrow key
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <F2> :NERDTreeToggle<CR><CR>

"" ctrlspace
"set nocompatible
"set hidden
"set encoding=utf-8
"set showtabline=0
"let g:CtrlSpaceDefaultMappingKey = "<C-space> "
"let g:CtrlSpaceLoadLastWorkspaceOnStart = 1
"let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
"let g:CtrlSpaceSaveWorkspaceOnExit = 1

let g:ale_pattern_options_enabled = 1
let g:ale_pattern_options = {
\   '.*': { 'ale_enabled': 0},
\   '\.cs$': { 'ale_enabled': 1}
\}

let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'cpp': ['clang']
\}
let g:ale_cpp_clang_options = '-std=c++2a -Wall -Wextra -Weffc++ -Wsign-conversion -DDEBUG'
let g:ale_cpp_gcc_options = '-std=c++2a -Wall -Wextra -Weffc++ -Wsign-conversion -DDEBUG'
let g:ale_cpp_cc_options = '-std=c++2a -Wall -Wextra -Weffc++ -Wsign-conversion -DDEBUG'

" white space
" highlight ExtraWhitespace ctermbg=red guibg=red
highlight ColorColumn ctermbg=grey guibg=grey

match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

""""""""""""""""""""""""""""""
" Omnisharp
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_highlighting = 0
let g:OmniSharp_log_dir = '/tmp/omnisharp-vim'
let g:OmniSharp_loglevel = 'info'
let g:OmniSharp_popup_options = {
\ 'wrap': v:true,
\ 'winblend': 10,
\ 'winhl': 'Normal:Normal',
\ 'border': 'rounded'
\}

let g:OmniSharp_selector_ui = 'fzf'
let g:OmniSharp_selector_findusages = 'fzf'
autocmd FileType cs     nnoremap <silent> K :OmniSharpDocumentation<CR>
autocmd FileType cs     nnoremap <F12> :OmniSharpGotoDefinition<CR>
autocmd FileType cs     nnoremap <C-LeftMouse> :OmniSharpGotoDefinition<CR>

autocmd FileType cs     nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs     nnoremap <buffer> gv :OmniSharpGotoDefinition vsplit<CR>
autocmd FileType cs     nnoremap <buffer> gs :OmniSharpGotoDefinition split<CR>


augroup omnisharp_commands
    autocmd!

    " Show type information automatically when the cursor stops moving.
    " Note that the type is echoed to the Vim command line, and will overwrite
    " any other messages in this space including e.g. ALE linting messages.
    autocmd CursorHold *.cs OmniSharpTypeLookup

    " The following commands are contextual, based on the cursor position.
    autocmd FileType cs nmap <silent> <buffer> gd <Plug>(omnisharp_go_to_definition)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfu <Plug>(omnisharp_find_usages)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfi <Plug>(omnisharp_find_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ospd <Plug>(omnisharp_preview_definition)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ospi <Plug>(omnisharp_preview_implementations)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ost <Plug>(omnisharp_type_lookup)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osd <Plug>(omnisharp_documentation)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfs <Plug>(omnisharp_find_symbol)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osfx <Plug>(omnisharp_fix_usings)
    autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
    autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

    " Navigate up and down by method/property/field
    autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
    autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
    " Find all code errors/warnings for the current solution and populate the quickfix window
    autocmd FileType cs nmap <silent> <buffer> <Leader>osgcc <Plug>(omnisharp_global_code_check)
    " Contextual code actions (uses fzf, vim-clap, CtrlP or unite.vim selector when available)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
    autocmd FileType cs xmap <silent> <buffer> <Leader>osca <Plug>(omnisharp_code_actions)
    " Repeat the last code action performed (does not use a selector)
    autocmd FileType cs nmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)
    autocmd FileType cs xmap <silent> <buffer> <Leader>os. <Plug>(omnisharp_code_action_repeat)

    autocmd FileType cs nmap <silent> <buffer> <Leader>os= <Plug>(omnisharp_code_format)

    autocmd FileType cs nmap <silent> <buffer> <Leader>osnm <Plug>(omnisharp_rename)

    autocmd FileType cs nmap <silent> <buffer> <Leader>osre <Plug>(omnisharp_restart_server)
    autocmd FileType cs nmap <silent> <buffer> <Leader>osst <Plug>(omnisharp_start_server)
    autocmd FileType cs nmap <silent> <buffer> <Leader>ossp <Plug>(omnisharp_stop_server)
augroup END


"nnoremap <buffer> gr :PRg<CR>
nnoremap <buffer> gp :PRg<CR>

command! -bang -nargs=* PRg
    \ call fzf#vim#grep("rg --column -w --line-number --no-heading --color=always --smart-case ".shellescape(expand('<cword>')), 1, {'dir': system('git -C '.expand('%:p:h').' rev-parse --show-toplevel 2> /dev/null')[:-2]}, <bang>0)

" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

" cppman
function! s:JbzCppMan()
    let old_isk = &iskeyword
    setl iskeyword+=:
    let str = expand("<cword>")
    let &l:iskeyword = old_isk
    execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()

au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

" switch c/h
au BufEnter *.hh  let b:fswitchdst = "c,cpp,cc,m" | let b:fswitchlocs = 'reg:|include.*|src/**|'
au BufEnter *.cc let b:fswitchdst = "h,hh,hpp"

nnoremap <silent> <C-s> :FSHere<cr>

" Extra hotkeys to open header/source in the split
nnoremap <silent> <localleader>oh :FSSplitLeft<cr>
nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
nnoremap <silent> <localleader>ol :FSSplitRight<cr>

" Compile C
let $CXX = 'g++'
let $CXXFLAGS = '-std=c++2a -g -Wall -Wextra -fsanitize=address -fsanitize=undefined -DDEBUG'
"let $LDFLAGS = ''
"let $LDFLIBS = ''

au filetype cpp nmap <C-B> :make %<<cr>
"au filetype cpp nmap <C-R> :./%<

" Vista
nnoremap <silent> <F3> :Vista!!<CR>



"" Vimspector
"command! -nargs=+ Vfb call vimspector#AddFunctionBreakpoint(<f-args>)
"
"nnoremap <localleader>gd :call vimspector#Launch()<cr>
"nnoremap <localleader>gc :call vimspector#Continue()<cr>
"nnoremap <localleader>gs :call vimspector#Stop()<cr>
"nnoremap <localleader>gR :call vimspector#Restart()<cr>
"nnoremap <localleader>gp :call vimspector#Pause()<cr>
"nnoremap <localleader>gb :call vimspector#ToggleBreakpoint()<cr>
"nnoremap <localleader>gB :call vimspector#ToggleConditionalBreakpoint()<cr>
"nnoremap <localleader>gn :call vimspector#StepOver()<cr>
"nnoremap <localleader>gi :call vimspector#StepInto()<cr>
"nnoremap <localleader>go :call vimspector#StepOut()<cr>
"nnoremap <localleader>gr :call vimspector#RunToCursor()<cr>

"" deoplete-clang
"let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
"let g:deoplete#sources#clang#clang_header= '/usr/lib/clang'

" treesitter
lua << EOF
    local ensure_packer = function()
      local fn = vim.fn
      local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
      if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
      end
      return false
    end

    local packer_bootstrap = ensure_packer()

    require('packer').startup(function(use)
      use 'wbthomason/packer.nvim'
      use {
          'Joakker/lua-json5',
          run = './install.sh'
      }

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if packer_bootstrap then
        require('packer').sync()
      end
    end)

    -- disable nvim-comp beacuse it's not support omnisharp-vim
    -- nvim-cmp --
    local cmp = require'cmp'
    cmp.setup({
      -- https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#disabling-completion-in-certain-contexts-such-as-comments
      enabled = function()
        -- disable completion in comments
        local context = require 'cmp.config.context'
        -- keep command mode completion enabled when cursor is in a comment
        if vim.api.nvim_get_mode().mode == 'c' then
          return true
        else
          return not context.in_treesitter_capture("comment") 
            and not context.in_syntax_group("Comment")
        end
      end,
      snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      }),
      sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          -- { name = 'vsnip' }, -- For vsnip users.
          -- { name = 'luasnip' }, -- For luasnip users.
          { name = 'ultisnips' }, -- For ultisnips users.
          -- { name = 'snippy' }, -- For snippy users.
        }, {
          { name = 'buffer' },
      })
    })

    -- Set configuration for specific filetype.
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
      }, {
        { name = 'buffer' },
      })
    })

    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' }
      }, {
        { name = 'cmdline' }
      })
    })

    -- lsp --
    -- Mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    local opts = { noremap=true, silent=true }
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

    -- Use an on_attach function to only map the following keys
    -- after the language server attaches to the current buffer
    local on_attach = function(client, bufnr)
      -- Enable completion triggered by <c-x><c-o>
      vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

      -- Mappings.
      -- See `:help vim.lsp.*` for documentation on any of the below functions
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
      vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
      vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
      vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
      vim.keymap.set('n', '<space>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
      end, bufopts)
      vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
      vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
      vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
      vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
    end

    -- require'lspconfig'.clangd.setup{}
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    require("clangd_extensions").setup({
        server = {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = {
              "clangd",
              "--background-index",
              "-j=4",
              "--query-driver=/usr/bin/**/clang-*,/bin/clang,/bin/clang++,/usr/bin/gcc,/usr/bin/g++",
              "--clang-tidy",
              "--clang-tidy-checks=*",
              "--all-scopes-completion",
              "--cross-file-rename",
              "--completion-style=detailed",
              "--header-insertion-decorators",
              "--header-insertion=iwyu",
              "--pch-storage=memory",
            }
        }
    })

    -- treesitter --

    require'nvim-treesitter.configs'.setup {
        highlight = {
            enable = true,
            -- disable = { "cs" },
            -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
            -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
            -- Using this option may slow down your editor, and you may see some duplicate highlights.
            -- Instead of true it can also be a list of languages
            additional_vim_regex_highlighting = false,
        },
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
        textobjects = {
            enable = true,
            move = {
                enable = true,
                disable = {"c_sharp"},
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = { query = "@class.outer", desc = "Next class start" },
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
            },

            lsp_interop = {
                enable = true,
                border = 'rounded',
                peek_definition_code = {
                    ["<leader>df"] = "@function.outer",
                    ["<leader>dF"] = "@class.outer",
                },
            },
        },
    }

    -- mason
    require("mason").setup()

    -- dap --
    local dap = require('dap')

    require("mason-nvim-dap").setup({
        ensure_installed = {"cppdbg", "codeclr"},
        automatic_setup = true,
    })
    require 'mason-nvim-dap'.setup_handlers()

    -- -- Adpater: configured by mason
    -- dap.adapters.coreclr = {
    --     type = 'executable',
    --     command = '/usr/bin/netcoredbg',
    --     args = {'--interpreter=vscode'}
    -- }

    -- dap.adapters.cppdbg = {
    --     id = 'cppdbg',
    --     type = 'executable',
    --     --command = '~/.tools/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
    --     command = vim.fn.expand('$HOME/.tools/cpptools/extension/debugAdapters/bin/OpenDebugAD7'),
    -- }

    require('dap.ext.vscode').json_decode = require'json5'.parse
    require('dap.ext.vscode').load_launchjs(nil, {coreclr = {'cs'}})

    dap.configurations.cpp = {
        {
                name = "Launch file",
                type = "cppdbg",
                request = "launch",
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
                cwd = '${workspaceFolder}',
                stopAtEntry = true,
                setupCommands = {
                    {
                        text = '-enable-pretty-printing',
                        description =  'enable pretty printing',
                        ignoreFailures = false
                    }
                },
        },
        {
                name = 'Attach to gdbserver :1234',
                type = 'cppdbg',
                request = 'launch',
                MIMode = 'gdb',
                miDebuggerServerAddress = 'localhost:1234',
                miDebuggerPath = '/usr/bin/gdb',
                cwd = '${workspaceFolder}',
                program = function()
                    return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
                end,
        },
    }

    local dapui = require("dapui")
    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
    end

    require("nvim-dap-virtual-text").setup()

    -- auto pair
    require("nvim-autopairs").setup {}

    -- comment.vim
    require('Comment').setup()
EOF

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable                     " Disable folding at startup.

" dap

nnoremap <silent> <F5> <Cmd>lua require'dap'.continue()<CR>
nnoremap <silent> <F10> <Cmd>lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> <Cmd>lua require'dap'.step_into()<CR>
nnoremap <silent> <C-F12> <Cmd>lua require'dap'.step_out()<CR>
nnoremap <silent> <F9> <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <Leader>B <Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <Leader>lp <Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <F6> <Cmd>lua require'dap'.repl.open()<CR>
nnoremap <silent> <F7> <Cmd>lua require'dap'.run_last()<CR>

" UtilSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" Termdebug
autocmd FileType cpp packadd termdebug
let g:termdebug_wide = 1
