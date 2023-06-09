;------------------------------------------
;コンフィグ画面　環境設定ファイル
;
;背景画像ファイル		config_bg
;スライダーのツマミ		config_slider
;キャンセルボタン		config_cancel_init
;初期化ボタンの座標		config_init_init
;戻るボタン				config_btn_return
;画面効果　オンボタン	config_effect_on
;画面効果　オフボタン	config_effect_off
;画面効果　クリックでスキップボタン	config_effect_click
;既読判定　オンボタン	config_kidoku_on
;既読判定　オフボタン	config_kidoku_off
;------------------------------------------


[iscript]

//■コンフィグ画面の初期値

tf.windowopa	= 255;		/*	メッセージウィンドウ透明度	*/
tf.textSpeed = 45;//		テキスト速度
tf.pageWait  = 50;//		オート時のページウェイト
tf.bgmVolume = 30;//		BGMボリューム
tf.bgmVolume2= 30;//		BGM鑑賞モードのボリューム
tf.seVolume  = 50;//		SEのボリューム
tf.se2Volume = 60;//		BGVのボリューム
tf.se3Volume = 60;//		台詞に影響しないBGVのボリューム
tf.voiceVolume= 50;//		音声のボリューム
tf.kidokuSkip= false;//	既読判定
tf.transEffect= 'on';//	画面効果の設定
tf.autoSave= false;//	オートセーブ
tf.voiceFemale= true;//	女性ボイス
tf.voiceMale= true;//	男性ボイス
tf.vsetting= 0;//	リスニング環境の初期値(0で使用しない）




//■キャンセル・初期化・戻るボタンの座標

var cancel_button  = [143,556];//	キャンセルボタンの座標 x,y	ファイル名：config_cancel_init
var init_button    = [263,556];//	初期化ボタンの座標 x,y	ファイル名：config_init_init
var return_button  = [23 ,556];//	戻るボタンの座標 x,y	ファイル名：config_btn_return


//□ボリューム関係

tf.volume_mode = 'volume';//ボリュームモード　'slider'でツマミ付き。'volume'でツマミナシ

//○ウィンドウ透明度	スライダー
var window_opacity_slider	=[189,238,150,11];//x座標,y座標,スライダーの長さ,ボリュームの高さ（スライダー時は無視)

//○テキストのスピード	スライダー
var text_speed_slider	=[189,387,150,11];//x座標,y座標スライダーの長さ,ボリュームの高さ（スライダー時は無視)
//○ページウェイト		スライダー
var page_wait_slider	=[189,416,150,11];//x座標,y座標,スライダーの長さ,ボリュームの高さ（スライダー時は無視)

//○音声ボリューム		スライダー
var voice_volume_slider	=[588,298,150,11];//x座標,y座標,スライダーの長さ,ボリュームの高さ（スライダー時は無視)
//○ＢＧＭボリューム	スライダー
var bgm_volume_slider	=[588,328,150,11];//x座標,y座標,スライダーの長さ,ボリュームの高さ（スライダー時は無視)
//○ＳＥボリューム		スライダー
var se_volume_slider	=[588,357,150,11];//x座標,y座標,スライダーの長さ,ボリュームの高さ（スライダー時は無視)
//○ＢＧＶボリューム	スライダー
var se_volume_slider2	=[588,387,150,11];//x座標,y座標,スライダーの長さ,ボリュームの高さ（スライダー時は無視)
//○ＢＧＶボリューム	スライダー
var se_volume_slider3	=[588,416,150,11];//x座標,y座標,スライダーの長さ,ボリュームの高さ（スライダー時は無視)

//□ボリューム変更時のナンバー表示
tf.draw_slide_number	= false;//			ボリューム変更時にナンバーを表示するか　ファイル名：config_number
var text_speed_number	= [650,19];
var page_wait_number	= [650,60];
var bgm_volume_number	= [650,145];
var se_volume_number	= [650,189];
var voice_volume_number	= [650,100];

var voice_test	= [766,296];
var bgm_test	= [766,326];
var se_test		= [766,355];
var bgv_test	= [766,385];
var bgse_test	= [766,414];


//□機能ボタン関係
/*	メガネ機能	*/
var megane_on		= [182,88];		// メガネON			config_megane_on.png
var megane_off		= [236,88];		// メガネOFF		config_megane_off.png

var effect_on		= [182,142];	// 画面効果ON		ファイル名：config_effect_on.png
var effect_off		= [230,142];	// 画面効果OFF		ファイル名：config_effect_off.png
var effect_click	= [287,142];	// 画面効果clicskip	ファイル名：config_effect_click.png

var stfade_on		= [182,171];	// 文字表示のフェードON
var stfade_off		= [236,171];	// 文字表示のフェードOFF

var window_window	= [182,202];	// 画面サイズウインドウ	config_window_window.png
var window_full		= [269,202];	// 画面サイズフル			config_window_full.png

var kidoku_on		= [182,294];	// 既読判定オン			config_kidoku_on.png
var kidoku_off		= [236,294];	// 既読判定オフ			config_kidoku_off.png

var auto_wc_on		= [182,325];	// 句読点でウェイトを入れる　オン	config_autowc_on
var auto_wc_off		= [236,325];	// 句読点でウェイトを入れる　オフ	config_autowc_off

var font_gothic		= [182,355];
var font_mintyou	= [268,355];

var bgm_down_on		= [617,173];
var bgm_down_off	= [671,173];

var voicestop_on	= [617,204];
var voicestop_off	= [671,204];

var autosave_on		= [187,172];	// オートセーブオン		config_autosave_on.png
var autosave_off	= [241,172];	// オートセーブオフ		config_autosave_off.png

var hint			= [13,490,40];	// ヒントの位置(x,y)　１個の縦サイズ	config_hint.png

//□各種テストボタン

//VOICE
var	stest_voice		= 'titlecall00';

//BGM
var	stest_bgm		= 'bgm02';

//SE
var	stest_se		= 'se043';

//BGV
var	stest_bgv		= 'bgv023';

//BGSE
var	stest_bgse		= 'seha09';

//□リスニング環境におけるボリューム設定
tf.listen_mode = true;//リスニングボタンを使うか？

//スピーカー
tf.speaker_bgm_volume = 55;
tf.speaker_voice_volume = 80;
tf.speaker_se_volume = 60;
var speaker_button =[703,143];

//ヘッドホン
tf.head_bgm_volume = 60;
tf.head_voice_volume = 75;
tf.head_se_volume = 70;
var head_button =[617,143];





//□ボイス選択ボタン　男性ボイスが存在する時に使用する
tf.voice_choice = false;//ボイス選択ボタンを使うか？

var voice_male		= [187,96];//	男性ボイス選択の座標
var voice_female	= [242,96];//	女性ボイス選択の座標
[endscript]

[iscript]

//□ボイスフラグ関係　
//tf.femalesに設定した場合女性ボイスになります。
//tf.males　に設定した場合男性ボイスに認識されます。

tf.males = [
/*環*/ 'tmk'



];

tf.females = [
/*ウエイトレス*/ 'wt',
/*エミリ*/ 'em',
/*キャプテン*/ 'cp',
/*ネ　コ*/ 'ne',
/*ひかる*/ 'hi',
/*ひかる神*/ 'hik',
/*沙　樹*/ 'sk',
/*主　婦*/ 'sh',
/*女　Ａ*/ 'ga',
/*女　Ｂ*/ 'gb',
/*女　Ｃ*/ 'gc',
/*女*/ 'g',
/*女子*/ 'gl',
/*電　話*/ 'tl',
/*日　直*/ 'ni',
/*女子バスケ部*/ 'bs',
/*女　Ｃ*/ 'gc',
/*神　楽*/ 'kg',
/*相手Ａ*/ 'aa',
/*相手Ｂ*/ 'ab',
/*美　優*/ 'my',
/*美津子*/ 'mt',
/*未　冴*/ 'ms',
/*夏　生*/ 'nt'
];



[endscript]

[return]
