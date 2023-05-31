[if exp="typeof(global.exsmenu_object) == 'undefined'"]
[iscript]


class ExsMenuLayer extends ExButtonLayer
{
	var menuenable = true;
	var onenablecheck = 'true';
	
	function ExsMenuLayer(window, parent)
	{
		super.ExButtonLayer(window, parent);
		showFocusImage = true;
		//focusable = true;
	}
	
	function filnalize()
	{
		super.finalize(...);
	}
	
	function onClick()
	{
		if (menuenable===true) {
			super.onClick(...);
		}
	}

	function setOptions(elm)
	{
		onenablecheck = elm.onenablecheck if elm.onenablecheck!==void;
		super.setOptions(...);
		update();
	}

	function draw()
	{
		//drawState��enabled==false���Ə����drawState(0)�ɂ��Ă��܂��̂ŉ������
		var enabledOrg = enabled;
		enabled = true;
		(menuenable===true) ? super.draw() : drawState(3);
		enabled = enabledOrg;
	}
	
	function onPaint()
	{
		enableCheck();
		super.onPaint(...);
	}
	
	function enableCheck()
	{
		var last_menuenable = menuenable;
		menuenable = (Scripts.eval(onenablecheck) ? true : false) if onenablecheck!==void;
		
		if (menuenable != last_menuenable) {
			update();
		}
		
		//Debug.message('������������'+name + '/' + menuenable + '/' + onenablecheck);
	}
}





class ExsMenuPlugin extends ExPlugin
{
	var triggerBtn = %[];
	var fullAreaBtn = %[];
	var show = false;
	var ready = false;

	function ExsMenuPlugin()
	{
		super.ExPlugin('ExsMenuPlugin');
	}

	function finalize()
	{
		super.finalize(...);
	}

	function createObject(elm)
	{
		if (!ready) {
			ready = true;
			triggerBtn.back = createTriggerBtn(kag, kag.back.base, 150, 574, 500, 25);
			triggerBtn.fore = createTriggerBtn(kag, kag.fore.base, 150, 574, 500, 25);
			fullAreaBtn.fore = createFullAreaBtn(kag, kag.fore.base);
			fullAreaBtn.back = createFullAreaBtn(kag, kag.back.base);

			show = false;
			showTrigger(true, false);
		}
		super.createObject(...);
	}

	function deleteObject(name)
	{
		super.deleteObject(...);

		if (name === void || name == 'all' || objects.count==0) {
			invalidate triggerBtn.back if triggerBtn.back !== void;
			invalidate triggerBtn.fore if triggerBtn.fore !== void;
			invalidate fullAreaBtn.back if fullAreaBtn.back !== void;
			invalidate fullAreaBtn.fore if fullAreaBtn.fore !== void;
			ready = false;
		}
	}

	function showObject(parent, child=false)
	{
		var count = objects.count;
		for (var i = 0; i < count; i++) {
			if (objects[i].elm.parent !== void) {
				objects[i].fore.visible = child;
				objects[i].back.visible = child;
			}
			else {
				objects[i].fore.visible = parent;
				objects[i].back.visible = parent;
			}
			objects[i].fore.enableCheck();
			objects[i].back.enableCheck();
		}
	}
	
	function showTrigger(trigger, fullArea)
	{
		if (ready) {
			triggerBtn.back.visible = trigger if triggerBtn.back !== void;
			triggerBtn.fore.visible = trigger if triggerBtn.fore !== void;
			fullAreaBtn.back.visible = fullArea if fullAreaBtn.back !== void;
			fullAreaBtn.fore.visible = fullArea if fullAreaBtn.fore !== void;
		}
	}
	
	function showMenu()
	{
		//if (show == false) {
			show = true;
			showObject(true);
			showTrigger(false, true);
		//}
	}
	function hideMenu()
	{
		//if (show == true) {
			show = false;
			showObject(false);
			showTrigger(true, false);
		//}
	}
	
	function createTriggerBtn(window, parent, left, top, width, height)
	{
		var obj = new ExButtonLayer(window, parent);
		with (obj) {
			.setPos(left, top);
			.width		= width;
			.height		= height;
			.color		= 0xffffff;
			.opacity	= 0;
			.absolute	= 2000000-10;
			.focusable	= false;
			.visible	= true;
		}
		
		obj.onMouseEnter = function()
		{
			if (kag.inStable===true) {
				global.exsmenu_object.showMenu();
			}
		} incontextof obj;
		return obj;
	}
	function createFullAreaBtn(window, parent)
	{
		var obj = new ExButtonLayer(window, parent);
		with (obj) {
			.setPos(0, 0);
			.width		= kag.innerWidth;
			.height		= kag.innerHeight;
			.color		= 0x000000;
			.opacity	= 0;
			.absolute	= 2000000-15;	//	trigger��艺
			.focusable	= false;
			.visible	= false;
		}
		
		obj.onMouseEnter = function()
		{
			global.exsmenu_object.hideMenu();
		} incontextof obj;
		return obj;
	}
	
	function newObject(window, parent, elm)
	{
		var obj = new ExsMenuLayer(window, parent);
		with (obj) {
			.loadImages(elm.file);
			.setPos(elm.x, elm.y);
			.absolute = 2000000-3;
			.visible = false;
			.setOptions(elm);
		}
		obj.onMouseEnter = function()
		{
			global.exsmenu_object.showChild(name);
			(global.ExButtonLayer.onMouseEnter incontextof this)(...);
		} incontextof obj;
		obj.onClick = function()
		{
			global.exsmenu_object.hideMenu();
			(global.ExsMenuLayer.onClick incontextof this)(...);
		} incontextof obj;
		return obj;
	}
	
	function showChild(name)
	{
		if (isChild(name)) {
			return;
		}
		var count = objects.count;
		for (var i = 0; i < count; i++) {
			if (objects[i].elm.parent!==void) {
				if (objects[i].elm.parent == name) {
					//Debug.message('��'+'show:'+objects[i].elm.name);
					objects[i].fore.visible = true;
					objects[i].back.visible = true;
				}
				else {
					//Debug.message('��'+'hide:'+objects[i].elm.name);
					objects[i].fore.visible = false;
					objects[i].back.visible = false;
				}
			}
		}
	}

	function isChild(name)
	{
		var count = objects.count;
		for (var i = 0; i < count; i++) {
			if (objects[i].elm.name == name) {
				if (objects[i].elm.parent!==void) {
					return true;
				}
			}
		}
		return false;
	}

	function onStableStateChanged(stable)
	{
		super.onStableStateChanged(...);
		showTrigger(stable, false);
	}
}


kag.addPlugin(global.exsmenu_object = new ExsMenuPlugin(kag));
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

[endscript]
[endif]


;------------------------------------------------------------------------------
;	���j���[
;		[exsmenu name="" parent="" x="" y="" file="" onclick="" onenter="" onleave=""]
;		name		���ʎq
;		parent		�e�̎��ʎq
;		x			x���W
;		y			y���W
;		file		�摜�t�@�C����(�`����button�^�O�Ɠ���)
;		onclick		�N���b�N���ɕ]������鎮
;		onenter		�}�E�X����������ɕ]������鎮
;		onleave		�}�E�X�����ꂽ���ɕ]������鎮
;------------------------------------------------------------------------------
[macro name="exsmenu"]
	[eval exp="exsmenu_object.createObject(mp)"]
[endmacro]

;------------------------------------------------------------------------------
;	�I�v�V����
;	[exsmenuopt delete=""]
;	delete			���O���w�肵�����̂��폜('all'�őS�č폜)
;------------------------------------------------------------------------------
[macro name="exsmenuopt"]
	[eval exp="exsmenu_object.setOptions(mp)"]
[endmacro]

[return]

