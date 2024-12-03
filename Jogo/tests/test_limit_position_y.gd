extends GutTest

var player
var lixo
var double_jogo

func before_each():
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn")
	
	# Mock do Eat_canudo
	var eat_canudo_mock = AudioStreamPlayer.new()
	eat_canudo_mock.name = "Eat_canudo"
	player.add_child(eat_canudo_mock)

	add_child(double_jogo)
	double_jogo.add_child(player)

func test_below_lower_limit_y():
	var instance1 = lixo.instantiate()
	double_jogo.add_child(instance1)
	instance1.position.y = -65
	instance1._process(0)
	assert_eq(instance1.is_valido, true, "Posição Inválida")

func test_lower_limit_y():
	var instance2 = lixo.instantiate()
	double_jogo.add_child(instance2)
	instance2.position.y = -64
	instance2._process(0)
	assert_eq(instance2.is_valido, true, "Posição Inválida")

func test_in_the_middle_y():
	var instance3 = lixo.instantiate()
	double_jogo.add_child(instance3)
	instance3.position.y = 368
	instance3._process(0)
	assert_eq(instance3.is_valido, true, "Posição Inválida")

func test_upper_limit_y():
	var instance4 = lixo.instantiate()
	double_jogo.add_child(instance4)
	instance4.position.y = 800
	instance4._process(0)
	assert_eq(instance4.is_valido, true, "Posição Inválida")
	
func test_above_upper_limit_y():
	var instance5 = lixo.instantiate()
	double_jogo.add_child(instance5)
	instance5.position.x = 801
	instance5._process(0)
	assert_eq(instance5.is_valido, true, "Posição Inválida")
