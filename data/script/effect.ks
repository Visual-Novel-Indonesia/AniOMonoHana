



;------------------------------------------------------------------------------
;	��ʗh�炵�i�X�L�b�v���[�h���͎��s���Ȃ��j
;	��������[quake]�Ɠ���
;------------------------------------------------------------------------------
[macro name="quake2"]
	[stoptrans]
	[if exp="kag.skipMode<=1"]
		[quake *]
	[endif]
[endmacro]



;------------------------------------------------------------------------------
;	�t���b�V��
;	[flash layer="�t���b�V���p�Ɏg�����C���[NO" count="�t���b�V���̉�" interval="�t���b�V���̊Ԋu"]
;------------------------------------------------------------------------------
[macro name="flash"]
	[stoptrans]
	[if exp="kag.skipMode<=1"]
		[eval exp="tf.layer=mp.layer, tf.count=mp.count, tf.interval=mp.interval"]
		[call storage="effect.ks" target="*flash"]
	[endif]
[endmacro]

;------------------------------------------------------------------------------
;	�t���b�V���Q�i���F�F�J�����p�j
;	[flash2 layer="�t���b�V���p�Ɏg�����C���[NO" count="�t���b�V���̉�" interval="�t���b�V���̊Ԋu"]
;------------------------------------------------------------------------------
[macro name="flash2"]
	[stoptrans]
	[if exp="kag.skipMode<=1"]
		[eval exp="tf.layer=mp.layer, tf.count=mp.count, tf.interval=mp.interval"]
		[call storage="effect.ks" target="*flash2"]
	[endif]
[endmacro]

[return]


;�t���b�V���p�T�u���[�`��
*flash|
	[image layer="&tf.layer" storage="white" page="fore" visible="false"]
	[resetwait]
*flashloop|
	[if exp="&tf.interval !== void"]
	[wait time="&tf.interval"]
	[layopt layer="&tf.layer" page="fore" visible="true"]
	[wait time="&tf.interval"]
	[layopt layer="&tf.layer" page="fore" visible="false"]
	[jump target="*flashloop" cond="tf.count--"]
	[endif]
[return]


;�t���b�V���Q�p�T�u���[�`��
*flash2|
	[image layer="&tf.layer" storage="yellow" page="fore" visible="false"]
	[resetwait]
*flash2loop|
	[if exp="&tf.interval !== void"]
	[wait time="&tf.interval"]
	[layopt layer="&tf.layer" page="fore" visible="true"]
	[wait time="&tf.interval"]
	[layopt layer="&tf.layer" page="fore" visible="false"]
	[jump target="*flash2loop" cond="tf.count--"]
	[endif]
[return]



