extends Control

var heart_width
var heart_height

func on_player_life_changed(player_hearts: int) -> void:
	# Verifica se o nó "Coracao" e sua textura estão presentes
	var coracao = get_node("Coracao")
	if coracao and coracao.texture:
		heart_width = coracao.texture.get_width()
		heart_height = coracao.texture.get_height()
		
		# Define o tamanho do coração de acordo com o número de corações do jogador
		$Coracao.set_size(Vector2(player_hearts * heart_width , heart_height), true)
	else:
		# Se a textura não existir, emite uma mensagem de erro
		push_error("A textura do Coracao não está definida!")
