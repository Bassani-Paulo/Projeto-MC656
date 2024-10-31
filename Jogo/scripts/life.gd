extends Control

func on_player_life_changed(player_hearts: int) -> void:
	var escala = get_node("Coracao").scale.x
	var heart_height = get_node("Coracao").get_rect().size.x/escala
	var heart_width = get_node("Coracao").get_rect().size.y/escala
	$Coracao.set_size(Vector2(player_hearts * heart_height , heart_width) , true)
