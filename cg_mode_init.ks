
;mp.storage���w�肷��΁Asf.cg_flag����ԍ���T���Ă��̉摜�̃t���O�����Ă�
;�}�N���ɑg�ݍ���ł���
;��
;@macro name=im        
;@image *
;@flagcg *
;@endmacro

@macro name=flagcg
@eval exp="flagcg(mp)"
@endmacro

;�O�����Ɛݒ�
@iscript
var cg = %[];
cg.base = 'black'; //�w�i�A��������������ꍇ�́A���O�̃Q�[����ʂ�������
cg.cg_button = 'cg_button'; //�T���l�C���Ɠ����傫���̃{�^��
cg.cg_dummy = 'cg_dummy'; //�܂����Ă��Ȃ�CG�̈ʒu�ɕ\������摜
cg.thumbnail_width  = 100; //�T���l�C���̕�
cg.thumbnail_height =  75; //�T���l�C���ƍ���
cg.line   = 4; //���̐�
cg.column = 4; //�c�̐�
cg.base_x = 50; //����x���W
cg.base_y = 100; //����y���W
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //�T���l�C���Ԃ̕�
cg.height = 100; //�T���l�C���Ԃ̍���
cg.page_basex = 500; //�y�[�W�{�^���̏���x���W
cg.page_basey = 0;   //�y�[�W�{�^���̏���y���W
cg.page_width = 20;  //�y�[�W�{�^���Ԃ̕�
cg.page_height = 0;  //�y�[�W�{�^���Ԃ̍���
cg.page_font = %['italic' => true];  //�y�[�W�{�^���̃t�H���g
cg.count_x = cg.thumbnail_width - 30;  //�����摜�������݂�����\������T���l�C������̑���x���W
cg.count_y = cg.thumbnail_height - 10; //�����摜�������݂�����\������T���l�C������̑���y���W
cg.count_font = %['size' => 12];       //�����摜�������݂����̃t�H���g
cg.close_x=kag.scWidth-100; //�����x���W
cg.close_y=0; //�����y���W
cg.close_font = %['italic' => true]; //����̃t�H���g
cg.cg_storage = [ //�t�@�C����������
['�~�`(������O��)', '���U�C�N', '�c�u���C���h(������E��)', '���u���C���h(�ォ�牺��)'],
['�E���獶��', '�~�`(�O���璆��)', '��������', '������E��', '�ォ�牺��'], 
'�΂߃u���C���h(���ォ��E����)', 
'���H��', 
'�g', 
'�E�Q����', 
'�����', 
'���ׂ����c�u���C���h(�������獶�E��)', 
'�ׂ����c�u���C���h(������E��)', 
'�ׂ����c�u���C���h(�Z���O�Ղō�����E��)', 
'�ׂ������u���C���h(�ォ�牺��)', 
'�ׂ������u���C���h(�Z���O�Ղŏォ�牺��)', 
'���ׂ������u���C���h(�ォ�牺��)', 
'���ׂ������u���C���h(�Z���O�Ղŏォ�牺��)', 
'���ׂ����c�u���C���h(������E��)', 
'���ׂ����c�u���C���h(�Z���O�Ղō�����E��)', 
'�ǂ��������炢����������Ȃ����ǂ�����ƈႤ���u���C���h(������E��)', 
'�Ђ��`(������E��)', 
'�Ђ��`(���ォ��E����)', 
'�ׂ����Ђ��`(������E��)', 
'�ׂ����Ђ��`(���ォ��E����)', 
'���ˏ�(���v���)', 
'��������E���', 
'������(������E��)', 
'����'
];
cg.cg_sstorage = [ //�T���l�C���t�@�C����������
['s�~�`(������O��)', 's���U�C�N', 's�c�u���C���h(������E��)', 's���u���C���h(�ォ�牺��)'],
['s�E���獶��', 's�~�`(�O���璆��)', 's��������', 's������E��', 's�ォ�牺��'], 
's�΂߃u���C���h(���ォ��E����)', 
's���H��', 
's�g', 
's�E�Q����', 
's�����', 
's���ׂ����c�u���C���h(�������獶�E��)', 
's�ׂ����c�u���C���h(������E��)', 
's�ׂ����c�u���C���h(�Z���O�Ղō�����E��)', 
's�ׂ������u���C���h(�ォ�牺��)', 
's�ׂ������u���C���h(�Z���O�Ղŏォ�牺��)', 
's���ׂ������u���C���h(�ォ�牺��)', 
's���ׂ������u���C���h(�Z���O�Ղŏォ�牺��)', 
's���ׂ����c�u���C���h(������E��)', 
's���ׂ����c�u���C���h(�Z���O�Ղō�����E��)', 
's�ǂ��������炢����������Ȃ����ǂ�����ƈႤ���u���C���h(������E��)', 
's�Ђ��`(������E��)', 
's�Ђ��`(���ォ��E����)', 
's�ׂ����Ђ��`(������E��)', 
's�ׂ����Ђ��`(���ォ��E����)', 
's���ˏ�(���v���)', 
's��������E���', 
's������(������E��)', 
's����'
];
if (sf.cg_mode_init === void){
	// �ŏ��Ɉ�x�������s
	// �������ǂ����̃t���O
	sf.cg_flag = %[];
	for (var i = 0; i < cg.cg_storage.count; i++){
		if (typeof(cg.cg_storage[i]) == 'Object'){
			sf.cg_flag[i] = %[];
				for (var n = 0; n < cg.cg_storage[i].count; n++){
					sf.cg_flag[i][n] = false;
				}
		}else{
			sf.cg_flag[i] = false;
		}
	}
	sf.cg_mode_init = 1;
}
//�SCG���������Ƃɂ���(�f�o�b�O�p)
cg.complete = function (){
	for (var i=0; i < cg.cg_storage.count; i++){
		if (typeof(cg.cg_storage[i]) == 'Object'){
			for (var n=0; n < cg.cg_storage[i].count; n++){
				sf.cg_flag[i][n]=true;
			}
		}else{
			sf.cg_flag[i] = true;
		}
	}
} incontextof global;
cg.page = 0;
cg.maxpage = cg.cg_sstorage.count%(cg.column*cg.line) == 0 ? cg.cg_sstorage.count\(cg.column*cg.line) - 1 : cg.cg_sstorage.count\(cg.column*cg.line);

cg.modecount = function (num){ //�����摜�̌���������Ԃ�
	var saw = 0;
	for (var i=0; i < cg.cg_storage[num].count; i++){
		if (sf.cg_flag[num][i])
			saw+=1;
	}
	return saw + '/' + cg.cg_storage[num].count;
} incontextof global;
function flagcg(elm){
	var i = cg.cg_storage.find(elm.storage);
	if (i == -1){
	var n;
		for ( n = 0; n < cg.cg_storage.count; n++){
			if (typeof(cg.cg_storage[n]) == 'Object'){
				if (cg.cg_storage[n].find(elm.storage) >= 0){
					i = cg.cg_storage[n].find(elm.storage);
					break;
				}
			}
		}
		if (n != cg.cg_storage.count)
			sf.cg_flag[n][i] = true;
	}else{
		sf.cg_flag[i] = true;
	}
}
@endscript

@return
