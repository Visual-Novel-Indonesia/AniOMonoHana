;■更新履歴
;2010/12/03		ネガポジモード追加

*init_config
[call storage="config_cfg.ks"]

[if exp="sf.init_config!==true"]
	[iscript]
	sf.config = %[];
	sf.config.windowopa		= tf.windowopa;		// メッセージウィンドウ透過度
	sf.config.textSpeed		= tf.textSpeed;
	sf.config.bgmVolume		= tf.bgmVolume;
	sf.config.bgmVolume2	= tf.bgmVolume2;
	sf.config.seVolume		= tf.seVolume;
	sf.config.se2Volume		= tf.se2Volume;		// BGV
	sf.config.se3Volume		= tf.se3Volume;		// BGSE
	sf.config.voiceVolume	= tf.voiceVolume;
	sf.config.pageWait		= tf.pageWait;
	sf.config.kidokuSkip	= tf.kidokuSkip;
	sf.config.transEffect	= tf.transEffect;
	sf.config.autoSave		= tf.autoSave;
	sf.config.voiceFemale	= tf.voiceFemale;
	sf.config.voiceMale		= tf.voiceMale;
	sf.config.fontFace		= 'ＭＳ ゴシック';
	sf.config.autowc		= true;
	sf.config.voicestop		= true;
	sf.config.bgm_down		= false;
//	sf.config.voiceDetails	= false;
	sf.config.vsetting		= tf.vsetting;
	sf.config.megane		= true;			// メガネ等のCG差し替え処理用変数
	sf.config.stfade		= true;				// 文字のフェード状態保持変数
	sf.init_config			= true;
	[endscript]
[endif]

[iscript]
sf._voice_ = %[];
sf.usevoice = %[];
[endscript]


[call target="*set_window_opa"]
[call target="*set_kidoku"]
[call target="*set_text_speed"]
[call target="*set_bgm_volume"]
[call target="*set_se_volume"]
[call target="*set_se2_volume"]
[call target="*set_se3_volume"]
[call target="*set_voice_volume"]
[call target="*set_page_wait"]

[return]


*store_config
[iscript]
tf.config = %[];
(Dictionary.assignStruct incontextof tf.config)(sf.config);
tf.voiceflag = %[];
sf._voice_ = %[] if sf._voice_===void;
(Dictionary.assignStruct incontextof tf.voiceflag)(sf._voice_);
[endscript]
[return]

*restore_config
[iscript]
(Dictionary.assignStruct incontextof sf.config)(tf.config);
(Dictionary.assignStruct incontextof sf._voice_)(tf.voiceflag);
[endscript]
[call target="*init_config"]
[return]




;/***************************************/
;/*	メッセージウィンドウの透明度設定	*/
;/***************************************/
*set_window_opa
[eval exp="setWindowOpacity(sf.config.windowopa)"]
[return]

*set_kidoku
[labelopt kidokuskip="&sf.config.kidokuSkip"]
;[eval exp="Debug.message('■■■kidoku='+sf.config.kidokuSkip)"]
[return]

*set_text_speed
[eval exp="setTextSpeed(sf.config.textSpeed)"]
;[eval exp="Debug.message('■■■text_speed='+sf.config.textSpeed)"]
[return]

*set_bgm_volume
[bgmopt gvolume="&sf.config.bgmVolume"]
;[eval exp="Debug.message('■■■bgm_volume='+sf.config.bgmVolume)"]
[return]

*set_voice_volume
[seopt buf="0" gvolume="&sf.config.voiceVolume"]
;[eval exp="Debug.message('■■■voice_volume='+sf.config.voiceVolume)"]
[return]

*set_se_volume
[seopt buf="1" gvolume="&sf.config.seVolume"]
;[eval exp="Debug.message('■■■se_volume='+sf.config.seVolume)"]
[return]

*set_se2_volume
[seopt buf="2" gvolume="&sf.config.se2Volume"]
;[eval exp="Debug.message('■■■se_volume='+sf.config.se2Volume)"]
[return]

*set_se3_volume
[seopt buf="3" gvolume="&sf.config.se3Volume"]
;[eval exp="Debug.message('■■■se_volume='+sf.config.se3Volume)"]
[return]

*set_wc
[autowc enabled="&sf.config.autowc" ch="、。…―！？"  time="8,2,6,6,6,8"]
[return]

*set_page_wait
[iscript]
var page = (int)(2000 - (sf.config.pageWait / 100 * 1600));	//400-2000
var line = (int)(2000 - (sf.config.pageWait / 100 * 1600));	//180-500
setAutoWait(page, line);
[endscript]
;[eval exp="Debug.message('■■■page_wait='+sf.config.pageWait)"]
[return]






*config
[call storage="config_cfg.ks"]

[iscript]


function showHint(no, layer=2, page='fore')
{
	var dstlayer = page=='fore' ? kag.fore.layers[layer] : kag.back.layers[layer];
	var srclayer = kag.back.layers[3];

	dstlayer.copyRect(hint[0], hint[1], srclayer, 0,hint[2]*no, srclayer.width, hint[2]);
}

function hideHint(layer=2, page='fore')
{
	var dstlayer = page=='fore' ? kag.fore.layers[layer] : kag.back.layers[layer];
	var srclayer = kag.back.layers[3];
	var clearlayer = kag.back.layers[2];

	dstlayer.copyRect(hint[0], hint[1], kag.back.layers[2],hint[0], hint[1],srclayer.width,hint[2], hint[2]);
}


function uncheck(group, no, layer=2, page='fore')
{
	var grp = tf.positions[group];
	if (no < 0 || no > grp.count) {
		return;
	}
	var pos = grp[no];
	var srclayer = pos.arrow===true ? kag.back.layers[1] : kag.back.layers[0];
	var dstlayer = page=='fore' ? kag.fore.layers[layer] : kag.back.layers[layer];
	dstlayer.fillRect(pos.x, pos.y, srclayer.width, srclayer.height, 0);
}

function check(group, no, layer=2, page='fore')
{
	var grp = tf.positions[group];
	if (no < 0 || no > grp.count) {
		return;
	}

	var dstlayer = page=='fore' ? kag.fore.layers[layer] : kag.back.layers[layer];
	
	for (var i = 1; i < grp.count; i++) {
		var pos = grp[i];
		var srclayer = pos.arrow===true ? kag.back.layers[1] : kag.back.layers[0];
		if (i == no) {
//			dstlayer.copyRect(pos.x, pos.y, srclayer, 0, 0, srclayer.width, srclayer.height);
		}
		else if (pos.grp!==false) {
			dstlayer.fillRect(pos.x, pos.y, srclayer.width, srclayer.height, 0);
		}
	}
}



function setMalesVoiceFlag(flag)
{
	for (var i = 0; i < tf.males.count; i++) {
		Debug.message('set:'+tf.males[i]);
		setVoiceFlag(tf.males[i], flag);
	}
}
function setFemalesVoiceFlag(flag)
{
	for (var i = 0; i < tf.females.count; i++) {
		Debug.message('set:'+tf.males[i]);
		setVoiceFlag(tf.females[i], flag);
	}
}


function setAthersVoiceFlag(flag)
{
	for (var i = 0; i < tf.athers.count; i++) {
		setVoiceFlag(tf.athers[i], flag);
	}
}

function drawVolume(id)
{
	if (tf.draw_slide_number == true) {
		var layer = kag.fore.layers[2];
		var tmp;
		switch (id) {
		case 'voice':
			drawNumber(sf.config.voiceVolume, 'config_number', layer, voice_volume_number[0], voice_volume_number[1], 3);
			break;
		case 'bgm':
			drawNumber(sf.config.bgmVolume, 'config_number', layer, bgm_volume_number[0], bgm_volume_number[1], 3);
			break;
		case 'se':
			drawNumber(sf.config.seVolume, 'config_number', layer, se_volume_number[0], se_volume_number[1], 3);
			break;
		case 'se2':
			drawNumber(sf.config.se2Volume, 'config_number', layer, se_volume_number[0],se_volume_number[1], 3);
			break;
		case 'se3':
			drawNumber(sf.config.se3Volume, 'config_number', layer, se_volume_number[0],se_volume_number[1], 3);
			break;
		case 'textspeed':
			tmp = -(int)(sf.config.textSpeed-100);
			drawNumber(tmp, 'config_number', layer, text_speed_number[0], text_speed_number[1], 3);
			break;
		case 'pagewait':
			tmp = -(int)(sf.config.pageWait-100);
			drawNumber(tmp, 'config_number', layer, text_speed_number[0], page_wait_number[1], 3);
			break;
		}
	}
}
function eraseVolume(id)
{
	var layer = kag.fore.layers[2];
	switch (id) {
	case 'voice':
		layer.fillRect(650, 105, 24, 18, 0);
		break;
	case 'bgm':
		layer.fillRect(650, 150, 24, 18, 0);
		break;
	case 'se':
		layer.fillRect(650, 194, 24, 18, 0);
		break;
	case 'se2':
		layer.fillRect(650, 235, 24, 18, 0);
		break;
	case 'textspeed':
		layer.fillRect(650, 24, 24, 18, 0);
		break;
	case 'pagewait':
		layer.fillRect(650, 65, 24, 18, 0);
		break;
	}
}
[endscript]

[call target="*store_config"]

[tempsave place="2"]
[backlay]

[stopquake]
[history enabled="false"]

;フェード時に判定を持たないように表画面のクリッカブルマップを終わらせる
;裏画面は画面切り替え処理で他の処理に書き換わる
[mapdisable layer="base" page="fore"]

[endzoomex]


[hide_all_layer page="back"]
[layopt layer="message0" page="back" visible="false"]
[layopt layer="message1" page="back" visible="false"]
[layopt layer="message2" page="back" visible="false"]
[layopt layer="message3" page="back" visible="false"]
[layopt layer="message4" page="back" visible="false"]

[rclick storage="mode_config.ks" target="*exit" jump="true" enabled="true"]
[exkeybind key="VK_SPACE" exp=""]

[image storage="config_bg" layer="base" page="back"]

;チェックマーク用
[layer no="2" file="clear"]
[layer no="3" file="config_hint"]
[layopt layer="0" page="back" left="&kag.scWidth"]
[layopt layer="1" page="back" left="&kag.scWidth"]
[layopt layer="3" page="back" left="&kag.scWidth"]

@eval exp="fubuki_object.uninit()"
@eval exp="snow_object.uninit()"

[exmenuopt delete="all"]
[exsmenuopt delete="all"]
[exformopt delete="all" forevisible="false" backvisible="true"]
[call target="*createbtn"]

[crossfade time="500"]

*wait
[s]


*cancel
[call target="*restore_config"]


*exit
*ok

;20180508 temploadでBGV BGSEも保存するように変更
;[tempload place="2" backlay="true" bgm="true" se="false"]
[tempload place="2" backlay="true" bgm="true" se="true"]

[if exp="f.sepia_mode == true"]
	[sepia_mode]
[endif]

[if exp="f.gray_mode == true"]
	[gray_mode]
[endif]

[if exp="f.pink_mode == true"]
	[pink_mode]
[endif]

;	ネガポジモード追加	2010/12/03
[if exp="f.negaposi_mode == true"]
	[negaposi_mode]
[endif]

;直前が拡大状態なら拡大状態に裏画面を操作
[if exp="f.cgzoom == true"]
[iscript]
	cgzoom_object.dispstretchdib( f.cgzoomdic.file, f.cgzoomdic.dl, f.cgzoomdic.dt, f.cgzoomdic.dw, f.cgzoomdic.dh, "back" );
[endscript]
[endif]

[if exp="tf.fubuki == true"]
[fubukiinit forevisible=false backvisible=true]
[endif]

[if exp="tf.snow == true"]
[snowinit forevisible=false backvisible=true]
[endif]

[exformopt forevisible="false" backvisible="true"]
[crossfade time="500"]

[eval exp="kag.onMouseMove=global.KAGWindow.onMouseMove"]
[exkeybind key="VK_SPACE" exp="toggleMessageShowing()"]

;temploadで情報が保存されているから必要なし
;[playbgm storage="&tf.playingbgm" cond="tf.playingbgm =! kag.bgm.playingStorage"]


[eval exp="setMalesVoiceFlag(sf.config.voiceMale)"]
[eval exp="setFemalesVoiceFlag(sf.config.voiceFemale)"]

;20180508 configから戻ったあとにテストボタンも兼ねBGV・BGSEを消していたのをtemploadにBGV・SEを保存することで修正
;[stopse buf="2"]

[call target="*set_window_opa"]
[call target="*set_text_speed"]
[call target="*set_page_wait"]
[call target="*set_kidoku"]
[call target="*set_font"]
[call target="*set_wc"]
[call target="*set_stfade"]

[return]


*init
[eval exp="sf.init_config=false"]
[call target="*init_config"]
[exformopt delete="all" forevisible="true" backvisible="true"]
[layer no="2" file="clear"]
[call target="*createbtn"]
[forelay]
[jump target="*wait"]


*text_speed
[eval exp="sf.config.textSpeed=tf.text_speed"]
[jump target="*wait"]


*page_wait
[eval exp="sf.config.pageWait=tf.page_wait"]
[jump target="*wait"]


*bgm_volume
[eval exp="sf.config.bgmVolume=tf.bgm_volume"]
[call target="*set_bgm_volume"]
[jump target="*wait"]


*se_volume
[eval exp="sf.config.seVolume=tf.se_volume"]
[call target="*set_se_volume"]
[jump target="*wait"]

*se2_volume
[eval exp="sf.config.se2Volume=tf.se2_volume"]
[call target="*set_se2_volume"]
[jump target="*wait"]

*se3_volume
[eval exp="sf.config.se3Volume=tf.se3_volume"]
[call target="*set_se3_volume"]
[jump target="*wait"]

*voice_volume
[eval exp="sf.config.voiceVolume=tf.voice_volume"]
[call target="*set_voice_volume"]
[jump target="*wait"]

*window_opacity
[eval exp="sf.config.windowopa	= tf.windowopa"]
[call target="*set_window_opa"]
[jump target="*wait"]

*createbtn

;--------------------------------------
;戻る・初期化・キャンセル　ボタン
;--------------------------------------
[exbutton name="exit" x="&return_button[0]" y="&return_button[1]" file="config_btn_return" onclick="jump('', '*exit')" onenter="showHint(12)" onleave="hideHint()"]
[exbutton name="init" x="&init_button[0]" y="&init_button[1]" file="config_btn_init" onclick="jump('', '*init')" onenter="showHint(19)" onleave="hideHint()"]
[exbutton name="cancel" x="&cancel_button[0]" y="&cancel_button[1]" file="config_btn_cancel" onclick="jump('', '*cancel')" onenter="showHint(11)" onleave="hideHint()"]


;--------------------------------------
;ボリューム関係
;--------------------------------------
[if exp="tf.volume_mode=='slider'"]
[exslider name="voice_volume" x="&voice_volume_slider[0]" y="&voice_volume_slider[1]" width="&voice_volume_slider[2]" file="config_slider" min="0" max="100" center="7" pos="&sf.config.voiceVolume" var="tf.voice_volume" onslide="kag.process('', '*voice_volume'), drawVolume('voice')" onenter="showHint(5), drawVolume('voice')" onleave="hideHint(), eraseVolume('voice')"]
[exslider name="se_volume" x="&se_volume_slider[0]" y="&se_volume_slider[1]" width="&se_volume_slider[2]" file="config_slider" min="0" max="100" center="7" pos="&sf.config.seVolume" var="tf.se_volume" onslide="kag.process('', '*se_volume'), drawVolume('se')" onenter="showHint(4), drawVolume('se')" onleave="hideHint(), eraseVolume('se')"]
[exslider name="bgm_volume" x="&bgm_volume_slider[0]" y="&bgm_volume_slider[1]" width="&bgm_volume_slider[2]" file="config_slider" min="0" max="100" center="7" pos="&sf.config.bgmVolume" var="tf.bgm_volume" onslide="kag.process('', '*bgm_volume'), drawVolume('bgm')" onenter="showHint(3), drawVolume('bgm')" onleave="hideHint(), eraseVolume('bgm')"]
[exslider name="text_speed" x="&text_speed_slider[0]" y="&text_speed_slider[1]" width="&text_speed_slider[2]" file="config_slider" min="100" max="0" center="7" pos="&sf.config.textSpeed" var="tf.text_speed" onslide="kag.process('', '*text_speed'), drawVolume('textspeed')" onenter="showHint(1), drawVolume('textspeed')" onleave="hideHint(), eraseVolume('textspeed')"]
[exslider name="page_wait" x="&page_wait_slider[0]" y="&page_wait_slider[1]" width="&page_wait_slider[2]" file="config_slider" min="100" max="0" center="7" pos="&sf.config.pageWait" var="tf.page_wait" onslide="kag.process('', '*page_wait'), drawVolume('pagewait')" onenter="showHint(2), drawVolume('pagewait')" onleave="hideHint(), eraseVolume('pagewait')"]
[endif]


[if exp="tf.volume_mode=='volume'"]
[exvolumebar name="voice_volume" x="&voice_volume_slider[0]" y="&voice_volume_slider[1]" width="&voice_volume_slider[2]" height="&voice_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.voiceVolume" var="tf.voice_volume" ongain="jump('', '*voice_volume')"  onenter="showHint(5)" onleave="hideHint()"]
[exvolumebar name="se_volume" x="&se_volume_slider[0]" y="&se_volume_slider[1]" width="&se_volume_slider[2]" height="&se_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.seVolume" var="tf.se_volume" ongain="jump('', '*se_volume')" onenter="showHint(4)" onleave="hideHint()"]
[exvolumebar name="se2_volume" x="&se_volume_slider2[0]" y="&se_volume_slider2[1]" width="&se_volume_slider2[2]" height="&se_volume_slider2[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.se2Volume" var="tf.se2_volume" ongain="jump('', '*se2_volume')" onenter="showHint(29)" onleave="hideHint()"]
[exvolumebar name="se3_volume" x="&se_volume_slider3[0]" y="&se_volume_slider3[1]" width="&se_volume_slider3[2]" height="&se_volume_slider3[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.se3Volume" var="tf.se3_volume" ongain="jump('', '*se3_volume')" onenter="showHint(29)" onleave="hideHint()"]
[exvolumebar name="bgm_volume" x="&bgm_volume_slider[0]" y="&bgm_volume_slider[1]" width="&bgm_volume_slider[2]" height="&bgm_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.bgmVolume" var="tf.bgm_volume" ongain="jump('', '*bgm_volume')" onenter="showHint(3)" onleave="hideHint()"]

[exvolumebar name="text_speed" x="&text_speed_slider[0]" y="&text_speed_slider[1]" width="&text_speed_slider[2]" height="&text_speed_slider[3]" color="0xffff5a5a" min="100" max="0" pos="&sf.config.textSpeed" var="tf.text_speed" ongain="jump('', '*text_speed')" onenter="showHint(1), drawVolume('pagewait')" onleave="hideHint(), eraseVolume('pagewait')"]

[exvolumebar name="page_wait" x="&page_wait_slider[0]" y="&page_wait_slider[1]" width="&page_wait_slider[2]" height="&page_wait_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.pageWait" var="tf.page_wait" ongain="jump('', '*page_wait')" onenter="showHint(2), drawVolume('pagewait')" onleave="hideHint(), eraseVolume('pagewait')"]

;--------------------------------------
;メッセージウィンドウ透過率
;--------------------------------------
[exvolumebar name="mwin" x="&window_opacity_slider[0]" y="&window_opacity_slider[1]" width="&window_opacity_slider[2]" height="&window_opacity_slider[3]" color="0xffff5a5a" min="0" max="255" pos="&sf.config.windowopa" var="tf.windowopa" ongain="jump('', '*window_opacity')" onenter="showHint(30)" onleave="hideHint()"]

[endif]


;--------------------------------------
;□各種チェックボタン
;--------------------------------------

;--------------------------------------
;■再生ボイス
;--------------------------------------
[if exp="tf.voice_choice==true"]
[excheckbox name="voice_male" x="&voice_male[0]" y="&voice_male[1]" file="config_voice_male" oncheck="setMalesVoiceFlag(true), sf.config.voiceMale=true" onuncheck="setMalesVoiceFlag(false), sf.config.voiceMale=false" checked="sf.config.voiceMale==true" onenter="showHint(32)" onleave="hideHint()"]
[excheckbox name="voice_female" x="&voice_female[0]" y="&voice_female[1]" file="config_voice_female" oncheck="setFemalesVoiceFlag(true), sf.config.voiceFemale=true" onuncheck="setFemalesVoiceFlag(false), sf.config.voiceFemale=false" checked="sf.config.voiceFemale==true" onenter="showHint(6)" onleave="hideHint()"]
[endif]

;--------------------------------------
;■スピーカーセット
;--------------------------------------
[if exp="tf.listen_mode==true"]
[exradio name="vset_speaker" group="vset" x="&speaker_button[0]" y="&speaker_button[1]" file="config_vset_speaker" oncheck="sf.config.vsetting=2, jump('', '*set_speaker')" checked="sf.config.vsetting==2" onenter="showHint(7)" onleave="hideHint()"]
[exradio name="vset_head" group="vset" x="&head_button[0]" y="&head_button[1]" file="config_vset_head" oncheck="sf.config.vsetting=1, jump('', '*set_head')" checked="sf.config.vsetting==1" onenter="showHint(7)" onleave="hideHint()"]
[endif]

;--------------------------------------
;■画面設定
;--------------------------------------
[exradio name="effect_click" group="effect" x="&effect_click[0]" y="&effect_click[1]" file="config_effect_click" oncheck=" sf.config.transEffect='click'" checked="sf.config.transEffect=='click'" onenter="showHint(16)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'effect_click'])"]
[exradio name="effect_off" group="effect" x="&effect_off[0]" y="&effect_off[1]" file="config_effect_off" oncheck="sf.config.transEffect='off'" checked="sf.config.transEffect=='off'" onenter="showHint(15)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'effect_off'])"]
[exradio name="effect_on" group="effect" x="&effect_on[0]" y="&effect_on[1]" file="config_effect_on" oncheck=" sf.config.transEffect='on'" checked="sf.config.transEffect=='on'" onenter="showHint(8)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'effect_on'])"]

;--------------------------------------
;■既読判定
;--------------------------------------
[exradio name="kidoku_off" group="kidoku" x="&kidoku_off[0]" y="&kidoku_off[1]" file="config_kidoku_off" oncheck="sf.config.kidokuSkip=false" checked="sf.config.kidokuSkip==false" onenter="showHint(17)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'kidoku_off'])"]
[exradio name="kidoku_on" group="kidoku" x="&kidoku_on[0]" y="&kidoku_on[1]" file="config_kidoku_on" oncheck="sf.config.kidokuSkip=true" checked="sf.config.kidokuSkip==true" onenter="showHint(9)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'kidoku_on'])"]


;--------------------------------------
;■オートセーブ
;--------------------------------------
;[exradio name="autosave_off" group="autosave" x="&autosave_off[0]" y="&autosave_off[1]" file="config_autosave_off" onclick="global.exradio_object.setOptions(%[check:'autosave_off'])" oncheck="sf.config.autoSave=false" checked="sf.config.autoSave==false" onenter="showHint(18)" onleave="hideHint()"]
;[exradio name="autosave_on" group="autosave" x="&autosave_on[0]" y="&autosave_on[1]" file="config_autosave_on" onclick="global.exradio_object.setOptions(%[check:'autosave_on'])" oncheck="sf.config.autoSave=true" checked="sf.config.autoSave==true" onenter="showHint(10)" onleave="hideHint()"]

;--------------------------------------
;■ウインドウモード
;--------------------------------------
[exradio name="window_window" group="window" x="&window_window[0]" y="&window_window[1]" file="config_window_window" oncheck="changeWindowMode()" checked="!isFullScreen()" onenter="showHint(14)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'window_window'])"]
[exradio name="window_full" group="window" x="&window_full[0]" y="&window_full[1]" file="config_window_full" oncheck="changeFullScreenMode()" checked="isFullScreen()" onenter="showHint(13)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'window_full'])"]


;--------------------------------------
;■フォント設定
;--------------------------------------
[exradio name="font_mintyou" group="font" x="&font_mintyou[0]" y="&font_mintyou[1]" file="config_font_mintyou" oncheck="sf.config.fontFace='ＭＳ 明朝'" checked="sf.config.fontFace=='ＭＳ 明朝'"  onenter="showHint(21)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'font_mintyou'])"]
[exradio name="font_gothic" group="font" x="&font_gothic[0]" y="&font_gothic[1]" file="config_font_gothic" oncheck="sf.config.fontFace='ＭＳ ゴシック'" checked="sf.config.fontFace=='ＭＳ ゴシック'" onenter="showHint(22)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'font_gothic'])"]


;--------------------------------------
;■句読点でウェイトを付ける
;--------------------------------------
[exradio name="autowc_on" group="autowc" x="&auto_wc_on[0]" y="&auto_wc_on[1]" file="config_autowc_on" oncheck="sf.config.autowc=true" checked="sf.config.autowc==true"  onenter="showHint(23)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'autowc_on'])"]
[exradio name="autowc_off" group="autowc" x="&auto_wc_off[0]" y="&auto_wc_off[1]" file="config_autowc_off" oncheck="sf.config.autowc=false" checked="sf.config.autowc==false" onenter="showHint(24)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'autowc_off'])"]


;--------------------------------------
;■クリックでボイスを停止する
;--------------------------------------
[exradio name="voicestop_on" group="voicestop" x="&voicestop_on[0]" y="&voicestop_on[1]" file="config_voicestop_on" oncheck="sf.config.voicestop=true" checked="sf.config.voicestop==true"  onenter="showHint(25)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'voicestop_on'])"]
[exradio name="voicestop_of" group="voicestop" x="&voicestop_off[0]" y="&voicestop_off[1]" file="config_voicestop_off" oncheck="sf.config.voicestop=false" checked="sf.config.voicestop==false" onenter="showHint(26)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'voicestop_off'])"]


;--------------------------------------
;■ボイス再生中にＢＧＭを小さくする
;--------------------------------------
[exradio name="bgm_down_on" group="bgm_down" x="&bgm_down_on[0]" y="&bgm_down_on[1]" file="config_bgm_down_on" oncheck="sf.config.bgm_down=true" checked="sf.config.bgm_down==true"  onenter="showHint(27)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'bgm_down_on'])"]
[exradio name="bgm_down_off" group="bgm_down" x="&bgm_down_off[0]" y="&bgm_down_off[1]" file="config_bgm_down_off" oncheck="sf.config.bgm_down=false" checked="sf.config.bgm_down==false" onenter="showHint(28)" onleave="hideHint()" onclick="global.exradio_object.setOptions(%[check:'bgm_down_off']),jump('', '*bgm_volume')"]

;--------------------------------------
;■メガネモード
;--------------------------------------
[if exp="coschange_cg || coschange_char"]
	[exradio name="megane_on"	group="megane"	x="&megane_on[0]"	y="&megane_on[1]"	file="config_megane_on"		oncheck="sf.config.megane=true"		checked="sf.config.megane==true"	onenter="showHint(39)"	onleave="hideHint()"	onclick="global.exradio_object.setOptions(%[check:'megane_on'])"]
	[exradio name="megane_off"	group="megane"	x="&megane_off[0]"	y="&megane_off[1]"	file="config_megane_off"	oncheck="sf.config.megane=false"	checked="sf.config.megane==false"	onenter="showHint(40)"	onleave="hideHint()"	onclick="global.exradio_object.setOptions(%[check:'megane_off'])"]
[endif]

;--------------------------------------
;■文字のフェード
;--------------------------------------
[exradio name="stfade_on"	group="stfade"	x="&stfade_on[0]"	y="&stfade_on[1]"	file="config_megane_on"		oncheck="sf.config.stfade=true"		checked="sf.config.stfade==true"	onenter="showHint(31)"	onleave="hideHint()"	onclick="global.exradio_object.setOptions(%[check:'stfade_on'])"]
[exradio name="stfade_off"	group="stfade"	x="&stfade_off[0]"	y="&stfade_off[1]"	file="config_megane_off"	oncheck="sf.config.stfade=false"	checked="sf.config.stfade==false"	onenter="showHint(32)"	onleave="hideHint()"	onclick="global.exradio_object.setOptions(%[check:'stfade_off'])"]


;--------------------------------------
;■テストボタン
;--------------------------------------

;testファイル名をconfig_cfgへ退避
[exbutton name="voice_test" x="&voice_test[0]" y="&voice_test[1]" file="config_btn_test" onenter="" onleave="" onclick="kag.se[0].play(%[storage:stest_voice, loop:false])"]

[exbutton name="bgm_test" x="&bgm_test[0]" y="&bgm_test[1]" file="config_btn_test" onenter="" onleave="" onclick="kag.bgm.play(%[storage:stest_bgm, loop:false])"]

[exbutton name="se_test" x="&se_test[0]" y="&se_test[1]" file="config_btn_test" onenter="" onleave="" onclick="kag.se[1].play(%[storage:stest_se, loop:false])"]

[exbutton name="bgv_test" x="&bgv_test[0]" y="&bgv_test[1]" file="config_btn_test" onenter="" onleave="" onclick="kag.se[2].play(%[storage:stest_bgv, loop:false])"]

[exbutton name="bgse_test" x="&bgse_test[0]" y="&bgse_test[1]" file="config_btn_test" onenter="" onleave="" onclick="kag.se[3].play(%[storage:stest_bgse, loop:false])"]


[eval exp="tf.playingbgm = kag.bgm.playingStorage"]

[return]



*set_font
;現在のカレントレイヤーの情報を保存
[iscript]

tf.layer	= "message" + kag.currentNum;

if( kag.currentPage )
	tf.page	= "back";
else
	tf.page	= "fore";
tf.withback	= kag.currentWithBack;

[endscript]

[current layer="message0" page="fore"]
[deffont face="&sf.config.fontFace"]
[current layer="message1" page="fore"]
[deffont face="&sf.config.fontFace"]
[current layer="message2" page="fore"]
[deffont face="&sf.config.fontFace"]
[backlay layer="message0"]
[backlay layer="message1"]
[backlay layer="message2"]
[resetfont]
[resetstyle]

;通常画面時にカレントだったレイヤーへ戻す
[current layer="&tf.layer" page="&tf.page"]
[eval exp="delete tf.layer"]
[eval exp="delete tf.page"]
[eval exp="delete tf.withback"]

[return]

;****************************
;	文字フェードの設定		
;****************************
*set_stfade
;現在のカレントレイヤーの情報を保存
[iscript]

tf.layer	= "message" + kag.currentNum;

if( kag.currentPage )
	tf.page	= "back";
else
	tf.page	= "fore";
tf.withback	= kag.currentWithBack;

[endscript]

[current layer="message0" page="fore"]
[defstyle fade="&sf.config.stfade"]
[current layer="message1" page="fore"]
[defstyle fade="&sf.config.stfade"]
[current layer="message2" page="fore"]
[defstyle fade="&sf.config.stfade"]
[backlay layer="message0"]
[backlay layer="message1"]
[backlay layer="message2"]
[resetfont]
[resetstyle]

;通常画面時にカレントだったレイヤーへ戻す
[current layer="&tf.layer" page="&tf.page"]
[eval exp="delete tf.layer"]
[eval exp="delete tf.page"]
[eval exp="delete tf.withback"]

[return]

*set_speaker
[iscript]
sf.config.bgmVolume = tf.speaker_bgm_volume;
sf.config.voiceVolume = tf.speaker_voice_volume;
sf.config.seVolume = tf.speaker_se_volume;
[endscript]
[call target="*set_bgm_volume"]
[call target="*set_se_volume"]
[exvolumebaropt delete="voice_volume"]
[exvolumebaropt delete="se_volume"]
[exvolumebaropt delete="bgm_volume"]

[exvolumebar name="voice_volume" x="&voice_volume_slider[0]" y="&voice_volume_slider[1]" width="&voice_volume_slider[2]" height="&voice_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.voiceVolume" var="tf.voice_volume" ongain="jump('', '*voice_volume')"  onenter="showHint(5)" onleave="hideHint()"]
[exvolumebar name="se_volume" x="&se_volume_slider[0]" y="&se_volume_slider[1]" width="&se_volume_slider[2]" height="&se_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.seVolume" var="tf.se_volume" ongain="jump('', '*se_volume')" onenter="showHint(4)" onleave="hideHint()"]
[exvolumebar name="bgm_volume" x="&bgm_volume_slider[0]" y="&bgm_volume_slider[1]" width="&bgm_volume_slider[2]" height="&bgm_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.bgmVolume" var="tf.bgm_volume" ongain="jump('', '*bgm_volume')" onenter="showHint(3)" onleave="hideHint()"]



[jump target="*wait"]

*set_head
[iscript]
sf.config.bgmVolume = tf.head_bgm_volume;
sf.config.voiceVolume = tf.head_voice_volume;
sf.config.seVolume = tf.head_se_volume;
[endscript]
[call target="*set_bgm_volume"]
[call target="*set_se_volume"]
[call target="*set_voice_volume"]

[exvolumebaropt delete="voice_volume"]
[exvolumebaropt delete="se_volume"]
[exvolumebaropt delete="bgm_volume"]

[exvolumebar name="voice_volume" x="&voice_volume_slider[0]" y="&voice_volume_slider[1]" width="&voice_volume_slider[2]" height="&voice_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.voiceVolume" var="tf.voice_volume" ongain="jump('', '*voice_volume')"  onenter="showHint(5)" onleave="hideHint()"]
[exvolumebar name="se_volume" x="&se_volume_slider[0]" y="&se_volume_slider[1]" width="&se_volume_slider[2]" height="&se_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.seVolume" var="tf.se_volume" ongain="jump('', '*se_volume')" onenter="showHint(4)" onleave="hideHint()"]
[exvolumebar name="bgm_volume" x="&bgm_volume_slider[0]" y="&bgm_volume_slider[1]" width="&bgm_volume_slider[2]" height="&bgm_volume_slider[3]" color="0xffff5a5a" min="0" max="100" pos="&sf.config.bgmVolume" var="tf.bgm_volume" ongain="jump('', '*bgm_volume')" onenter="showHint(3)" onleave="hideHint()"]



[jump target="*wait"]

