
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
cg.base = 'black'; //背景
cg.cg_button = 'cg_button'; //サムネイルと同じ大きさのボタン
cg.thumbnail_width  = 100; //サムネイルの幅
cg.thumbnail_height =  75; //サムネイルと高さ
cg.line   = 4; //横の数
cg.column = 4; //縦の数
cg.base_x = 50; //初期x座標
cg.base_y = 100; //初期y座標
cg.page_basex = 500; //ページボタンの初期x座標
cg.page_basey = 0;   //ページボタンの初期y座標
cg.page_width = 20;  //ページボタン間の幅
cg.page_height = 0;  //ページボタン間の高さ
cg.close_x=kag.scWidth-150; //閉じるのx座標
cg.close_y=kag.scHeight-50; //閉じるのy座標
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //幅
cg.height = 100; //高さ
cg.cg_storage = [ //ファイル名を入れる
['cg1s', 'cg2s', 'cg3s'],
'cg4s',
'cg5s',
'cg6s',
'cg7s',
'cg8s',
'cg9s',
'cg10s',
'cg11s',
'cg12s',
'cg13s',
'cg14s',
'cg14s',
'cg15s',
'cg16s',
'cg17s',
'cg18s'
];
cg.cg_sstorage = [ //サムネイルファイル名を入れる
['cg1', 'cg2', 'cg3'],
'cg4',
'cg5',
'cg6',
'cg7',
'cg8',
'cg9',
'cg10',
'cg11',
'cg12',
'cg13',
'cg14',
'cg14',
'cg15',
'cg16',
'cg17',
'cg18'
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
if (0){
	for (var i=0; i < cg.cg_storage.count; i++){
		if (typeof(cg.cg_storage[i]) == 'Object'){
			for (var n=0; n < cg.cg_storage[i].count; n++){
				sf.cg_flag[i][n]=true;
			}
		}else{
			sf.cg_flag[i] = true;
		}
	}
}
cg.page = 0;
cg.maxpage = cg.cg_sstorage.count%(cg.column*cg.line) == 0 ? cg.cg_sstorage.count\(cg.column*cg.line) - 1 : cg.cg_sstorage.count\(cg.column*cg.line);

function cg_modecount(num){ //差分画像の見た割合を返す
	var saw = 0;
	for (var i=0; i < cg.cg_storage[num].count; i++){
		if (sf.cg_flag[num][i])
			saw+=1;
	}
	return saw + '/' + cg.cg_storage[num].count;
}
function flagcg(elm){
	var i = cg.cg_storage.fing(elm.storage);
	if (i == -1){
		for (var n = 0; n < cg.cg_storage.count; n++){
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
