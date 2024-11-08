extends Control

var heart_width
var heart_height

func on_player_life_changed(player_hearts: int) -> void:
	heart_width = get_node("Coracao").texture.get_width()
	heart_height = get_node("Coracao").texture.get_height()
	
	$Coracao.set_size(Vector2(player_hearts * heart_width , heart_height), true)
