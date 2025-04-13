" ---------Plugins--------

call plug#begin('~/.config/nvim/plugged')

Plug 'bronson/vim-trailing-whitespace'
Plug 'rakr/vim-one'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rbenv'
Plug 'tpope/vim-bundler'
Plug 'vim-ruby/vim-ruby'
Plug 'vim-airline/vim-airline'
" Plug 'easymotion/vim-easymotion'
Plug 'chrisbra/Colorizer'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'jeetsukumaran/vim-buffergator'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'majutsushi/tagbar'
Plug 'chriskempson/base16-vim'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'folke/which-key.nvim'
Plug 'phaazon/hop.nvim'
" Plug 'wellle/context.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'sindrets/diffview.nvim'
Plug 'lervag/vimtex'
Plug 'nvim-lua/plenary.nvim'
Plug 'vim-test/vim-test'
" Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }
" TODO: add neotest
Plug 'mfussenegger/nvim-dap'
Plug 'tmhedberg/SimpylFold'
Plug 'dccsillag/magma-nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'nvim-lua/plenary.nvim'
Plug 'TimUntersberger/neogit'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'nvim-telescope/telescope.nvim' ", { 'tag': '0.1.0' }
Plug 'folke/lsp-colors.nvim'
Plug 'folke/trouble.nvim'
Plug 'hkupty/iron.nvim'
Plug 'ggandor/leap.nvim'
Plug 'lukas-reineke/indent-blankline.nvim', { 'tag': 'v2.20.8' }
Plug 'github/copilot.vim'
Plug 'chipsenkbeil/distant.nvim', { 'branch': 'v0.3' }

" avante nvim and dependencies

" Deps
Plug 'stevearc/dressing.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'MeanderingProgrammer/render-markdown.nvim'

Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

" Optional deps
Plug 'nvim-tree/nvim-web-devicons'
Plug 'echasnovski/mini.icons'
" Plug 'HakonHarnes/img-clip.nvim'
" Plug 'zbirenbaum/copilot.lua'
" Plug 'MeanderingProgrammer/render-markdown.nvim'

" Yay, pass source=true if you want to build from source
" Plug 'yetone/avante.nvim', { 'branch': 'main', 'do': 'make' }

call plug#end()

" ------End of Plugins-----

"  -----CoC Extensions-----
let g:coc_global_extensions = [
  \'coc-json',
  \'coc-tsserver',
  \'coc-snippets',
  \'coc-solargraph',
  \'coc-html',
  \'coc-css',
  \'coc-omnisharp',
  \'coc-pyright',
  \'coc-texlab',
  \'coc-dictionary',
  \'coc-tag',
  \'coc-sqlfluff',
  \]
  " \'coc-tabnine',
  " \'coc-spell-checker'
  " \'coc-python',
  " \'coc-diagnostic'
  " \'coc-jedi',
call coc#config('disabledExtensions', ['coc-tabnine'])
" ----------END-----------

"---------Settings---------

" neovim is always nocompatible
" if has('vim_starting') !has('nvim') && &compatible
"  set nocompatible
" endif
"

let g:python3_host_prog = "$HOME/.pyenv/versions/3.9.7/envs/neovim/bin/python"

" set leader to Space
let g:mapleader = "\<Space>"
let maplocalleader = "\<Space>"

set number relativenumber         " hybrid line numbers
set ruler                         " Show line and column number
syntax enable                     " syntax highlighting

set mouse=a                       " scroll with mouse
set guicursor+=a:blinkon500       " turn on cursor blinking
set cursorline

set hidden                        " Buffer will be hidden if trying to open new file whilst changes aren't saved

set textwidth=0                   " do not insert newline after certain number of characters
set wrap                          " wrap long text
set linebreak                     " do not cut words in half when wrapping

set tabstop=2                     " 2 spaces of tab when insert
set shiftwidth=2                  " 2 spaces of tab when auto-insert
set expandtab                     " insert spaces not tab

set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots

set autoread                      " auto-reload file on change


"" Searching
""
set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

set backspace=indent,eol,start " backspace through everything in insert mode

set updatetime=300

"" make @ keyword for scss
autocmd FileType scss setl iskeyword+=@-@

filetype plugin on " load the plugin files for specific file types

set foldmethod=syntax
set foldlevelstart=20

set timeoutlen=300

" disable latex symbols
let g:tex_conceal = ""
" let g:markdown_syntax_conceal=0
" let g:vim_json_conceal=0
" set conceallevel=0
" this also disables indentline
" let g:indentLine_conceallevel = 0

" ------End of Setings-----

"-----Plugin Settings------
"
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'
let g:airline_powerline_fonts = 1

"" make FZF respect gitignore if `ag` is installed
if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git --ignore docs -g ""'
endif

" gnvim breaks with popup window
" let g:fzf_layout = { 'down': '40%' }

" let g:python3_host_prog = '/home/domi/.pyenv/versions/3.8.0/bin/python'

" do not hide special characters in json and markdown
let g:vim_json_syntax_conceal = 0
let g:vim_markdown_conceal = 0
let g:vim_markdown_conceal_code_blocks = 0

let g:fzf_tags_command = 'ctags -R'

let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0

" fixes nerdtree syntax highlight lag
let g:NERDTreeHighlightCursorline = 0
let g:NERDTreeLimitedSyntax = 1

" nerdtree left side
let g:NERDTreeWinPos = "left"

" let test#python#pytest#options = "--color=yes"
let g:ultest_use_pty = 1

let g:magma_image_provider = "ueberzug"

imap <silent><script><expr> <C-K> copilot#Accept("\<CR>")
let g:copilot_no_tab_map = v:true

" ------End of Setings-----


" -----Keybinds-------
"
" open new line without insert
nmap <S-CR> O<Esc>j
nmap <CR> o<Esc>k

" sudo save file
cmap w!! w !sudo tee > /dev/null %

function NerdTreeSmartOpen()
  if exists("g:NERDTree") && g:NERDTree.IsOpen()
    :NERDTreeToggle
  else
    :NERDTreeFind
  endif
endfunction

" map <silent> <Leader>n :NERDTreeToggle<CR>
" open nerdtree with viewing current buffer
nnoremap <silent> <Leader>n :call NerdTreeSmartOpen()<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-x> :Commands<CR>
nnoremap <silent> <ESC> :noh<CR>

tnoremap <Esc><Esc> <C-\><C-n>

nmap <Leader>p 0D"0pkdd

vnoremap <C-Y> "+y

" vim.keymap.set('<Leader>n', '-', '<Plug>(leap-forward)', {})
" vim.keymap.set('n', '_', '<Plug>(leap-backward)', {})
" ----End of Keybinds-----

" -------Commands-------
command! NvimrcEdit :tabnew ~/.config/nvim/init.lua
command! NvimrcReload :source ~/.config/nvim/init.lua
" ---------End----------

" ---Appearance---

set termguicolors
set background=dark " for the dark version
" set background=light " for the light version
let g:one_allow_italics = 1 "italics for comments
colorscheme one
let g:airline_theme='one'
set guifont=Fira\ Code\ Retina:h9

let comment_color='8e8e8e'
call one#highlight('Comment', comment_color, '', 'italic')
call one#highlight('vimLineComment', comment_color, '', 'italic')
call one#highlight('Todo', 'FFFFFF', '', 'bold')
call one#highlight('vimCommentTitle', 'FFFFFF', '', 'bold') " capital plus + at the start of comment

" call one#highlight('Normal', 'D3D5D3,', '1D1E1F', '')

highlight CocInlayHint gui=italic guifg=LightBlue guibg=NONE
" --------COC settings--------------
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
" if has("patch-8.1.1564")
  " " Recently vim can merge signcolumn and number column into one
  " set signcolumn=number
" else
  " set signcolumn=yes
" endif

set signcolumn=auto

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

imap <C-l> <Plug>(coc-snippets-expand)


" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
" if exists('*complete_info')
  " inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
" else
  " inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
" xmap <leader>fb  <Plug>(coc-format-selected)
" nmap <leader>fb  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
" nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" " Manage extensions.
" nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" " Show commands.
" nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" " Find symbol of current document.
" nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" " Search workspace symbols.
" nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" " Do default action for next item.
" nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" " Do default action for previous item.
" nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" " Resume latest coc list.
" nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
"
autocmd FileType python let b:coc_root_patterns = ['.git', '.env', 'venv', '.venv', 'setup.cfg', 'setup.py', 'pyproject.toml', 'pyrightconfig.json']


function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

function! Executables()
  call fzf#run(fzf#wrap({'source': "find . -type f -executable -not -path '*/\.*'", 'sink': 'vs|term bash'}))
endfunction

function! FormatParanthesis()
  execute "normal ^f(a\<CR>"

  let @q='f,a'."\<CR>"."\<ESC>".'@q'
  normal @q

  execute "normal f)i\<CR>"
endfunction

command! Executables call Executables()
command! FormatParanthesis call FormatParanthesis()
