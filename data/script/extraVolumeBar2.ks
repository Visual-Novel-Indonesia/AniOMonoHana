[if exp="typeof(global.exvolumebar2_object) == 'undefined'"]
[iscript]


class ExVolumeBar2Layer extends ExButtonLayer
{
	var drag;
	var ongain;
	var min = 0;
	var max = 100;
	var _var;
	var barWidth;
	var pos;
	var range;
	var posPerPixel;
	
	function ExVolumeBar2Layer(window, parent)
	{
		super.ExButtonLayer(window, parent);
	}
	function finalize()
	{
		super.finalize();
	}

	function setOptions(elm)
	{
		ongain	= elm.ongain if elm.ongain !== void;
		min		= +elm.min if elm.min !== void;
		max		= +elm.max if elm.max !== void;
		_var	= elm.var if elm.var !== void;
		barWidth = width;
		calcRange();
		snap(+elm.pos) if elm.pos !== void;
		
		super.setOptions(...);
	}
	function setPos(left, top, width=void, height=void)
	{
		super.setPos(...);
		calcRange();
	}
	
	function calcRange()
	{
		range		= Math.abs(max - min);
		posPerPixel	= height/range;
	}
	
	function onMouseDown(x, y, button, shift)
	{
		if(enabled && button == mbLeft) {
			drag = true;
			gain(y);
		}
		super.onMouseDown(...);
	}
	function onMouseUp(x, y, button, shift)
	{
		if(enabled && button == mbLeft) {
			drag = false;
		}
		super.onMouseUp(...);
	}
	
	function onMouseMove(x, y, shift)
	{
		if (enabled && drag) {
			gain(y);
		}
		super.onMouseMove(...);
	}

	function left2Abs(left)
	{
		left = 0 if left < 0;
		left = this.top if left > this.top;
		return Math.ceil(left/posPerPixel);
	}

	function abs2Pos(abs)
	{
		var pos = (min < max) ? (min + abs) : (min - abs);
		return pos;
	}
	
	function pos2Abs(pos)
	{
		var abs = (min < max) ? (pos - min) : (min - pos);
		abs = 0 if abs < 0;
		abs = range if abs > range;
		return abs;
	}

	function gain(x)
	{
		var last_pos = pos;
		var abs = left2Abs(x);
		pos = abs2Pos(abs);

		if (pos !== last_pos) {
			snap(pos);
			Scripts.eval(_var+'='+pos) if _var !== void;
			Scripts.eval(ongain) if ongain !== void;
			//Debug.message('����������������gain:'+pos+' abs:'+abs);
		}
	}
	
	function snap(pos)
	{
		barWidth = pos2Abs(pos) * posPerPixel;
		update();
	}

	function draw()
	{
		//���̂Ƃ���摜�͎w��o���Ȃ�
		fillRect(0,barWidth,width,height, color);
		fillRect(0,0,width,barWidth, 0);
	}
}


class ExVolumeBar2Plugin extends ExPlugin
{
	function ExVolumeBar2Plugin()
	{
		super.ExPlugin('ExVolumeBar2Plugin');
	}
	function finalize()
	{
		super.finalize();
	}
	
	function newObject(window, parent, elm)
	{
		var obj = new ExVolumeBar2Layer(window, parent);
		with (obj) {
			//.loadImages(elm.file);
			.setSize(elm.width, elm.height);
			.color = elm.color;
			//.opacity = 255;
			.setPos(elm.x, elm.y);
			.absolute = 2000000-3;
			.visible = elm.visible;
			.setOptions(elm);
		}
		return obj;
	}
	
}

kag.addPlugin(global.exvolumebar2_object = new ExVolumeBar2Plugin(kag));
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

[endscript]
[endif]

;------------------------------------------------------------------------------
;	�X���C�_�[�{�^��
;		[exslider name="" x="" y="" file="" min="" max="" center="" pos="" var="" onslide="" onclick="" onenter="" onleave=""]
;		name		���ʎq
;		x			x���W
;		y			y���W
;		file		�摜�t�@�C����
;		min			�X���C�_�[�ʒu�̍ŏ��l(�}�C�i�X��)
;		max			�X���C�_�[�ʒu�̍ő�l(�}�C�i�X��)
;		pos			�����ʒu
;		var			�X���C�_�[�ʒu���󂯎��ϐ�
;		onslide		�X���C�_�[�𓮂������Ƃ��ɕ]�����鎮
;		onclick		�N���b�N���ɕ]������鎮
;		onenter		�}�E�X����������ɕ]������鎮
;		onleave		�}�E�X�����ꂽ���ɕ]������鎮
;------------------------------------------------------------------------------
[macro name="exvolumebar2"]
	[eval exp="exvolumebar2_object.createObject(mp)"]
[endmacro]

;------------------------------------------------------------------------------
;	�I�v�V����
;	[exslideropt backvisible="" forevisible="" delete=""]
;	backvisible		���ʂ̕\�����(true,false)
;	forevisible		�\�ʂ̕\�����
;	delete			���O���w�肵�����̂��폜('all'�őS�č폜)
;------------------------------------------------------------------------------
[macro name="exvolumebar2opt"]
	[eval exp="exvolumebar2_object.setOptions(mp)"]
[endmacro]

[return]

