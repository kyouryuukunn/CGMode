
よくあるCGモードを実装する

もしも使いたい人がいたなら好きに使っていい
改変、再配布は自由
使用を明記する必要も報告する必要もない
けど報告をくれるとうれしい

機能
一度見たCGだけ表示する
CG数に合わせて、自動でぺージを調整する
差分画像に対応、何枚中何枚見たかを表示
ある程度レイアウトも変更出来る
使い方
設定後、first.ksでcg_mode_init.ksを読み込む
例
@call cg_mode_init.ks
後はcg_mode.ksをサブルーチンとして呼べばよい
例
[link exp="kag.callExtraConductor('cg_mode.ks', '*cg_mode')"]CGモード[endlink]

設定方法
195行目の右クリックの設定を環境にあわせてかえる
cg_mode_init.ksの17行目からの各変数を書きかえる

cg.base = 'black'; //背景画像
cg.cg_button = 'cg_button'; //サムネイルと同じ大きさのボタン画像
cg.thumbnail_width  = 100; //サムネイルの幅
cg.thumbnail_height =  75; //サムネイルと高さ
cg.line   = 7;  //サムネイルを表示する横の数
cg.column = 3;  //サムネイルを表示する縦の数
cg.base_x = 50; //サムネイルを表示する初期x座標
cg.base_y = 35; //サムネイルを表示する初期y座標
cg.page_basex = 500; //ページボタンの初期x座標
cg.page_basey = 0;   //ページボタンの初期y座標
cg.page_width = 20;  //ページボタン間の幅
cg.page_height = 0;  //ページボタン間の高さ
cg.close_x=kag.scWidth-150; //閉じるのx座標
cg.close_y=kag.scHeight-50; //閉じるのy座標
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //サムネイル間の幅
cg.height = 50; //サムネイル間の高さ
cg.cg_storage = []; //画像ファイル名を入れる
cg.cg_sstorage = []; //サムネイルファイル名を入れる
//2つの配列は同じ順番でなくてはならない
//また、差分画像は配列内配列で記述する
また、88行目の0を1にすることで全てのCGを見たことにできる

次にflagcgを画像を表示するマクロに組み込む
例
@macro name=im
@image *
@flagcg *
@endmacro
これでいちど表示した画像は記録される
ただし、storageで指定された文字列をcg.cg_storageから探して
記録しているので拡張子の有無は統一しなければならない
