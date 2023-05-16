let using_neovim = has('nvim')
let using_vim = !using_neovim

" auto-install vim-plug
if using_neovim
  if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif


" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
if using_neovim
call plug#begin('~/.config/nvim/autoload/plugged')
    " TODO replace FZF by telescope for neovim
    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/remote', 'do': ':UpdateRemotePlugins' } " FZF
    " Plug 'nvim-lua/popup.nvim'
    " Plug 'nvim-lua/plenary.nvim'
    " Plug 'nvim-telescope/telescope.nvim'
    Plug 'christianchiarulli/nvcode-color-schemes.vim'          " Themes
    Plug 'glepnir/galaxyline.nvim'              " Status Line
    Plug 'kyazdani42/nvim-web-devicons'         " Cool Icons
    Plug 'romgrk/barbar.nvim'                   " Better tabline
    Plug 'norcalli/nvim-colorizer.lua'          " Colorizer
    Plug 'nvim-treesitter/nvim-treesitter'                              " Treesitter
    " Plug 'nvim-treesitter/nvim-treesitter', { 'commit': '3c07232'}    " Treesitter
    " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}        " Treesitter
    " Plug 'nvim-treesitter/playground'                                  " Treesitter
    " Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }  " Neovim in Browser
else
call plug#begin("~/.vim/plugged")
    Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc'}        " FZF
    Plug 'gruvbox-community/gruvbox'                                    " Theme
    Plug 'vim-airline/vim-airline'                                      " Airline
    Plug 'vim-airline/vim-airline-themes'                               " Airline
    " TODO find a VIM alternative to ''romgrk/barbar'                   " Better tabline
    " TODO find a VIM alternative to 'nvim-treesitter/nvim-treesitter'  " Treesitter
    " TODO find alternative to Plug 'norcalli/nvim-colorizer.lua'       " Colorizer
    " TODO find a VIM alternative to 'glacambre/firenvim', { 'do': { _ -> firenvim#install(1) } }    " Neovim in Browser
endif

    Plug 'mhinz/vim-startify'               " Start Screen
    Plug 'liuchengxu/vim-which-key'         " Which-key
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }    " FZF
    Plug 'junegunn/fzf.vim'                                " FZF

    Plug 'ryanoasis/vim-devicons'           " Cool Icons
    Plug 'tpope/vim-commentary'             " Better Comments
    Plug 'tpope/vim-speeddating'            " Change dates fast
    Plug 'glts/vim-magnum'                  " Convert binary, hex, etc..
    Plug 'glts/vim-radical'                 " Not working
    Plug 'tpope/vim-repeat'                 " Repeat stuff
    Plug 'unblevable/quick-scope'           " Text Navigation
    " Plug 'suy/vim-context-commentstring'   " Useful for React Commenting
    Plug 'RRethy/vim-illuminate'            " highlight all matches under cursor

"  if exists('g:vscode')
"    " Plug 'asvetliakov/vim-easymotion'    " Easy motion for VSCode
"    Plug 'ChristianChiarulli/vscode-easymotion'
"    Plug 'machakann/vim-highlightedyank'
"  else
"
    Plug 'easymotion/vim-easymotion'    " Easymotion
    Plug 'tpope/vim-surround'           " Surround
    Plug 'airblade/vim-rooter'          " Have the file system follow you around
    Plug 'tpope/vim-sleuth'             " auto set indent settings
    Plug 'sheerun/vim-polyglot'         " Better Syntax Support

    Plug 'jiangmiao/auto-pairs'                     " Auto pairs for '(' '[' '{'
    Plug 'alvan/vim-closetag'                       " Closetags
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intellisense
    Plug 'kevinhwang91/rnvimr'                      " Ranger
    " Git TODO
        Plug 'airblade/vim-gitgutter'
        Plug 'tpope/vim-fugitive'
        Plug 'tpope/vim-rhubarb'
        Plug 'junegunn/gv.vim'
        Plug 'rhysd/git-messenger.vim'
    " End Git
    Plug 'voldikss/vim-floaterm'            " Terminal
    Plug 'liuchengxu/vista.vim'             " Vista
    Plug 'junegunn/goyo.vim'                " Zen mode
    Plug 'honza/vim-snippets'           " Snippets
    Plug 'mattn/emmet-vim'              " Snippets
    " Plug 'SirVer/ultisnips'           " Snippets
    " configure TODO
        Plug 'metakirby5/codi.vim'            " Interactive code
        Plug 'mbbill/undotree'                " undo time travel
        Plug 'ChristianChiarulli/far.vim'     " Find and replace
        Plug 'AndrewRadev/tagalong.vim'       " Auto change html tags
        Plug 'turbio/bracey.vim'              " live server
        Plug 'psliwka/vim-smoothie'           " Smooth scroll
        Plug 'skywind3000/asynctasks.vim'     " async tasks
        Plug 'skywind3000/asyncrun.vim'
        Plug 'wesQ3/vim-windowswap'            " Swap windows
        Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }             " Markdown Preview
        Plug 'mattn/vim-gist'                 " Easily Create Gists
        Plug 'mattn/webapi-vim'
        Plug 'moll/vim-bbye'                  " Intuitive buffer closing
        Plug 'puremourning/vimspector'        " Debugging
        Plug 'szw/vim-maximizer'
    " end configure TODO


   """"""""""""""""""""""""" UNUSED """""""""""""""""""""""""""
   " Plug 'luochen1990/rainbow'           " Rainbow brackets
   " Async Linting Engine
   " TODO make sure to add ale config before plugin
   " Plug 'dense-analysis/ale'
   " Plug 'ntpeters/vim-better-whitespace'            " Better Whitespace
   " Multiple Cursors
   " TODO add this back in change from C-n
   " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
   " Plug 'yuezk/vim-js'
   " Plug 'maxmellon/vim-jsx-pretty'
   " Plug 'jelera/vim-javascript-syntax'
   " Plugin Graveyard

   " Debug
   " Plug 'mfussenegger/nvim-dap'
   " Plug 'nvim-dap-virtual-text'
   " Plug 'justinmk/vim-sneak'                          " Sneak (does the same as quick-scope)
   " Plug 'nvim-treesitter/nvim-treesitter-refactor'
   " Plug 'nvim-treesitter/nvim-treesitter-textobjects'
   " Plug 'romgrk/nvim-treesitter-context'
   " Plug 'wfxr/minimap.vim'                            " Minimap
   " jsx syntax support
   " Typescript syntax
   " Plug 'HerringtonDarkholme/yats.vim'
   " Plug 'terryma/vim-multiple-cursors'                " Multiple Cursors
   " Plug 'kaicataldo/material.vim'
   " Plug 'tomasiser/vim-code-dark'
   " Plug 'mg979/vim-xtabline'
   " Plug 'tpope/vim-eunuch'                            " Files
   " Plug 'https://github.com/vimwiki/vimwiki.git'      " Vim Wiki
   " Plug 'jbgutierrez/vim-better-comments'             " Better Comments
   " Plug 'Shougo/echodoc.vim'                          " Echo doc
   " Plug 'hardcoreplayers/spaceline.vim'
   " Plug 'vim-airline/vim-airline'
   " Plug 'vim-airline/vim-airline-themes'
   " Plug 'francoiscabrol/ranger.vim'                   " Ranger
   " Plug 'rbgrouleff/bclose.vim'
   " Making stuff
   " Plug 'neomake/neomake'
   " Plug 'mhinz/vim-signify'
   " Plug 'preservim/nerdcommenter'
   " Plug 'brooth/far.vim'
   " Plug 'atishay/far.vim'
   " Plug 'romgrk/lib.kom'
   " Plug 'brooth/far.vim'
   " Debugging
" endif

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| source $MYVIMRC
  \| endif
