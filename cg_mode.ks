
*cg_mode

@tempsave
@rclick enabled=true jump=true storage=cg_mode.ks target=*back
@history enabled=false output=false

@iscript
cg.playing = 0;
var elm = %["visible" => false];
// �S�Ẵ��b�Z�[�W���C�����\���ɂ��܂�
for(var i=0;i<kag.numMessageLayers;i++)
	kag.fore.messages[i].setOptions(elm);
cg.in_cg = 1; //�}�E�X�z�C�[���̂��߂�CG���[�h�ł��邱�Ƃ̖ڈ�
@endscript

;��p�̃��C�������
@laycount layers="&kag.numCharacterLayers + 2" messages="&kag.numMessageLayers + 1"
;���ׂẴ��C������ɕ\��
;�w�i
@layopt index="&2000000+100" layer="&kag.numCharacterLayers-2"
;CG
@layopt index="&2000000+101" layer="&kag.numCharacterLayers-1"
;�����̊���
@layopt index="&2000000+102" layer="&'message' + (kag.numMessageLayers-1)"
@current layer="&'message' + (kag.numMessageLayers - 1)"
@position opacity=0 marginb=0 margint=0 marginl=0 marginr=0 width=&kag.scWidth height=&kag.scHeight top=0 left=0 layer=message visible=true
@call storage=cg_mode.ks target=*draw
@s


;�T�u���[�`��

;�T���l�C���`��
*draw
;pimage�ŕ`�悵�Ă���̂ŕK�v
@image layer="&kag.numCharacterLayers-2" storage=&cg.base visible=true
@er
@eval exp="cg.temp_column = 0"
*column_loop
	@eval exp="cg.temp_line = 0"
*line_loop
		;�����摜�����ׂ�
		@if exp="typeof(sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]) != 'Object'"
			;cg_sstorage�̐����z���ĕ`�悵�Ȃ�����
			@if exp="cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line < cg.cg_sstorage.count"
				@if exp="sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]"
					@locate x="&cg.base_x + cg.temp_column * cg.width" y="&cg.base_y + cg.temp_line * cg.height"
					;�����ȃ{�^����\��
					@button graphic=&cg.cg_button storage=cg_mode.ks target=*play exp="&'cg.playing = ' + ( cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line )"
					@pimage storage="&cg.cg_sstorage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line]" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height"
				@else
					@pimage storage="&cg.cg_dummy" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height"
				@endif
			@endif
		@else
		;�����摜�p����
			@eval exp="cg.count = 0"
*draw_loop
			;��ԍŏ��Ɍ����������������摜���T���l�C���ɑI��
			@if exp="sf.cg_flag[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line][cg.count]"
				@jump storage=cg_mode.ks target=*draw_end
			@endif
			@jump storage=cg_mode.ks target=*draw_loop cond="++cg.count < cg.cg_storage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line].count"
*draw_end
			@if exp="cg.count != cg.cg_storage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line].count"
				@locate x="&cg.base_x + cg.temp_column * cg.width" y="&cg.base_y + cg.temp_line * cg.height"
				@button graphic=&cg.cg_button storage=cg_mode.ks target=*play exp="&'cg.playing = ' + ( cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line )"
				@pimage storage="&cg.cg_sstorage[cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line][cg.count]" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height"
				@locate x="&cg.base_x + cg.temp_column * cg.width + cg.count_x" y="&cg.base_y + cg.temp_line * cg.height + cg.count_y"
				@eval exp="kag.tagHandlers.font(cg.count_font)"
				@nowait
				@emb exp="cg.modecount(cg.page*cg.column*cg.line + cg.temp_column*cg.line + cg.temp_line)"
				@endnowait
				@resetfont
			@else
				@pimage storage="&cg.cg_dummy" layer="&kag.numCharacterLayers-2" dx="&cg.base_x + cg.temp_column * cg.width" dy="&cg.base_y + cg.temp_line * cg.height"
			@endif
		@endif
	@jump storage=cg_mode.ks target=*line_loop cond="++cg.temp_line < cg.line"
@jump storage=cg_mode.ks target=*column_loop cond="++cg.temp_column < cg.column"
@eval exp="cg.count=0"


;�؁[�W�ԍ��`��
@if exp="cg.maxpage > 0"
	@eval exp="cg.pagecount = 0"
	;@locate x="&cg.page_basex + cg.page_width * cg.pagecount" y="&cg.page_basey + cg.page_height * cg.pagecount"
	;@nowait
	;@eval exp="kag.tagHandlers.font(cg.page_font)"
	;page
	;@resetfont
	;@endnowait
*pagedraw
		@locate x="&cg.page_basex + cg.page_width * cg.pagecount" y="&cg.page_basey + cg.page_height * cg.pagecount"
		@nowait
		@if exp="cg.pagecount != cg.page"
			@link storage=cg_mode.ks target=*sub_draw exp="&'cg.page = ' + cg.pagecount"
			@eval exp="kag.tagHandlers.font(cg.page_font)"
			@emb exp="cg.pagecount + 1"
			@resetfont
			@endlink
		@else
			@eval exp="kag.tagHandlers.font(cg.page_font)"
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
@eval exp="kag.tagHandlers.font(cg.close_font)"
close
@resetfont
@endnowait
@endlink

@return

*play
@unlocklink
;�\�����̓z�C�[�����֎~
@eval exp="cg.in_cg=0"
@layopt layer=message visible=false
;�ʏ�摜
@if exp="typeof(cg.cg_storage[cg.playing]) == 'String'"
	@image layer="&kag.numCharacterLayers-1" storage=&cg.cg_storage[cg.playing] visible=true
	@l
@else
	@eval exp="cg.count = 0"
*cg_multi
	@if exp="sf.cg_flag[cg.playing][cg.count]"
		@image layer="&kag.numCharacterLayers-1" storage=&cg.cg_storage[cg.playing][cg.count] visible=true
		@l
	@else
		@jump storage=cg_mode.ks target=*cg_multi cond="++cg.count < cg.cg_storage[cg.playing].count"
	@endif
	@jump storage=cg_mode.ks target=*cg_multi cond="++cg.count < cg.cg_storage[cg.playing].count"
@endif
@layopt layer=message visible=true
@layopt layer="&kag.numCharacterLayers-1" visible=false
@eval exp="cg.in_cg=1"
@s


;link����T�u���[�`�������邽��
*sub_draw
@call storage=cg_mode.ks target=*draw
@s

*back
@tempload
@eval exp="cg.in_cg=0"
;@history enabled=false output=false
;�e���Őݒ�
;@rclick enabled=true jump=true storage=title.ks target=*title
@return
