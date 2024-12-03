extends GutTest

var player
var lixo
var lixo2
var alga
var double_jogo

func before_each():
	Global.testing = 1
	
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	lixo2 = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	alga = load("res://scenes/Tartaruga/alga.tscn").instantiate()

	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)
	double_jogo.add_child(lixo2)
	double_jogo.add_child(alga)

func test_lixo_is_removed_out_of_bounds():
	lixo._process(5) # Enough time for the obstacle to exceed the bounds of the visible rect
	await wait_frames(2)
	assert_false(is_instance_valid(lixo))

func test_lixo_is_spawned_on_timeout():
	double_jogo.get_node("Timer_Canudo").emit_signal("timeout")
	await wait_frames(2)
	assert_called(double_jogo, "spawn_canudo")
	
func test_alga_is_spawned_on_timeout():
	double_jogo.get_node("Timer_Alga").emit_signal("timeout")
	await wait_frames(2)
	assert_called(double_jogo, "spawn_alga")
	
func test_alga_recovers_health():
	player.get_node("Area2D").emit_signal("area_entered", alga.get_node("Area_Alga"))
	await wait_frames(2)
	assert_called(double_jogo, "receive_health")
	
func test_increasing_difficulty():
	lixo2._process(20) # Enough time for spawn_rate to be increased
	await wait_frames(2)
	assert_gt(Global.spawn_rate, 1, "Difficulty should have been increasing.")
	
func test_restting_difficulty_on_health_lost():
	player.get_node("Area2D").emit_signal("area_entered", lixo2.get_node("Area_Lixo"))
	await wait_frames(2)
	assert_eq(Global.spawn_rate, 1, "Spawn rate should have been set to 1.")
