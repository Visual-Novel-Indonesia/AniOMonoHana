
[iscript]

Storages.addAutoPath( "clickable/" ); //cg

//	反転画像用レイヤー
//	今回は辺り判定が三カ所なのでこれで数が増えたら別の手を考える
var	parts_layer;
var	xnmax;

function onmouse_click( num, sefile )
{
	kag.se[1].play( %[ storage:sefile, loop:false ] );
	kag.fore.layers[0].piledCopy( 0, 0, parts_layer[num], 0, 0, kag.scWidth, kag.scHeight );
	kag.fore.layers[0].visible		= true;
	Debug.message( "clickable_" + num );
	return;
}

function offmouse_click( num )
{
	kag.tagHandlers.stopse( %[ buf:1 ] );
	kag.fore.layers[0].visible		= false;
	return;
}

function clickable_init( name )
{
	var file	= name + '1_p';
	var zntmp;
	var zndib;
	var znrtn;

	var znwidth;
	var zncnt;

	parts_layer	= [];
	xnmax	= 0;

	/*	反転画像の読み込み	*/
	zndib	= new Layer( kag, kag.fore.layers[0] );
	with( zndib )
	{
		.loadImages( name + '2' );
		.setSize( .imageWidth, .imageHeight );
		.visible	= false;
	}

	/*	領域画像の読み込み	*/
	zntmp	= new Layer( kag, kag.fore.layers[0] );
	with( zntmp )
	{
		.setSize( zndib.imageWidth, zndib.imageHeight );
		.loadProvinceImage( file );
		.visible	= false;
	}

	/*	tmpに読み込んだ領域画像を参照して反転画像を分離する	*/
	for( var zny = 0; zny < kag.scHeight; zny++ )
	{
		for( var znx = 0; znx < kag.scWidth; znx++ )
		{
			/*	パレットインデックスの個数を見てクリッカブルマップで使用するレイヤーを作る	*/
			znrtn	= zntmp.getProvincePixel( znx, zny );

			if( znrtn == 0 ) continue;	/*	パレットの先頭は領域ではないということで処理をしない	*/

			if( parts_layer[znrtn] === void )
			{
				parts_layer[znrtn]	= new Layer( kag, kag.fore.layers[0] );
				with( parts_layer[znrtn] )
				{
					.loadImages( "clear" );
					.setSize( zndib.imageWidth, zndib.imageHeight );
					.visible	= false;
				}
				xnmax++;
			}

			znwidth	= 0;

			/*	転送負荷軽減のため一ラインで一続きになっている箇所を検索	*/
			for( var zni = znx + 1; zni < kag.scWidth; zni++ )
			{
				zncnt	= zntmp.getProvincePixel( zni, zny );
				znwidth	+= 1;
				if( zncnt != znrtn )	/*	これ以上同じパレットが続かないので終了	*/
					break;
			}

			/*	レイヤーへ反転画像を転送する	*/
//			parts_layer[znrtn].piledCopy( znx, zny, zndib, znx, zny, 1, 1 );
			parts_layer[znrtn].piledCopy( znx, zny, zndib, znx, zny, znwidth, 1 );
			znx	+= znwidth;		/*	ひとかたまりにした分、x座標を更新	*/

		}
	}

	return;
}

function clickable_end()
{
	var zni;

	dispose( parts_layer );

/*
	for( zni = 1 ; zni <= xnmax; zni++ )
	{
		with( parts_layer[zni] )
		{
			.loadImages( "clear" );
		}
		delete	parts_layer[zni];
//		parts_layer[zni]	= void;
	}
*/
}

function dispose(x)
{
	if(typeof x != 'Object') return;
	if(x === null) return;
	if(!(x isvalid)) return;

	if(x instanceof 'Array')
	{
		for(var i = 0; i < x.count; ++i)
		{
			dispose(x[i]);
		}
	}
	else if(x instanceof 'Dictionary')
	{
		var a = [];
		a.assign(x);
		dispose(a);
	}
	else
	{
		invalidate x;
	}
}

[endscript]

;------------------------------------------------------------------------------
;	クリッカブルマップ表示
;		[clickablemap file=""]
;------------------------------------------------------------------------------
[macro name="clickablemap"]

	;フラグ立て
	[if exp="isExist2( mp.file + '.png' ) || isExist( mp.file + '.tlg' )"]
		[eval exp="setCGFlag( mp.file, true )"]
	[endif]

	;ボディタッチ指示画像の読み込み
	[layopt layer="2" visible="true" page="back" left=0]
	[image storage="click" layer="2" page="back" visible=true]
;	[image storage="&mp.file + '_g'" layer="2" page="back" visible=true]

	;初期化
	[eval exp="clickable_init( &mp.file )"]

	;クリッカブルマップ表示
	[image storage="&mp.file + '1'" layer="base" page="back" visible=true]
;	[image storage="&mp.file" layer="base" page="back" visible=true]
	[crossfade time="500"]

	[record]

	;// 右クリックの動作を止める
	[rclick enabled="false"]

[endmacro]

;------------------------------------------------------------------------------
;	クリッカブルマップ終了処理
;		[clickablemap_end]
;------------------------------------------------------------------------------
[macro name="clickablemap_end"]
	[freeimage layer="2" page="back"]

	[mapdisable layer="base" page="back"]

	;// 右クリックの動作再開
	[rclick enabled="true"]

	[eval exp="clickable_end()"]
[endmacro]

[return]
;-------------------[EOF]-----------------
