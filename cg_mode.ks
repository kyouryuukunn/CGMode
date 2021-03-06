
*cg_mode

@tempsave
@rclick enabled=true jump=true storage=cg_mode.ks target=*back
@history enabled=false output=false

@iscript
cg.playing = 0;
// 全てのメッセージレイヤを非表示にします
for(var i=0;i<kag.numMessageLayers;i++)
	kag.fore.messages[i].setOptions(%[visible:false]);
//マウスホイールのためのCGモードであることの目印
cg.in_cg = 1;
// 一時的にマウスホイールの動作を変える
cg.onMouseWheel_org = kag.onMouseWheel;
kag.onMouseWheel = function (shift, delta, x, y)
{
	cg.onMouseWheel_org(...);
	if (cg.in_cg)	cg.wheel(...);
} incontextof kag;
@endscript

;専用のレイヤを作る
@laycount layers="&kag.numCharacterLayers + 2" messages="&kag.numMessageLayers + 1"
;すべてのレイヤより上に表示
;背景
@layopt index="&2000000+100" layer="&kag.numCharacterLayers-2"
;CG
@layopt index="&2000000+101" layer="&kag.numCharacterLayers-1"
;差分の割合
@layopt index="&2000000+102" layer="&'message' + (kag.numMessageLayers-1)"
@current page=back layer="&'message' + (kag.numMessageLayers - 1)"
@position opacity=0 marginb=0 margint=0 marginl=0 marginr=0 width=&kag.scWidth height=&kag.scHeight top=0 left=0 layer=message visible=true
@backlay
@image layer="&kag.numCharacterLayers-2" storage=&cg.base visible=true page=back
@stoptrans
@trans method=crossfade time=300
@wt
@call storage=cg_mode.ks target=*draw
@s


;サブルーチン

;サムネイル描画
*draw
@backlay
;pimageで描画しているので必要
@image layer="&kag.numCharacterLayers-2" storage=&cg.base visible=true page=back
@er
@eval exp="cg.temp_column = 0"
*column_loop
	@eval exp="cg.temp_line = 0"
*line_loop
		;差分画像か調べる
		@if exp="typeof(sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]) != 'Object'"
			;cg_sstorageの数を越えて描画しないため
			@if exp="cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line < cg.cg_sstorage.count"
				@if exp="sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]"
					@locate x="&cg.base_x + cg.temp_column * cg.width" y="&cg.base_y + cg.temp_line * cg.height"
					;透明なボタンを表示
					@button graphic=&cg.cg_button storage=cg_mode.ks target=*play exp="&'cg.playing = ' + ( cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line )"
					@pimage storage="&cg.cg_sstorage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height" page=back
				@else
					@pimage storage="&cg.cg_dummy" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height" page=back
				@endif
			@endif
		@else
		;差分画像用処理
			@eval exp="cg.count = 0"
*draw_loop
			;一番最初に見つかった見た差分画像をサムネイルに選ぶ
			@if exp="sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line][cg.count]"
				@jump storage=cg_mode.ks target=*draw_end
			@endif
			@jump storage=cg_mode.ks target=*draw_loop cond="++cg.count < cg.cg_storage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line].count"
*draw_end
			@if exp="cg.count != cg.cg_storage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line].count"
				@locate x="&cg.base_x + cg.temp_column * cg.width" y="&cg.base_y + cg.temp_line * cg.height"
				@button graphic=&cg.cg_button storage=cg_mode.ks target=*play exp="&'cg.playing = ' + ( cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line )"
				@pimage storage="&cg.cg_sstorage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line][cg.count]" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height" page=back
				@locate x="&cg.base_x + cg.temp_column * cg.width + cg.count_x" y="&cg.base_y + cg.temp_line * cg.height + cg.count_y"
				@eval exp="kag.tagHandlers.font(cg.count_font)"
				@nowait
				@emb exp="cg.modecount(cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line)"
				@endnowait
				@resetfont
			@else
				@pimage storage="&cg.cg_dummy" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height" page=back
			@endif
		@endif
	@jump storage=cg_mode.ks target=*line_loop cond="++cg.temp_line < cg.line"
@jump storage=cg_mode.ks target=*column_loop cond="++cg.temp_column < cg.column"
@eval exp="cg.count=0"


;ぺージ番号描画
@if exp="cg.maxpage > 0"
	@eval exp="cg.pagecount = 0"
*pagedraw
		@locate x="&cg.page_basex + cg.page_width * cg.pagecount" y="&cg.page_basey + cg.page_height * cg.pagecount"
		@nowait
		@if exp="cg.pagecount != cg.page"
			@if exp="cg.page_cg.count > 0"
				@button storage=cg_mode.ks target=*sub_draw graphic=&cg.page_cg[cg.pagecount] exp="&'cg.page = ' + cg.pagecount"
			@else
				@link storage=cg_mode.ks target=*sub_draw exp="&'cg.page = ' + cg.pagecount"
				@eval exp="kag.tagHandlers.font(cg.page_font)"
				@emb exp="cg.pagecount + 1"
				@resetfont
				@endlink
			@endif
		@else
			@if exp="cg.page_cg.count > 0"
				@pimage dx="&cg.page_basex + cg.page_width * cg.page" dy="&cg.page_basey + cg.page_height * cg.page" storage=&cg.nowpage_cg[cg.page] layer="&kag.numCharacterLayers-2" page=back
			@else
				@eval exp="kag.tagHandlers.font(cg.page_font)"
				@font color=0x666666
				@emb exp="cg.pagecount + 1"
				@resetfont
			@endif
		@endif
		@endnowait
	@jump storage=cg_mode.ks target=*pagedraw cond="++cg.pagecount < (cg.maxpage + 1)"
@endif

@locate x=&cg.close_x y=&cg.close_y
@if exp="cg.close_buttun != ''"
	@button storage=cg_mode.ks target=*back graphic=&cg.close_buttun
@else
	@link storage=cg_mode.ks target=*back
	@nowait
	@eval exp="kag.tagHandlers.font(cg.close_font)"
	close
	@resetfont
	@endnowait
	@endlink
@endif

@stoptrans
@trans method=crossfade time=300
@wt
@return

*play
@unlocklink
;表示中はホイールを禁止
@eval exp="cg.in_cg=0"
@layopt layer=message visible=false
;通常画像
@if exp="typeof(cg.cg_storage[cg.playing]) == 'String'"
	@backlay
	@image layer="&kag.numCharacterLayers-1" storage=&cg.cg_storage[cg.playing] visible=true page=back
	@stoptrans
	@trans method=crossfade time=300
	@wt
	@p
@else
;差分画像
	@eval exp="cg.count = 0"
*cg_multi_loop
	@if exp="sf.cg_flag[cg.playing][cg.count]"
		@backlay
		@image layer="&kag.numCharacterLayers-1" storage=&cg.cg_storage[cg.playing][cg.count] visible=true page=back
		@stoptrans
		@trans method=crossfade time=300
		@wt
		@p
	@else
		@jump storage=cg_mode.ks target=*cg_multi_loop cond="++cg.count < cg.cg_storage[cg.playing].count"
	@endif
	@jump storage=cg_mode.ks target=*cg_multi_loop cond="++cg.count < cg.cg_storage[cg.playing].count"
@endif
@layopt layer=message visible=true
@layopt layer="&kag.numCharacterLayers-1" visible=false
@eval exp="cg.in_cg=1"
@s


;linkからサブルーチンをするため
*sub_draw
@call storage=cg_mode.ks target=*draw
@s

*back
@tempload
@iscript
//ホイールの動作を戻す
kag.onMouseWheel = cg.onMouseWheel_org;
@endscript
;各自で設定
;@history enabled=false output=false
@rclick enabled=false
@return
