extends GutTest

var player
var lixo
var double_jogo


func before_each():
	double_jogo = double(load("res://scenes/Tartaruga/Jogo.tscn")).instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()

	add_child(double_jogo)
	double_jogo.add_child(player)
	double_jogo.add_child(lixo)

func test_player_takes_damage_on_collision():
	player.get_node("Area2D").emit_signal("area_entered", lixo.get_node("Area2D"))
	await wait_frames(2)
	assert_called(double_jogo, "take_damage")

func test_lixo_is_removed_after_collision():
	player.get_node("Area2D").emit_signal("area_entered", lixo.get_node("Area2D"))
	await wait_frames(2)
	assert_false(is_instance_valid(lixo))
