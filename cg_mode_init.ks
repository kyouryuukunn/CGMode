
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
cg.base = 'black'; //�w�i
cg.cg_button = 'cg_button'; //�T���l�C���Ɠ����傫���̃{�^��
cg.thumbnail_width  = 100; //�T���l�C���̕�
cg.thumbnail_height =  75; //�T���l�C���ƍ���
cg.line   = 4; //���̐�
cg.column = 4; //�c�̐�
cg.base_x = 50; //����x���W
cg.base_y = 100; //����y���W
cg.page_basex = 500; //�y�[�W�{�^���̏���x���W
cg.page_basey = 0;   //�y�[�W�{�^���̏���y���W
cg.page_width = 20;  //�y�[�W�{�^���Ԃ̕�
cg.page_height = 0;  //�y�[�W�{�^���Ԃ̍���
cg.close_x=kag.scWidth-150; //�����x���W
cg.close_y=kag.scHeight-50; //�����y���W
cg.width  = (kag.scWidth - cg.base_x*2)\cg.column; //��
cg.height = 100; //����
cg.cg_storage = [ //�t�@�C����������
['cg1s', 'cg2s', 'cg3s'],
'cg4s',
'cg5s',
'cg6s',
'cg7s',
'cg8s',
'cg9s',
'cg10s',
'cg11s',
'cg12s',
'cg13s',
'cg14s',
'cg14s',
'cg15s',
'cg16s',
'cg17s',
'cg18s'
];
cg.cg_sstorage = [ //�T���l�C���t�@�C����������
['cg1', 'cg2', 'cg3'],
'cg4',
'cg5',
'cg6',
'cg7',
'cg8',
'cg9',
'cg10',
'cg11',
'cg12',
'cg13',
'cg14',
'cg14',
'cg15',
'cg16',
'cg17',
'cg18'
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
if (0){
	for (var i=0; i < cg.cg_storage.count; i++){
		if (typeof(cg.cg_storage[i]) == 'Object'){
			for (var n=0; n < cg.cg_storage[i].count; n++){
				sf.cg_flag[i][n]=true;
			}
		}else{
			sf.cg_flag[i] = true;
		}
	}
}
cg.page = 0;
cg.maxpage = cg.cg_sstorage.count%(cg.column*cg.line) == 0 ? cg.cg_sstorage.count\(cg.column*cg.line) - 1 : cg.cg_sstorage.count\(cg.column*cg.line);

function cg_modecount(num){ //�����摜�̌���������Ԃ�
	var saw = 0;
	for (var i=0; i < cg.cg_storage[num].count; i++){
		if (sf.cg_flag[num][i])
			saw+=1;
	}
	return saw + '/' + cg.cg_storage[num].count;
}
function flagcg(elm){
	var i = cg.cg_storage.fing(elm.storage);
	if (i == -1){
		for (var n = 0; n < cg.cg_storage.count; n++){
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
