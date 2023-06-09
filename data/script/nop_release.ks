[eval exp="tf.debugsys = 'nop_release'"]

[iscript]

var	RELEASE		= true;

/****************************/
/*	リリース用コンフィグ	*/
/****************************/
function SetReleaseConfig()
{
	/*	debug用コンソールOFF	*/
	System.setArgument( '-debugwin', 'no' );
	System.setArgument( '-debug', 'no' );
	System.setArgument( '-khabout', '' );
	System.setArgument( '-hkupdaterect', '' );
	System.setArgument( '-hkdumplayer', '' );

	return;
}


/********************/
/*	定義ここまで	*/
/********************/

SetReleaseConfig();

/*	一応正常に定義されてるかチェック	*/
if( System.getArgument( '-debug' ) != 'no' )
{
	System.inform( 'デバッグモードが動作しています' );
	System.exit();
}

if( System.getArgument( '-debugwin' ) != 'no' )
{
	System.inform( 'デバッグ支援ウィンドウエラー' );
	System.exit();
}

/*	更新矩形の表示チェック	*/
if( System.getArgument( '-hkupdaterect' ) != '' )
{
	System.inform( '更新矩形の表示のホットキーエラー' );
	System.terminate();		/*	exitで終了させるとメモリ管理エラーを吐くぞ	*/
}

/*	著作権情報の表示チェック	*/
if( System.getArgument( '-hkabout' ) != '' )
{
	System.inform( '著作権情報の表示のホットキーエラー' );
	System.terminate();		/*	exitで終了させるとメモリ管理エラーを吐くぞ	*/
}


[endscript]

[return]


