;------------------------------------------------------------------------------
;	レイヤーを非表示属性にする
;		[negaposi_layer no="レイヤー番号"]
;------------------------------------------------------------------------------
[macro name="negaposi_layer"]
	[eval exp="mp.layer =mp.no"]
	[eval exp="mp.page = 'back'"]
;	[eval exp="kag.getLayerFromElm(mp).doGrayScale()"]
	[eval exp="kag.getLayerFromElm(mp).adjustGamma( 1.0, 255, 0, 1.0, 255, 0, 1.0, 255, 0 )"]
[endmacro]


;------------------------------------------------------------------------------
;	画面をネガポジ反転する
;------------------------------------------------------------------------------

[macro name="negaposi_mode"]
	[eval exp="f.negaposi_mode = true"]
	[eval exp="f.sepia_mode = false"]
	[eval exp="f.gray_mode = false"]
	[negaposi_layer no="base"]
	[negaposi_layer no="0"]
	[negaposi_layer no="1"]
	[negaposi_layer no="2"]
	[negaposi_layer no="3"]
	[negaposi_layer no="4"]
[endmacro]

[return]
;-------------------[EOF]-----------------
