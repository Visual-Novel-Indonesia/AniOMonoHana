[if exp="typeof(global.autoInsertLabel_object) == 'undefined'"]
[iscript]

/*
	どこでもセーブプラグイン
*/
class AutoInsertLabelPlugin extends KAGPlugin
{
	var indexStack = [0];
	var curStack = 0;
	var currentRecordName;
	var currentLabel;
	var kidokuSkip = true;
	
	function setOptions(elm)
	{
		kidokuSkip = elm.kidokuskip if elm.kidokuskip!==void;
	}
	
	function onCall()
	{
		curStack++;
		indexStack[curStack] = 0;
	}
	function onReturn()
	{
		indexStack[curStack] = 0;
		if (--curStack < 0) {
			curStack = 0;
		}
	}
	function onJump()
	{
		indexStack[curStack] = 0;
		//curStackはそのまま
	}
	function incRecordLabel()
	{
		if (currentRecordName!==void) {
			sf[currentRecordName] = 0 if !sf[currentRecordName];
			sf[currentRecordName]++;
			//Debug.message('■■■■INC:sf['+currentRecordName+']='+sf[currentRecordName]+'■■■■');
			currentRecordName = void;
		}
	}
	
	function setRecordLabel()
	{
		currentLabel = kag.currentLabel + ':' + indexStack[curStack]++;
		currentRecordName = 'autotrail_' + Storages.chopStorageExt(Storages.extractStorageName(kag.conductor.curStorage)) + '_' + currentLabel.substring(1);

		//Debug.message('■■■■SET:sf['+currentRecordName+']='+sf[currentRecordName]+'■■■■');

		if (kidokuSkip) {
			if (!sf[currentRecordName] && kag.skipMode!=4) {
				kag.cancelSkip();
				//Debug.message('■■■■STOP■■■■');
			}
		}
	}
	
	function putLabel()
	{
		incRecordLabel();
		setRecordLabel();
	}

	function AutoInsertLabelPlugin(window)
	{
		super.KAGPlugin(...);
		this.window = window;
		kag.autoRecordPageShowing = false;

		window.mainConductor.onCall = function()
		{
			global.autoInsertLabel_object.onCall(...);
			return (global.Conductor.onCall incontextof this)(...);
		} incontextof window.mainConductor;
		
		window.mainConductor.onReturn = function()
		{
			global.autoInsertLabel_object.onReturn(...);
			return (global.Conductor.onReturn incontextof this)(...);
		} incontextof window.mainConductor;
		
		window.mainConductor.onJump = function()
		{
			global.autoInsertLabel_object.onJump(...);
			return (global.Conductor.onJump incontextof this)(...);
		} incontextof window.mainConductor;
		
	}

	function finalize()
	{
		super.finalize(...);
	}

	function onStore(f, elm)
	{
		var dic = f.AutoInsertLablePlugin = %[];
		with (dic) {
			.indexStack			= indexStack;
			.curStack			= curStack;
			.kidokuSkip			= kidokuSkip;
			.currentRecordName	= currentRecordName;
			.currentLabel		= currentLabel;
		}
		/*
		Debug.message(
			"indexStack         :"+indexStack+"\n"+
			"curStack           :"+curStack+"\n"+
			"kidokuSkip         :"+kidokuSkip+"\n"+
			"currentRecordName  :"+currentRecordName+"\n"+
			"currentLabel       :"+currentLabel+"\n"
		);
		*/
	}

	function onRestore(f, clear, elm)
	{
		var dic = f.AutoInsertLablePlugin;
		if (dic !== void) {
			with (dic) {
				indexStack			= .indexStack;
				curStack			= .curStack;
				kidokuSkip			= .kidokuSkip;
				currentRecordName	= .currentRecordName;
				currentLabel		= .currentLabel;
			}
		}
		/*
		Debug.message(
			"indexStack         :"+indexStack+"\n"+
			"curStack           :"+curStack+"\n"+
			"kidokuSkip         :"+kidokuSkip+"\n"+
			"currentRecordName  :"+currentRecordName+"\n"+
			"currentLabel       :"+currentLabel+"\n"
		);
		*/
	}

}

kag.addPlugin(global.autoInsertLabel_object = new AutoInsertLabelPlugin(kag));

[endscript]
[endif]


;------------------------------------------------------------------------------
;	オートラベル設置
;		[label]
;------------------------------------------------------------------------------
[macro name="label"]
	[eval exp="global.autoInsertLabel_object.putLabel()"]
	[call target="*autolabel" storage="autoInsertLabel.ks"]
[endmacro]

;------------------------------------------------------------------------------
;	オプション
;		[labelopt kidokuskip=""]
;		kidokuskip		既読判定するか(true,false)
;------------------------------------------------------------------------------
[macro name="labelopt"]
	[eval exp="global.autoInsertLabel_object.setOptions(mp)"]
[endmacro]

[return]


*autolabel|
;実際にセーブするためのラベル


[return]

