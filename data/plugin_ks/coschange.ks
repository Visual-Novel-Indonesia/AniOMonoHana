
[iscript]

//差し替えが発生するCG
var cosname_cg	= [
		"APDK_01",
		"APDK_02",
		"APDK_03",
		"APDK_04",
		"APDK_05",
		"APDK_06",
		"APDK_07",
		"APDK_08",
		"APDK_09",
		"APDK_10",
		"APDK_11",
		"APDK_12",
		"APDK_13",
		"APDK_14",
		"APDK_15",
		"APDK_16",
		"APDK_17",
		"APDK_18",
		"APDK_19",
		"APDK_20"
];

//差し替えが発生する立ち絵
var cosname_char	= [
		"ta1",			//キャラ1 立ち絵通常
		"tab1",			//キャラ1 立ち絵拡大
		"cut1",			//キャラ1 立ち絵顔のみ
		"cutin1"		//キャラ1 カットイン
];
//イベントCGのコスチュームチェンジ判定
var coschange_cg	= false;

//立ち絵のコスチュームチェンジ判定
var coschange_char	= false;

var count_cg	= cosname_cg.count;
var count_char	= cosname_char.count;


/****************************************************************************/
/*	function		:	イベントCGのコスチュームチェンジ処理				*/
/*	arguments		:	I	[name]		処理予定のイベントCG名				*/
/*						I	[swich]		変更処理ON/OFFフラグ				*/
/*						I	[flg]		イベントCGチェンジ処理判定			*/
/*	return value	:	対象のファイル名（ファイル名変更/そのまま関わらず）	*/
/****************************************************************************/
function func_coschange_cg( name, swich, flg )
{

	//そもそもコスチェンジ使用してない
	if( flg == false )
		return name;

	var	rtn	= false;

	//ファイル名を変更する必要があるCGかチェック
	for( var i = 0; i < count_cg; i++ )
	{
		if( name.indexOf( cosname_cg[i] ) == 0 )
		{
			rtn = true;
			break;
		}
	}

	//イベントCGだけどコスチェンジの必要がない
	if( rtn == false )
		return name;

	//sf.config.megane　コスチェンジOFFなのでファイル名変更無し、対応CGのフラグは立てる
	if( swich == false )
	{
		setCGFlag( 'm' + name, true );
		return name;
	}


	//名前を変更してフラグを立てる
	var	tmpname;

	//元の名前残す
	tmpname		= name;

	name = 'm' + tmpname;

	//変更後のCGフラグはは既存処理の方で立てる
	if( isExist2( tmpname + '.png' ) || isExist( tmpname + '.tlg' ) )
		setCGFlag( tmpname, true );

	return name;
}


/****************************************************************************/
/*	function		:	立ち絵のコスチュームチェンジ処理					*/
/*	arguments		:	I	[name]		処理予定の立ち絵ファイル名			*/
/*						I	[swich]		変更処理ON/OFFフラグ				*/
/*						I	[flg]		立ち絵チェンジ処理判定				*/
/*	return value	:	対象のファイル名（ファイル名変更/そのまま関わらず）	*/
/****************************************************************************/
function func_coschange_char( name, swich, flg )
{

	//そもそもコスチェンジ使用してない
	if( flg == false )
		return name;

	//sf.config.megane　コスチェンジOFFなのでファイル名変更
	if( swich == false )
		return name;

	var	rtn	= false;

	//ファイル名を変更する必要がある立ち絵かチェック
	for( var i = 0; i < count_char; i++ )
	{
		if( name.indexOf( cosname_char[i] ) == 0 )
		{
			rtn = true;
			break;
		}
	}

	//コスチェンジの必要がない立ち絵
	if( rtn == false )
		return name;


	//名前を変更
	var	tmpname;

	//元の名前残す
	tmpname		= name;

	name = 'm' + tmpname;

	return name;
}

[endscript]



[return]
