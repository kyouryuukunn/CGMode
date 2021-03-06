;mp.storageを指定すれば、sf.cg_flagから番号を探してその画像のフラグをたてる
;マクロに組み込んでくれ
;例
;@macro name=im
;@image *
;@flagcg *
;@endmacro

@macro name=flagcg
@eval exp="flagcg(mp)"
@endmacro

;前処理と設定
@iscript
var cg = %[];
//ここを書き換える↓------------------------------------------------------- 
cg.base = 'black'; //背景、透明部分がある場合は、直前のゲーム画面が見える
cg.cg_button = 'cg_button'; //サムネイルと同じ大きさのボタン
cg.cg_dummy = 'cg_dummy'; //まだ見ていないCGの位置に表示する画像
cg.thumbnail_width  = 100; //サムネイルの幅
cg.thumbnail_height =  75; //サムネイルと高さ
cg.line   = 4; //列数
cg.column = 4; //行数
cg.base_x = 50; //サムネイルの初期x座標
cg.base_y = 100;//サムネイルの初期y座標
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //サムネイルの列幅
cg.height = 100; //サムネイルの行の幅
cg.page_basex = 500; //ページボタンの初期x座標
cg.page_basey = 0;   //ページボタンの初期y座標
cg.page_width = 20;  //ページボタン間の幅
cg.page_height = 0;  //ページボタン間の高さ
cg.page_cg = ['1', '2'];  	//ページボタンに使用するボタン画像, この配列が空なら文字そうでないなら画像を表示する
				//例 music.page_cg = ['1', '2'] 前から順に使用する分だけ指定する
cg.nowpage_cg = ['off_1', 'off_2'];	//ページボタンに画像を使用するときはここに現在のページの画像を指定する
cg.page_font = %['italic' => true];	//ページボタンに文字を使うときのフォント
					//(ユーザーがフォントを変更すると不味いのでちゃんと指定すること)
cg.count_x = cg.thumbnail_width - 30;  //差分画像をいくつみたかの表示のサムネイルからの相対x座標
cg.count_y = cg.thumbnail_height - 25; //差分画像をいくつみたかの表示のサムネイルからの相対y座標
cg.count_font = %['size' => 12];       //差分画像をいくつみたかの表示フォント
					//(ユーザーがフォントを変更すると不味いのでちゃんと指定すること)
cg.close_x=kag.scWidth-100; //閉じるのx座標
cg.close_y=0; //閉じるのy座標
cg.close_button = '';	//閉じるにボタン画像を使用するなら指定する。空のときは文字を使う
cg.close_font = %['italic' => true];	//閉じるに文字を使用するときのフォント
					//(ユーザーがフォントを変更すると不味いのでちゃんと指定すること)

//2つの配列は同じ順番でなくてはならない
//また、差分画像は配列内配列で記述する
cg.cg_storage = [ //ファイル名を入れる
['円形(中から外へ)', 'モザイク', '縦ブラインド(左から右へ)', '横ブラインド(上から下へ)'],
['右から左へ', '円形(外から中へ)', '下から上へ', '左から右へ', '上から下へ'],
'斜めブラインド(左上から右下へ)',
'虫食い',
'波',
'右渦巻き',
'左回り',
'やや細かい縦ブラインド(中央から左右へ)',
'細かい縦ブラインド(左から右へ)',
'細かい縦ブラインド(短い軌跡で左から右へ)',
'細かい横ブラインド(上から下へ)',
'細かい横ブラインド(短い軌跡で上から下へ)',
'やや細かい横ブラインド(上から下へ)',
'やや細かい横ブラインド(短い軌跡で上から下へ)',
'やや細かい縦ブラインド(左から右へ)',
'やや細かい縦ブラインド(短い軌跡で左から右へ)',
'どう言ったらいいか分からないけどちょっと違う横ブラインド(左から右へ)',
'ひし形(左から右へ)',
'ひし形(左上から右下へ)',
'細かいひし形(左から右へ)',
'細かいひし形(左上から右下へ)',
'放射状(時計回り)',
'左下から右上へ',
'こすり(左から右へ)',
'爆発'
];
cg.cg_sstorage = [ //サムネイルファイル名を入れる
['s円形(中から外へ)', 'sモザイク', 's縦ブラインド(左から右へ)', 's横ブラインド(上から下へ)'],
['s右から左へ', 's円形(外から中へ)', 's下から上へ', 's左から右へ', 's上から下へ'],
's斜めブラインド(左上から右下へ)',
's虫食い',
's波',
's右渦巻き',
's左回り',
'sやや細かい縦ブラインド(中央から左右へ)',
's細かい縦ブラインド(左から右へ)',
's細かい縦ブラインド(短い軌跡で左から右へ)',
's細かい横ブラインド(上から下へ)',
's細かい横ブラインド(短い軌跡で上から下へ)',
'sやや細かい横ブラインド(上から下へ)',
'sやや細かい横ブラインド(短い軌跡で上から下へ)',
'sやや細かい縦ブラインド(左から右へ)',
'sやや細かい縦ブラインド(短い軌跡で左から右へ)',
'sどう言ったらいいか分からないけどちょっと違う横ブラインド(左から右へ)',
'sひし形(左から右へ)',
'sひし形(左上から右下へ)',
's細かいひし形(左から右へ)',
's細かいひし形(左上から右下へ)',
's放射状(時計回り)',
's左下から右上へ',
'sこすり(左から右へ)',
's爆発'
];
//ここを書き換える↑------------------------------------------------------- 


if (sf.cg_mode_init === void){
	// 最初に一度だけ実行
	// 見たかどうかのフラグ
	sf.cg_flag = %[];
	for (var i = 0; i < cg.cg_storage.count; i++){
		if (typeof(cg.cg_storage[i]) == 'Object'){
			sf.cg_flag[i] = %[];
				for (var n = 0; n < cg.cg_storage[i].count; n++){
					sf.cg_flag[i][n] = false;
				}
		}else{
			sf.cg_flag[i] = false;
		}
	}
	sf.cg_mode_init = 1;
}
cg.complete = function (){ //全CGを見たことにする(デバッグ用)
	for (var i=0; i < cg.cg_storage.count; i++){
		if (typeof(cg.cg_storage[i]) == 'Object'){
			for (var n=0; n < cg.cg_storage[i].count; n++){
				sf.cg_flag[i][n]=true;
			}
		}else{
			sf.cg_flag[i] = true;
		}
	}
} incontextof global;
cg.modecount = function (num){ //差分画像の見た割合を返す
	var saw = 0;
	for (var i=0; i < cg.cg_storage[num].count; i++){
		if (sf.cg_flag[num][i])
			saw+=1;
	}
	return saw + '/' + cg.cg_storage[num].count;
} incontextof global;
function flagcg(elm){
	var i = cg.cg_storage.find(elm.storage);
	if (i == -1){
	var n;
		for ( n = 0; n < cg.cg_storage.count; n++){
			if (typeof(cg.cg_storage[n]) == 'Object'){
				if (cg.cg_storage[n].find(elm.storage) >= 0){
					i = cg.cg_storage[n].find(elm.storage);
					break;
				}
			}
		}
		if (n != cg.cg_storage.count)
			sf.cg_flag[n][i] = true;
	}else{
		sf.cg_flag[i] = true;
	}
}
cg.wheel = function (shift, delta, x, y) {
	//通常
	if (cg.in_cg == 1){
		if (delta < 0){
			if  (cg.page >= cg.maxpage){
				cg.page = 0;
			}else{
				cg.page += 1;
			}
			kag.process('cg_mode.ks', '*sub_draw');
		}else if(delta > 0){
			if  (cg.page <= 0){
				cg.page = cg.maxpage;
			}else{
				cg.page -= 1;
			}
			kag.process('cg_mode.ks', '*sub_draw');
		}
	//画像表示時
	}else if (cg.in_cg == 2){
		kag.process('cg_mode.ks', '*play_finish');
	//差分画像表示時
	}else if (cg.in_cg == 3){
		kag.process('cg_mode.ks', '*play_multi_finish');
	}
} incontextof global;
cg.page = 0;
cg.maxpage = cg.cg_sstorage.count%(cg.column*cg.line) == 0 ? cg.cg_sstorage.count\(cg.column*cg.line) - 1 : cg.cg_sstorage.count\(cg.column*cg.line);

@endscript

@return
