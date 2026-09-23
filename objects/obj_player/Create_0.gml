
//Método para deixar o codico mais limpo de se ler 
//variaveis no metodo
//vel:				para ser a velocidade de movimento
//tempo_recarga:	Tempo que servira de dalay para o tiro sendo o temnpo sem poder atirar

//variaveis que so podem ser definidas 1 vez
//Contador_tiro:	Vai contar do maior para o menor a o tempo para atirar de novo
contador_tiro = 0

control_player = function(_vel, _tempo_recarga) {
	
	
	show_debug_message(contador_tiro)
	
	//iniciando as variaveis de movimento e a ação de atirar
	var _cima, _bax, _esq, _dire, _atirar
	
	//checando se eu to apetando as teclas e retornando um valor
	_cima	 = keyboard_check(ord("W")) or keyboard_check(vk_up);
	_bax	 = keyboard_check(ord("S")) or keyboard_check(vk_down);
	_esq	 = keyboard_check(ord("A")) or keyboard_check(vk_left);
	_dire	 = keyboard_check(ord("D")) or keyboard_check(vk_right);
	
	//veirificando o botão de atirar
	_atirar	 = mouse_check_button(mb_left) or keyboard_check(vk_space);
	
	//fazendo uma movimentação otimizada
	//movimentação vertical
	var velv = (_bax - _cima) * _vel
	//movimentação horizontal
	var velh = (_dire - _esq) * _vel
	
	//soma dos X's e Y's
	x += velh
	y += velv
	
	
	//fazer todo tempo o tempo do dalay/contador do tiro diminuir
	//sendo que no codigop ele vai voltar
	contador_tiro --
	
	//fazendo o atirar atirar quando apertar o botão
	//E o contador terminar de contar
	if (_atirar == 1 and contador_tiro <= 0) {
		
		//criando uma varivel que vai criar o tiro para eu conseguir mudar algumas
		//caracteristicas do tiro (tipo a velocidade)
		var _tiro	= instance_create_layer(x, y, "Tiro", obj_tiro)
		
		//colocando uma velocidade pro tiro e mum objeto que tem a id dele salva
		//(ta salva na variavel
		_tiro.vspeed = - 6
		
		//fazer o cronometro voltar a ser o dalay que escolhemos 
		contador_tiro = _tempo_recarga
		
	}
}
	
	