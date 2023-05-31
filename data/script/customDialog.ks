
[iscript]
//2015/08/07 �ꕔ�ϐ��𖾎��I�ɖ��������Ĉꕔ�����ϐ����O���ϐ��֕ύX test�^�O


//	�_�C�A���O�{�b�N�X�̎��
var	dlgset	=
[
		%[],//dammy
		%[ msg:'���[�h���܂����H',				bg:'dlg_askLoad',				yes:'dlg_btn_yes', no:'dlg_btn_no' ],
		%[ msg:'�f�[�^���㏑�����܂����H',		bg:'dlg_askOverWriteData',		yes:'dlg_btn_yes', no:'dlg_btn_no' ],
		%[ msg:'�^�C�g���ɖ߂�܂����H',		bg:'dlg_askReturnTitle',		yes:'dlg_btn_yes', no:'dlg_btn_no' ],
		%[ msg:'�I�����܂����H',				bg:'dlg_askQuit',				yes:'dlg_btn_yes', no:'dlg_btn_no' ],
		%[ msg:'�O�̑I�����ɖ߂�܂����H',		bg:'dlg_askReturnPrevSelect',	yes:'dlg_btn_yes', no:'dlg_btn_no' ],
		%[ msg:'�N���A��ɑI�����Ă��������B',	bg:'dlg_infoCanNotSelect',		ok:'' ],
		%[ msg:'�̌��łł͎g�p�ł��܂���B', 	bg:'dlg_infoCanNotSelect2',		ok:'' ],
		%[ msg:'�f�[�^�����݂��܂���B',		bg:'dlg_infoDataDoesNotExist',	ok:'' ],
		%[ msg:'�V�[����z�ɖ߂�܂����H',		bg:'dlg_askReturnScene',		yes:'dlg_btn_yes', no:'dlg_btn_no' ],
		%[ msg:'�N�C�b�N�Z�[�u���܂����B',		bg:'dlg_infoQuickSaveOK',		ok:'' ],
		%[ msg:'�N�C�b�N���[�h���܂����H',		bg:'dlg_askQuickLoad',			yes:'dlg_btn_yes', no:'dlg_btn_no' ]
];

//test
var		xdlg;

/****************************************************************************/
/*	class			:	���C���[�^Yes/No�_�C�A���O�쐬						*/
/*	comment			:	-													*/
/****************************************************************************/
class CustomDialogWindow extends KAGLayer
{
	var		buttons		= [];
	var		clickyes;
	var		result;
	var		param;

	function CustomDialogWindow( win, par, no, func )
	{
		super.KAGLayer(...);

		setSize( win.innerWidth, win.innerHeight );
		setPos( 0, 0 );
		return;
	}

	/*	�_�C�A���O�쐬��Ɉ�ԍŏ��ɂ�鏈��	*/
	function open()
	{
		/*	�_�C�A���O�̏����ݒ�	*/
		window.openDialog( this );

//		setClickHook( true );
		return;
	}

	/* �_�C�A���O�����ۂ̏���	*/
    function close()
	{
//test
		invalidate buttons;

		enabled		= false;
		window.closeDialog( this );

		setClickHook( false );
    }

	/*	�_�C�A���O�x�[�X�̕\��	*/
	function addImage( file )
	{
		loadImages( file );
		hitThreshold	= 0;
//		bringToFront();
//		absolute = kag.currentDialogAbsolute + 1;
//		visible = true;  // �\����Ԃɂ��܂�
		update();
		return;
	}

	/*	�}�E�X�L�[�t�b�N	*/
	function setClickHook( en )
	{
		if ( en ) setClickHook( false );

		var	set	= en ? window.addHook : window.removeHook;

		set( "leftClick",  this.leftClickHook );
		set( "rightClick", this.rightClickHook );
	}

	function leftClickHook()  { return true; }
	function rightClickHook()
	{
		System.inform( "test" );
		if ( enabled )
			close();
		return true;
	}

    function finalize()
	{
        super.finalize();
    }

	/*	�{�^���쐬�֐�	*/
	function addButton( name, x, y, file, focus=false )
	{
		var	count	= buttons.count;

//test
//		buttons[count]	= new CustomDialogButton( kag, this );
		kag.add( buttons[count]	= new CustomDialogButton( kag, this ) );
		with ( buttons[count] )
		{
			.loadImages( file );
			.setPos( x, y );
			.visible	= true;
			.name		= name;
			.absolute	= kag.currentDialogAbsolute + 1;
			.focus() if focus===true;
		}

		return;
	}

	function setOptions( func, elm )
	{
		clickyes = func if func !== void;
		param = elm if elm !== void;

		super.setOptions( elm );
	}

	function onClick( x, y, ivent )
	{
		//	debug
//		System.inform( "Click " + "\n" + x +  "\n" + y + "\n" + ivent );

		super.onClick( x, y );

		result	= ivent;

		if( result == "yes" )
		{
			Scripts.eval( clickyes( param ) ) if clickyes !== void;
		}

		//	��~���Ă���kag�𓮂���
		close();
		return;
	}
}

/****************************************************************************/
/*	class			:	���C���[�^Yes/No�_�C�A���O�p�̃{�^��				*/
/*	comment			:	-													*/
/****************************************************************************/
class CustomDialogButton extends ExButtonLayer
{

	function CustomDialogButton( window, parent )
	{
		super.ExButtonLayer(...);
		return;
	}

//test
	function filnalize()
	{
		invalidate this;
		super.finalize(...);
	}

	function onClick( x, y )
	{
		/*	�e���C���[�֍쐬�����{�^���̖��O��Ԃ�	*/
		parent.onClick( x, y, name );

		super.onClick(...);

		return;
	}

}

/****************************************************************************/
/*	function		:	Yes/No�_�C�A���O�̍쐬(Layer�g�p)					*/
/*	arguments		:	no		: �Ăяo���̏�ԁidlgset�Q�Ɓj				*/
/*						func	: Yes�{�^�����������A���얽��				*/
/*						elm		: func�̃p�����[�^							*/
/*	return value	:	void												*/
/*	comment			:	-													*/
/****************************************************************************/
function DialogYesNoLayer( no, func, elm )
{
	var	dic		= dlgset[no];

//	var	dlg	= new CustomDialogWindow( kag, kag.primaryLayer, no, func );
//	var	dlg	= new CustomDialogWindow( kag, kag.fore.base, no, func );
//test
//	xdlg	= new CustomDialogWindow( kag, kag.fore.base, no, func );
	kag.add( xdlg	= new CustomDialogWindow( kag, kag.fore.base, no, func ) );

//	with( dlg )
	with( xdlg )
	{
		.open();
		.addImage( dic.bg + '.tlg' );
		.addButton( "yes", 330, 277, dic.yes ) if dic.yes !== void;
		.addButton( "no", 420, 277, dic.no ) if dic.no !== void;
		.setOptions( func, elm );
	}

	return;
}

/****************************************************************************/
/*	function		:	Yes/No�_�C�A���O�̍쐬(System�_�C�A���O�g�p)		*/
/*	arguments		:	no		: �Ăяo���̏�ԁidlgset�Q�Ɓj				*/
/*						func	: Yes�{�^�����������A���얽��				*/
/*						elm		: func�̃p�����[�^							*/
/*	return value	:	void												*/
/*	comment			:	-													*/
/****************************************************************************/
function DialogYesNoSystem( no, func, elm )
{
	var	dic		= dlgset[no];
	var	result	= 'no';

	if( dic.ok !== void )
		System.inform( dic.msg );
	else
		result	= askYesNo( dic.msg ) ? 'yes' : 'no';

	if( result == "yes" )
		func( elm );

	return;
}
/****************************************************************************/
/*	function		:	Yes/No�_�C�A���O�̌Ăяo��							*/
/*	arguments		:	no		: �Ăяo���̏�ԁidlgset�Q�Ɓj				*/
/*						func	: Yes�{�^�����������A����֐�				*/
/*						elm		: func�̃p�����[�^							*/
/*	return value	:	void												*/
/*	comment			:	�_�C�A���O���o�������ŏ����͌��ʂ͉������̏�����	*/
/*						�����̊֐��ɔC����									*/
/****************************************************************************/
function showDialog( no, func, elm )
{
	var	dic			= dlgset[no];
	var	isFile		= false;
	var	isMovie		= false;

	isFile	= Storages.isExistentStorage( dic.bg+'.tlg' );
	isMovie	= kag.isMoviePlaying();

	/*	�_�C�A���O�p���C���̃��[�_�����ׂ̈ɑS�Ẵg�����W�V�������~�߂�	*/
	kag.stopAllTransitions();

	if( isMovie || !isFile )
		DialogYesNoSystem( no, func, elm );
	else
		DialogYesNoLayer( no, func, elm );

	return;
}

[endscript]

[return]
