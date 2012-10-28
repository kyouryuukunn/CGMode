
*cg_mode

@tempsave
@laycount messages="&kag.numMessageLayers + 1"
@rclick enabled=true storage=cg_mode.ks target=*back

@iscript
cg.playing = 0;
var elm = %["visible" => false];
// 全ての前景レイヤを非表示にします
for(var i=0;i<kag.numCharacterLayers;i++)
	kag.fore.layers[i].setOptions(elm);
// 全てのメッセージレイヤを非表示にします
for(var i=0;i<kag.numMessageLayers;i++)
	kag.fore.messages[i].setOptions(elm);
@endscript

@current layer="&'message' + (kag.numMessageLayers - 1)"
@position opacity=0 marginb=0 margint=0 marginl=0 marginr=0 width=&kag.scWidth height=&kag.scHeight top=0 left=0 layer=message visible=true
@call storage=cg_mode.ks target=*draw
@s


;サブルーチン

;サムネイル描画
*draw
@image layer=base storage=&cg.base
@er
@eval exp="cg.temp_column = 0"
*column
	@eval exp="cg.temp_line = 0"
*line
		;差分画像か調べる
		@if exp="typeof(sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]) != 'Object'"
			@if exp="sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]"
				;cg_sstorageの数を越えて描画しないため
				@if exp="cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line < cg.cg_sstorage.count"
					@locate x="&cg.base_x + cg.temp_column * cg.width" y="&cg.base_y + cg.temp_line * cg.height"
					;透明なボタンを表示
					@button graphic=&cg.cg_button storage=cg_mode.ks target=*play exp="&'cg.playing = ' + ( cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line )"
					@pimage storage="&cg.cg_sstorage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]" layer=base dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height"
				@endif
			@endif
		@else
			@eval exp="cg.count = 0"
*draw_loop
			@if exp="sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line][cg.count]"
				@jump storage=cg_mode.ks target=*draw_end
			@endif
			@jump storage=cg_mode.ks target=*draw_loop cond="++cg.count < cg.cg_storage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line].count"
*draw_end
			@if exp="cg.count != cg.cg_storage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line].count"
				@locate x="&cg.base_x + cg.temp_column * cg.width" y="&cg.base_y + cg.temp_line * cg.height"
				@button graphic=&cg.cg_button storage=cg_mode.ks target=*play exp="&'cg.playing = ' + ( cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line )"
				;一番最初に見つかった見た差分画像をサムネイルに選ぶ
				@pimage storage="&cg.cg_sstorage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line][cg.count]" layer=base dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height"
				@locate x="&cg.base_x + cg.temp_column * cg.width + cg.thumbnail_width - 30" y="&cg.base_y + cg.temp_line * cg.height + cg.thumbnail_height - 25"
				@font size=12
				@nowait
				@emb exp="cg_modecount(cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line)"
				@endnowait
				@resetfont
			@endif
		@endif
	@jump storage=cg_mode.ks target=*line cond="++cg.temp_line < cg.line"
@jump storage=cg_mode.ks target=*column cond="++cg.temp_column < cg.column"
@eval exp="cg.count=0"


;ぺージ番号描画
@if exp="cg.maxpage > 0"
	@eval exp="cg.pagecount = 0"
	@locate x="&cg.page_basex + cg.page_width * cg.pagecount" y="&cg.page_basey + cg.page_height * cg.pagecount"
	@nowait
	ページ
	@endnowait
*pagedraw
		@locate x="&cg.page_basex + cg.page_width * cg.pagecount + 100" y="&cg.page_basey + cg.page_height * cg.pagecount"
		@nowait
		@if exp="cg.pagecount != cg.page"
			@link storage=cg_mode.ks target=*sub_draw exp="&'cg.page = ' + cg.pagecount"
			@emb exp="cg.pagecount + 1"
			@endlink
		@else
			@font color=0x666666
			@emb exp="cg.pagecount + 1"
			@resetfont
		@endif
		@endnowait
	@jump storage=cg_mode.ks target=*pagedraw cond="++cg.pagecount < (cg.maxpage + 1)"
@endif

@locate x=&cg.close_x y=&cg.close_y
@link storage=cg_mode.ks target=*back
@nowait
閉じる
@endnowait
@endlink

@return

*play
@unlocklink
@layopt layer=message visible=false
@if exp="typeof(cg.cg_storage[cg.playing]) == 'String'"
	;@locate x=600 y=&kag.scHeight-50
	;@link storage=cg_mode.ks target=*nextpage
	;@nowait
	;進む
	;@endnowait
	;@endlink
	;@locate x=600 y=&kag.scHeight-50
	;@link storage=cg_mode.ks target=*backpage
	;@nowait
	;戻る
	;@endnowait
	;@endlink
	@image layer=0 storage=&cg.cg_storage[cg.playing] visible=true opacity=255 top=0 left=0
	@l
@else
	@eval exp="cg.count = 0"
*cg_multi
	@if exp="sf.cg_flag[cg.playing][cg.count]"
		@image layer=0 storage=&cg.cg_storage[cg.playing][cg.count] visible=true opacity=255 top=0 left=0
	@else
		@jump storage=cg_mode.ks target=*cg_multi cond="++cg.count < cg.cg_storage[cg.playing].count"
	@endif
	@l
	@jump storage=cg_mode.ks target=*cg_multi cond="++cg.count < cg.cg_storage[cg.playing].count"
@endif
@layopt layer=message visible=true
@layopt layer=0 visible=false
@s

;*nextpage
;@unlocklink
;@iscript
;if (typeof(cg.cg_storage[cg.playing]) == 'String'){
;	while(cg.playing < cg.cg_storage.count){
;		cg.playing+=1;
;		if (sf.cg_flag[cg.playing])
;			break;
;	}
;	if (cg.playing == cg.cg_storage.count){
;		for (cg.playing = 0; cg.playing < cg.cg_storage.count; cg.playing++){
;			if (sf.cg_flag[cg.playing])
;				break;
;		}
;	}
;}else{
;	while(cg.count < cg.cg_storage[cg.playing].count - 1){
;		cg.count+=1;
;		if (sf.cg_flag[cg.playing][cg.count])
;			break;
;	}
;	if (cg.playing == cg.cg_storage.count){
;		for (cg.playing = 0; cg.playing < cg.cg_storage.count; cg.playing++){
;			if (sf.cg_flag[cg.playing])
;				break;
;		}
;	}
;	
;}
;@endscript
;@jump storage=cg_mode.ks target=*play cond="cg.playing != cg.cg_storage.count"
;@s
;
;*backpage
;@unlocklink
;@iscript
;while(cg.playing >= 0){
;	cg.playing-=1;
;	if (sf.cg_flag[cg.playing])
;		break;
;}
;if (cg.playing == -1){
;	for (cg.playing = cg.cg_storage.count - 1; cg.playing >= 0; cg.playing--){
;		if (sf.cg_flag[cg.playing])
;			break;
;	}
;}
;@endscript
;@jump storage=cg_mode.ks target=*play cond="cg.playing != -1"
;@s

;linkからサブルーチンをするため
*sub_draw
@call storage=cg_mode.ks target=*draw
@s

*back
@tempload
@rclick enabled=true jump=true storage=title.ks target=*title
@return

