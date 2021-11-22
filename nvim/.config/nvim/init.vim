call plug#begin('~/.config/nvim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dadbod'
Plug 'tpope/vim-commentary'
" Plug 'dense-analysis/ale'
" Plug 'pangloss/vim-javascript'    " JavaScript support
" Plug 'leafgarland/typescript-vim' " TypeScript syntax
" Plug 'maxmellon/vim-jsx-pretty'   " JS and JSX syntax
" Plug 'peitalin/vim-jsx-typescript' " TSX syntax
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/vimux'
" Plug 'morhetz/gruvbox'
Plug 'lifepillar/gruvbox8'
Plug 'vim-airline/vim-airline'
Plug 'triglav/vim-visual-increment'
Plug 'nvim-lua/plenary.nvim' " required for telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'branch': '0.5-compat', 'do': ':TSUpdate'}
Plug 'tweekmonster/startuptime.vim'
call plug#end()

set nocompatible "enter the current millenium
syntax enable
filetype plugin indent on
set colorcolumn=80
set hidden
let &listchars = 'tab:> ,trail:-,nbsp:+'
set list
set inccommand=split
set clipboard+=unnamedplus
colorscheme gruvbox8
set path+=**
set wildmenu
let mapleader=" "

command! MakeTags !ctags -R .

" Tweaks for file browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()

let g:airline#extensions#tabline#enabled = 1

" Snippets:
nnoremap ,html :-1read $HOME/.config/nvim/snippets/html.html<CR>9ji

" Key mappings
nnoremap <CR> :noh<CR><CR>
nnoremap <C-p> :Telescope find_files<CR>
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nmap <leader>q <cmd>bdelete<CR>

" reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" allow gf to open non-existing files
map gf :edit <cfile><cr>

" show highlighted line's number and relative lines
set number relativenumber

" Indent with space instead of tab
set expandtab
set shiftwidth=2
set softtabstop=2

" toggle relative number when gaining/loosing focus
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

autocmd BufWritePost */.config/nvim/init.vim :source %
" autocmd BufWritePost */.zshrc :source % " sourcing .zshrc inside vim gives
" errors :(
" reload bspwmrc changes
autocmd BufWritePost */.config/bspwm/bspwmrc !$HOME/.config/bspwm/bspwmrc
" reload polybar changes
autocmd BufWritePost */.config/polybar/config !$HOME/.config/polybar/launch
" reload sxhkd changes
autocmd BufWritePost */.config/sxhkd/sxhkdrc !pkill -USR1 -x sxhkd

let g:ale_fixers =
\ {'rust': ['rustfmt'],
\  'ocaml':['ocamlformat'],
\  'javascript': ['prettier'],
\  'js': ['prettier'],
\  'typescript': ['prettier'],
\  'html': ['prettier'],
\  'css': ['prettier'],
\  'scss': ['prettier']}
let g:ale_fix_on_save = 1
let g:ale_linters_explicit = 1

" tsx syntax highlighting
hi tsxTagName ctermfg=5
hi tsxCloseTagName ctermfg=5
hi tsxComponentName ctermfg=6 cterm=italic
hi tsxCloseComponentName ctermfg=6 cterm=italic
hi tsxAttributeBraces ctermfg=10 cterm=bold

" CoC extensions
let g:coc_global_extensions = [
\  'coc-tsserver',
\  'coc-json'
\]

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Show autocomplete when Tab is pressed
inoremap <silent><expr> <Tab> coc#refresh()


" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Show highlight  group under cursor
nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    custom_captures = {
      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
      ["foo.bar"] = "Identifier",
    },
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

