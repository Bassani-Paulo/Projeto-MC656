extends GutTest

var player
var lixo
var double_jogo


func before_each():
	Global.testing = 1
	
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = double_jogo.get_node("Player")
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()

	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)

func test_player_takes_damage_on_collision():
	player.get_node("Area2D").emit_signal("area_entered", lixo.get_node("Area_Lixo"))
	await wait_frames(2)
	assert_called(double_jogo, "take_damage")

func test_lixo_is_removed_after_collision():
	player.get_node("Area2D").emit_signal("area_entered", lixo.get_node("Area_Lixo"))
	await wait_frames(2)
	assert_false(is_instance_valid(lixo))
