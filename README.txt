
�悭����CG���[�h����������

�������g�������l�������Ȃ�D���Ɏg���Ă����ł��B
���ρA�Ĕz�z�͎��R
�g�p�𖾋L����K�v���񍐂���K�v���Ȃ��ł����A
���Ǖ񍐂������Ƃ��ꂵ���ł��B
���R�Ȃɂ������Ă��ӔC�͎��Ȃ�����

�S������T���v����skydrive�Ō��J���Ă���
https://skydrive.live.com/#cid=8F8EF4D2142F33D4&id=8F8EF4D2142F33D4!257

�@�\
��x����CG�����\������
CG���ɍ��킹�āA�����ł؁[�W�𒲐�����
�}�E�X�z�C�[���Ńy�[�W�ړ�����
�����摜�ɑΉ��A������������������\��
������x���C�A�E�g���ύX�o����

�g���Ă���ϐ�
sf.cg_flag
sf.cg_mode_init
global.cg

�g����
�ݒ��Afirst.ks��cg_mode_init.ks��ǂݍ���
��
@call cg_mode_init.ks
���cg_mode.ks���T�u���[�`���Ƃ��ČĂׂ΂悢
��
[link exp="kag.callExtraConductor('cg_mode.ks', '*cg_mode')"]CG���[�h[endlink]

�ݒ���@
cg_mode.ks��177�s�ڂ̉E�N���b�N�̐ݒ�����ɂ��킹�Ă�����
cg_mode_init.ks��17�s�ڂ���̊e�ϐ�������������

cg.base = 'black'; //�w�i�摜
cg.cg_button = 'cg_button'; //�T���l�C���Ɠ����傫���̃{�^���摜
cg.cg_dummy = 'cg_dummy'; //�܂����Ă��Ȃ�CG�̈ʒu�ɕ\������摜
cg.thumbnail_width  = 100; //�T���l�C���̕�
cg.thumbnail_height =  75; //�T���l�C���ƍ���
cg.line   = 4; //��
cg.column = 4; //�s��
cg.base_x = 50; //�T���l�C���̏���x���W
cg.base_y = 100;//�T���l�C���̏���y���W
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //�T���l�C���̗�
cg.height = 100; //�T���l�C���̍s�̕�
cg.page_basex = 500; //�y�[�W�{�^���̏���x���W
cg.page_basey = 0;   //�y�[�W�{�^���̏���y���W
cg.page_width = 20;  //�y�[�W�{�^���Ԃ̕�
cg.page_height = 0;  //�y�[�W�{�^���Ԃ̍���
cg.page_font = %['italic' => true];  //�y�[�W�{�^���̃t�H���g
cg.count_x = cg.thumbnail_width - 30;  //�����摜�������݂����̕\���̃T���l�C������̑���x���W
cg.count_y = cg.thumbnail_height - 25; //�����摜�������݂����̕\���̃T���l�C������̑���y���W
cg.count_font = %['size' => 12];       //�����摜�������݂����̕\���t�H���g
cg.close_x=kag.scWidth-150; //�����x���W
cg.close_y=kag.scHeight-50; //�����y���W
cg.close_font = %['italic' => true]; //����̃t�H���g
cg.cg_storage = [];  //�摜�t�@�C����������
cg.cg_sstorage = []; //�T���l�C���t�@�C����������
//2�̔z��͓������ԂłȂ��Ă͂Ȃ�Ȃ�
//�܂��A�����摜�͔z����z��ŋL�q����
�܂��Acg_mode_complete()�����s���邱�ƂőS�Ă�CG���������Ƃɂł���

����flagcg���摜��\������}�N���ɑg�ݍ���
��
@macro name=im
@image *
@flagcg *
@endmacro
����ł����Ǖ\�������摜�͋L�^�����
�������Astorage�Ŏw�肳�ꂽ�������cg.cg_storage����T����
�L�^���Ă���̂Ŋg���q�̗L���͓��ꂵ�Ȃ���΂Ȃ�Ȃ�
