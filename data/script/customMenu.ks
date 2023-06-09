

[iscript]

/*	システム	*/
kag.systemMenu.add( kag.configMenuItem = new KAGMenuItem( kag, "Config", 0, config, false ) );
kag.systemMenu.add( kag.saveMenuItem = new KAGMenuItem( kag, "Save", 0, save, false ) );
kag.systemMenu.add( kag.loadMenuItem = new KAGMenuItem( kag, "Load", 0, load, false ) );
kag.systemMenu.add( kag.goToStartMenuItem = new KAGMenuItem( kag, "Return to Title", 0, goToStart, false ) );
kag.systemMenu.add( kag.exitMenuItem = new KAGMenuItem( kag, "Quit Game", 0, exit, false ) );

/*	クイックセーブ	*/
kag.menu.add( kag.quickSaveMenu = new KAGMenuItem( kag, "Quicksave", 0, quickSave, false ) );

/*	クイックロード	*/
kag.menu.add( kag.quickLoadMenu = new KAGMenuItem( this, "Quickload", 0, quickLoad, false ) );

/*	選択肢に戻る	*/
kag.menu.add( kag.backHistoryMenu = new KAGMenuItem( this, "Return to Last Choice", 0, backHistory, false ) );

/*	ボイスリピート	*/
kag.menu.add( kag.voiceRepeatMenu = new KAGMenuItem( this, "Replay Voices", 0, voiceRepeat, false ) );

/*	バックログ	*/
kag.menu.add( kag.showHistoryMenu = new KAGMenuItem( this, "Log", 0, showHistory, false ) );

/*	オート	*/
kag.menu.add( kag.autoMenu = new KAGMenuItem( this, "Autoplay", 0, auto, false ) );

/*	スキップ	*/
kag.menu.add( kag.skipMenu = new KAGMenuItem( this, "Skip", 0, skip, false ) );

kag.setMenuAccessibleAll();

[endscript]

[return]
