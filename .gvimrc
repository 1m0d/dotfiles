color Tomorrow-Night
set guifont=Source\ Code\ Pro\ for\ Powerline\ Regular\ 10
set guioptions-=T " Removes top toolbar
set guioptions-=r " Removes right hand scroll bar
set guioptions-=m " Removes menu
set go-=L " Removes left hand scroll bar
autocmd User Rails let b:surround_{char2nr('-')} = "<% \r %>" " displays <% %> correctly
:set cpoptions+=$ " puts a $ marker for the end of words/lines in cw/c$ commands
set clipboard=unnamed

let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsListSnippets="<c-s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
