
;------------------------------------------------------------------------------
;	トランジションマクロベース
;------------------------------------------------------------------------------
[macro name="trans2"]
;	[clickskip enabled="false" cond="kag.skipMode<=1"]
	[stopmove]
	[stoptrans]
	[if exp="kag.skipMode<=0 && sf.config.transEffect=='on'"]
		[trans *]
		[wt canskip="false"]
	[endif]
	[if exp="kag.skipMode<=0 && sf.config.transEffect=='click'"]
		[trans *]
		[wt canskip="true"]
	[endif]
	[if exp="kag.skipMode>0 || sf.config.transEffect=='off'"]
		[forelay]
	[endif]
;	[clickskip enabled="true"]
[endmacro]

;------------------------------------------------------------------------------
;	クロスフェード
;		[crossfade time=""]
;------------------------------------------------------------------------------
[macro name="crossfade"]
	[trans2 time="&mp.time" method="crossfade"]
[endmacro]

[macro name="nowaitfade"]
	[stopmove]
	[stoptrans]
	[if exp="sf.config.transEffect=='on'"]
		[trans time="&mp.time" method="crossfade"]
	[endif]
	[if exp="sf.config.transEffect=='off'"]
		[forelay]
	[endif]
	[if exp="sf.config.transEffect=='click'"]
		[trans time="&mp.time" method="crossfade"]
	[endif]
[endmacro]

;------------------------------------------------------------------------------
;	ユニバーサルトランジション
;		[universal time="" rule="" vague=""]
;------------------------------------------------------------------------------
[macro name="rulefade"]
	[trans2 time="&mp.time" method="universal" rule="&mp.rule" vague="64"]
[endmacro]

;------------------------------------------------------------------------------
;	スクロールトランジション
;		[scroll time="" from="" stay=""]
;------------------------------------------------------------------------------
[macro name="scroll"]
	[trans2 time="&mp.time" method="scroll" from="&mp.from" stay="&mp.stay"]
[endmacro]



;------------------------------------------------------------------------------
;	マクロ作成例
;------------------------------------------------------------------------------

;[rule no="" vague=""]
[macro name="rule"]
	[eval exp="mp.rule='rule%03d'.sprintf(mp.no)"]
	[universal *]
[endmacro]

;[stayfore time="" from=""]
[macro name="stayfore"]
	[eval exp="mp.stay='stayfore'"]
	[scroll *]
[endmacro]

;[stayback time="" from=""]
[macro name="stayback"]
	[eval exp="mp.stay='stayback'"]
	[scroll *]
[endmacro]

;[nostay time="" from=""]
[macro name="nostay"]
	[eval exp="mp.stay='nostay'"]
	[scroll *]
[endmacro]







[return]

