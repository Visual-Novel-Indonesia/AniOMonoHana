;----------------------------------------------------
;BGM�ӏ܉�ʁ@���W�E���ݒ�t�@�C��
;
;TODO:�@�f�U�C���ɍ��킹�Ēl��ύX���ĉ������B
;
;BGM�ӏ܂̔w�i�t�@�C�����Fbgm_bg
;
;----------------------------------------------------

[iscript]

tf.bgmNum	= 10;//�Đ��ł���悤�ɂ���BGM�t�@�C���̐�

//�Ȗڃ{�^���̍��W�ƍĐ�����t�@�C���iwav or ogg)
//���ꂼ��bgm_btn_1.png�`�{�^���ɑΉ����܂��B
tf.prop	= [
	%[x:66,y:72,  file:'bgm_01'],				//1		
	%[x:66,y:115, file:'bgm_02'],				//2		
	%[x:66,y:158, file:'bgm_03'],				//3		
	%[x:66,y:201, file:'bgm_04'],				//4		
	%[x:66,y:244, file:'bgm_05'],				//5		
	%[x:66,y:287, file:'bgm_06'],				//6		
	%[x:66,y:330, file:'bgm_07'],				//7		
	%[x:66,y:373, file:'bgm_08'],				//8		
	%[x:66,y:416, file:'bgm_09'],				//9		
	%[x:66,y:459, file:'bgm_10']				//10	
];


var play_button  = [430,553];//�Đ��{�^���̍��W x,y		�t�@�C�����Fbgm_btn_play
var stop_button  = [350,553];//��~�{�^���̍��W x,y		�t�@�C�����Fbgm_btn_stop
var next_button  = [470,553];//���ȃ{�^���̍��W x,y		�t�@�C�����Fbgm_btn_next
var loop_button  = [510,553];//���[�v�{�^���̍��W x,y	�t�@�C�����Fbgm_btn_loop
var exit_button  = [653,552];//�߂�{�^���̍��W x,y		�t�@�C�����Fbgm_btn_exit



//���{�����[���X���C�_�[
//bgm_config_slider.png���c�}�~�ɂȂ�܂��B�ʏ�͉��u���ł��B
var volume_button  =[41,561,150,12];//x���W,y���W,�X���C�_�[�̒���


[endscript]

[return]
