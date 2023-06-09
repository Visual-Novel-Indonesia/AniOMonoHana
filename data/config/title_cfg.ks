;------------------------------------------
;タイトル画面　環境設定ファイル
;
;各種審査機関ロゴファイル	:medi1～3.png
;ブランドロゴファイル		:logo.png
;ブランドコールファイル		:brandcall00～09.ogg
;警告文ファイル				:caution.png
;タイトルコールファイル		:titlecall00～09.ogg
;背景画像ファイル			:title_bg.png
;体験版背景画像ファイル		:trial_bg.png
;2015/06/12 作成
;------------------------------------------

[iscript]

//ブランドコール
tf.brandcall_mode = true ;	//ブランドコールを行うか true/false
tf.brandcall_char = 1 ;	//キャラクターの人数

//タイトルコール
tf.titlecall_mode = true ;
tf.titlecall_char = 1 ;

//bgm番号
tf.bgmfile	= "bgm20";

//各種ボタンの座標
var	titlebtn_pos	=
[
	[	66,		513	],	//start
	[	170,	513	],	//qload
	[	336,	513	],	//load
	[	576,	513	],	//config
	[	446,	513	],	//omake
	[	700,	513	],	//exit
//ここから体験版
	[	66,		513	],	//start
	[	170,	513	],	//qload
	[	446,	513	],	//config
	[	700,	513	],	//exit
];

[endscript]

[return]
