
�悭����CG���[�h����������

�������g�������l�������Ȃ�D���Ɏg���Ă���
���ρA�Ĕz�z�͎��R
�g�p�𖾋L����K�v���񍐂���K�v���Ȃ�
���Ǖ񍐂������Ƃ��ꂵ��

�@�\
��x����CG�����\������
CG���ɍ��킹�āA�����ł؁[�W�𒲐�����
�����摜�ɑΉ��A������������������\��
�g����
�ݒ��Afirst.ks��cg_mode_init.ks��ǂݍ���
��
@call cg_mode_init.ks
���cg_mode.ks���T�u���[�`���Ƃ��ČĂׂ΂悢
��
[link exp="kag.callExtraConductor('cg_mode.ks', '*cg_mode')"]CG���[�h[endlink]

�ݒ���@
203�s�ڂ̉E�N���b�N�̐ݒ�����ɂ��킹�Ă�����
cg_mode_init.ks��17�s�ڂ���̊e�ϐ�������������

cg.base = 'black'; //�w�i�摜
cg.cg_button = 'cg_button'; //�T���l�C���Ɠ����傫���̃{�^���摜
cg.thumbnail_width  = 100; //�T���l�C���̕�
cg.thumbnail_height =  75; //�T���l�C���ƍ���
cg.line   = 7;  //�T���l�C����\�����鉡�̐�
cg.column = 3;  //�T���l�C����\������c�̐�
cg.base_x = 50; //�T���l�C����\�����鏉��x���W
cg.base_y = 35; //�T���l�C����\�����鏉��y���W
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //�T���l�C���Ԃ̕�
cg.height = 50; //�T���l�C���Ԃ̍���
cg.cg_storage = []; //�摜�t�@�C����������
cg.cg_sstorage = []; //�T���l�C���t�@�C����������
//2�̔z��͓������ԂłȂ��Ă͂Ȃ�Ȃ�
//�܂��A�����摜�͔z����z��ŋL�q����
�܂��A82�s�ڂ�0��1�ɂ��邱�ƂőS�Ă�CG���������Ƃɂł���

����flagcg���摜��\������}�N���ɑg�ݍ���
��
@macro name=im
@image *
@flagcg *
@endmacro
����ł����Ǖ\�������摜�͋L�^�����
�������Astorage�Ŏw�肳�ꂽ�������cg.cg_storage����T����
�L�^���Ă���̂Ŋg���q�̗L���͓��ꂵ�Ȃ���΂Ȃ�Ȃ�
