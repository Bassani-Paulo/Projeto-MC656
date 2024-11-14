extends GutTest

var player
var lixo
var lixo2
var double_jogo

func before_each():
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	lixo2 = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()

	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)

func test_lixo_is_removed_out_of_bounds():
	lixo._process(20) # Enough time for the obstacle to exceed the bounds of the visible rect
	await wait_frames(2)
	assert_false(is_instance_valid(lixo))

func test_lixo_is_spawned_on_timeout():
	double_jogo.get_node("Timer").emit_signal("timeout")
	await wait_frames(2)
	assert_called(double_jogo, "spawn_canudo")
	
func test_increasing_difficulty():
	var temp = Global.spawn_rate
	lixo._process(20) # Enough time for spawn_rate to be increased
	await wait_frames(2)
	assert_gt(temp, Global.spawn_rate, "Difficulty should have been increasing.")
	
func test_restting_difficulty_on_health_lost():
	player.get_node("Area2D").emit_signal("area_entered", lixo2.get_node("Area2D"))
	await wait_frames(2)
	assert_eq(Global.spawn_rate, 1, "Spawn rate should have been set to 1.")
