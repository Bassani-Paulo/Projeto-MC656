extends GutTest

var player
var lixo
var double_jogo
var timer_canudo

func before_each():
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	
	# Mock do Eat_canudo
	var eat_canudo_mock = AudioStreamPlayer.new()
	eat_canudo_mock.name = "Eat_canudo"
	player.add_child(eat_canudo_mock)

	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)
	
	timer_canudo = double_jogo.get_node("Timer_Canudo")
	pass

func test_below_lower_limit_canudo():
	timer_canudo.wait_time = 0.1
	timer_canudo.update_wait_time(lixo)
	assert_eq(timer_canudo.is_valido, true, "Tempo Inválido")

func test_lower_limit_canudo():
	timer_canudo.wait_time = 0.2
	timer_canudo.update_wait_time(lixo)
	assert_eq(timer_canudo.is_valido, true, "Tempo Inválido")

func test_in_the_middle_canudo():
	timer_canudo.wait_time = 2.6
	timer_canudo.update_wait_time(lixo)
	assert_eq(timer_canudo.is_valido, true, "Tempo Inválido")

func test_upper_limit_canudo():
	timer_canudo.wait_time = 5
	timer_canudo.update_wait_time(lixo)
	assert_eq(timer_canudo.is_valido, true, "Tempo Inválido")
	
func test_above_upper_limit_canudo():
	timer_canudo.wait_time = 5.1
	timer_canudo.update_wait_time(lixo)
	assert_eq(timer_canudo.is_valido, true, "Tempo Inválido")
