

[if exp="typeof(global.exmwbutton_object) == 'undefined'"]
[iscript]

/*	ExPluginがbaseレイヤーのみなので別レイヤー対応	*/
class ExMwPlugin extends ExPlugin
{
	var result;
	
	function ExMwPlugin()
	{
		super.ExPlugin('ExMwPlugin');
	}

	function finalize()
	{
		super.finalize(...);
	}
	
	function createObject(elm)
	{
		nameCheck(elm.name);

		var layer	= elm.layer;

		if( layer === void || layer[0] != 'm' ) 
			layer	= "message0";


		var obj = objects[objects.count] = %[];
		with (obj) {
			.elm = %[];
			(Dictionary.assign incontextof .elm)(elm);

//	これまで前景レイヤー20がメッセージウィンドウだったのを
//	きちんとmessageレイヤーが親になるように変更
			elm.visible = foreSeen;
			.fore = newObject(kag, kag.fore.messages[+layer.substr(7)], elm);

			elm.visible = backSeen;
			.back = newObject(kag, kag.back.messages[+layer.substr(7)], elm);

		}
	}
}


class ExMwButtonPlugin extends ExMwPlugin
{
	function ExMwButtonPlugin()
	{
		super.ExMwPlugin('ExMwButtonPlugin');
	}
	function finalize()
	{
		super.finalize();
	}
	
	function newObject(window, parent, elm)
	{
		var obj = new ExButtonLayer(window, parent);
		with (obj) {
			.loadImages(elm.file);
			.setPos(elm.x, elm.y);
			.absolute = 2000000-3;
			.visible = elm.visible;
			.setOptions(elm);
		}
		return obj;
	}
	
}

kag.addPlugin(global.exmwbutton_object = new ExMwButtonPlugin(kag));
	// プラグインオブジェクトを作成し、登録する

[endscript]
[endif]

;------------------------------------------------------------------------------
;	ボタン
;		[exbutton name="" x="" y="" file="" onclick="" onenter="" onleave=""]
;		name		識別子
;		x			x座標
;		y			y座標
;		file		画像ファイル名(形式はbuttonタグと同じ)
;		onclick		クリック時に評価される式
;		onenter		マウスが乗った時に評価される式
;		onleave		マウスが離れた時に評価される式
;------------------------------------------------------------------------------
[macro name="exmwbutton"]
	[eval exp="exmwbutton_object.createObject(mp)"]
[endmacro]

;------------------------------------------------------------------------------
;	オプション
;	[exbuttonopt backvisible="" forevisible="" delete=""]
;	backvisible		裏面の表示状態(true,false)
;	forevisible		表面の表示状態
;	delete			名前を指定したものを削除('all'で全て削除)
;------------------------------------------------------------------------------
[macro name="exmwbuttonopt"]
	[eval exp="exmwbutton_object.setOptions(mp)"]
[endmacro]


[return]
