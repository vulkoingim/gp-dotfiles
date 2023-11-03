syntax on
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'morhetz/gruvbox'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-terraform'
Plugin 'juliosueiras/vim-terraform-completion'
Plugin 'dense-analysis/ale'
Plugin 'stephpy/vim-yaml'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'valloric/youcompleteme'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-commentary'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'preservim/nerdtree'
Plugin 'ryanoasis/vim-devicons'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" set rtp+=/opt/homebrew/opt/fzf

if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

set mouse=i
if has("mouse_sgr")
	set ttymouse=sgr
else
	set ttymouse=xterm2
end

set clipboard=

map <ScrollWheelDown> j
map <ScrollWheelUp> k

function! ExecuteCommandOnLines()
    " Prompt the user for a command
    let l:command = input('Enter command: ')

    " Iterate over each line in the buffer
    for l:line in getline(1, '$')
        " Replace '{}' with the line content, escaping it for the shell
        let l:execCommand = substitute(l:command, '{}', shellescape(l:line), 'g')

        " Execute the command as a shell command
        execute '!' . l:execCommand
    endfor
endfunction

" ----- jistr/vim-nerdtree-tabs -----
" Open/close NERDTree Tabs with \t
nmap <silent> <leader>t :NERDTreeToggle<CR>
" To have NERDTree always open on startup
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
" enable vim-devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:WebDevIconsOS = 'Darwin'

" Map the function to Ctrl+X+c
nnoremap <C-X>c :call ExecuteCommandOnLines()<CR>
nnoremap <C-R> :History:<CR>
nnoremap <C-F>w :Windows<CR>
nnoremap <C-F>o :Files<CR>
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']
