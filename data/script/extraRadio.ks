[if exp="typeof(global.exradio_object) == 'undefined'"]
[iscript]




class ExRadioPlugin extends ExPlugin
{
	function ExRadioPlugin()
	{
		super.ExPlugin('ExRadioPlugin');
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

		obj.onClick = function()
		{
			global.exradio_object.check(this.name, false);
			(global.ExCheckboxLayer.onClick incontextof this)(...);
		} incontextof obj;

		return obj;
	}
	
	function check(name, check=true)
	{
		var index = name2Index(name);
		if (index === void) {
			return;
		}
		var count = objects.count;
		var group = objects[index].elm.group;
		for (var i = 0; i < count; i++) {
			if (i == index) {
			}
			else if (group!==void && objects[i].elm.group==group) {
				objects[i].fore.uncheck(false);
				objects[i].back.uncheck(false);
				Debug.message('��������unchecking:'+objects[i].elm.name+'/'+i);
			}
		}
		if (check==true) {
			objects[index].fore.check(false);
			objects[index].back.check(true);
			Debug.message('��������checking:'+objects[index].elm.name+'/'+index);
		}
	}
	
	function setOptions(elm)
	{
		check(elm.check) if elm.check !== void;
		super.setOptions(...);
	}
}

kag.addPlugin(global.exradio_object = new ExRadioPlugin(kag));
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

[endscript]
[endif]

;------------------------------------------------------------------------------
;	���W�I�{�^��
;		[exradio name="" x="" y="" file="" checked="" oncheck="" onclick="" onenter="" onleave=""]
;		type		radio
;		name		���ʎq
;		group		�O���[�v
;		x			x���W
;		y			y���W
;		file		�摜�t�@�C����
;		checked		�f�t�H���g�Ń`�F�b�N�����邩�]�����鎮
;		oncheck		�`�F�b�N���������ɕ]������鎮
;		onclick		�N���b�N���ɕ]������鎮
;		onenter		�}�E�X����������ɕ]������鎮
;		onleave		�}�E�X�����ꂽ���ɕ]������鎮
;------------------------------------------------------------------------------
[macro name="exradio"]
	[eval exp="exradio_object.createObject(mp)"]
[endmacro]

;------------------------------------------------------------------------------
;	�I�v�V����
;	[exradioopt backvisible="" forevisible="" delete=""]
;	backvisible		���ʂ̕\�����(true,false)
;	forevisible		�\�ʂ̕\�����
;	delete			���O�Ŏw�肵�����̂��폜('all'�őS�č폜)
;	check			���O�Ŏw�肵�����̂��`�F�b�N
;------------------------------------------------------------------------------
[macro name="exradioopt"]
	[eval exp="exradio_object.setOptions(mp)"]
[endmacro]

[return]

