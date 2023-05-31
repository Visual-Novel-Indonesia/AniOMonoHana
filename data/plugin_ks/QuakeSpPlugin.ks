@if exp="typeof global.quakesp_object == 'undefined'"
@iscript
//*-------------------------------------------------------------------------------------------*
//
//FileName		:	QuakeSpPlugin.ks
//
//Version		:	1.10
//
//Description	:	�w�肵�����C���[�݂̂�h�炷�v���O�C��
//					�w�肵���O�i���C���[�̕\�����C���[��h�炷�B
//
//					Copyright (C)2006�`2009 ���m�X ���� All rights reserved.
//					���ρE�Ĕz�z���R�ł��B
//
//					���g�p�ɂ������Ă�readme.txt����сAQuakeSpPlugin�戵������
//					���悭���ǂ݂��������B
//
//					�^�O���@quakesp
//
//					�����@�@	�K�{�H�@����
//					laynum		���@�@�@�h�炷�O�i���C���[�ԍ����w��@","(�J���})�ŋ�؂��
//										�����̑O�i���C���[���w��\�B
//											�� laynum="0,1"	�O�i���C���[0��1���h���
//					time		�~		�h�炷���Ԃ��w��(�~���b�P��)
//											�f�t�H���g��1000
//											[�� time=5000]	1000=1�b
//					timemode	�~		time�����̒P��
//											(�ڂ����̓^�O���t�@�����X��quake�^�O���Q��)
//					hmax		�~		�h��̉������ւ̍ő�U��(pixel�P��)
//											�f�t�H���g��10
//					vmax		�~		�h��̏c�����ւ̍ő�U��(pixel�P��)
//											�f�t�H���g��10
//					usesin		�~		�O�p�֐����g�����h�炵���s����
//											�f�t�H���g��false
//					speed		�~		�h�炷�X�s�[�h(�~���b�P��)
//											�f�t�H���g��50
//
//
//					�^�O���@stopquakesp�@�h����~
//					
//					�����@�Ȃ�
//
//
//					�^�O��  wqsp�@�h��I���܂ő҂�
//
//					�����@�Ȃ�
//
//
//					����
//					*laynum�����ɂ�base,���b�Z�[�W���C���[�͎w��ł��Ȃ��B
//					�w�i��h�炵�����Ȃ�Aquake�^�O���g���B
//
//
//*--------------------------------------------------------------------------------------------*
class QuakeSpPlugin extends KAGPlugin
{

	var window;						// Window�I�u�W�F�N�g
	var quakeSpTimer;				// quake �p�̃^�C�}
	var spquaking		=	false;	// quake�����H
	var spquakeEndTick	=	0;		// �I��tick
	var spquakeHorzMax	=	0;		// ���������̍ő�U����
	var spquakeVertMax	=	0;		// ���������̍ő�U����
	var spquakePhase	=	0;		// �h�炷����
	var laynum			=	[];		// �h�炷�O�i���C���̔ԍ����i�[����z��
	var laynum_or;					// laynum�����ɓ��͂��ꂽ�l��ۑ�
	var laypos			=	[];		// �O�i���C���[�̏����ʒu
	var count			=	0;		// �O�p�֐��h�炵�p�ϐ�
	var usesin			=	false;	// �A���S���Y���ɎO�p�֐����g�p���邩
	var speed			=	0;		// �U���̃X�s�[�h
	var time			=	0;		// �I������
	var loop;




	//*----------------------------------------------------------------*
	//Name		:	QuakeSpPlugin
	//
	//Purpose	:	�R���X�g���N�^
	//				�I�u�W�F�N�g�쐬���ɌĂ΂��
	//
	//in		:	window	(Window�I�u�W�F�N�g)
	//
	//out		:	�Ȃ�
	//-----------------------------------------------------------------*
	function QuakeSpPlugin(window)
	{
		super.KAGPlugin();
		this.window = window;
	}



	//*----------------------------------------------------------------*
	//Name		:	finalize
	//
	//Purpose	:	�f�X�g���N�^
	//				�I�u�W�F�N�g���Ŏ��ɌĂ΂��
	//
	//in		:	�Ȃ�
	//
	//out		:	�Ȃ�
	//-----------------------------------------------------------------*
	function finalize()
	{
		// �h����~
		stopQuake();
		
		// �^�C�}�[��j��
		invalidate quakeSpTimer if quakeSpTimer != void;
		
		super.finalize(...);
	}




	//*----------------------------------------------------------------*
	//Name		:	doQuakeSp
	//
	//Purpose	:	�h��J�n
	//				quakesp�}�N������Ă΂��
	//
	//in		:	elm (�����Ƃ��Đݒ肳�ꂽ�l)
	//
	//out		:	�Ȃ�
	//-----------------------------------------------------------------*
	function doQuakeSp(elm)
	{

		// ���C���[�ԍ�����
		laynum = ((string)elm.laynum).split(",", ,true); 
			
		// ���f�[�^��ۑ�
		laynum_or = elm.laynum;
		
		// ���C���[���W����(���[�h��̏ꍇ)
		if(elm.laypos != void)
		{
			// ������C��
			setLayersPosition();
			
			// ���[�h�����l����
			laypos = elm.laypos;
		}
		// ���ʂ̏ꍇ
		else
		{
			// �h�炷���C���[��
			var laycount = laynum.count;
			
			for(var i=0; i<laycount; i++)
			{	
				// ���W������z����쐬
				var mlaypos = [];
				
				// ���C���[�����ȗ�
				var lsf = kag.fore.layers[laynum[i]];
				var lsb = kag.back.layers[laynum[i]];
				
				// ���C���[�̍��W����
				mlaypos[0] = lsf.left;
				mlaypos[1] = lsf.top;
				mlaypos[2] = lsb.left;
				mlaypos[3] = lsb.top;
				
				// ��{�̕ϐ��ɑ��
				laypos[i] = mlaypos;
			}
		}

		// �h�ꎞ�Ԃ�ݒ�
		if(elm.time != void)
		{
			// �����ݒ�܂��̓��[�h�����l����
			time = elm.time;
		}
		else
		{
			// �����l����
			time = 1000;
		}

		// timemode�̐ݒ�ɂ��l��ݒ�
		// Config.tjs��defaultQuakeTimeInChUnit��true���H
		if(kag.defaultQuakeTimeInChUnit)
		{
			// timemode�����ɂ��ݒ��D�悷��@�~���b�ɐݒ�
			if(elm.timemode == 'ms')
			{
				spquakeEndTick = System.getTickCount() + +time;
			}
			// �����\�����x�ɐݒ�
			else
			{
				spquakeEndTick = System.getTickCount() + +time * kag.chSpeed;
			}
		}
		// defaultQuakeTimeInChUnit��false(default)
		else
		{
			// timemode�����ɂ��ݒ��D��@�����\�����x�ɐݒ�
			if(elm.timemode == 'delay')
			{
				spquakeEndTick = System.getTickCount() + +time * kag.chSpeed;
			}
			// �~���b�ɐݒ�
			else
			{
				spquakeEndTick = System.getTickCount() + +time;
			}
		}

		// �A���S���Y���ɎO�p�֐����g�p���邩�H
		if(elm.usesin != void)
		{
			// �����ݒ�܂��̓��[�h�����l����
			usesin = elm.usesin;
		}
		else
		{
			// �����l����
			usesin = false;
		}

		// ���������ő�U����ݒ�
		if(elm.hmax != void)
		{
			// �����ݒ�܂��̓��[�h�����l����
			spquakeHorzMax = elm.hmax;
		}
		else
		{
			// �����l����
			spquakeHorzMax = 10;
		}

		// ���������ő�U����ݒ�
		if(elm.vmax != void)
		{
			// �����ݒ�܂��̓��[�h�����l����
			spquakeVertMax = elm.vmax;
		}
		else
		{
			// �����l����
			spquakeVertMax = 10;
		}
			
		// �����̐ݒ�
		if(elm.speed != void)
		{
			// �����ݒ�܂��̓��[�h�����l����
			speed = elm.speed;
		}
		else
		{
			// �����l����
			speed = 50;
		}

		if(elm.loop != void)
		{
			// �����ݒ�܂��̓��[�h�����l����
			loop = elm.loop;
		}
		else
		{
			// �����l����
			loop=false;
		}

		// quake �p�^�C�}�̍쐬
		quakeSpTimer = new Timer(onQuakeSpTimerInterval, '');
		
		// 50ms���ƂɌĂяo��
		quakeSpTimer.interval = speed;
		
		// �^�C�}�[��L���ɂ���
		quakeSpTimer.enabled = true;
		
		// Quake���ɐݒ�
		spquaking = true;
	}





	//*----------------------------------------------------------------*
	//Name		:	onQuakeSpTimerInterval
	//
	//Purpose	:	�h����s���ɌĂ΂��
	//				quakeSpTimer����Ă΂��
	//
	//in		:	�Ȃ�
	//
	//out		:	�Ȃ�
	//-----------------------------------------------------------------*
	function onQuakeSpTimerInterval()
	{
		// �����h�ꎞ�Ԃ��߂��Ă�����
		if(System.getTickCount() > spquakeEndTick)
		{
			// loop������������������
			if(!loop)
			{
				// �h���~
				stopQuake();

				return;
			}
		}

		var laycount;	// �h�炷���C���[��
		var	x;			// x���W�̑���or������
		var	y; 			// y���W�̑���or������
		
		// �v�f������
		laycount = laynum.count;
		
		// ���b�Z�[�W����\�����͗h�炳�Ȃ�
		if(kag.historyShowing)
		{
			// ���ׂĂ̑O�i���C���[�������ʒu�ɖ߂�
			setLayersPosition();
				
			return;
		}
		
		// �A���S���Y���ɎO�p�֐����g�p���邩?
		if(usesin)
		{
			x = (int)( spquakeHorzMax * Math.sin(count) );
			y = (int)( spquakeVertMax * Math.sin(count) );
		}
		else
		{
			// x���W��y���W�ւ̑����ʂ��v�Z
			if( spquakeHorzMax == spquakeVertMax )
			{
				// ������������
				x = int( Math.random() * spquakeHorzMax - spquakeHorzMax );
				y = int( Math.random() * spquakeVertMax - spquakeVertMax );
			}
			else if( spquakeHorzMax < spquakeVertMax )
			{
				// �c�h��
				x = int( Math.random() * spquakeHorzMax - spquakeHorzMax );
				y = int( (spquakePhase ? Math.random() : -Math.random() ) * spquakeVertMax);
			}
			else
			{
				// ���h��
				x = int( (spquakePhase ? Math.random() : -Math.random() ) * spquakeHorzMax );
				y = int( Math.random() * spquakeVertMax - spquakeVertMax );
			}
			
			// �h�炷�������t�ɂ���
			spquakePhase = !spquakePhase;
		}


		// ���C���[�����W�ɔz�u
		for(var i=0; i<laycount; i++)
		{
			// ���C���[���W���i�[����z��
			var mlaypos = [];

			// ���C���[���W���󂯓n��
			mlaypos = laypos[i];

			// ���݂̃��C���[���W + or - x �Ƃ��̍��W�Ɉړ�
			kag.fore.layers[laynum[i]].setPos(mlaypos[0] + x, mlaypos[1] + y);
			kag.back.layers[laynum[i]].setPos(mlaypos[2] + x, mlaypos[3] + y);
		}
		
		// �J�E���g��ǉ�
		count++;
	}




	//*----------------------------------------------------------------*
	//Name		:	stopQuake
	//
	//Purpose	:	�h���~
	//
	//in		:	�Ȃ�
	//
	//out		:	�Ȃ�
	//-----------------------------------------------------------------*
	function stopQuake()
	{
		// �h��m�F
		if(quakeSpTimer === void || !spquaking) 
		{
			// �h��Ă��Ȃ�����
			return;
		}
		
		// �h����~
		setLayersPosition();
		
		// �h�ꃌ�C���[���� 
		laynum = []; 
		laypos = []; 

		// �^�C�}�[���~
		quakeSpTimer.enabled = false;

		// �h�ꒆ�ݒ������
		spquaking = false;

		// �g���K�[������
		window.trigger('quake');
	}




	//*----------------------------------------------------------------*
	//Name		:	setLayersPosition
	//
	//Purpose	:	���ׂĂ̑O�i���C���[�������ʒu�ɖ߂�
	//
	//in		:	�Ȃ�
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function setLayersPosition()
	{
		for(var i=0; i<laynum.count; i++)
		{
			// ���C���[���W���i�[����z��
			var mlaypos = [];

			// ���C���[���W���󂯓n��
			mlaypos = laypos[i];

			// ���C���[�ʒu�Œ�
			kag.fore.layers[laynum[i]].setPos(mlaypos[0], mlaypos[1]); 
			kag.back.layers[laynum[i]].setPos(mlaypos[2], mlaypos[3]);
		}
	}




	//*----------------------------------------------------------------*
	//Name		:	PosChange
	//
	//Purpose	:	���W�����ւ���
	//				�g�����W�V������backlay�^�O�̎��p
	//
	//in		:	x1	(	����ւ���mlaypos�̗v�f�ԍ��@(x���W)	)
	//				x2	(	����ւ���mlaypos�̗v�f�ԍ��A(x���W)	)
	//				y1	(	����ւ���mlaypos�̗v�f�ԍ��B(y���W)	)
	//				y2	(	����ւ���mlaypos�̗v�f�ԍ��C(y���W)	)
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function PosChange(x1, x2, y1, y2)
	{
		// ���C���[���W���i�[����z��
		var mlaypos = [];
		var tmp;
		
		for(var i=0; i<laynum.count; i++)
		{
			// ���C���[���W���󂯓n��
			mlaypos = laypos[i];

			// x���W�����ւ�
			tmp			=	mlaypos[x1];
			mlaypos[x1]	=	mlaypos[x2];
			mlaypos[x2]	=	tmp;
			
			// y���W�����ւ�
			tmp		=	mlaypos[y1];
			mlaypos[y1]	=	mlaypos[y2];
			mlaypos[y2]	=	tmp;
		}
		
		
	}




	//*----------------------------------------------------------------*
	//Name		:	onStore
	//
	//Purpose	:	�x�̕ۑ������Ƃ��ɌĂ΂��
	//
	//in		:	f		(�ۑ���̞x�f�[�^��\�������z��)
	//						Dictionary�N���X�̃I�u�W�F�N�g
	//
	//				elm		(���s�o�[�W�����ł͎g�p����Ă��Ȃ� ���void)
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function onStore(f, elm)
	{
		// �h����~
		setLayersPosition();
		
		// �ۑ����鎫���z����쐬
		var dic = f.quakesp = %[];
		
		// �����z��Ɍ��݂̒l��ۑ�
		dic.spquaking		=	spquaking;			// �h��Ă��邩�H
		dic.laynum			=	laynum_or;			// �h�炷�O�i���C���[�ԍ�
		dic.laypos			=	laypos;				// �O�i���C���[�̏������W
		dic.usesin			=	usesin;				// �A���S���Y���ɎO�p�֐����g�p���邩�H
		dic.time			=	time;				// �I������
		dic.hmax			=	spquakeHorzMax;		// ���������̍ő�h�ꕝ
		dic.vmax			=	spquakeVertMax;		// ���������̍ő�h�ꕝ
		dic.speed			=	speed;				// �h��̑���
	}




	//*----------------------------------------------------------------*
	//Name		:	onRestore
	//
	//Purpose	:	�x��ǂݏo���Ƃ��ɌĂ΂��
	//
	//in		:	f		(�ۑ���̞x�f�[�^��\�������z��)
	//						Dictionary�N���X�̃I�u�W�F�N�g
	//
	//				clear	(���b�Z�[�W���C���[���N���A�[���邩)
	//						tempload���̂�false
	//
	//				elm		(tempload���̃I�v�V����)
	//						tempload���ȊO�͏��void,tempload�̂Ƃ���
	//						Dictionary�N���X�̃I�u�W�F�N�g
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*	
	function onRestore(f, clear, elm)
	{
		// �ǂݏo�������z���ݒ�
		var dic = f.quakesp;
		
		// �h��Ă��Ȃ��������H
		if(dic === void || dic.spquaking == 0)
		{
			// �h��Ă��Ȃ�����
			stopQuake();
		}
		
		// �h��Ă������H
		else if(dic !== void || dic.spquaking == 1)
		{
			// doQuakeSp�֐����s
			doQuakeSp( %[ laynum : dic.laynum, laypos : dic.laypos, time : dic.time, hmax : dic.hmax, vmax : dic.vmax,
			usesin : dic.usesin, speed : dic.speed ] );
		}
	}





	//*----------------------------------------------------------------*
	//Name		:	onStableStateChanged
	//
	//Purpose	:	�u����v���邢�́u���s���v�̏�Ԃ��ς�����Ƃ���
	//				�Ă΂��B
	//
	//in		:	state	(����̂Ƃ���true�A���s���̂Ƃ���false)
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function onStableStateChanged(stable)
	{
	}




	//*----------------------------------------------------------------*
	//Name		:	onMessageHiddenStateChanged
	//
	//Purpose	:	���b�Z�[�W���C���[���B���Ƃ��ƁA���̏�Ԃ��甲����
	//				�Ƃ��ɌĂ΂��B
	//
	//in		:	hidden	(���b�Z�[�W���C���[���B�����Ƃ��Ɂhtrue�h�A
	//				 �Ăь����Ƃ��Ɂhfalse�h�ƂȂ�B)
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function onMessageHiddenStateChanged(hidden)
	{
	}




	//*----------------------------------------------------------------*
	//Name		:	onCopyLayer
	//
	//Purpose	:	�ubacklay�v�^�O���邢�́uforelay�v�^�O�����s���ꂽ
	//				�Ƃ��A���邢�̓g�����W�V�����I�����ɁA����ʂ̏���
	//				�\��ʂɃR�s�[����K�v������Ƃ��ɌĂ΂��B
	//
	//in		:	toback	(�u�\�����v�̂Ƃ��Ɂhtrue�h�A
	//						�u�����\�v�̂Ƃ��Ɂhfalse�h�ɂȂ�B)
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function onCopyLayer(toback)
	{
		if(spquaking)
		{
			// �O�i���C���[�̕\���y�[�W�������W�������ꂼ���������

			var mlaypos = [];	// ���C���[���W���i�[����z��
			
			// �\����
			if(toback)
			{
				for(var i=0; i<laynum.count; i++)
				{
					// ���C���[���W���󂯓n��
					mlaypos = laypos[i];

					// x���W�����ւ�
					mlaypos[2]	=	mlaypos[0];

					// y���W�����ւ�
					mlaypos[3]	=	mlaypos[1];
				}
			}
			// �����\
			else
			{
				for(var i=0; i<laynum.count; i++)
				{
					// ���C���[���W���󂯓n��
					mlaypos = laypos[i];

					// x���W�����ւ�
					mlaypos[0]	=	mlaypos[2];

					// y���W�����ւ�
					mlaypos[1]	=	mlaypos[3];
				}
			}
		}
	}





	//*----------------------------------------------------------------*
	//Name		:	onExchangeForeBack
	//
	//Purpose	: 	�g�����W�V�����̏I���ɂ���āA����ʂƕ\��ʂ̏���
	//				����ւ���K�v������Ƃ��ɌĂ΂��B
	//				���̃��\�b�h���Ă΂ꂽ���_�Ń��C���[�̃c���[�\����
	//				�ς���Ă���B
	//
	//in		:	�Ȃ�
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function onExchangeForeBack()
	{
		if(spquaking)
		{
			// �O�i���C���[�̕\���y�[�W�������W�������ꂼ���������
			
			var mlaypos = [];	// ���C���[���W���i�[����z��
			var tmp;			// �ꎞ�ۑ��p
		
			for(var i=0; i<laynum.count; i++)
			{
				// ���C���[���W���󂯓n��
				mlaypos = laypos[i];

				// x���W�����ւ�
				tmp			=	mlaypos[0];
				mlaypos[0]	=	mlaypos[2];
				mlaypos[2]	=	tmp;
			
				// y���W�����ւ�
				tmp			=	mlaypos[1];
				mlaypos[1]	=	mlaypos[3];
				mlaypos[3]	=	tmp;
			}
		}
	}




	//*----------------------------------------------------------------*
	//Name		:	onSaveSystemVariables
	//
	//Purpose	:	�V�X�e���ϐ��ɏ����m���ɕۑ����邽�߂̃^�C�~���O��
	//				�񋟂���B
	//				���̊֐����Łukag.scflags�v�ɉ��������o������A
	//				�����ɏ����L�^���Ă������Ƃ��ł���B
	//				�ukag.scflags�v�͎����z��I�u�W�F�N�g�ł���B
	//
	//in		:	�Ȃ�
	//
	//out		:	�Ȃ�
	//*----------------------------------------------------------------*
	function onSaveSystemVariables()
	{
	}


}


// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����
kag.addPlugin(global.quakesp_object = new QuakeSpPlugin(kag));


//----- TJS�X�N���v�g�����܂� ----------------------------------------*
@endscript
@endif

;----- �^�O��` ------------------------------------------------------*

;quake�^�O��`
@macro name=quakesp
@eval exp="quakesp_object.doQuakeSp(mp)"
@endmacro

;stopquake�^�O��`
@macro name=stopquakesp
@eval exp="quakesp_object.stopQuake()"
@endmacro

;wqsp�^�O��`
@macro name=wqsp
@waittrig name="quake"
@eval exp="quakesp_object.stopQuake()"
@endmacro

@return

;----- EOF ----------------------------------------------------------*
