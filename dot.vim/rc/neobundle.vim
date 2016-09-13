call neobundle#begin(expand('~/.vim/bundle'))

let g:neobundle#types#git#default_protocol = 'https'

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neocomplcache.vim'
"NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimproc', {
      \ 'build': {
      \   'windows' : 'make -f make_mingw32.mak',
      \   'cygwin' : 'make -f make_cygwin.mak',
      \   'mac' : 'make -f make_mac.mak',
      \   'unix' : 'make -f make_unix.mak',
      \   },
      \ }
NeoBundle 'eagletmt/vim-ruby_namespace'
NeoBundle 'kana/vim-altercmd'
NeoBundle 'kana/vim-smartchr'
NeoBundle 'kana/vim-fakeclip'
NeoBundle 'mattn/gist-vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'thinca/vim-localrc'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'thinca/vim-ref'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-surround'
NeoBundle 'tpope/vim-markdown'
NeoBundle 'tyru/skk.vim'
NeoBundle 'AndrewRadev/linediff.vim'
NeoBundle 'eagletmt/jsonpp-vim'
NeoBundle 'Yggdroot/indentLine'

NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'eagletmt/ghcmod-vim'
NeoBundle 'eagletmt/unite-haddock'
NeoBundle 'eagletmt/tinytest'
NeoBundle 'eagletmt/onlinejudge-vim'
NeoBundle 'vim-scripts/coq-syntax'
NeoBundle 'vim-scripts/Coq-indent'
NeoBundle 'vim-scripts/alex.vim'
NeoBundle 'vim-scripts/happy.vim'
NeoBundle 'rust-lang/rust.vim'

NeoBundleLazy 'derekwyatt/vim-scala', {
      \ 'autoload': { 'filetypes': ['scala'] },
      \ }

NeoBundle 'pangloss/vim-javascript'

NeoBundle 'tangledhelix/vim-octopress'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'timcharper/textile.vim'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'puppetlabs/puppet-syntax-vim'

NeoBundle 'michalbachowski/vim-wombat256mod'

NeoBundle 'Blackrush/vim-gocode'

call neobundle#end()

nnoremap <silent> ,d :<C-u>NeoBundleDocs<CR>
