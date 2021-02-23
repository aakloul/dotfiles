let using_neovim = has('nvim')
let using_vim = !using_neovim

source $HOME/.config/nvim/general/plugins.vim
source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/general/functions.vim
source $HOME/.config/nvim/general/mappings.vim

" Themes
if using_neovim
    " source $HOME/.config/nvim/themes/syntax.vim
    source $HOME/.config/nvim/themes/nvcode.vim
    luafile $HOME/.config/nvim/lua/nvcodeline.lua
else
    colorscheme gruvbox
endif

let g:python3_host_prog = '~/.pyenv/versions/3.9.1/envs/neovim3/bin/python3.9'
let g:python_host_prog =  '~/.pyenv/versions/2.7.18/envs/neovim2/bin/python2.7'

" Plugin Configuration
if using_neovim
    source $HOME/.config/nvim/plug-config/fzf.vim
    "source $HOME/.config/nvim/plug-config/telescope.vim
    source $HOME/.config/nvim/plug-config/barbar.vim
    luafile $HOME/.config/nvim/lua/treesitter.lua
    luafile $HOME/.config/nvim/lua/plug-colorizer.lua
else
    source $HOME/.config/nvim/plug-config/fzf.vim
endif

" Common Plugins Configuration
source $HOME/.config/nvim/plug-config/closetags.vim
source $HOME/.config/nvim/plug-config/easymotion.vim
source $HOME/.config/nvim/plug-config/floaterm.vim
source $HOME/.config/nvim/plug-config/goyo.vim
source $HOME/.config/nvim/plug-config/quickscope.vim
source $HOME/.config/nvim/plug-config/rnvimr.vim
source $HOME/.config/nvim/plug-config/start-screen.vim
source $HOME/.config/nvim/plug-config/vim-commentary.vim
source $HOME/.config/nvim/plug-config/vim-rooter.vim
source $HOME/.config/nvim/plug-config/which-key.vim

" TODO test with vim
    " source $HOME/.config/nvim/plug-config/codi.vim
    " source $HOME/.config/nvim/plug-config/coc/coc.vim
    " source $HOME/.config/nvim/plug-config/coc/coc-extensions.vim
    " source $HOME/.config/nvim/plug-config/gitgutter.vim
    " source $HOME/.config/nvim/plug-config/git-messenger.vim
    " source $HOME/.config/nvim/plug-config/far.vim
    " source $HOME/.config/nvim/plug-config/tagalong.vim
    " source $HOME/.config/nvim/plug-config/bracey.vim
    " source $HOME/.config/nvim/plug-config/asynctask.vim
    " source $HOME/.config/nvim/plug-config/window-swap.vim
    " source $HOME/.config/nvim/plug-config/markdown-preview.vim
    " source $HOME/.config/nvim/plug-config/vimspector.vim
    " source $HOME/.config/nvim/plug-config/vim-wiki.vim
" end TODO test with vim

" NOT USED
" source $HOME/.config/nvim/plug-config/better-whitespace.vim
" source $HOME/.config/nvim/plug-config/sneak.vim
" source $HOME/.config/nvim/plug-config/rainbow.vim
" source $HOME/.config/nvim/plug-config/illuminate.vim
" source $HOME/.config/nvim/plug-config/vista.vim
" source $HOME/.config/nvim/plug-config/xtabline.vim
" source $HOME/.config/nvim/plug-config/ale.vim


" vim-radical (NOT WORKING)
" nnoremap gA <Plug>RadicalView
" xnoremap gA <Plug>RadicalView


