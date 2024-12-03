extends GutTest

var player
var alga
var double_jogo
var timer_alga

func before_each():
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	alga = load("res://scenes/Tartaruga/alga.tscn").instantiate()
	
	# Mock do Eat_canudo
	var eat_canudo_mock = AudioStreamPlayer.new()
	eat_canudo_mock.name = "Eat_canudo"
	player.add_child(eat_canudo_mock)

	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(alga)
	
	timer_alga = double_jogo.get_node("Timer_Alga")
	pass

func test_below_lower_limit_alga():
	timer_alga.wait_time = 0.4
	timer_alga.update_wait_time(alga)
	assert_eq(timer_alga.is_valido, true, "Tempo Inválido")

func test_lower_limit_alga():
	timer_alga.wait_time = 0.5
	timer_alga.update_wait_time(alga)
	assert_eq(timer_alga.is_valido, true, "Tempo Inválido")

func test_in_the_middle_alga():
	timer_alga.wait_time = 32.25
	timer_alga.update_wait_time(alga)
	assert_eq(timer_alga.is_valido, true, "Tempo Inválido")

func test_upper_limit_alga():
	timer_alga.wait_time = 64
	timer_alga.update_wait_time(alga)
	assert_eq(timer_alga.is_valido, true, "Tempo Inválido")
	
func test_above_upper_limit_alga():
	timer_alga.wait_time = 65
	timer_alga.update_wait_time(alga)
	assert_eq(timer_alga.is_valido, true, "Tempo Inválido")
