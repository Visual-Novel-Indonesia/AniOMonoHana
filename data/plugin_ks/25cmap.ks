;layers[10]の子で作成するので動きに注意

[iscript]

Storages.addAutoPath( "25cdata/" );

class dispMapPlugin extends KAGPlugin
{
	var	baselay;
	var	roomlay;
	var	maplay;
	var	foreLay;	//表画面用のレイヤ
	var	backLay; 	//裏画面用のレイヤ

	var	cwidth;
	var	cheight;

	var	foreVisible;
	var	backVisible;

	var	pos	= [ 5, 40, 75, 110, 145 ];

	/*	コンストラクタ	*/
	function dispMapPlugin()
    {
		super.KAGPlugin();	// スーパークラスのコンストラクタを呼び出します

		/*	マップのベース	*/
		baselay	= new Layer( kag, kag.fore.layers[10] );
		with( baselay )
		{
			.loadImages( "map_base" );
			.setSize( baselay.imageWidth, baselay.imageHeight );
		}

		/*	部屋アイコンのベース	*/
		roomlay	= new Layer( kag, kag.fore.layers[10] );
		roomlay.type		= ltAddAlpha;
		roomlay.loadImages( "map_room" );

		cwidth	= roomlay.imageWidth / 4;
		cheight	= roomlay.imageHeight;

		/*	マップの合成場	*/
		maplay	= new Layer( kag, kag.fore.layers[10] );
		with( maplay )
		{
			.setSize( baselay.imageWidth, baselay.imageHeight );
		}


		// 表画面用のレイヤを作ります
		foreLay	= new Layer( kag, kag.fore.layers[10] );
		with( foreLay )
		{
			.setSize( baselay.imageWidth, baselay.imageHeight );
			.setPos( 10, 28 );
		}

		// 裏画面用のレイヤを作ります
		backLay	= new Layer( kag, kag.back.layers[10] );
		with( backLay )
		{
			.setSize( baselay.imageWidth, baselay.imageHeight );
			.setPos( 10, 28 );
		}

		foreVisible	= false;
		backVisible	= false;
		return;
	}

	/************************************************/
	/*	maplayに各部屋の踏破情報と現在位置情報を反映	*/
	/************************************************/
	function setMapData()
	{
		var	zi;
		var	zj;
		var roomnum	= 0;

		maplay.fillRect(0, 0, maplay.imageWidth, maplay.imageHeight, 0x00000000);

		/*	baseの配置	*/
		maplay.copyRect( 0, 0, baselay, 0, 0, baselay.imageWidth, baselay.imageHeight );

		for( zi = 0; zi < 5; zi++ )
		{
			for( zj = 0; zj < 5; zj++ )
			{
				roomnum	+= 1;

				/*	部屋の状態ごとに部屋の画像転送	*/
				if( f.room[zi][zj] == 0 )
					maplay.copyRect( pos[zj], pos[zi], roomlay, cwidth * 0, 0, cwidth, cheight );
				else if( f.room[zi][zj] == 1 )
					maplay.copyRect( pos[zj], pos[zi], roomlay, cwidth * 1, 0, cwidth, cheight );
				else
					maplay.copyRect( pos[zj], pos[zi], roomlay, cwidth * 2, 0, cwidth, cheight );

				/*	自分がいる場所の表示	*/
				if( roomnum == f.pos )
					maplay.pileRect( pos[zj], pos[zi], roomlay, cwidth * 3, 0, cwidth, cheight, 255 );

			}
		}

		return;
	}

	function onStableStateChanged( stable )
	{

	}

	/************************************/
	/*	レイヤー同士で画像を共有		*/
	/************************************/
	function onCopyLayer( toback )
	{
		if( toback )
			backLay.assignImages( foreLay );	// foreLay の内容を backLay にコピーします（画像を共有します）
		else
			foreLay.assignImages( backLay );	// backLay の内容を foreLay にコピーします（画像を共有します）
	}

	/********************************/
	/*	レイヤーの参照入れ替え		*/
	/********************************/
	function onExchangeForeBack()
	{
		foreLay <-> backLay;  // 表画面用レイヤと裏画面用レイヤの参照を入れ替えます
	}


	/************************************/
	/*	メッセージウィンドウと連動処理	*/
	/************************************/
	function onMessageHiddenStateChanged( hidden )
	{
		if( hidden )
		{
			/*	メッセージレイヤが非表示になったので foreLay, backLay も非表示にします	*/
//			foreLay.visible	= false;
//			backLay.visible	= false;
		}
		else
		{
			/*	メッセージレイヤが表示されたので foreLay, backLay の visible を	*/
			/*	メッセージレイヤが非表示になる前の状態に戻します				*/
//			foreLay.visible	= foreVisible;
//			backLay.visible	= backVisible;
		}
	}

	function drawMapData( fore = true )
	{
		clearMap();

		/*	fore が true なら表、false なら裏画面のレイヤに書き込みます	*/
		var	layer	= fore ? foreLay : backLay;
		layer.piledCopy( 0, 0, maplay, 0, 0, baselay.imageWidth, baselay.imageHeight );

		foreLay.visible	= true;
		backLay.visible	= true;

		return;
	}

	function hideMap()
	{
		foreLay.visible	= false;
		backLay.visible	= false;

		return;
	}

	function clearMap()
	{
		foreLay.fillRect(0, 0, foreLay.imageWidth, foreLay.imageHeight, 0x00000000);
		backLay.fillRect(0, 0, backLay.imageWidth, backLay.imageHeight, 0x00000000);

		return;
	}

	// デストラクタ
	function finalize()
	{
		invalidate	baselay;
		invalidate	roomlay;
		invalidate	maplay;
		invalidate	foreLay;  // 表画面用のレイヤを無効化します
		invalidate	backLay;  // 裏画面用のレイヤを無効化します

		super.finalize();  // スーパークラスのデストラクタを呼び出します

		return;
	}

}


kag.addPlugin( global.map = new dispMapPlugin() );


class dispLifePlugin extends KAGPlugin
{
	var	baselay;
	var	lifelay;
	var	foreLay;	//表画面用のレイヤ
	var	backLay; 	//裏画面用のレイヤ

	var	foreVisible;
	var	backVisible;

	/*	コンストラクタ	*/
	function dispLifePlugin()
    {
		super.KAGPlugin();	// スーパークラスのコンストラクタを呼び出します

		/*	マップのベース	*/
		baselay	= new Layer( kag, kag.fore.layers[10] );
		with( baselay )
		{
			.loadImages( "life_bar" );
			.setSize( baselay.imageWidth, baselay.imageHeight );
		}

		/*	Lifeの合成場	*/
		lifelay	= new Layer( kag, kag.fore.layers[10] );
		with( lifelay )
		{
			.setSize( baselay.imageWidth, baselay.imageHeight );
		}


		// 表画面用のレイヤを作ります
		foreLay	= new Layer( kag, kag.fore.layers[10] );	// 表画面の背景レイヤを親レイヤにします
		with( foreLay )
		{
			.setSize( baselay.imageWidth, baselay.imageHeight );
			.setPos( 590, 28 );
		}

		// 裏画面用のレイヤを作ります
		backLay	= new Layer( kag, kag.back.layers[10] );	// 裏画面の背景レイヤを親レイヤにします
		with( backLay )
		{
			.setSize( baselay.imageWidth, baselay.imageHeight );
			.setPos( 590, 28 );
		}

		foreVisible	= false;
		backVisible	= false;
		return;
	}

	/************************************************/
	/*	maplayに各部屋の踏破情報と現在位置情報を反映	*/
	/************************************************/
	function setLifeData()
	{
		var	cwidth	= baselay.imageWidth - 6;
		var	cheight	= ( baselay.imageHeight / 2 ) - 6;
		var	posx	= 3;
		var	posy	= 20 + 3;
		var life;

		lifelay.fillRect( 0, 0, lifelay.imageWidth, lifelay.imageHeight, 0x00000000 );

		/*	baseの配置	*/
		lifelay.copyRect( 0, 0, baselay, 0, 0, baselay.imageWidth, baselay.imageHeight );

		life	= ( cwidth * f.life ) / 20;

		lifelay.colorRect( posx, posy, life, cheight, 0xff0000 );

		return;
	}

	function onStableStateChanged( stable )
	{

	}

	/************************************/
	/*	レイヤー同士で画像を共有		*/
	/************************************/
	function onCopyLayer( toback )
	{
		if( toback )
			backLay.assignImages( foreLay );	// foreLay の内容を backLay にコピーします（画像を共有します）
		else
			foreLay.assignImages( backLay );	// backLay の内容を foreLay にコピーします（画像を共有します）
	}

	/********************************/
	/*	レイヤーの参照入れ替え		*/
	/********************************/
	function onExchangeForeBack()
	{
		foreLay <-> backLay;  // 表画面用レイヤと裏画面用レイヤの参照を入れ替えます
	}


	function drawLifeData( fore = true )
	{
		clearLife();

		foreLay.visible	= true;
		backLay.visible	= true;

		/*	fore が true なら表、false なら裏画面のレイヤに書き込みます	*/
		var	layer	= fore ? foreLay : backLay;
		layer.piledCopy( 0, 0, lifelay, 0, 0, baselay.imageWidth, baselay.imageHeight );

		return;
	}

	function hideLife()
	{
		foreLay.visible	= false;
		backLay.visible	= false;

		return;
	}

	function clearLife()
	{
		foreLay.fillRect(0, 0, foreLay.imageWidth, foreLay.imageHeight, 0x00000000);
		backLay.fillRect(0, 0, backLay.imageWidth, backLay.imageHeight, 0x00000000);

		return;
	}

	// デストラクタ
	function finalize()
	{
		invalidate	baselay;
		invalidate	lifelay;
		invalidate	foreLay;  // 表画面用のレイヤを無効化します
		invalidate	backLay;  // 裏画面用のレイヤを無効化します

		super.finalize();  // スーパークラスのデストラクタを呼び出します

		return;
	}

}

kag.addPlugin( global.life = new dispLifePlugin() );

[endscript]

;------------------------------------------------------------------------------
;	マップ表示
;		[dispfloormap]
;------------------------------------------------------------------------------
[macro name="dispfloormap"]

[if exp="f.mapvisible == false"]
	[eval exp="f.mapvisible = true"]
	[eval exp="map.setMapData()"]
	[eval exp="map.drawMapData()"]
	[backlay]
[endif]

[endmacro]

;------------------------------------------------------------------------------
;	ライフ表示
;		[displife]
;------------------------------------------------------------------------------
[macro name="displife"]

[if exp="f.lifevisible == false"]
	[eval exp="f.lifevisible = true"]

	[eval exp="life.setLifeData()"]
	[eval exp="life.drawLifeData()"]
	[backlay]
[endif]

[endmacro]

;------------------------------------------------------------------------------
;	マップ消去
;		[hidefloormap]
;------------------------------------------------------------------------------
[macro name="hidefloormap"]


	[eval exp="f.mapvisible = false"]
	[eval exp="map.hideMap()"]

[endmacro]

;------------------------------------------------------------------------------
;	ライフ消去
;		[hidelife]
;------------------------------------------------------------------------------
[macro name="hidelife"]


	[eval exp="f.lifevisible = false"]
	[eval exp="life.hideLife()"]

[endmacro]

[return]
