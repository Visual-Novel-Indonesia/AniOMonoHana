@if exp="typeof(global.fubuki_object) == 'undefined'"

@iscript

/*
	����ӂ点��v���O�C��
*/

class fubukiGrain
{
	// �ᗱ�̃N���X

	var fore; // �\��ʂ̐ᗱ�I�u�W�F�N�g
	var back; // ����ʂ̐ᗱ�I�u�W�F�N�g
	var xvelo; // �����x
	var yvelo; // �c���x
	var xaccel; // ������
	var l, t; // ���ʒu�Əc�ʒu
	var ownwer; // ���̃I�u�W�F�N�g�����L���� fubukiPlugin �I�u�W�F�N�g
	var spawned = false; // �ᗱ���o�����Ă��邩
	var window; // �E�B���h�E�I�u�W�F�N�g�ւ̎Q��

	function fubukiGrain(window, n, owner)
	{
		// fubukiGrain �R���X�g���N�^
		this.owner = owner;
		this.window = window;

		fore = new Layer(window, window.fore.base);
		back = new Layer(window, window.back.base);

		fore.absolute = 2000000-1; // �d�ˍ��킹�����̓��b�Z�[�W����������
		back.absolute = fore.absolute;

		fore.hitType = htMask;
		fore.hitThreshold = 256; // �}�E�X���b�Z�[�W�͑S�擧��
		back.hitType = htMask;
		back.hitThreshold = 256;

		fore.loadImages("fubuki_" + n); // �摜��ǂݍ���
		back.assignImages(fore);
		fore.setSizeToImageSize(); // ���C���̃T�C�Y���摜�̃T�C�Y�Ɠ�����
		back.setSizeToImageSize();
		xvelo = 0; // ���������x
		yvelo = n*10 + 20 + Math.random() * 20; // �c�������x
		xaccel = Math.random(); // ���������x
	}

	function finalize()
	{
		invalidate fore;
		invalidate back;
	}

	function spawn()
	{
		// �o��
		l = Math.random() * window.primaryLayer.width -600; // �������ʒu
		t = -fore.height-100; // �c�����ʒu
		spawned = true;
		fore.setPos(l, t);
		back.setPos(l, t); // ����ʂ̈ʒu��������
		fore.visible = owner.foreVisible;
		back.visible = owner.backVisible;
	}

	function resetVisibleState()
	{
		// �\���E��\���̏�Ԃ��Đݒ肷��
		if(spawned)
		{
			fore.visible = owner.foreVisible;
			back.visible = owner.backVisible;
		}
		else
		{
			fore.visible = false;
			back.visible = false;
		}
	}

	function move()
	{
		// �ᗱ�𓮂���
		if(!spawned)
		{
			// �o�����Ă��Ȃ��̂ŏo������@�����������
			if(Math.random() < 0.002) spawn();
		}
		else
		{
			l += 70 + xvelo;
			t += yvelo;
			xvelo += xaccel;
			xaccel += (Math.random() - 0.5) * 2;
			if(xvelo>=110) xvelo= 100;
			if(xvelo<=-110) xvelo=-100;
			if(xaccel>=20) xaccel= 10;
			if(xaccel<=-20) xaccel=-10;
			if(t >= window.primaryLayer.height)
			{
				t = -fore.height;
				l = Math.random() * window.primaryLayer.width;
			}
			fore.setPos(l, t);
			back.setPos(l, t); // ����ʂ̈ʒu��������
		}
	}

	function exchangeForeBack()
	{
		// �\�Ɨ��̊Ǘ�������������
		var tmp = fore;
		fore = back;
		back = tmp;
	}
}

class fubukiPlugin extends KAGPlugin
{
	// ���U�炷�v���O�C���N���X

	var fubukis = []; // �ᗱ
	var timer; // �^�C�}
	var window; // �E�B���h�E�ւ̎Q��
	var foreVisible = true; // �\��ʂ��\����Ԃ��ǂ���
	var backVisible = true; // ����ʂ��\����Ԃ��ǂ���

	function fubukiPlugin(window)
	{
		super.KAGPlugin();
		this.window = window;
	}

	function finalize()
	{
		// finalize ���\�b�h
		// ���̃N���X�̊Ǘ����邷�ׂẴI�u�W�F�N�g�𖾎��I�ɔj��
		for(var i = 0; i < fubukis.count; i++)
			invalidate fubukis[i];
		invalidate fubukis;

		invalidate timer if timer !== void;

		super.finalize(...);
	}

	function init(num, options)
	{
		// num �̐ᗱ���o��������
		if(timer !== void) return; // ���łɐᗱ�͂łĂ���

		// �ᗱ���쐬
		for(var i = 0; i < num; i++)
		{
			var n = intrandom(0, 4); // �ᗱ�̑傫�� ( �����_�� )
			fubukis[i] = new fubukiGrain(window, n, this);
		}
		fubukis[0].spawn(); // �ŏ��̐ᗱ�����͍ŏ�����\��

		// �^�C�}�[���쐬
		timer = new Timer(onTimer, '');
		timer.interval = 30;
		timer.enabled = true;

		foreVisible = true;
		backVisible = true;
		setOptions(options); // �I�v�V������ݒ�
	}

	function uninit()
	{
		// �ᗱ������
		if(timer === void) return; // �ᗱ�͂łĂ��Ȃ�

		for(var i = 0; i < fubukis.count; i++)
			invalidate fubukis[i];
		fubukis.count = 0;

		invalidate timer;
		timer = void;
	}

	function setOptions(elm)
	{
		// �I�v�V������ݒ肷��
		foreVisible = +elm.forevisible if elm.forevisible !== void;
		backVisible = +elm.backvisible if elm.backvisible !== void;
		resetVisibleState();
	}

	function onTimer()
	{
		// �^�C�}�[�̎������ƂɌĂ΂��
		var fubukicount = fubukis.count;
		for(var i = 0; i < fubukicount; i++)
			fubukis[i].move(); // move ���\�b�h���Ăяo��
	}

	function resetVisibleState()
	{
		// ���ׂĂ̐ᗱ�� �\���E��\���̏�Ԃ��Đݒ肷��
		var fubukicount = fubukis.count;
		for(var i = 0; i < fubukicount; i++)
			fubukis[i].resetVisibleState(); // resetVisibleState ���\�b�h���Ăяo��
	}

	function onStore(f, elm)
	{
		// �x��ۑ�����Ƃ�
		var dic = f.fubukis = %[];
		dic.init = timer !== void;
		dic.foreVisible = foreVisible;
		dic.backVisible = backVisible;
		dic.fubukiCount = fubukis.count;
	}

	function onRestore(f, clear, elm)
	{
		// �x��ǂݏo���Ƃ�
		var dic = f.fubukis;
		if(dic === void || !+dic.init)
		{
			// ��͂łĂ��Ȃ�
			uninit();
		}
		else if(dic !== void && +dic.init)
		{
			// ��͂łĂ���
			init(dic.fubukiCount, %[ forevisible : dic.foreVisible, backvisible : dic.backVisible ] );
		}
	}

	function onStableStateChanged(stable)
	{
	}

	function onMessageHiddenStateChanged(hidden)
	{
	}

	function onCopyLayer(toback)
	{
		// ���C���̕\���������̃R�s�[
		// ���̃v���O�C���ł̓R�s�[���ׂ����͕\���E��\���̏�񂾂�
		if(toback)
		{
			// �\����
			backVisible = foreVisible;
		}
		else
		{
			// �����\
			foreVisible = backVisible;
		}
		resetVisibleState();
	}

	function onExchangeForeBack()
	{
		// ���ƕ\�̊Ǘ���������
		var fubukicount = fubukis.count;
		for(var i = 0; i < fubukicount; i++)
			fubukis[i].exchangeForeBack(); // exchangeForeBack ���\�b�h���Ăяo��
	}
}

kag.addPlugin(global.fubuki_object = new fubukiPlugin(kag));
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

@endscript
@endif
; �}�N���o�^
@macro name="fubukiinit"
@eval exp="tf.fubuki=true"
@eval exp="fubuki_object.init(160, mp)"
@endmacro

@macro name="fubukiuninit"
@eval exp="tf.fubuki=false"
@eval exp="fubuki_object.uninit()"
@endmacro

@macro name="fubukiopt"
@eval exp="fubuki_object.setOptions(mp)"
@endmacro

@return
