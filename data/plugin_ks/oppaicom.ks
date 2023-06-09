
; 既に定義されていれば二重定義を防ぐためにすぐreturnする
[return cond="typeof( global.oppaicom_object ) != 'undefined'"]

[iscript]

var oppai_com = [
	"",//dammy
	"1",	"コマンドテスト1",
	"2",	"コマンドテスト2",
	"3",	"コマンドテスト3",
	"4",	"コマンドテスト4",
	"5",	"コマンドテスト5",
	"6",	"コマンドテスト6",
	"7",	"コマンドテスト7",
	"8",	"コマンドテスト8",
	"9",	"コマンドテスト9",
	"10",	"コマンドテスト10",
	"11",	"コマンド終わり",
	"100",	""
];

/********************************************/
/*	おっぱいコマンドメッセージ部分			*/
/********************************************/
class TextButtonLayer extends Layer
{

	var	dic;
	var	comno;	//	コマンド情報

	function TextButtonLayer( win, par )
	{
		super.Layer( win, par );
		return;
	}

	function CreateObject( window, par, elm )
	{
		dic	= elm;

		comno = callOppaiText( dic.no );

		if( comno == null )
			return;


		setSize( dic.width, dic.height );

		setPos( dic.posx, dic.posy );

		hitThreshold	= 0;	//	枠全体を選択できるようにする

		font.height	= 24;
		drawText( 10, 5, oppai_com[comno + 1], 0xffffff, 255, true, 0, 0x000000, 0, 0, 0);

		visible	= true;

		return;
	}

	function callOppaiText( no )
	{

		for( var i = 1; oppai_com[i] <= 100; i += 2 )
		{
			if( no == oppai_com[i] )
				return i;
		}

		System.inform( "おっぱいコマンドが登録されていません" );
		return null;
	}

	function onMouseEnter()
	{
		loadImages( "clear" );
		drawText( 10, 5, oppai_com[comno + 1], 0xff0000, 255, true, 0, 0x000000, 0, 0, 0);
		return;
	}

	function onMouseLeave()
	{
		loadImages( "clear" );
		drawText( 10, 5, oppai_com[comno + 1], 0xffffff, 255, true, 0, 0x000000, 0, 0, 0);
		return;
	}

	function onClick()
	{

		//	前提プラグイン増えるけど
		var	onclick	= ChJump( "", dic.target );

		Scripts.eval( onclick ) if onclick !== void;
		super.onClick(...);

	 	return;
	}
}


/****************************************/
/*	ドラッガブルレイヤーの雛形作成		*/
/****************************************/
class DraggableLayer extends Layer
{
	var	dic;
	var	dragging;
	var	dragOriginX;
	var	dragOriginY;

	var	newLeft;
	var	newTop;

	// コンストラクタ
	function DraggableLayer( win, par, elm )
	{
		//	パーツ情報等の情報もらう
		dic	= elm;

		// スーパークラスのコンストラクタを呼び出します
		super.Layer( win, par );
	}

	function onMouseDown( x, y, button, shift )
	{
		// ドラッグが開始されたとみなします
		dragging	= true;

		// ドラッグが開始された時の(このレイヤの座標系での)マウスカーソルの座標を保存しておきます
		dragOriginX	= x;
		dragOriginY	= y;

		//	仮で半透明
		opacity	= 128;

		// スーパークラスの onMouseDown メソッドを呼び出します
		super.onMouseDown(...);
	}

	function onMouseUp( x, y, button, shift )
	{
		// ドラッグが終わったとみなします
		dragging	= false;
		opacity		= 255;

		super.onMouseUp(...);
	}

	function onMouseMove( x, y, shift )
	{
		if( dragging )	//	ドラッグ中の場合は…
		{
			// レイヤの移動先の x, y 座標(newLeft, newTop)を計算します
			newLeft	= left + x - dragOriginX;
			newTop	= top + y - dragOriginY;

			// レイヤが親レイヤの範囲外に出ないように位置を調整します
			if( newLeft < -width + dic.width )
				newLeft	= -width + dic.width;
			else if( newLeft > parent.width - dic.width )
				newLeft	= parent.width - dic.width;

			if( newTop < -height + dic.height )
				newTop	= -height + dic.height;
			else if( newTop > parent.height - dic.height )
				newTop	= parent.height - dic.height;

			// レイヤの位置を設定します
			setPos( newLeft, newTop );
		}

		super.onMouseMove(...);
	}

	// デストラクタ
	function finalize()
	{
		super.finalize();
	}
}

/************************************************/
/*	おっぱいコマンド本体(実ウィンドウ)			*/
/*	このプラグイン内でコマンドを作ってる		*/
/************************************************/
class OppaiCommand
{

	var	oppai_command;		//	画像表示先

	//	土台画像群
	var	head;
	var	body;
	var	foot;

	var tblcount;
	var	oppai_button	= [];
	var	oppai_table		= [];
	var	oppai_target	= [];

	var	size;

	function OppaiCommand( kag, elm )
	{

		head	= new Layer( kag, kag.fore.base );
		head.loadImages( "oppai_header" );

		body	= new Layer( kag, kag.fore.base );
		body.loadImages( "oppai_body" );

		foot	= new Layer( kag, kag.fore.base );
		foot.loadImages( "oppai_footer" );

		//	初期位置はヘッダとフッタのみで右下固定
		if( elm.posx == void )
			elm.posx	= kag.scWidth - head.imageWidth;
		if( elm.posy == void )
			elm.posy	= kag.scHeight - ( head.imageHeight + head.imageHeight );

		return;
	}

	//	おっぱいコマンドテーブルクリア
	function ClearTable()
	{
		tblcount	= 0;
		oppai_table.clear;
		oppai_target.clear;
		return;
	}

	//	コマンドの追加
	function SetTable( elm )
	{
		oppai_table[tblcount]	= elm.no;
		oppai_target[tblcount]	= elm.target;
		tblcount	+= 1;
		return;
	}

	//	おっぱいコマンド作成
	function CommandStart( elm )
	{
		//	コマンド個数*コマンドパーツ高さ
		var	comheight	= body.imageHeight * ( tblcount );

		//	ヘッダー高さ+表示コマンドの高さ+フッターの高さ
		var	tablesize	= head.imageHeight + foot.imageHeight + comheight;

		if( tablesize >= kag.scHeight )
		{
			System.inform( "コマンドの数が多すぎます" );
			return;
		}

		//	枠の表示位置・高さ
		//	横は0
		var	headposy	= 0;
		var	bodyposy	= head.imageHeight;
		var	footposy	= tablesize - foot.imageHeight;


		//	おっぱいコマンド枠の情報
		size		= %[];

		size.posx		= kag.scWidth - head.imageWidth;
		size.posy		= kag.scHeight - tablesize;

		size.width		= head.imageWidth;
		size.height		= tablesize;

		oppai_command	= new DraggableLayer( kag, kag.fore.base, size );

		oppai_command.setSize( head.imageWidth, tablesize );

		if( elm.posx >= size.posx )
			elm.posx = size.posx;

		if( elm.posy >= size.posy )
			elm.posy = size.posy;

		//	コマンド位置記録するか固定か
		if( elm.def == true )
			oppai_command.setPos( elm.posx, elm.posy );
		else
			oppai_command.setPos( size.posx, size.posy );

		//	ヘッダ
		oppai_command.stretchCopy( 0, headposy, head.imageWidth, head.imageHeight, head, 0, 0, head.imageWidth, head.imageHeight, stNearest );

		//	ボディ
		oppai_command.stretchCopy( 0, bodyposy, body.imageWidth, comheight, body, 0, 0, body.imageWidth, body.imageHeight, stNearest );

		//	フッター
		oppai_command.stretchCopy( 0, footposy, foot.imageWidth, foot.imageHeight, foot, 0, 0, foot.imageWidth, foot.imageHeight, stNearest );

		//	ボタンの配置
		for( var i = 0; i < tblcount; i++ )
		{
			oppai_button[i]	= new TextButtonLayer( kag, oppai_command );
			oppai_button[i].CreateObject( kag, oppai_command, %[ posx : 0, posy:( head.imageHeight + i * body.imageHeight ), width:body.imageWidth, height:body.imageHeight, no:oppai_table[i], target:oppai_target[i] ] );
		}

		//	表示
		oppai_command.visible = true;
		return;
	}

	//	おっぱいコマンド終わり
	function CommandEnd( elm )
	{
		//	最後にダイアログがあった位置を記録
		if( oppai_command.newLeft !== void )
			elm.posx	= oppai_command.newLeft;
		if( oppai_command.newTop !== void )
			elm.posy	= oppai_command.newTop;

		oppai_command.visible = false;

		invalidate oppai_command if oppai_command !== void;
		oppai_command = void;

		return;
	}

	function onMessageHiddenStateChanged( hidden )
	{
		if( hidden )
			oppai_command.visible = false;
		else
			oppai_command.visible = true;

		return;
	}

	// デストラクタ
	function finalize()
	{
		invalidate	head;
		invalidate	body;
		invalidate	foot;

		delete	oppai_command;
		invalidate	oppai_button;

		return;
	}

}

/************************************************************/
/*	おっぱいコマンドプラグイン本体							*/
/*	一個しか作らないけど理屈上は複数個ウィンドウ作れる		*/
/*	こいつから呼び出さないとウィンドウ破棄が面倒			*/
/************************************************************/
class OppaiPlugin extends KAGPlugin
{
	var	obj;
	var	obj_info	= %[];
	obj_info.def	= false;	//	コマンド座標の記憶
								//	true  : 記憶
								//	false : 右下固定

	function OppaiPlugin()
	{
		super.KAGPlugin();
	}

	function finalize()
	{
		( Dictionary.clear incontextof obj_info )();
		super.finalize();
	}

	function CommandInit( kag )
	{
		obj = new OppaiCommand( kag, obj_info );
		ClearTable();
		return;
	}

	function CommandStart()
	{
		obj.CommandStart( obj_info );
		return;
	}

	function ClearTable()
	{
		obj.ClearTable();
		return;
	}

	function SetTable( elm )
	{
		obj.SetTable( elm );
		return;
	}

	function onMessageHiddenStateChanged( hidden )
	{
		if( obj !== void )
			obj.onMessageHiddenStateChanged( hidden );

		return;
	}

	function CommandEnd()
	{
		obj.CommandEnd( obj_info );
		invalidate obj if obj !== void;
		obj = void;
		return;
	}

	//	セーブ時(栞に保存するとき)に呼ばれる
	//	f = 保存先の栞データ ( Dictionary クラスのオブジェクト )
	//	elm = tempsave 時のオプション(通常はvoid)
	function onStore( f, elm )
	{
		//	セーブデータを初期化
		f.object			= %[];

		//	位置情報ををセーブデータ上に書き込む
		f.object.obj		= obj;
		f.object.obj_info	= obj_info;

		return;
	}

	//	ロード時(栞から読み出すとき)に呼ばれる
	//	f = 読み込む栞データ ( Dictionary クラスのオブジェクト )
	//	clear = メッセージレイヤをクリアするか (tempload 時のみ false)
	//	elm = tempload 時のオプション (通常はvoid, tempload 時は dic)
	function onRestore( f, clear, elm )
	{
		if ( f.object === void )
			return;	 // 一応エラーチェックしておく

		//	各種情報 を復活する
		obj			= f.object.obj;
		obj_info	= f.object.obj_info;

		return;
	}

}

kag.addPlugin( global.oppaicom_object = new OppaiPlugin( kag ) );

	// プラグインオブジェクトを作成し、登録する

[endscript]


;*******************************************************************************
;	function	: おっぱいコマンドの初期化
;	sample		: [oppai_init]
;	argumens	: I		[kag]		kag以外は入れない
;	comment		: コマンド使用前に定義する
;*******************************************************************************
[macro name="oppai_init"]
	[eval exp="oppaicom_object.CommandInit( kag )"]
[endmacro]

;*******************************************************************************
;	function	: おっぱいコマンドの終了処理
;	sample		: [oppai_end]
;	argumens	: -
;	comment		: コマンドを選択してジャンプ後に必ず定義
;*******************************************************************************
[macro name="oppai_end"]
	[eval exp="oppaicom_object.CommandEnd()"]
[endmacro]

;*******************************************************************************
;	function	: おっぱいコマンドのテーブルの消去
;	sample		: [oppai_clear]
;	argumens	: -
;	comment		: テーブルに登録した各種コマンドの全消去
;*******************************************************************************
[macro name="oppai_clear"]
	[eval exp="oppaicom_object.ClearTable()"]
[endmacro]

;*******************************************************************************
;	function	: おっぱいコマンドの登録
;	sample		: [oppai_add]
;	argumens	: I		[no]		コマンド内容呼び出しID
;				  I		[target]	選択後の飛び先
;	comment		: IDと文字情報はoppai_comに記述
;*******************************************************************************
[macro name="oppai_add"]
	[eval exp="oppaicom_object.SetTable( mp )"]
[endmacro]

;*******************************************************************************
;	function	: おっぱいコマンドの開始
;	sample		: [oppai_command]
;	argumens	: -
;	comment		: コマンド使用開始
;*******************************************************************************
[macro name="oppai_command"]
	[eval exp="oppaicom_object.CommandStart()"]
[endmacro]

[return]
