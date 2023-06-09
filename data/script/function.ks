;■更新履歴
;2010/12/03		ネガポジモード追加


[iscript]
//
//ファイルがあるかどうか確認する処理
//
function isExist(fn)
{
	if (!Storages.isExistentStorage(fn)) {
		System.inform('ファイル\"'+fn+'\"がみつかりません');
		return false;
	}
	return true;
}

//
//ファイルがあるかどうか確認する・ダイアログがでない
//

function isExist2(fn)
{
	if (!Storages.isExistentStorage(fn)) {
		return false;
	}
	return true;
}

//
//	レイヤーを全て非表示
//
function hideLayer(page='back')
{
	var layers = page=='back' ? kag.back.layers : kag.fore.layers;
	
	for (var i = layers.count-1; i >= 0; i--) {
		layers[i].visible = false;
	}
}

//
//	メッセージレイヤーを全て非表示
//

function clearMessage(page='back')
{
	var layers;
	if (page=='back') {
		layers = kag.back.messages;
	}
	else {
		layers = kag.fore.messages;
	}
	
	for (var i = layers.count-1; i >= 0; i--) {
		layers[i].visible = false;
	}
}

//
//	カラーモードを復帰する
//


function colormode_recovery()
{
	if(f.sepia_mode == true){
		kag.fore.base.doGrayScale();
		kag.fore.base.adjustGamma(1.6,0,255,0.9,0,255,0.6,0,255);
		kag.back.base.doGrayScale();
		kag.back.base.adjustGamma(1.6,0,255,0.9,0,255,0.6,0,255);

		for(var i = 0; i<5; i++){
		kag.fore.layers[i].doGrayScale();
		kag.fore.layers[i].adjustGamma(1.6,0,255,0.9,0,255,0.6,0,255);
		kag.back.layers[i].doGrayScale();
		kag.back.layers[i].adjustGamma(1.6,0,255,0.9,0,255,0.6,0,255);
		}
	}

	if(f.pink_mode == true){
		kag.fore.base.doGrayScale();
		kag.fore.base.adjustGamma(2.8,0,255,1.0,0,255,1.0,0,255);
		kag.back.base.doGrayScale();
		kag.back.base.adjustGamma(2.8,0,255,1.0,0,255,1.0,0,255);

		for(var i = 0; i<5; i++){
		kag.fore.layers[i].doGrayScale();
		kag.fore.layers[i].adjustGamma(2.8,0,255,1.0,0,255,1.0,0,255);
		kag.back.layers[i].doGrayScale();
		kag.back.layers[i].adjustGamma(2.8,0,255,1.0,0,255,1.0,0,255);
		}
	}

	if(f.gray_mode == true){
		kag.fore.base.doGrayScale();
		kag.back.base.doGrayScale();

		for(var i = 0; i<5; i++){
		kag.fore.layers[i].doGrayScale();
		kag.back.layers[i].doGrayScale();
		}
	}

//	ネガポジモード追加	2010/12/03
	if( f.negaposi_mode == true )
	{
		kag.fore.base.doGrayScale();
		kag.fore.base.adjustGamma( 1.0, 255, 0, 1.0, 255, 0, 1.0, 255, 0 );
		kag.back.base.doGrayScale();
		kag.back.base.adjustGamma( 1.0, 255, 0, 1.0, 255, 0, 1.0, 255, 0 );

		for( var i = 0; i < 5; i++ )
		{
			kag.fore.layers[i].doGrayScale();
			kag.fore.layers[i].adjustGamma( 1.0, 255, 0, 1.0, 255, 0, 1.0, 255, 0 );
			kag.back.layers[i].doGrayScale();
			kag.back.layers[i].adjustGamma( 1.0, 255, 0, 1.0, 255, 0, 1.0, 255, 0 );
		}
	}

	//直前が拡大状態なら拡大状態に裏画面を操作
	if( f.cgzoom == true )
	{
		cgzoom_object.dispstretchdib( f.cgzoomdic.file, f.cgzoomdic.dl, f.cgzoomdic.dt, f.cgzoomdic.dw, f.cgzoomdic.dh, "fore" );
		cgzoom_object.dispstretchdib( f.cgzoomdic.file, f.cgzoomdic.dl, f.cgzoomdic.dt, f.cgzoomdic.dw, f.cgzoomdic.dh, "back" );
	}


//	マップを再表示
	if( f.mapvisible )
	{
		map.setMapData();
		map.drawMapData();
	}

//	ライフを再表示
	if( f.lifevisible )
	{
		life.setLifeData();
		life.drawLifeData();
	}

	// 文字のフェード状態の復帰
	setFadeState( sf.config.stfade );

	/*	ここで透明度を変えないとロード時に前回の透明度で再現される	*/
	setWindowOpacity( sf.config.windowopa );
	return;


}



//
//	tjs上でのjumpタグっぽい処理
//
function jump(storage, label)
{
	kag.process(storage, label);
}


//
//	バックログの履歴削除
//
function clearHistory()
{
	kag.historyLayer.clear();
}

//
//	メッセージレイヤーを一時的に非表示
//	（右クリックで非表示にするのと同じ）
//
function hideMessage()
{
	kag.hideMessageLayerByUser();
}


//
//	メッセージレイヤーの一時的な非表示を解除
//
function showMessage()
{
	kag.showMessageLayerByUser();
}


//
//	メッセージレイヤーの表示切り替え
//
function toggleMessageShowing()
{
	if (kag.messageLayerHiding) {
		showMessage();
	}
	else {
		hideMessage();
	}
}

//
//	フルスクリーンかどうか
//
function isFullScreen()
{
	return kag.fullScreened;
}

//
//	ウィンドウモードに移行
//
function changeWindowMode()
{
	kag.onWindowedMenuItemClick();
}


//
//	フルスクリーンモードに移行
//
function changeFullScreenMode()
{
	kag.onFullScreenMenuItemClick();
}


//
//	ウィンドウモードの切り替え
//
function toggleScreenMode()
{
	if (isFullScreen()) {
		changeWindowMode();
	}
	else {
		changeFullScreenMode();
	}
}

/********************************************/
/*	メッセージウィンドウの透明度を変える	*/
/********************************************/
function setWindowOpacity( num )
{
	with(kag)
	{

//	メッセージ枠の種類を増やす場合は透明度変更処理を随時追加するように
//	子のメッセージウィンドウのボタンの透明度は親ウィンドウに引きずられる
		.fore.messages[0].opacity	= num;
		.back.messages[0].opacity	= num;

		.fore.messages[3].opacity	= num;
		.back.messages[3].opacity	= num;

		.saveSystemVariables();
	}
}


/********************************/
/*	文字列のフェード属性の変更	*/
/********************************/
function setFadeState( flg )
{
	with(kag)
	{
		for(var i = 0; i < .numMessageLayers; i++)
		{
			.fore.messages[i].setDefaultStyle( %[ fade:flg ] );
			.back.messages[i].setDefaultStyle( %[ fade:flg ] );
		}
		.saveSystemVariables();
	}
}

//
//	テキスト表示スピードの変更
//
function setTextSpeed(speed)
{
	with (kag) {
		.userChSpeed = (int)+speed;
		.setUserSpeed();
		.saveSystemVariables();
	}
}

//
//	オート時のウェイト変更
//
function setAutoWait(page, line)
{
	with (kag) {
		.autoModePageWait = (int)+page;
		.autoModeLineWait = (int)+line;
	}
}

//
//	文字列の先頭に&がついている場合に
//	&以降の文字列を評価する
//
function getVarContents(str)
{
	if (str[0]=='&') {
		return Scripts.eval(str.substring(1));
	}
	return str;
}

//
//	セーブデータが存在するかどうか調べる
//
function isExistentBookMark(no)
{
	//	セーブデータが存在するかどうか調べる
	return Storages.isExistentStorage(kag.getBookMarkFileNameAtNum(no));
}


//
// メッセージ履歴をクリックしたときに実行する TJS 式を生成する
//
function createHistoryActionExp(file)
{
	// メッセージ履歴をクリックしたときに実行する TJS 式を生成する
	return "HistoryActionExp('" + file + "')";
}

function HistoryActionExp(file)
{
	kag.se[2].setOptions(%[volume:0]);
	kag.se[0].play(%[storage:file]);
}



//
//	指定したIDのボイスを再生するかどうかのフラグを返す
//
function createVoiceFlagName(id)
{
	return 'voice_' + id;
}

//
//	指定したIDのボイスを再生するかどうかのフラグの値を設定する
//
function getVoiceFlag(id)
{
	return sf[createVoiceFlagName(id)];
}

//
//	指定したIDのボイスを再生するかどうかのフラグの値を設定する
//

function setVoiceFlag(id, flag)
{
	sf[createVoiceFlagName(id)] = flag;
}


//
//	指定されたファイルのシーン回想用のフラグを取得する
//
function getSceneFlag(fname)
{
	sf._scene_ = %[] if sf._scene_===void;
	return sf._scene_[Storages.chopStorageExt(fname)];
}

//
//	指定されたファイルのシーン回想用のフラグに値を設定する
//
function setSceneFlag(fname, flag)
{
	sf._scene_ = %[] if sf._scene_===void;
	sf._scene_[Storages.chopStorageExt(fname)] = flag;
}


//
//	指定されたファイルのCG鑑賞用のフラグを取得する
//
function getCGFlag(fname)
{
	sf._cg_ = %[] if sf._cg_===void;
	return sf._cg_[Storages.chopStorageExt(fname)];
}

//
//	指定されたファイルのCG鑑賞用のフラグの値を設定する
//
function setCGFlag(fname, flag)
{
	sf._cg_ = %[] if sf._cg_===void;
	sf._cg_[Storages.chopStorageExt(fname)] = flag;
}

//
//	リンクを選択したことがあるかどうかを保持するフラグ名を作成する
//

function createLinkFlagName(storage, target)
{
	if (storage === void || storage == '') {
		storage = kag.mainConductor.curStorage;
	}
	return 'link_' + Storages.chopStorageExt(storage) + '_' + target.substring(1, target.length-1);
}

//
//	リンクを選択したときに選択フラグをオンにする
//

function onSelectLink()
{
	var selectedLink = kag.current.links[kag.current.lastLink];
	var flagName = createLinkFlagName(selectedLink.storage, selectedLink.target);
	sf[flagName] = true;
}

//
//	[move2]のpath中の変数を展開する
//

function expressionMovePath(path)
{
	var array = [].split("(), ", path, , true);
	var path = '';

	var left = 0;
	var top = 0;
	var opacity = 0;
	var count = array.count;
	for (var i = 0; i < count; i+=3) {
		left	= getVarContents(array[i+0]);
		top		= getVarContents(array[i+1]);
		opacity = getVarContents(array[i+2]);
		path += '('+left+','+top+','+opacity+')';
	}
	return path;
}



//
//	オートモードの切り替え
//

function auto()
{

	// [s]コマンド等の止まってる途中は受け付けない
	if( kag.inSleep )
		return;

	if (kag.skipMode > 1) {
		return;
	}
	if (kag.autoMode) {
		kag.cancelAutoMode();
	}
	else {
		kag.enterAutoMode();
	}
}

//
//	スキップモードの切り替え
//

function skip()
{

	// [s]コマンド等の止まってる途中は受け付けない
	if( kag.inSleep )
		return;

	if (kag.skipMode > 1) {
		kag.cancelSkip();
	}
	else {
		kag.skipToStop();
	}
}


/************************/
/*	クイックセーブ		*/
/*	拡張showDialog対応	*/
/************************/
function quickSave( showdialog = true )
{
	if( kag.skipMode > 1 )
		return;

	kag.storeBookMark( 0, false );
	showDialog( 10, void, %[] ) if showdialog;
}

/************************/
/*	オートセーブ		*/
/************************/
function AutoSave()
{
	if ( kag.skipMode > 1 )
		return;

	kag.storeBookMark( 100, false );
}

/********************************************/
/*	オートセーブを復帰						*/
/*	拡張showDialog対応（現仕様では未使用）	*/
/********************************************/
function autosaveLoad()
{
	if ( kag.skipMode > 1 )
		return;

	if( !isExistentBookMark( 100 ) )
		showDialog( 8, void, %[] );

	kag.historyLayer.clear();
	kag.restoreBookMark( 100, false );
}

/************************/
/*	クイックロード		*/
/*	拡張showDialog対応	*/
/************************/
function quickLoad()
{
	if( kag.skipMode > 1 )
		return;

	if( !isExistentBookMark( 0 ) )
		showDialog( 8, void, %[] );
	else
		showDialog( 11, quickLoad_dlg, %[] );

}

/****************************************/
/*	レイヤーダイアログ用クイックセーブ	*/
/*	showDialogの第二引数から呼び出す	*/
/****************************************/
function quickLoad_dlg()
{
	kag.historyLayer.clear();
	kag.restoreBookMark( 0, false );
	colormode_recovery();
	return;
}

//
//	ボイスリピート
//

function voiceRepeat()
{
	if (kag.skipMode > 1) {
		return;
	}
	kag.se[0].play(%[storage:f.lastVoice]) if f.lastVoice!==void;
}

/************************/
/*	タイトルに戻る		*/
/*	拡張showDialog対応	*/
/************************/
function goToStart()
{
	if( kag.skipMode > 1 )
		return;

	showDialog( 3, kag.goToStart, %[] );
}

//
//	終了する
//
function exit()
{
	if ( kag.skipMode > 1 || kag.usingExtraConductor )
		return;

	kag.close();
}

//
//	バックログの表示
//

function showHistory()
{
	if (kag.skipMode > 1) {
		return;
	}
	if (kag.historyShowing!==true) {
		kag.showHistory();
	}
}

/************************/
/*	前の選択肢に戻る	*/
/*	拡張showDialog対応	*/
/************************/
function backHistory()
{
	if( kag.skipMode > 1 )
		return;

	if( canBackHistory() )
		showDialog( 5, backHistory_dlg, %[] );

}

/********************************************/
/*	レイヤーダイアログ用前の選択肢へ戻る	*/
/*	showDialogの第二引数から呼び出す		*/
/********************************************/
function backHistory_dlg()
{
	clearHistory();
	kag.goBackHistory( false );
	return;
}



//
//	前の選択肢に戻れるかどうか
//
function canBackHistory()
{
	return kag.isHistoryOfStoreAlive();
}

/****************************************************/
/*	シーン回想中のスクリプトからシーン回想に戻る	*/
/*	拡張showDialog対応（現仕様では未使用）			*/
/****************************************************/
function backToScene()
{

	//回想シーンの実行中スクリプトから強制的に[return]する
	//直接関数呼べればいいんだけどどれが[return]タグに相当するか分からん
	showDialog( 9, backToScene_dlg, %[] );
}

/****************************************************/
/*	シーン回想中のスクリプトからシーン回想に戻る	*/
/*	showDialogの第二引数から呼び出す				*/
/****************************************************/
function backToScene_dlg()
{
	kag.process( 'function.ks', '*return' );
	return;
}

//
//	セーブ画面に行く
//


function save()
{
	if (kag.skipMode > 1 || kag.usingExtraConductor) {
		return;
	}
	
	//[s]タグ等で停止していないといけない
	//TODO:ジャンプ先を変更する
	kag.callExtraConductor('mode_saveload.ks', '*save');
}

//
//	ロード画面に行く
//

function load()
{
	if (kag.skipMode > 1 || kag.usingExtraConductor) {
		return;
	}
	//[s]タグ等で停止していないといけない
	//TODO:ジャンプ先を変更する
	kag.callExtraConductor('mode_saveload.ks', '*load');
}

//
//	コンフィング画面に行く
//

function config()
{
	if (kag.skipMode > 1 || kag.usingExtraConductor) {
		return;
	}
	//[s]タグ等で停止していないといけない
	//TODO:ジャンプ先を変更する
	kag.callExtraConductor('mode_config.ks', '*config');
}

function drawNumber(number, image, dstlayer, x, y, digits)
{
	var srclayer = kag.temporaryLayer;
	srclayer.loadImages(image);
	
	var numberWidth = srclayer.imageWidth / 10;
	var numberHeight = srclayer.imageHeight;
	
	var fmt = "%%0%0dd".sprintf(digits);
	number = fmt.sprintf(+number);
	
	//Debug.message('■■■■'+digits+'/'+fmt+'/'+number);
	
	for (var i = 0; i < digits; i++) {
		dstlayer.copyRect(x, y, srclayer, +number[i]*numberWidth, 0, numberWidth, numberHeight);
		x += numberWidth;
	}
}

function saveload_drawNumber(number, image, layer, page, x, y, digits)
{
	var srclayer = kag.temporaryLayer;
	srclayer.loadImages(image);
	
	var dstlayer;
	if (page=='fore') {
		dstlayer = kag.fore.layers[layer];
	}
	else {
		dstlayer = kag.back.layers[layer];
	}
	
	var numberWidth = srclayer.imageWidth / 10;
	var numberHeight = srclayer.imageHeight;
	
	//Debug.message('■■■■■'+numberWidth+','+numberHeight);

	var maxDigits = 4;
	var num = [
		(int)(+number / 1000),
		(int)((+number % 1000) / 100),
		(int)((+number % 100) / 10),
		(int)(+number % 10),
		];

	for (var i = maxDigits-digits; i < maxDigits; i++) {
		dstlayer.copyRect(x, y, srclayer, num[i]*numberWidth, 0, numberWidth, numberHeight);
		x += numberWidth;
	}
}


//;**********************************/
//;*区間ジャンプ					*/
//;*titleへのジャンプのみ限定実装	*/
//;**********************************/
function myKeyClickHook()
{
	kag.process( tf.file, tf.label );
	return true;
}


/****************************************************************************/
/*	function		:	選択肢の飛び先確定処理								*/
/*	arguments		:	I	[storage]		飛び先ファイル名				*/
/*						I	[label]			飛び先ラベル名					*/
/*	return value	:	void												*/
/****************************************************************************/
function ChJump( storage, label )
{

	// 選択先へ飛ぶ前の処理

	// Ctlrスキップの復帰
	if( typeof( global.CtrlSkip_obj ) != 'undefined' )
		.CtrlSkip_obj.setOptions( %[ enabled : true ] );

	// キーバインド復帰
	if( typeof( global.exkeybind_object ) != 'undefined' )
		.exkeybind_object.setOptions( %[ enable : 'true' ] );	// なんか知らんけど判定が文字のtrue

	//選択先へジャンプ
	kag.process( storage, label );
	return;
}

[endscript]



[return]
