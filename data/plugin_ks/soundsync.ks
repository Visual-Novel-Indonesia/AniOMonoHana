se][if exp="typeof(global.synchro_object) == 'undefined'"]

[iscript]

//--------------------
// �����v���O�C��
//--------------------
class SynchroPlugin extends KAGPlugin
{
	var buf;
	var time;
	var moving = false;

//----------------------------------------------------------------------

	// �R���X�g���N�^
	function SynchroPlugin(window)
	{
		super.KAGPlugin(); // �e�N���X�̃R���X�g���N�^���Ă�
		this.window = window; // �E�B���h�E�ւ̎Q��
	}

//----------------------------------------------------------------------

	// �f�X�g���N�^
	function finalize()
	{
		finish(); // �I��
		super.finalize(...); // �e�N���X�̃f�X�g���N�^���Ă�
	}

//----------------------------------------------------------------------

	// �����̊J�n
	function startSynchro(buf = 0, time = 0)
	{
		finish(); // �I��

		this.buf = buf;
		this.time = time;

		System.addContinuousHandler(continuousHandler);
		moving = true;
	}

	//----------------------------------------------------------------------

	// �^�C�}�[�̎���������
	function continuousHandler()
	{
		if(kag.se[buf].position >= time)
			finish();
	}

//----------------------------------------------------------------------

	/// �I��
	function finish()
	{
		if(moving)
		{
			window.trigger('synchro');
			System.removeContinuousHandler(continuousHandler);
			moving = false;
			buf = void;
			time = void;
		}
	}

//----------------------------------------------------------------------

	function onRestore(f, clear, elm)
	{
		finish(); // �I��
	}

//----------------------------------------------------------------------

}
//--------------------------------------------------------------------------

kag.addPlugin(global.synchro_object = new SynchroPlugin(kag));
	// �v���O�C���I�u�W�F�N�g���쐬���A�o�^����

[endscript]

[macro name=waitsound]
	[eval exp="synchro_object.startSynchro(+mp.buf, +mp.time)"]
	[waittrig * name="synchro" onskip="synchro_object.finish()"]
[endmacro]


[return]
