
;レイヤ初期化
[tempsave place="1"]
[clear_message_layer]

[stop_bgm fadeout="0"]
[stopse buf="2"]

[call storage="title_cfg.ks"]

;メディ倫テロップ
*medi|
[clickskip enabled="false"]

;[if exp="sf.trial == false"]
;	[haikei file="medi1" st="bg" fade="cross" time="500"]
;	[wait time="2000"]

;	[haikei file="white" st="bg" fade="cross" time="500"]
;	[wait time="1000"]

;	[haikei file="medi2" st="bg" fade="cross" time="1500"]
;	[wait time="3000"]

;	[haikei file="white" st="bg" fade="cross" time="500"]
;	[wait time="1000"]

;	[haikei file="medi3" st="bg" fade="cross" time="1500"]
;	[wait time="3000"]

;	[haikei file="white" st="bg" fade="cross" time="500"]
;	[wait time="1000"]
;[endif]

[clickskip enable="true"]

;ブランドロゴ
*bland|

;クリックされたら特定の段落に飛ぶ（今回はtitle）
;命令発行
[clickjump label="*pre_title"]


;ここからはクリックされると*titleへジャンプ

[haikei file="logo00" st="bg" fade="cross" time="1500"]
[haikei file="logo01" st="bg" fade="28" time="1500"]

;ブランドコール
[if exp="tf.brandcall_mode == true"]
	[eval exp="f.ramdom = intrandom( 0, 50 )"]
	[eval exp="f.ramdom = f.ramdom % tf.brandcall_char"]
	
	[eval exp="f.brandcall = 'brandcall0' + f.ramdom"]
	[se file="&f.brandcall"]
[endif]

[wait time="4000"]

[haikei file="white" st="bg" fade="cross" time="500"]

[wait time="1000"]

;警告文
[bg file="black"]
[crossfade time="2000"]

;[haikei file="caution001" st="bg" fade="cross" time="1500"]

;[wait time="1000"]

;[haikei file="caution002" st="bg" fade="cross" time="1500"]
;[wait time="1000"]

;[haikei file="caution003" st="bg" fade="cross" time="1500"]
;[wait time="3000"]

;[bg file="black"]
;[crossfade time="2000"]

*pre_title|

;BGV_stop
[stopse buf="2"]


[eval exp="tf.start = true"]

;クリックで飛ばした際に残る直前の画面情報を消す
[bg file="black"]
[crossfade time="0"]

*title|

[bg file="black"]
[crossfade time="0"]

;ジャンプ命令の取り消し
[endclickjump]

;初期化
[freeimage layer="19" page="back"]
[freeimage layer="18" page="back"]
[freeimage layer="17" page="back"]
[freeimage layer="16" page="back"]
[freeimage layer="15" page="back"]
[freeimage layer="14" page="back"]
[freeimage layer="13" page="back"]

[backlay]
[layopt layer="message0" page="back" visible="false"]
[layopt layer="message1" page="back" visible="false"]
[layopt layer="message2" page="back" visible="false"]
[layopt layer="message3" page="back" visible="false"]
[layopt layer="message4" page="back" visible="false"]

[layopt layer="0" page="back" visible="false"]
[layopt layer="1" page="back" visible="false"]
[layopt layer="2" page="back" visible="false"]
[layopt layer="3" page="back" visible="false"]
[layopt layer="4" page="back" visible="false"]
[layopt layer="5" page="back" visible="false"]
[layopt layer="13" page="back" visible="false"]
[layopt layer="14" page="back" visible="false"]
[layopt layer="15" page="back" visible="false"]

[reset_color_mode]
[startanchor]

[if exp="f.textwindowVisble==true"]
	[layopt layer="message1" visible="false" page="back"]
	[layopt layer="message2" visible="false" page="back"]
	[exbuttonopt forevisible="true" backvisible="false"]
	[crossfade time="500"]
	[exbuttonopt delete="all"]
	[eval exp="f.textwindowVisble=false"]
[endif]


[call target="*set_title_mode"]
[clear_message_layer]

[backlay]


*reload
[stop_bgm fadeout="2000"]
[stopse buf="2"]

[bg file="title_bg"]
[crossfade time="500"]

[if exp="sf.trial == true"]
	[bg file="trial_bg"]
	[crossfade time="500"]
[endif]

;[trans method="crossfade" layer="base" children="false" time="500"]

[bgm file="&tf.bgmfile"]

[clear_message_layer]
[if exp="tf.start != true"]
	[bgm file="&tf.bgmfile"]
[endif]

[stop_se]
[stopse buf="2"]


;;タイトルコール
[if exp="tf.titlecall_mode == true"]
	[eval exp="f.ramdom = intrandom( 0, 50 )"]
	[eval exp="f.ramdom = f.ramdom % tf.titlecall_char"]
	
	[eval exp="f.titlecall = 'titlecall0' + f.ramdom"]
	[se file="&f.titlecall"]
[endif]

;ボタン描画
[exformopt delete="all" forevisible="false" backvisible="true"]


[iscript]
	tf.btn	= titlebtn_pos;
[endscript]

;通常　タイトルボタン
[if exp="sf.trial == false"]

	;スタート
	[exbutton name="start" x="&tf.btn[0][0]" y="&tf.btn[0][1]" file="title_btn_start" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),kag.process('', '*start')"]

	;クイックロード
	[exbutton name="qload" x="&tf.btn[1][0]" y="&tf.btn[1][1]" file="title_btn_qload" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),quickLoad()"]

	;ロード
	[exbutton name="load"  x="&tf.btn[2][0]" y="&tf.btn[2][1]" file="title_btn_load" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),load()"]

	;おまけ
	[if exp="sf.end == true"]
		[exbutton name="omake" x="&tf.btn[3][0]" y="&tf.btn[3][1]" file="title_btn_omake" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),kag.process('', '*omake')"]
	[endif]

	;コンフィグ
	[exbutton name="config" x="&tf.btn[4][0]" y="&tf.btn[4][1]" file="title_btn_config"  onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),config()"]

	;EXIT
	[exbutton name="exit" x="&tf.btn[5][0]" y="&tf.btn[5][1]" file="title_btn_exit" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),exit()"]

[endif]

;体験版　タイトルボタン
[if exp="sf.trial == true"]

	;スタート
	[exbutton name="start" x="&tf.btn[6][0]" y="&tf.btn[6][1]" file="title_btn_start" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),kag.process('', '*start')"]

	;クイックロード
	[exbutton name="qload" x="&tf.btn[7][0]" y="&tf.btn[7][1]" file="title_btn_qload" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),quickLoad()"]

	;コンフィグ
	[exbutton name="config" x="&tf.btn[8][0]" y="&tf.btn[8][1]" file="title_btn_config"  onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),config()"]

	;EXIT
	[exbutton name="exit" x="&tf.btn[9][0]" y="&tf.btn[9][1]" file="title_btn_exit" onenter="kag.se[1].play(%[storage:'sys007', loop:false])" onleave="" onclick="kag.se[1].play(%[storage:'sys013', loop:false]),exit()"]

[endif]

[wait time="500" canskip="true"]

[freeimage layer="19" page="back"]
[freeimage layer="18" page="back"]
[freeimage layer="17" page="back"]
[freeimage layer="16" page="back"]
[crossfade time="500"]

*wait
[s]

*start
;;ＢＧＭストップ
[stop_bgm fadeout="3000"]
[eval exp="tf.game_mode = 1"]

[eval exp="tf.start=true"]
[bg file="black"]
[hide_layer no="0"]
[hide_layer no="1"]
[hide_layer no="2"]
[hide_layer no="3"]
[hide_layer no="4"]
[hide_layer no="5"]
[exbuttonopt forevisible="true" backvisible="false"]
[crossfade time="500"]

[iscript]
kag.historyOfStore=[];
[endscript]

[call storage="mode_scenario.ks"]
[jump target="*title"]

*qload
;[eval exp="quickLoad()"]
;[jump target="*wait"]

*load
;[eval exp="loadMode()"]
;[jump target="*wait"]

*omake
[stop_bgm fadeout="2000"]
[call storage="mode_omake.ks"]
[jump target="*reload"]

*exit
[jump target="*wait" cond="showDialog(4)=='no'"]
[tempload place="1" backlay="true"]

[stop_bgm fadeout="3000"]

[exbuttonopt delete="all"]
[crossfade time="500"]

[return]


*set_title_mode
[history enabled="false" output="false"]
[clickskip enabled="false"]
[nextskip enabled="false"]
[rclick enabled="false"]
[disablestore store="true" restore="true"]
[autowc enabled="false"]
[exmenuopt delete="all"]
[exsmenuopt delete="all"]

[eval exp="tf.title_mode = true"]

[exkeybindopt enable="true" delete="all"]
[exkeybind key="VK_RETURN" shift="ssAlt" exp="toggleScreenMode()"]
[return]


