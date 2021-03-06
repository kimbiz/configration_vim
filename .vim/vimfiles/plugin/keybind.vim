" Yの動作をDやCと同じにする
map Y y$
" 1文字消去はヤンクしない
nnoremap x "_x
" 検索後の強調表示を解除する
nmap <Esc><Esc>		:nohl<CR><Esc>
" 検索した箇所から移動したくない
" nmap * *N
" 行を折り返し表示しない
nmap <Leader>w		:set wrap!<CR>
" .vimrcを開く
nmap <Space>.		:<C-u>edit $MYVIMRC<CR>
" 連続貼り付け
vmap <silent>		<C-p> "0p<CR>

nnoremap [Mark] <Nop>
nmap <S-m> [Mark]
nnoremap <silent>[Mark]m :call AutoMarkrement()<CR>
" 次/前のマーク
nnoremap [Mark]n :echo<CR>]`
nnoremap [Mark]p :echo<CR>[`
" 一覧表示
nnoremap [Mark]l :marks<CR>

" 日時挿入
nmap date			<ESC>a<C-R>=strftime("%Y/%m/%d")<CR><ESC>
nmap time			<ESC>a<C-R>=strftime("%H:%M:%S")<CR><ESC>
" 記載されているファイルを開く
nmap gv				:vertical wincmd f<CR>

" window control とりあえず
" nmap <C-k>			<C-W>+
" nmap <C-j>			<C-W>-
" nmap <C-l>			<C-W>>
" nmap <C-h>			<C-W><
nmap ;			4<C-W>+
nmap -			4<C-W>-
noremap L		<C-L>
nmap )			<C-W>>
nmap (			<C-W><
nmap <c-k>		<C-W>k
nmap <c-j>		<C-W>j
nmap <c-l>		<C-W>l
nmap <c-h>		<C-W>h
nmap <c-q>		:let @q=expand('%:t')<CR>
nmap <s-q>		:let @q=expand('%:p')<CR>
nmap =			<C-W>=
" バッファ移動
nmap <C-n>			:bp<CR>
nmap <C-p>			:bn<CR>
" タブ移動
nmap <C-PageDown>	gt
nmap <C-PageUp>		gT
" 挿入時も移動
imap <C-h>			<Left>
imap <C-j>			<Down>
imap <C-k>			<Up>
imap <C-l>			<Right>
imap <C-Space>		<C-p>

" タグ複数時はリストを表示する
nmap <C-]>			g<C-]>

" source tree
nmap <Leader>tl		:Tlist<CR>
nmap <C-C>			:cd %:h<CR>:pwd<CR>
nmap <S-C>			:cd ..<CR>:pwd<CR>

" Cデバッグ用
nmap #p				oprintf("FILE[%s] LINE[%d]\n", __FILE__, __LINE__);
nmap #d				:.s/\/\*//:.s/\*\///

cmap <tab>			<Up>
cmap <S-tab>		<Down>

" 同じ名前のヘッダファイルを開く todo:ただ対応する.hファイルを開くだけでよい？
nmap <F2>			:<C-u>hide edit %<.h<CR>
" diffのショートカット
nmap <F5>			:difft<CR><C-w>w:difft<CR><C-w>w
nmap <C-F5>			:diffo<CR><C-w>w:diffo<CR><C-w>w
nmap <S-F5>			:bd!<CR>:bd!<CR>
" cvs/svn diff
nmap <F6>			:call SvnDiff_ShowList()<CR>
nmap <F7>			:call SvnDiff_ShowDiff(0)<CR>
nmap <C-F7>			:call SvnDiff_ShowDiff(1)<CR>
nmap <S-F7>			:call SvnDiff_ShowDiff(2)<CR>
" vimgrep
let g:search_tag=""
nmap <F8>			:let g:search_tag = GetTargetTag(0)<CR>
nmap <C-F8>			:let g:search_tag = GetTargetTag(1)<CR>
nmap <S-F8>			:let g:search_tag = GetTargetTag(2)<CR>
nmap <M-F8>			:call GetTagSearchBaseDir()<CR>
nmap <F9>			:mA:ccl<CR>:call TagSearch(0, "\\<" . g:search_tag . "\\>")<CR>:cw<CR>:silent execute "/\\<" . g:search_tag . "\\>"<CR><C-w>p'Ahn
nmap <S-F9>			:mA:ccl<CR>:call TagSearch(0, g:search_tag)<CR>:cw<CR>:silent execute "/" . g:search_tag<CR><C-w>p'Ahn
nmap <C-F9>			:mA:ccl<CR>:call TagSearch(1, "\\<" . g:search_tag . "\\>")<CR>:cw<CR>:silent execute "/\\<" . g:search_tag . "\\>"<CR><C-w>p'Ahn
nmap <C-S-F9>		:mA:ccl<CR>:call TagSearch(1, g:search_tag)<CR>:cw<CR>:silent execute "/" . g:search_tag<CR><C-w>p'Ahn
nmap <M-F9>			'A
" svn annotate
nmap <F10>			:call SvnAnnotate_ShowResult(expand("%"))<CR>
nmap <C-F10>		:call SvnLog_ShowResult(expand("%"))<CR>
" start up explorer
nmap <F12>			:silent !explorer.exe `cygpath -wa %:h`<CR>:redraw!<CR>

" get revision(描画がおかしくなるため再描画する)
nmap <Leader>rev	:let rev=SvnDiff_GetRevision()<CR>:redraw!<CR>:echo rev<CR>

" sub mode
"	call submode#enter_win('winsize', 'n', '<C-l>', '<C-w>>')
"	call submode#enter_win('winsize', 'n', '<C-h>', '<C-w><')
"	call submode#enter_win('winsize', 'n', '<C-k>', '<C-w>-')
"	call submode#enter_win('winsize', 'n', '<C-j>', '<C-w>+')
"	call submode#map('winsize', 'n', '<C-l>', '<C-w>>')
"	call submode#map('winsize', 'n', '<C-h>', '<C-w><')
"	call submode#map('winsize', 'n', '<C-k>', '<C-w>-')
"	call submode#map('winsize', 'n', '<C-j>', '<C-w>+')
