
[clearvar]
[pluginlayer_clear]
[call target="*set_scenario_mode"]

*scenario|シナリオスタート

@image storage="clear" layer=0 page=fore visible=true
@image storage="clear" layer=1 page=fore visible=true
@image storage="clear" layer=2 page=fore visible=true
@image storage="clear" layer=3 page=fore visible=true
@image storage="clear" layer=4 page=fore visible=true
@image storage="clear" layer=5 page=fore visible=true
@image storage="clear" layer=10 page=fore visible=true
[backlay]

[call storage="scr.ks"]
[return]

*set_scenario_mode
[eval exp="tf.scene_mode = false"]
[jump target="*junction"]

*set_scene_mode
[eval exp="tf.scene_mode = true"]
[jump target="*junction"]

*junction
[cancelskip]
[cancelautomode]
[history enabled="true" output="true"]
[clickskip enabled="true"]
[nextskip enabled="true"]

;rclick制御
[if exp="sf.rclickmenu == false"]
	[rclick enabled="true" name="default" call="false" jump="false"]
[else]
	[rclick enabled="true" call="true" storage="r_click.ks" target="*r_click"]
[endif]

[disablestore store="false" restore="false"]
[autowc enabled="true"]

[exformopt delete="all"]

[exbuttonopt delete="all"]
[exbuttonopt forevisible="false" backvisible="true"]

;メッセージウィンドウボタンと併用時の上部メニュー
[if exp="sf.meswinbutton && sf.shoutcutmenu"]
	[exmenuopt delete="all"]
	[exmenu name="config" x="0" y="0" file="menu_config" onclick="config()"]
	[exmenu name="save" x="100" y="0" file="menu_save" onclick="save()" onenablecheck="tf.scene_mode!==true&& sf.trial!==true"]
	[exmenu name="load" x="200" y="0" file="menu_load" onclick="load()"  onenablecheck="tf.scene_mode!==true && sf.trial!==true"]
	[exmenu name="log" x="300" y="0" file="menu_log" onclick="showHistory()"]
	[exmenu name="back" x="400" y="0" file="menu_back" onclick="backHistory()" onenablecheck="tf.scene_mode!==true && canBackHistory()"]
	[exmenu name="return" x="550" y="0" file="menu_return" onclick="goToStart()" onenablecheck="tf.scene_mode!==true"]
	[exmenu name="exit" x="700" y="0" file="menu_exit" onclick="exit()"]
[endif]

;上部メニューバーですべて操作
[if exp="sf.menubar && sf.shoutcutmenu == false"] 
	[exmenuopt delete="all"]
	[exmenu name="system" x="0" y="0" file="s_menu_system"]
	[exmenu name="qsave" x="100" y="0" file="s_menu_qsave" onclick="quickSave()" onenablecheck="tf.scene_mode!==true"]
	[exmenu name="qload" x="200" y="0" file="s_menu_qload" onclick="quickLoad()"  onenablecheck="tf.scene_mode!==true"]
	[exmenu name="back" x="300" y="0" file="s_menu_back" onclick="backHistory()" onenablecheck="tf.scene_mode!==true && canBackHistory()"]
	[exmenu name="voice" x="400" y="0" file="s_menu_voicer" onclick="voiceRepeat()" onenablecheck="f.lastVoice!==void"]
	[exmenu name="log" x="500" y="0" file="s_menu_log" onclick="showHistory()"]
	[exmenu name="auto" x="600" y="0" file="s_menu_auto" onclick="auto()"]
	[exmenu name="skip" x="700" y="0" file="s_menu_skip" onclick="skip()"]

	[exmenu name="config" parent="system" x="0" y="25" file="sc_menu_config" onclick="config()" onenablecheck="sf.trial!==true"]
	[exmenu name="save" parent="system" x="0" y="50" file="sc_menu_save" onclick="save()" onenablecheck="tf.scene_mode!==true && sf.trial!==true"]
	[exmenu name="load" parent="system" x="0" y="75" file="sc_menu_load" onclick="load()" onenablecheck="tf.scene_mode!==true && sf.trial!==true"]
	[exmenu name="return" parent="system" x="0" y="100" file="sc_menu_return" onclick="goToStart()" onenablecheck="tf.scene_mode!==true"]
	[exmenu name="exit" parent="system" x="0" y="125" file="sc_menu_exit" onclick="exit()"]
[endif]

;exsmenuの使いみちがいまいちわからんのでソース放置
;[if exp="sf.shoutcutmenu && sf.meswinbutton == false"] 
;	[exmenu name="config" x="0" y="0" file="menu_config" onclick="config()"]
;	[exmenu name="save" x="100" y="0" file="menu_save" onclick="save()" onenablecheck="tf.scene_mode!==true"]
;	[exmenu name="load" x="200" y="0" file="menu_load" onclick="load()" onenablecheck="tf.scene_mode!==true"]
;	[exmenu name="back" x="300" y="0" file="menu_back" onclick="backHistory()" onenablecheck="tf.scene_mode!==true && canBackHistory()"]
;	[exmenu name="log" x="400" y="0" file="menu_log" onclick="showHistory()"]
;	[exmenu name="voice" x="500" y="0" file="menu_voice" onclick="voiceRepeat()" onenablecheck="f.lastVoice!==void"]
;	[exmenu name="return" x="600" y="0" file="menu_return" onclick="goToStart()" onenablecheck="tf.scene_mode!==true"]
;	[exmenu name="exit" x="700" y="0" file="menu_exit" onclick="exit()"]

;	[exsmenu name="s_auto" x="150" y="575" file="smenu_btn_auto" onclick="auto()"]
;	[exsmenu name="s_qsave" x="250" y="575" file="smenu_btn_qsave" onclick="quickSave()" onenablecheck="tf.scene_mode!==true"]
;	[exsmenu name="s_qload" x="350" y="575" file="smenu_btn_qload" onclick="quickLoad()"  onenablecheck="tf.scene_mode!==true"]
;	[exsmenu name="s_voice" x="450" y="575" file="smenu_btn_voicer" onclick="voiceRepeat()" onenablecheck="f.lastVoice!==void"]
;	[exsmenu name="skip" x="550" y="575" file="smenu_btn_skip" onclick="skip()"]
;[endif]


[eval exp="clearHistory()"]

[if exp="tf.scene_mode == false"]

	[exkeybindopt enable="true" delete="all"]

[endif]

[exkeybind key="VK_RETURN" shift="ssAlt" exp="toggleScreenMode()"]
[exkeybind key="VK_SPACE" exp="toggleMessageShowing()"]


[current layer="message0" page="fore" withback="true"]
[backlay layer="message0"]

;// 文字のフェード状態の設定
[defstyle fade="&sf.config.stfade"]
[current layer="message1" page="fore" withback="true"]
[defstyle fade="&sf.config.stfade"]
[current layer="message4" page="fore" withback="true"]

[deffont size="22" face="&sf.config.fontFace" bold="false" edge="false" edgecolor="0x000000" shadow="false"  color="0xffffff"]
[resetfont]
[cm]

[eval exp="f.textwindowVisble=false"]




;[glyph fix="true" left="720" top="520"]
[if exp="tf.start==true"]
[bg file="black"]
@image storage="clear" layer=0 page=fore visible=true
@image storage="clear" layer=1 page=fore visible=true
@image storage="clear" layer=2 page=fore visible=true
@image storage="clear" layer=3 page=fore visible=true
@image storage="clear" layer=4 page=fore visible=true
[crossfade time="500"]
[endif]

[eval exp="tf.start=false"]


[return]
