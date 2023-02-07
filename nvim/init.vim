" basic {{{
set number "显示行号
" set relativenumber
set autoindent  " 按下回车键后，下一行的缩进会自动跟上一行的缩进保持一致
set tabstop=4 "按下 Tab 键时，Vim 显示的空格数
set shiftwidth=4 " 在文本上按下>> <<等缩进,每一级的字符数
set smarttab
set softtabstop=4
" set mouse=a " 使用鼠标
syntax enable " 语法高亮,自动识别代码,使用多种颜色显示
syntax on
set ignorecase " 搜索时大小写不敏感
set encoding=utf-8 " 使用utf-8编码
set cursorline " 高亮当前行
set autoread " 自动读取最新文件
" }}}

" plugin {{{
call plug#begin()
" nvim dashboard
" Plug 'glepnir/dashboard-nvim'
Plug 'mhinz/vim-startify'
" if use this plugin,need install lazygit. https://github.com/jesseduffield/lazygit
Plug 'kdheepak/lazygit.nvim'

" mulit colorscheme
Plug 'rafi/awesome-vim-colorschemes'
Plug 'lifepillar/vim-gruvbox8'
" terminal
Plug 'voldikss/vim-floaterm'

Plug 'preservim/nerdtree' " NERDTree 文件目录树
Plug 'Xuyuanp/nerdtree-git-plugin' "NERDTree显示git信息
Plug 'ryanoasis/vim-devicons' " NERDTree显示文件icon 需要安装字体: https://github.com/ryanoasis/nerd-fonts#option-4-homebrew-fonts
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" gcc: 注释或反注释 gcap: 注释一段 gc: visual 模式下直接注释所有已选择的行
Plug 'tpope/vim-commentary'
Plug 'vim-airline/vim-airline' "Status bar
Plug 'vim-airline/vim-airline-themes'
" 上方的buffers,切换最近的文件
"Plug 'jiangmiao/auto-pairs' " 自动补全括号的插件，包括小括号，中括号，以及花括号

Plug 'godlygeek/tabular' " 快捷对齐 :Tabularize /\/\/  :Tabularize /{pattern}
" markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' } " https://github.com/iamcco/markdown-preview.nvim 推荐使用yarn方式，另一种有问题

" ## git
" 上线改动位置跳转 [c and ]c , 现在的每一行和之前的每一行对比:GitGutterDiffOrig, 高亮修改行:GitGutterLineHighlightsToggle 
Plug 'airblade/vim-gitgutter' " 左侧展示增加,修改,删除的行标志
Plug 'tpope/vim-fugitive' " git相关命令 如：Git blame
Plug 'rbong/vim-flog' " 高亮git分支，与 fugitive集成

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " 在终端按照文件名搜索文件
Plug 'junegunn/fzf.vim' " :Rg $ brew install ripgrep :Ag $ brew install the_silver_searcher
" https://github.com/dandavison/delta  $ brew install git-delta
" telescope 用着还不错，后续考虑替代掉fzf.vim https://github.com/nvim-telescope/telescope.nvim
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Plug 'SirVer/ultisnips' " https://github.com/SirVer/ultisnips

" go development: 目前使用coc替代
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" 补全代码
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" 支持python补全 :CocInstall coc-pyright
" tabline :CocInstall coc-tabnine
" go to definition for protobuf messages :CocInstall coc-protobuf
" json :CocInstall coc-json
" vimscript :CocInstall coc-vimlsp
" toml :CocInstall coc-toml
Plug 'honza/vim-snippets' " snippets with Coc: run command(CocInstall coc-snippets)
Plug 'sbdchd/neoformat' " format code
Plug 'preservim/tagbar' "Tagbar: a class outline viewer for Vim
" go: Struct split and join  gS:split  gJ:join
Plug 'AndrewRadev/splitjoin.vim'

" proto集成vim参考：https://docs.buf.build/editor-integration
" proto file ,prerequisites :git,https://stedolan.github.io/jq/,https://docs.buf.build/installation
Plug 'dense-analysis/ale' " ale中已集成bufbuild/vim-buf(https://github.com/bufbuild/vim-buf)

Plug 'sebdah/vim-delve' " debug
" 显示方法间的虚线   nvim生效需要配置
Plug 'Yggdroot/indentLine'

" dhall
Plug 'vmchale/dhall-vim'
Plug 'machakann/vim-highlightedyank' " 高亮复制行
" 切换buffer
Plug 'tpope/vim-unimpaired' " [b 切换到前一个 ]b 切换到下一个
Plug 'editorconfig/editorconfig-vim'
" 窗口切换
" code color
Plug 'ap/vim-css-color'
" bookmark
Plug 'MattesGroeger/vim-bookmarks'
call plug#end()
" }}}
" global
" 设置主题 主题如果放在coc后边，会覆盖coc.nvim中的popup menu颜色
" set background=dark
colorscheme gruvbox
" colorscheme PaperColor
" colorscheme gruvbox8

let g:python3_host_prog = '/usr/bin/python3'
" need run $ python3 -m pip install --user --upgrade pynvim
inoremap jk <esc>

augroup filetype_vim
    autocmd!
	" za 折叠&取消折叠当前段 | zi 取消&展开所有折叠
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" ## 插件配置
" fzf {{{
" find all的缩写
nnoremap <leader>fa :Rg! 
nmap // :BLines!<CR>
nmap ?? :Rg!<CR>
" https://github.com/junegunn/fzf.vim/issues/162
let g:fzf_commands_expect = 'enter'
" Find files with fzf
" nmap <leader>ff :Files!<CR>
" Show Git history for the current buffer
command! FileHistory execute ":BCommits!"
nmap cc :Commands<CR>
" }}}

" telescope.nvim {{{
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }}}

" nerdtree {{{
nnoremap <leader>nt :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
let NERDTreeShowHidden=1
let NERDTreeIgnore = [ '\.idea','\.vscode','\.DS_Store' ]
" }}}

" vim-airline {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
" 关闭当前buffer
nnoremap <leader>bq :bp <BAR> bd #<CR>
" vim-airline themes
let g:airline_theme='onedark'
" }}}

" markdown
nnoremap <leader>mp :MarkdownPreviewToggle<CR>

" vim-floaterm
let g:floaterm_keymap_new = '<Leader>ft'
let g:floaterm_keymap_toggle = '<Leader>t'

" gitgutter {{{
nmap gp <Plug>(GitGutterPreviewHunk)
nmap gs <Plug>(GitGutterStageHunk)
nmap gu <Plug>(GitGutterUndoHunk)
" }}}

" vim-go {{{
" let g:go_highlight_types = 1
" let g:go_highlight_fields = 1
" let g:go_highlight_functions = 1
" let g:go_highlight_function_calls = 1
" let g:go_highlight_operators = 1
" let g:go_highlight_extra_types = 1
" let g:go_highlight_build_constraints = 1
" let g:go_highlight_generate_tags = 1
" 跳转到 下一个/上一个quickfix位置
" noremap <C-n> :cnext<CR>
" noremap <C-p> :cprevious<CR>
" nnoremap <leader>a :cclose<CR>
" autocmd FileType go nmap <leader>b  <Plug>(go-build)
" autocmd FileType go nmap <leader>r  <Plug>(go-run)
" let g:go_list_type = "quickfix"
" autocmd FileType go nmap <leader>t  <Plug>(go-test)
" autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
" let g:go_fmt_command = "goimports"
" autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
" autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
" autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
" autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" autocmd FileType go nmap <Leader>i <Plug>(go-info)
" }}}

"coc {{{
" https://github.com/neoclide/coc.nvim/issues/3980
" https://github.com/neoclide/coc.nvim/issues/4031
hi CocSearch ctermfg=12 guifg=#18A3FF
hi CocMenuSel ctermbg=19 guibg=#222222

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

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
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)
" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" }}}

" Yggdroot/indentLine 支持golang
set listchars=tab:\¦\ ,trail:■,extends:>,precedes:<,nbsp:+
set list
hi SpecialKey ctermfg=239 ctermbg=NONE

" neoformat
nnoremap <leader>cf :Neoformat<cr>
" tagbar
nnoremap <leader>tb :Tagbar<CR>

" dense-analysis/ale {{{
let g:ale_linters_explicit = 1
let g:ale_linters = {
            \ 'go': ['golangci-lint'],
			\ 'proto': ['buf-lint'],
			\ 'sh': ['shellcheck'],
			\ 'zsh': ['shellcheck']
            \ }
let g:ale_go_golangci_lint_options = ''
let g:ale_go_golangci_lint_package = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_fixers = {
      \ 'python': ['autopep8'],
      \ 'go': ['gofmt'],
      \ 'rust': ['rustfmt'],
      \ 'kotlin': ['ktlint'],
      \ 'javascript': ['eslint'],
      \ 'typescript': ['tslint'],
      \ 'typescriptreact': ['prettier'],
      \ }
let g:ale_fix_on_save = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" 自定义快捷键
" 快速把当前行上移或下移一行 比如连续按下 2 ] e 就可以把当前行向下移动两行
nnoremap [e  :<c-u>execute 'move -1-'. v:count1<cr>
nnoremap ]e  :<c-u>execute 'move +'. v:count1<cr>
" copy: 粘贴到系统剪贴板 "*y | "+y 二选一即可
vnoremap <leader>y "*y
" paste: 从系统剪贴板粘贴 "*p | "+p 二选一即可
nnoremap <leader>p "*p

" 解决nvim自动隐藏json的"
let g:vim_json_conceal=0
