[if exp="typeof(global.exkeybind_object) == 'undefined'"]
[iscript]

class ExKeybindPlugin extends KAGPlugin
{
	var window;
	var enable;
	var stable;
	var savename;
	var hooks = [];
	
	function ExKeybindPlugin(window)
	{
		super.KAGPlugin(...);
		window.keyDownHook.add(this.keyDownHook);
		savename = 'ExKeybindPlugin';
	}
	function finalize()
	{
		super.finalize();
		//window.keyDownHook.remove(this.keyDownHook);
	}
	
	function setOptions(elm)
	{
		if (elm.enable!==void) {
			enable = (elm.enable=='true') ? true : false;
			stable = enable;
		}
		
		del(elm.delete) if elm.delete!==void;
	}
	
	function add(key, shift, exp)
	{
		key = Scripts.eval(key) if typeof(key) == 'String'; //文字ｰ>コード
		shift = Scripts.eval(shift) if typeof(shift) == 'String';
		del(key);
		hooks.add(%[key:key, shift:shift, exp:exp]);
	}
	
	function del(key)
	{
		if (key == 'all') {
			hooks.clear();
			return;
		}
		var count = hooks.count;
		for (var i = 0; i < count; i++) {
			if (key == hooks[i].key) {
				delete hooks[i];
				break;
			}
		}
	}
	
	function keyDownHook(key, shift)
	{
		if (enable!==true) {
			return false;
		}
		
		var count = hooks.count;
		for (var i = 0; i < count; i++) {
			with (hooks[i]) {
				if (key===.key && (.shift===void || shift===.shift)) {
					Scripts.eval(.exp);
					return true;
				}
			}
		}
		
		return false;
	}

	function onStore(f, elm)
	{
		// 栞を保存する際に呼ばれる
		// f = 保存先の栞データ ( Dictionary クラスのオブジェクト )
		// elm = tempsave 時のオプション ( 現在は常に void )
		var dic = f[savename] = %[];
		with (dic) {
			.enable = stable;
			.hooks = hooks;
		}
	}

	function onRestore(f, clear, elm)
	{
		// 栞を読み出すときに呼ばれる
		// f = 読み込む栞データ ( Dictionary クラスのオブジェクト )
		// clear = メッセージレイヤをクリアするか ( tempload の時のみ false )
		// elm = tempload 時のオプション ( tempload でない場合は 常に void,
		//                                 tempload の時は Dictionary クラスのオブジェクト )
		var dic = f[savename];
		if (dic !== void) {
			with (dic) {
				enable = .enable;
				hooks = .hooks;
			}
			stable = enable;
		}
	}

	function onStableStateChanged(stable)
	{
		// 安定 ( s l p タグで停止中 ) または 走行中 ( それ以外 )
		// の状態が変化したときに呼ばれる
		// stable = 安定の状態に true, それ以外の場合に false

		if (stable) {
			enable = this.stable;
		}
		else {
			this.stable = enable;
			enable = false;
		}
	}

	function onSaveSystemVariables()
	{
		// システム変数に情報が保存され時に呼ばれる
		// このタイミングで kag.scflags に情報を書き込めば
		// 確実にシステム変数に情報を書くことができる
	}
}

kag.addPlugin(global.exkeybind_object = new ExKeybindPlugin(kag));
	// プラグインオブジェクトを作成し、登録する

[endscript]
[endif]

;------------------------------------------------------------------------------
;	キーボードバインド
;		[exkeybind key="" shift="" exp=""]
;		key		仮想キーコード
;		shift	シフトキーの状態
;				ssAlt		: ALT キーが押されていた
;				ssShift		: SHIFT キーが押されていた
;				ssCtrl		: CTRL キーが押されていた
;				ssLeft		: マウスの左ボタンが押されていた
;				ssMiddle	: マウスの中ボタンが押されていた
;				ssRight		: マウスの右ボタンが押されていた
;							  また、キーボードが長時間押され、キーリピートが発生している場合は 以下の値も組み合わされます。
;				ssRepeat	: キーリピートが発生した
;		exp		実行される式
;------------------------------------------------------------------------------
[macro name="exkeybind"]
	[eval exp="global.exkeybind_object.add(mp.key, mp.shift, mp.exp)"]
[endmacro]

;------------------------------------------------------------------------------
;	キーボードバインドオプション
;		[exkeybindopt delete="" enable=""]
;		delete	削除する仮想キーコード('all'で全削除)
;		enable	キーバインドの有効無効(true,false)
;------------------------------------------------------------------------------
[macro name="exkeybindopt"]
	[eval exp="global.exkeybind_object.setOptions(mp)"]
[endmacro]


[return]

