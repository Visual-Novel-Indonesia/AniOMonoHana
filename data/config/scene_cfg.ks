[iscript]

tf.btnNum		= 6;//画面上にでるボタンの数
tf.sceneNum		= 15;//シーン数

var exit_button  = [652,552];	//戻るボタンの座標 x,y			ファイル名：scene_btn_exit

//ジャンプする・スクリプト　サムネイルとなるCG
var sceneFiles = [
	"",//dammy
	"00_020.ks","s",	//010
	"10_020.ks","s",	//020
	"20_000.ks","s",	//030
	"20_032.ks","s",	//040
	"30_010.ks","s",	//050
	"30_040.ks","s",	//060
	"40_040.ks","s",	//070
	"50_030.ks","s",	//080
	"60_030.ks","s",	//100
	"70_030.ks","s",	//110
	"70_062.ks","s",	//120
	"80_011.ks","s",	//130
	"90_010.ks","s",	//140
	"90_040.ks","s",	//150
	"90_050.ks","s"		//090
];


tf.sceneNum = (sceneFiles.count-1)/2;//シーン数を与えられた配列数より計数します。
tf.currentPageMax	= (int)Math.ceil(tf.sceneNum/tf.btnNum);//シーン数からページの最大値を計数します。

//サムネイルの大きさ
tf.thm_width=0;
tf.thm_height=0;

//200*150
//シーンボタンの座標
var btn_pos	=
[
	[40,130],
	[290,130],
	[540,130],

	[60,305],
	[310,305],
	[560,305]
];

//■ボタン内部の配置
//　ちとややこしいですが、ボタンの座標からの相対座標です。

//サムネイルの座標　シーンボタンの相対距離です
var thm_pos = [0,0];
//シーンタイトルの座標　シーンタイトルの相対距離です
var title_pos = [0,0];


//１シーンタイトルの高さ
tf.scene_title_height = 150;

//ページボタンの座標
var page = [
	[44, 552],
	[74, 552],
	[104,552],
	[134,552],
	[164,552],
	[194,552],
	[224,552],
	[254,552],
	[284,552]
];


[endscript]

[return]
