color Tomorrow-Night-1mod

autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly

:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands

let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" map <F8> :w <CR> :!gcc % -o %< && ./%< <CR>

autocmd filetype cpp map <C-c> :!g++ -std=c++11 % -Wall -g -o %.out && ./%.out<CR>
autocmd filetype c map <C-c> :!gcc -std=c99 -o %< && ./%<<CR>

" YCM
let g:ycm_min_num_of_chars_for_completion = 1
let g:ycm_complete_in_comments = 1

" key bindings for UltiSnipsExpandTrigger have to be set inside
" /home/domi/.janus/ultisnips/autoload/UltiSnips

let g:NERDSpaceDelims=1

let g:airline_theme='yowish'

imap <C-v> <ESC>"+p"

set relativenumber" air-line

let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" user keybinds
nnoremap <leader>ig :IndentGuidesToggle<CR>
nnoremap <leader>ct :ColorToggle<CR>
nnoremap <leader>w :FixWhitespace<CR>

" ctrl p show hidden files
let g:ctrlp_show_hidden = 1

" sudo save file
cmap w!! w !sudo tee > /dev/null %

" be able to scroll with mouse in urxvt vim
set mouse=a

" open new line without insert
nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
