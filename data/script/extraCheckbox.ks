[if exp="typeof(global.excheckbox_object) == 'undefined'"]
[iscript]


class ExCheckboxLayer extends ExButtonLayer
{
	var checked = false;
	var oncheck;
	var onuncheck;
	var group;
	
	function ExCheckboxLayer(window, parent)
	{
		super.ExButtonLayer(window, parent);
		//showFocusImage = true;
	}
	
	function filnalize()
	{
		super.finalize(...);
	}
	
	function onClick()
	{
		checked ? uncheck() : check();
		
		super.onClick(...);
	}

	function check(eval=true)
	{
		checked = true;
		if (eval) {
			Scripts.eval(oncheck) if oncheck !== void;
		}
		update();
	}
	function uncheck(eval=true)
	{
		checked = false;
		if (eval) {
			Scripts.eval(onuncheck) if onuncheck !== void;
		}
		update();
	}

	function setOptions(elm)
	{
		oncheck = elm.oncheck if elm.oncheck !== void;
		onuncheck = elm.onuncheck if elm.onuncheck !== void;
		group = elm.group if elm.group !== void;
		
		if (elm.checked !== void && Scripts.eval(elm.checked)) {
			//	elm.checked�̓��e��]�����Đ^�Ȃ�`�F�b�N
			checked = true;
			update();
		}
		
		super.setOptions(...);
	}

	function draw()
	{
		var enabled_org = enabled;
		enabled = true;
		checked ? drawState(1) : super.draw();
		enabled = enabled_org;
	}

}


class ExCheckboxPlugin extends ExPlugin
{
	function ExCheckboxPlugin()
	{
		super.ExPlugin('ExCheckboxPlugin');
	}
	function finalize()
	{
		super.finalize();
	}
	
	function newObject(window, parent, elm)
	{
		var obj = new ExCheckboxLayer(window, parent);
		with (obj) {
			.loadImages(elm.file);
			.setPos(elm.x, elm.y);
			.absolute = 2000000-3;
			.visible = elm.visible;
			.setOptions(elm);
		}
		return obj;
	}
	
	function check(name)
	{
		var index = name2Index(name);
		if (index === void) {
			return;
		}
		objects[index].fore.check(false);
		objects[index].back.check(false);
	}
	function uncheck(name)
	{
		var index = name2Index(name);
		if (index === void) {
			return;
		}
		objects[index].fore.uncheck(false);
		objects[index].back.uncheck(false);
	}
	
	function setOptions(elm)
	{
		check(elm.check) if elm.check !== void;
		uncheck(elm.uncheck) if elm.uncheck !== void;
		super.setOptions(elm);
	}
}

kag.addPlugin(global.excheckbox_object = new ExCheckboxPlugin(kag));
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

[endscript]
[endif]

;------------------------------------------------------------------------------
;	�`�F�b�N�{�b�N�X
;		[excheckbox name="" x="" y="" file="" oncheck="" onuncheck="" onclick="" onenter="" onleave=""]
;		name		���ʎq
;		x			x���W
;		y			y���W
;		file		�摜�t�@�C����
;		oncheck		�`�F�b�N���������ɕ]������鎮
;		onuncheck	�`�F�b�N���͂��������ɕ]������鎮
;		onclick		�N���b�N���ɕ]������鎮
;		onenter		�}�E�X����������ɕ]������鎮
;		onleave		�}�E�X�����ꂽ���ɕ]������鎮
;------------------------------------------------------------------------------
[macro name="excheckbox"]
	[eval exp="excheckbox_object.createObject(mp)"]
[endmacro]

;------------------------------------------------------------------------------
;	�I�v�V����
;	[excheckboxopt backvisible="" forevisible="" delete=""]
;	backvisible		���ʂ̕\�����(true,false)
;	forevisible		�\�ʂ̕\�����
;	delete			���O�Ŏw�肵�����̂��폜('all'�őS�č폜)
;	check			���O�Ŏw�肵�����̂��`�F�b�N��t����
;	uncheck			���O�Ŏw�肵�����̂��`�F�b�N���͂���
;------------------------------------------------------------------------------
[macro name="excheckboxopt"]
	[eval exp="excheckbox_object.setOptions(mp)"]
[endmacro]

[return]

