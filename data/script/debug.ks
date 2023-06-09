[eval exp="tf.debugsys = 'debug'"]

[iscript]

var titleOrg = System.title;
var verOrg = tf.ver;


kag.onConductorAfterReturn = function()
{
	setTitle( '[' + verOrg + ']' + '['+mainConductor.curStorage+' - '+mainConductor.curLine+']' + titleOrg );
	return (global.KAGWindow.onConductorAfterReturn incontextof kag)(...);
} incontextof kag;


kag.onConductorScenarioLoaded = function()
{
	setTitle( '[' + verOrg + ']' + '['+mainConductor.curStorage+' - '+mainConductor.curLine+']' + titleOrg );
	return (global.KAGWindow.onConductorScenarioLoaded incontextof kag)(...);
} incontextof kag;

[endscript]


[return]

