
*r_click

;�󋵂�ۑ�
[tempsave place="0"]

@eval exp="fubuki_object.uninit()"
@eval exp="snow_object.uninit()"
;@eval exp="sakurafubuki_object.uninit()"
;@eval exp="sakura_object.uninit()"

;���b�Z�[�W���C�����\��
[layopt layer="message0" page="back" visible="false"]
[layopt layer="message1" page="back" visible="false"]
[layopt layer="message2" page="back" visible="false"]
[layopt layer="message3" page="back" visible="false"]
[layopt layer="message4" page="back" visible="false"]

;�t�F�C�X�E�C���h�E���\��
[layopt layer="0" page="back" visible="false"]

[image layer="0" storage="rc_menu_base" page="back" visible="true" left="0" top="0"]

;���j���[���E�C���h�E�{�^�����\��
[exmenuopt delete="all"]
[exsmenuopt delete="all"]
[exformopt delete="all" forevisible="false" backvisible="true"]

;�E�N���b�N���̏�������w��
[rclick jump=true target="*r_click_exit" storage="r_click.ks" enabled=true]

[exkeybind key="VK_SPACE" exp=""]


;�������Ȃ����ǃ{�^���\������
[exbutton name="config"	x="225"	y="240"	file="rc_menu_config"	onclick="kag.process('', '*r_config')" hint="�R���t�B�O��ʂֈڍs���܂�"]

[if exp="tf.scene_mode !== true && sf.trial !== true"]
[exbutton name="save"	x="225"	y="270"	file="rc_menu_save"	onclick="kag.process('', '*r_save')" hint="�Z�[�u���s���܂�"]
[exbutton name="load"	x="449"	y="270"	file="rc_menu_load"	onclick="kag.process('', '*r_load')" hint="���[�h���s���܂�"]
[endif]

[exbutton name="log"	x="225"	y="300"	file="rc_menu_log"	onclick="showHistory()" hint="�o�b�N���O��\�����܂�"]

[if exp="tf.scene_mode !== true && canBackHistory()"]
[exbutton name="back"	x="225"	y="330"	file="rc_menu_back"	onclick="backHistory()" hint="���O�̑I�����ɖ߂�܂�"]
[endif]

[if exp="tf.scene_mode !== true"]
[exbutton name="return"	x="449"	y="330"	file="rc_menu_return"	onclick="goToStart()" hint="�^�C�g���֖߂�܂�"]
[endif]
[exbutton name="exit"	x="225"	y="360"	file="rc_menu_exit"	onclick="kag.close()" hint="�Q�[�����I�����܂�"]

[crossfade time="100"]

*reload

;�N���b�N�҂�
[s]

*r_save
[call storage="mode_saveload.ks" target="*save"]
[jump target="*reload"]

*r_load
[call storage="mode_saveload.ks" target="*load"]
[jump target="*reload"]

*r_config
[call storage="mode_config.ks" target="*config"]
[jump target="*reload"]


*r_click_exit

;�ۑ��󋵂ɕ��A
[freeimage layer="1" page="back"]
[tempload place="0" backlay="true" bgm="false" se="false"]
[exformopt forevisible="false" backvisible="true"]

;�e���Ԃ𕜋A
[eval exp="colormode_recovery()"]

[crossfade time="100"]

;�E�N���b�N���̏�������w��
[rclick enabled="true" call="true" storage="r_click.ks" target="*r_click"]

[exkeybind key="VK_SPACE" exp="toggleMessageShowing()"]

[return]
