
;[loadplugin module="krkrutil.dll"]
[iscript]

function sigCheck2(fname, publickey)
{
	if (!sigCheck(fname, publickey)) {
	/*
		System.inform('�����������ł� : '+fname);
		kag.shutdown();
	*/
	}
}

[endscript]


;------------------------------------------------------------------------------
;	exe, xp3�t�@�C���̏����`�F�b�N
;		[signcheck file="" publickey=""]
;		file		�t�@�C����
;		publickey	�����̌��J��
;------------------------------------------------------------------------------
[macro name="signcheck"]
	[eval exp="sigCheck2(mp.file, mp.publickey)"]
[endmacro]

;------------------------------------------------------------------------------
;	�f�o�b�O�z�b�g�L�[������(Shift+F*�n)
;		[hook]
;------------------------------------------------------------------------------
[macro name="hook"]
	[eval exp="hook()"]
[endmacro]

;------------------------------------------------------------------------------
;	�f�o�b�O�z�b�g�L�[�L����(Shift+F*�n)
;		[unhook]
;------------------------------------------------------------------------------
[macro name="unhook"]
	[eval exp="unhook()"]
[endmacro]


[return]



