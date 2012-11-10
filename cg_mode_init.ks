
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
cg.base = 'black'; //背景、透明部分がある場合は、直前のゲーム画面が見える
cg.cg_button = 'cg_button'; //サムネイルと同じ大きさのボタン
cg.cg_dummy = 'cg_dummy'; //まだ見ていないCGの位置に表示する画像
cg.thumbnail_width  = 100; //サムネイルの幅
cg.thumbnail_height =  75; //サムネイルと高さ
cg.line   = 4; //横の数
cg.column = 4; //縦の数
cg.base_x = 50; //初期x座標
cg.base_y = 100; //初期y座標
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //サムネイル間の幅
cg.height = 100; //サムネイル間の高さ
cg.page_basex = 500; //ページボタンの初期x座標
cg.page_basey = 0;   //ページボタンの初期y座標
cg.page_width = 20;  //ページボタン間の幅
cg.page_height = 0;  //ページボタン間の高さ
cg.page_font = %['italic' => true];  //ページボタンのフォント
cg.count_x = cg.thumbnail_width - 30;  //差分画像をいくつみたかを表示するサムネイルからの相対x座標
cg.count_y = cg.thumbnail_height - 10; //差分画像をいくつみたかを表示するサムネイルからの相対y座標
cg.count_font = %['size' => 12];       //差分画像をいくつみたかのフォント
cg.close_x=kag.scWidth-100; //閉じるのx座標
cg.close_y=0; //閉じるのy座標
cg.close_font = %['italic' => true]; //閉じるのフォント
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
//全CGを見たことにする(デバッグ用)
cg.complete = function (){
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
cg.page = 0;
cg.maxpage = cg.cg_sstorage.count%(cg.column*cg.line) == 0 ? cg.cg_sstorage.count\(cg.column*cg.line) - 1 : cg.cg_sstorage.count\(cg.column*cg.line);

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
@endscript

@return
