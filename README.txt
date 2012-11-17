赤恐竜	http://akakyouryuu.blog.fc2.com/

よくあるCGモードを実装する

もしも使いたい人がいたなら好きに使っていいです。
改変、再配布は自由
使用を明記する必要も報告する必要もないですが、
けど報告をくれるとうれしいです。
当然なにかあっても責任は取れないけど

全部入りサンプルをskydriveで公開している
https://skydrive.live.com/#cid=8F8EF4D2142F33D4&id=8F8EF4D2142F33D4!257

機能
一度見たCGだけ表示する
CG数に合わせて、自動でぺージを調整する
マウスホイールでページ移動も可
差分画像に対応、何枚中何枚見たかを表示
ある程度レイアウトも変更出来る

使っている変数
sf.cg_flag
sf.cg_mode_init
global.cg

使い方
設定後、first.ksでcg_mode_init.ksを読み込む
例
@call cg_mode_init.ks
後はcg_mode.ksをサブルーチンとして呼べばよい
例
[link exp="kag.callExtraConductor('cg_mode.ks', '*cg_mode')"]CGモード[endlink]

設定方法

cg_mode.ksのラベル*backの右クリックの設定を環境にあわせてかえる。
cg_mode_init.ksの17行目からの各変数をコメントに従って書きかえる。


また、cg.complete()を実行することで全てのCGを見たことにできる

次にflagcgを画像を表示するマクロに組み込む
例
@macro name=im
@image *
@flagcg *
@endmacro
これでいちど表示した画像は記録される
ただし、storageで指定された文字列をcg.cg_storageから探して
記録しているので拡張子の有無は統一しなければならない
