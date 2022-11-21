let g:vimspector_enable_mappings = 'HUMAN'

""""""""""""""""""""""""""""""""""""
" Plugins
call plug#begin()

"lsp
Plug 'neovim/nvim-lspconfig'

" OmniSharp
Plug 'OmniSharp/omnisharp-vim'

" deoplete
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim' Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
Plug 'zchee/deoplete-clang'

Plug 'ncm2/float-preview.nvim'

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'vim-ctrlspace/vim-ctrlspace'
Plug 'ctrlpvim/ctrlp.vim'
"Plug 'liuchengxu/vim-clap', { 'do': { -> clap#installer#force_download() } }
Plug 'liuchengxu/vim-clap'
Plug 'dense-analysis/ale'
Plug 'SirVer/ultisnips'
Plug 'boss14420/vim-snippets'
Plug 'ervandew/supertab'

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

" colorscheme
Plug 'overcache/NeoSolarized'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'sainnhe/sonokai'
Plug 'catppuccin/nvim', { 'as': 'catppuccin' }
Plug 'navarasu/onedark.nvim'
Plug 'ayu-theme/ayu-vim'

Plug 'Yggdroot/indentLine'

call plug#end()

set completeopt-=preview
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" preview
let g:float_preview#docked = 0


""""""""""""""""""""""""""""""""""""
" Basic config
set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent
set wrap
set cc=80
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

let g:ale_linters = {
\ 'cs': ['OmniSharp'],
\ 'cpp': ['clang']
\}

" white space
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()

" Omnisharp
let g:OmniSharp_server_use_net6 = 1
let g:OmniSharp_highlighting = 0
let g:OmniSharp_log_dir = '/tmp/omnisharp-vim'
let g:OmniSharp_loglevel = 'debug'
autocmd FileType cs     nnoremap <silent> K :OmniSharpDocumentation<CR>
autocmd FileType cs     nnoremap <F12> :OmniSharpGotoDefinition<CR>
autocmd FileType cs     nnoremap <C-LeftMouse> :OmniSharpGotoDefinition<CR>

autocmd FileType cs     nnoremap <buffer> gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs     nnoremap <buffer> gv :OmniSharpGotoDefinition vsplit<CR>
autocmd FileType cs     nnoremap <buffer> gs :OmniSharpGotoDefinition split<CR>

nnoremap <buffer> gr :PRg<CR>
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

" Vista
"nnoremap <silent> <F5> :Vista!!<CR>

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

" clang
let g:deoplete#sources#clang#libclang_path = '/usr/lib/libclang.so'
let g:deoplete#sources#clang#clang_header= '/usr/lib/clang'

" treesitter
lua << EOF
    require('packer').startup(function(use)
        use {
            'Joakker/lua-json5',
            run = './install.sh'
        }
    end)

    -- lsp --
    require'lspconfig'.clangd.setup{}

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
    }

    require'nvim-treesitter.configs'.setup {
        incremental_selection = {
            enable = true,
            keymaps = {
                init_selection = "gnn",
                node_incremental = "grn",
                scope_incremental = "grc",
                node_decremental = "grm",
            },
        },
    }

    -- dap --
    local dap = require('dap')
    dap.adapters.coreclr = {
        type = 'executable',
        command = '/usr/bin/netcoredbg',
        args = {'--interpreter=vscode'}
    }

    dap.adapters.cppdbg = {
        id = 'cppdbg',
        type = 'executable',
        --command = '~/.tools/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
        command = vim.fn.expand('$HOME/.tools/cpptools/extension/debugAdapters/bin/OpenDebugAD7'),
    }

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
