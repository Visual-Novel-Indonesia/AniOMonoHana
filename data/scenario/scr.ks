;=============================================================================;
;兄嫁は俺のモノを離さない～未亡人若女将の誘惑～
;=============================================================================;

;各種フラグ初期化
[eval exp="f.root_flg = 0"]
[eval exp="f.root_4022 = false"]

;=============================================================================;
*00|
;=============================================================================;

[call storage="00_000.ks"]
[call storage="00_010.ks"]

;010
[call storage="00_020.ks"]
[call storage="00_030.ks"]

[call storage="10_000.ks"]
[call storage="10_010.ks"]

;020
[call storage="10_020.ks"]
[call storage="10_030.ks"]

;030
[call storage="20_000.ks"]
[call storage="20_010.ks"]
[call storage="20_020.ks"]
[call storage="20_030.ks"]


;*************
;*	選択肢01 *
;*************
;選択肢１：仕事の邪魔はしない
;選択肢２：いたずらをする

[stopquake]
[hide_textwindow]
[exbuttonopt forevisible="false" backvisible="true"]
[begin_link]
[exbutton name="choice01" x="50"  y="133" file="choice01a" onclick="ChJump('', '*20_031')"]
[exbutton name="choice02" x="50"  y="323" file="choice01b" onclick="ChJump('', '*20_032')"]
[crossfade time="500"]
[end_link]

[wait_button]

;=============================================================================;
*20_031|
;=============================================================================;
[cm]
[exformopt delete="all" forevisible="false" backvisible="true"]
[hide_textwindow]

[call storage="20_031.ks"]

;元プロット
;[eval exp="f.root_flg = f.root_flg - 1"]

[jump target="*20_040"]

;======================================================;
*20_032|
;======================================================;
[cm]
[exformopt delete="all" forevisible="false" backvisible="true"]
[hide_textwindow]

;040
[call storage="20_032.ks"]

;元プロット
;[eval exp="f.root_flg = f.root_flg + 2"]

[eval exp="f.root_flg = f.root_flg + 1"]

[jump target="*20_040"]


;======================================================;
*20_040|
;======================================================;


[call storage="20_040.ks"]

[call storage="30_000.ks"]

;050
[call storage="30_010.ks"]
[call storage="30_020.ks"]
[call storage="30_030.ks"]

;060
[call storage="30_040.ks"]
[call storage="30_050.ks"]

[call storage="40_000.ks"]
[call storage="40_010.ks"]
[call storage="40_020.ks"]


;*************
;*	選択肢02 *
;*************
;選択肢１：『そうだな、それがいいかもしれない』と親の意見に賛成する
;選択肢２：『義姉さんのことをちゃんと考えてやれよ』と親の意見を否定する

;この時点のフラグは-1か+2

[stopquake]
[hide_textwindow]
[exbuttonopt forevisible="false" backvisible="true"]
[begin_link]
[exbutton name="choice01" x="50"  y="133" file="choice02a" onclick="ChJump('', '*40_021')"]
[exbutton name="choice02" x="50"  y="323" file="choice02b" onclick="ChJump('', '*40_022')"]
[crossfade time="500"]
[end_link]

[wait_button]

;=============================================================================;
*40_021|
;=============================================================================;
[cm]
[exformopt delete="all" forevisible="false" backvisible="true"]
[hide_textwindow]

[call storage="40_021.ks"]

;元プロット
;[eval exp="f.root_flg = f.root_flg - 1"]

[jump target="*40_030"]


;=============================================================================;
*40_022|
;=============================================================================;
[cm]
[exformopt delete="all" forevisible="false" backvisible="true"]
[hide_textwindow]

[call storage="40_022.ks"]

[eval exp="f.root_flg = f.root_flg + 1"]

[eval exp="f.root_4022 = true"]

[jump target="*40_030"]


;=============================================================================;
*40_030|
;=============================================================================;


[call storage="40_030.ks"]

;070
[call storage="40_040.ks"]
[call storage="40_050.ks"]

[call storage="50_000.ks"]
[call storage="50_010.ks"]
[call storage="50_020.ks"]

;080
[call storage="50_030.ks"]
[call storage="50_040.ks"]

[call storage="60_000.ks"]
[call storage="60_010.ks"]
[call storage="60_020.ks"]

;100
[call storage="60_030.ks"]
[call storage="60_040.ks"]

[call storage="70_000.ks"]
[call storage="70_010.ks"]
[call storage="70_020.ks"]

;110
[call storage="70_030.ks"]
[call storage="70_040.ks"]
[call storage="70_050.ks"]
[call storage="70_060.ks"]


;*************
;*	選択肢03 *
;*************
;選択肢１：マッサージだけで我慢する
;選択肢２：マッサージだけじゃ我慢できない

;この時点のフラグは-2か0か1か+3

[stopquake]
[hide_textwindow]
[exbuttonopt forevisible="false" backvisible="true"]
[begin_link]
[exbutton name="choice01" x="50"  y="133" file="choice03a" onclick="ChJump('', '*70_061')"]
[exbutton name="choice02" x="50"  y="323" file="choice03b" onclick="ChJump('', '*70_062')"]
[crossfade time="500"]
[end_link]

[wait_button]

;=============================================================================;
*70_061|
;=============================================================================;
[cm]
[exformopt delete="all" forevisible="false" backvisible="true"]
[hide_textwindow]

[call storage="70_061.ks"]

;元プロット
;[eval exp="f.root_flg = f.root_flg - 1"]

[jump target="*70_070"]


;=============================================================================;
*70_062|
;=============================================================================;
[cm]
[exformopt delete="all" forevisible="false" backvisible="true"]
[hide_textwindow]

;120
[call storage="70_062.ks"]

;元プロット
;[eval exp="f.root_flg = f.root_flg + 2"]

[eval exp="f.root_flg = f.root_flg + 1"]

[jump target="*70_070"]


;=============================================================================;
*70_070|
;=============================================================================;


[call storage="70_070.ks"]

[call storage="80_000.ks"]
[call storage="80_010.ks"]

[if exp="f.root_4022 = true"]
	[jump target="*80_011"]
[else]
	[jump target="*80_020"]
[endif]


;=============================================================================;
*80_011|
;=============================================================================;

;130
[call storage="80_011.ks"]

[jump target="*90_000"]


;=============================================================================;
*80_020|
;=============================================================================;

[call storage="80_020.ks"]

[jump target="*90_000"]


;=============================================================================;
*90_000|
;=============================================================================;


[call storage="90_000.ks"]

;140
[call storage="90_010.ks"]

;シーン内選択肢04

;この時点の旧フラグは-3 -1 0 2 3 5

;選択肢１：中に出す　フラグ＋１
;選択肢２：外に出す

;元プロット
;選択肢２：外に出す　フラグ－１

[call storage="90_020.ks"]

;旧最終フラグ値は-4 -2 -1 0 1 2 3 4 6のどれか

[if exp="f.root_flg > 2"]
	[jump target="*90_030"]
[endif]

[jump target="*90_999"]


;=============================================================================;
*90_030|
;=============================================================================;

[call storage="90_030.ks"]

;150
[call storage="90_040.ks"]

[call storage="ed.ks"]

;090
[call storage="90_050.ks"]

[jump target="*GameEnd"]

;=============================================================================;
*90_999|
;=============================================================================;

[call storage="90_999.ks"]

[call storage="ed.ks"]

[jump target="*GameEnd"]


;[eval exp="f.ed01 = true"]
;[eval exp="f.ed02 = true"]

;=============================================================================;
;終了処理
;=============================================================================;
*GameEnd|
[cm]


*Gamebad|

;終了処理
[stopquake]
[stopquakesp]
[exmenuopt delete="all"]
[exsmenuopt delete="all"]
[exformopt delete="all"]
[exbuttonopt delete="all"]

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

[eval exp="sf.end = true"]

[return]
