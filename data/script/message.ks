
[call storage="message_cfg.ks"]


;------------------------------------------------------------------------------
;	メッセージレイヤーを透明化＋800x600化
;		[clear_message_layer]
;------------------------------------------------------------------------------
[macro name="clear_message_layer"]
	[position layer="message0" page="back" visible="false"]
	[position layer="message1" page="back" visible="false"]
	[position layer="message2" page="back" visible="false"]
	[position layer="message3" page="back" visible="false"]
	[position layer="message4" page="back" visible="false"]
[endmacro]

;------------------------------------------------------------------------------
;	テキストウィンドウの画像読み込み
;		[load_textwindow]
;------------------------------------------------------------------------------
[macro name="load_textwindow"]
	[if exp="f.textwindowVisble==false"]

		;//ウィンドウ枠のみ表示
		[current layer="message0" page="fore" withback="true"]
		[position layer="message0" page="back" frame="textwindow" left="&meswleft[0]" top="&meswtop[0]" width="&meswwidth[0]" height="&meswheight[0]" visible="true" marginl="&meswmarginl[0]" margint="&meswmargint[0]" marginr="&meswmarginr[0]"]

		;//文字表示
		[current layer="message1" page="fore" withback="true"]

		;// 文字の表示位置の設定
		[position layer="message1" page="back" frame="" opacity="0" left="&meswleft[1]" top="&meswtop[1]" width="&meswwidth[1]" height="&meswheight[1]" visible="true" marginl="&meswmarginl[1]" margint="&meswmargint[1]" marginr="&meswmarginr[1]"]

		[defstyle linespacing="7" pitch="0"]
		[deffont size="24" face="&sf.config.fontFace" bold="false" edge="true" face="&sf.config.fontFace" color="0xffffff" edgecolor="0x000000" shadow="false" rubysize="8" rubyoffset="0"]
		[resetfont]
		[cm]
		[hr]

		;//	メッセージ窓にボタン付ける時用のボタン
		;//	メッセージウィンドウの子レイヤとしてボタン配置
		;//	メッセージ枠の用のレイヤの子レイヤとして作ってるのでこっちを使わないとquake時に各種ボタンが揺れる
		[exmwbuttonopt delete="all"]
		[exmwbuttonopt forevisible="false" backvisible="true"]

		[if exp="sf.meswinbutton"]
			[if exp="tf.scene_mode==true"]
				[exmwbutton name="auto"		layer="message0"	x="400"	y="28"	file="textwindow_btn_auto"	onclick="auto()"			hint="オートモードに移行します"] 
				[exmwbutton name="voice"	layer="message0"	x="640"	y="28"	file="textwindow_btn_voice"	onclick="voiceRepeat()"		hint="音声をもう一度再生します"] 
				[exmwbutton name="skip"		layer="message0"	x="720"	y="28"	file="textwindow_btn_skip"	onclick="skip()"			hint="スキップモードに移行します"] 
			[else]
				[exmwbutton name="auto"		layer="message0"	x="400"	y="28"	file="textwindow_btn_auto"	onclick="auto()"			hint="オートモードに移行します"] 
				[exmwbutton name="qsave"	layer="message0"	x="560"	y="28"	file="textwindow_btn_qsave"	onclick="quickSave()"		hint="クイックセーブを行います"] 
				[exmwbutton name="qload"	layer="message0"	x="480"	y="28"	file="textwindow_btn_qload"	onclick="quickLoad()"		hint="クイックロードを行います"] 
				[exmwbutton name="voice"	layer="message0"	x="640"	y="28"	file="textwindow_btn_voice"	onclick="voiceRepeat()"		hint="音声をもう一度再生します"] 
				[exmwbutton name="skip" 	layer="message0"	x="720"	y="28"	file="textwindow_btn_skip"	onclick="skip()"			hint="スキップモードに移行します"] 
			[endif] 
		[endif]

		[crossfade time="500"]
		[backlay]

		;ネーム枠設定
		[current layer="message2" page="fore" withback="true"]
		[position layer="message2" page="fore" color="0x000000" opacity="0" left="&meswleft[2]" top="&meswtop[2]" width="&meswwidth[2]" height="&meswheight[2]" visible="true"]

		[defstyle linespacing="1" pitch="0"]
		[deffont size="25" face="&sf.config.fontFace" bold="false"  edge="true" face="&sf.config.fontFace" color="0xFFFFFF" edgecolor="0x000000" shadow="false" rubysize="10" rubyoffset="0"]
		[resetfont]
		[cm]
		[hr]
		[backlay layer="message2"]

		[current layer="message1" page="fore" withback="true"]
		[eval exp="f.textwindowVisble=true"]
	[endif]


[endmacro]

;------------------------------------------------------------------------------
;	テキストウィンドウを表示属性にする(使ってない)
;		[show_textwindow]
;------------------------------------------------------------------------------
[macro name="show_textwindow"]
	[if exp="f.textwindowVisble==false"]
		[layopt layer="message0" visible="true" page="back"]
		[layopt layer="message1" visible="true" page="back"]
		[layopt layer="message2" visible="true" page="back"]
		[crossfade time="500"]
		[eval exp="f.textwindowVisble=true"]
	[endif]
[endmacro]

;------------------------------------------------------------------------------
;	テキストウィンドウを非表示属性にする
;		[hide_textwindow]
;------------------------------------------------------------------------------
[macro name="hide_textwindow"]
	[if exp="f.textwindowVisble==true"]
		[layopt layer="message0" visible="false" page="back"]
		[layopt layer="message1" visible="false" page="back"]
		[layopt layer="message2" visible="false" page="back"]

		[crossfade time="500"]
		[exmwbuttonopt delete="all"]
		[eval exp="f.textwindowVisble=false"]
	[endif]
[endmacro]

[macro name="init_variable"]
	[clearvar]
	[call storage="var.ks"]
[endmacro]

[macro name="eos"]
	[stop_bgm fadeout="500"]
	[bg file="black"]
	[hide_layer no="0"]
	[hide_layer no="1"]
	[hide_layer no="2"]
	[hide_layer no="3"]
	[hide_layer no="4"]
	[hide_layer no="5"]
	[crossfade time="500"]
[endmacro]

;//種別的にcommand.ksから移動
;------------------------------------------------------------------------------
;	吹き出しウィンドウの設定
;
;	[bln rgn="(100,100,200,200)"]
;	
;	各値は保持されているので省略可
;	初期値は設定ファイルmessage_cfg.ksの値になる
;	[bln rgn="(&meswleft[4],&meswtop[4],&meswwidth[4],&meswheight[4])"]

;	変更しない箇所は何も書かないでカンマで区切る
;	[bln rgn="(,400,,)"]
;
;	値に+か-をつけると現在の設定が加算・減算される
;	[bln rgn="(+100,-500,,)"]

;------------------------------------------------------------------------------
[macro name="bln"]
	;//	メッセージ窓表示
	;//	現状blnにメッセージ枠は表示していないので適当な空画像を指定してる
	;//20190918 色、透明度を設定、範囲を指定できるように変更、単色ウィンドウであればこちらのほうが作品に合わせて改変可能。
	[current layer="message3" page="fore" withback="true"]
;	[position layer="message3" page="back" frame="clear" left="&meswleft[3]" top="&meswtop[3]" width="&meswwidth[3]" height="&meswheight[3]" visible="true" marginl="&meswmarginl[3]" margint="&meswmargint[3]" marginr="&meswmarginr[3]"]
	[position layer="message3" page="back" frame="" color="0x000000" opacity="102" left="&meswleft[3]" top="&meswtop[3]" width="&meswwidth[3]" height="&meswheight[3]" visible="true" marginl="&meswmarginl[3]" margint="&meswmargint[3]" marginr="&meswmarginr[3]"]

	[eval exp="bln(mp)"]
	[backlay layer="message4"]
	[current layer="message4" page="fore"]

	[deffont size="24" face="&sf.config.fontFace" bold="false" edge="true" edgecolor="0x000000" rubysize="8" rubyoffset="0"]
	[resetfont]

	[exmwbuttonopt delete="all"]
	[exmwbuttonopt forevisible="false" backvisible="true"]

	[if exp="sf.meswinbutton"]
		[if exp="tf.scene_mode==true"]
			[exmwbutton name="auto"		layer="message3"	x="400"	y="560"	file="textwindow_btn_auto"	onclick="auto()"			hint="オートモードに移行します"] 
			[exmwbutton name="voice"	layer="message3"	x="640"	y="560"	file="textwindow_btn_voice"	onclick="voiceRepeat()"		hint="音声をもう一度再生します"] 
			[exmwbutton name="skip"		layer="message3"	x="720"	y="560"	file="textwindow_btn_skip"	onclick="skip()"			hint="スキップモードに移行します"] 
		[else]
			[exmwbutton name="auto"		layer="message3"	x="400"	y="560"	file="textwindow_btn_auto"	onclick="auto()"			hint="オートモードに移行します"] 
			[exmwbutton name="qsave"	layer="message3"	x="560"	y="560"	file="textwindow_btn_qsave"	onclick="quickSave()"		hint="クイックセーブを行います"] 
			[exmwbutton name="qload"	layer="message3"	x="480"	y="560"	file="textwindow_btn_qload"	onclick="quickLoad()"		hint="クイックロードを行います"] 
			[exmwbutton name="voice"	layer="message3"	x="640"	y="560"	file="textwindow_btn_voice"	onclick="voiceRepeat()"		hint="音声をもう一度再生します"] 
			[exmwbutton name="skip" 	layer="message3"	x="720"	y="560"	file="textwindow_btn_skip"	onclick="skip()"			hint="スキップモードに移行します"] 
		[endif] 
	[endif]

	[crossfade time="500"]
	[backlay]

[endmacro]

[iscript]
function bln(elm)
{
	var str = elm.rgn.substring(1,elm.rgn.length-2);
	var rgn = [].split(',', str);
	
	if (rgn.count < 4) {
		System.inform('blnのpathが間違ってます');
		return;
	}
//	f.blnRgn = [0+240,0+60,800,600] if f.blnRgn===void;
	//20191116　マージンを追加
//	f.blnRgn = [meswleft[4],meswtop[4],meswwidth[4],meswheight[4]] if f.blnRgn===void;
	f.blnRgn = [meswleft[4],meswtop[4],meswwidth[4],meswheight[4],meswmarginl[4],meswmargint[4],meswmarginr[4]] if f.blnRgn===void;
	//20191116//
	
	for (var i = 0; i < 4; i++) {
		if (rgn[i] ===void || rgn[i] === '') continue;
		switch (rgn[i][0]) {
		case '&':
			f.blnRgn[i] = +Scripts.eval(rgn[i].substring(1));
			break;
		case '+':
		case '-':
			f.blnRgn[i] += +rgn[i];
			break;
		default:
			f.blnRgn[i] = +rgn[i];
			break;
		}
	}
	
	elm.left	= f.blnRgn[0];
	elm.top		= f.blnRgn[1];
	elm.width	= f.blnRgn[2];
	elm.height	= f.blnRgn[3];

	//20191116　マージンを追加
	elm.marginl	= f.blnRgn[4];
	elm.margint		= f.blnRgn[5];
	elm.marginr	= f.blnRgn[6];
	//20191116//
	
	elm.visible	= true;
	elm.opacity	= 0;
	elm.color	= 0;

	//20190918　変数を初期化
	f.blnRgn =[meswleft[4],meswtop[4],meswwidth[4],meswheight[4]];

	//バルーンウィンドウの位置
	//20190918　初期設定を書き換えると呼び戻せなくなるのでコメントアウト
//	meswleft[4]	= elm.left;
//	meswtop[4]	= elm.top;

	//Debug.message('■■■■■■('+f.blnRgn[0]+','+f.blnRgn[1]+','+f.blnRgn[2]+','+f.blnRgn[3]+')');
	
	kag.fore.messages[4].setPosition(elm);
}

[endscript]

;------------------------------------------------------------------------------
;	吹き出しの非表示
;------------------------------------------------------------------------------
[macro name="hide_balloon_window"]


	[layopt layer="message3" visible="false" page="back"]
	[layopt layer="message4" page="back" visible="false"]
	[backlay layer="message4"]

	[crossfade time="500"]
	[exmwbuttonopt delete="all"]

[endmacro]

;------------------------------------------------------------------------------
;	メッセージカットアウト　下へ
;		[m_cutout_shita  time="ミリセカンド" accel="チーズスンチーズアウト数値。-は段々遅く。+は段々早く" y=""] 
;------------------------------------------------------------------------------
[macro name="m_cutout_shita"]
	[move2 layer="5" page="fore" time="&mp.time" path="(&f.m_x,&f.m_y,255)(&f.m_x,600,0)" accel="&mp.accel"]
	[wm2]
	[freeimage layer="5" page="fore"]
	[freeimage layer="5" page="back"]
[endmacro]


;------------------------------------------------------------------------------
;	文字枠レイヤーロード
;[m_load_move gyo="行数" y="縦軸" time="" accel="チーズスンチーズアウト数値。-は段々遅く。+は段々早く" center_m_y="縦軸の真ん中"] 
;------------------------------------------------------------------------------
[macro name="m_load_move"]

;文字枠レイヤー読み込み
	[blnreset]
	[eval exp="f.height_y=21+26*mp.gyo"]
	[if exp="mp.m_y>0"]
		[eval exp="f.m_y=mp.m_y"]
	[endif]
	[if exp="mp.center_m_y>0"]
		[eval exp="f.m_y=mp.center_m_y-13*mp.gyo"]
	[endif]
[image storage="m" layer="5" page="back" visible="true"  clipleft="0" cliptop="0" clipwidth="799" clipheight="&f.height_y"]
	[layopt layer="5" visible="no"]
	[copylay layer="5" srclayer="5" destlayer="5" srcpage="back" destpage="fore"]
	[layopt layer="5" opacity="0" visible="true"]
	[move2 layer="5" page="fore" time="500" path="(0,600,0)(0,&f.m_y,255)" accel="-4"]
	[wm2]
	[backlay layer="5"]
	[bln no="0" rgn="(,&f.m_y,,)"]
	[eval exp="f.m_y=+f.m_y"]
	[eval exp="f.m_x=0"]
[endmacro]


;------------------------------------------------------------------------------
;	文字枠レイヤーロード　ハーフ
;[mh_load_move gyo="行数" m_x="横軸" m_y="縦軸" center_m_y="縦軸の中心" time="" accel="チーズスンチーズアウト数値。-は段々遅く。+は段々早く" ] 
;------------------------------------------------------------------------------
[macro name="mh_load_move"]

;文字枠レイヤー読み込み
	[eval exp="f.height_y=21+26*mp.gyo"]
	[eval exp="f.m_x01=+mp.m_x+20"]
	[eval exp="f.m_x=+mp.m_x"]
	[eval exp="f.m_y=+mp.m_y"]
	[eval exp="f.moji_y=mp.m_y"]
	[if exp="mp.center_m_y>0"]
		[eval exp="f.m_y=mp.center_m_y-13*mp.gyo"]
	[endif]
	[image storage="mh" layer="5" page="back" visible="true"  clipleft="0" cliptop="0" clipwidth="400" clipheight="&f.height_y"]
	[layopt layer="5" visible="no"]
	[copylay layer="5" srclayer="5" destlayer="5" srcpage="back" destpage="fore"]
	[layopt layer="5" opacity="0" visible="true"]
	[move2 layer="5" page="fore" time="500" path="(&f.m_x,600,0)(&f.m_x,&f.m_y,255)" accel="&mp.accel"]
	[wm2]
	[backlay layer="5"]
	[bln no="0" rgn="(&f.m_x01,&f.m_y,380,600)"]
[endmacro]



;------------------------------------------------------------------------------
;	文字枠レイヤー入れ替え
;[m_chenge gyo="行数" m_y="縦位置" center_m_y="縦軸の真ん中" time=""]
;------------------------------------------------------------------------------
[macro name="m_chenge"]

	[move2 layer="5" page="fore" time="&mp.time" path="(0,&f.m_y,255)(799,&f.m_y,255)" accel="-4"]
	[wm2]
	[eval exp="f.height_y=21+26*mp.gyo"]
	[image storage="m" layer="5" page="fore" visible="true"  clipleft="0" cliptop="0" clipwidth="799" clipheight="&f.height_y"]
	[layopt layer="5" opacity="0" visible="true"]
	[eval exp="f.m_y=mp.m_y"]
	[if exp="mp.center_m_y>0"]
		[eval exp="f.m_y=mp.center_m_y-13*mp.gyo"]
	[endif]
	[move2 layer="5" page="fore" time="&mp.time" path="(-800,&f.m_y,0)(0,&f.m_y,255)" accel="-4"]
	[wm2]
	[backlay layer="5"]
	[bln no="0" rgn="(,&f.m_y,,,)"]


[endmacro]

;------------------------------------------------------------------------------
;	文字枠レイヤー入れ替え
;[mh_chenge gyo="行数" m_x="横位置" m_y="縦位置" center_m_y="縦位置中心"]
;------------------------------------------------------------------------------
[macro name="mh_chenge"]
	[move2 layer="5" page="fore" time="&mp.time" path="(&f.m_x,&f.m_y,255)(&f.m_x,-400,255)" accel=""]
	[wm2]
	[eval exp="f.height_y=21+26*mp.gyo"]
	[image storage="mh" layer="5" page="fore" visible="true"  clipleft="0" cliptop="0" clipwidth="400" clipheight="&f.height_y"]
	[layopt layer="5" opacity="0" visible="true"]
	[if exp="mp.m_x>0"]
		[eval exp="f.m_x=mp.m_x"]
		[eval exp="f.m_x01=mp.m_x+10"]
	[endif]
	[eval exp="f.m_y=mp.m_y"]
	[if exp="mp.center_m_y>0"]
		[eval exp="f.m_y=mp.center_m_y-13*mp.gyo"]
	[endif]
	[move2 layer="5" page="fore" time="&mp.time" path="(&f.m_x,600,0)(&f.m_x,&f.m_y,255)" accel="-4"]
	[wm2]
	[backlay layer="5"]
	[bln no="0" rgn="(&f.m_x01,&f.m_y,380,,)"]

[endmacro]


;------------------------------------------------------------------------------
;	文字センターへ
;	[blnc gyo="" center_y=""]
;------------------------------------------------------------------------------
[macro name="blnc"]
	[eval exp="f.moji_y=(f.height_y\2)+f.m_y+-13*mp.gyo-10"]
	[if exp="mp.center_y>0"]
	[eval exp="f.moji_y=mp.center_y-13*mp.gyo"]
	[eval exp="f.m_y=f.moji_y"]
	[eval exp="f.height_y=21+26*mp.gyo"]
	[endif]
	[bln no="0" rgn="(,&f.moji_y,,)"]
[endmacro]


;------------------------------------------------------------------------------
;	文字位置リセット
;	[blnreset]
;------------------------------------------------------------------------------
[macro name="blnreset"]
	[bln rgn="(60,200,700,400)"]
[endmacro]


[return]
