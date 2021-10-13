set clipboard+=unnamedplus
syntax on
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4


set noexpandtab
set smartindent
set hlsearch
set spell
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set exrc
set secure
set t_Co=256

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.nvim/plugged')
Plug 'ap/vim-css-color'
Plug 'morhetz/gruvbox'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'alexanderjeurissen/lumiere.vim'
call plug#end()
autocmd InsertEnter + norm zz
autocmd BufWritePre * %s/\s\+$//e
augroup project
	autocmd!
	autocmd BufRead,BufNewFile *.h,*.c set filetype=c.doxygen
augroup END
autocmd VimLeave *.tex !texclear %
autocmd VimLeave * silent! !exit-notification %
autocmd BufWritePost * silent! !notification %
autocmd BufWritePost *.tex silent! !compiler %
autocmd BufWritePost *.ms silent! !compiler %
map <F12> :w <CR> :!gcc % -o %< && ./%< <CR>
map <F2> :!opener %:p <CR><CR>
