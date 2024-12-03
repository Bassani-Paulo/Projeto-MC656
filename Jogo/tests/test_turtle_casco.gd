extends GutTest

var player
var lixo
var alga
var jogo

func before_each():
	jogo = load("res://scenes/Tartaruga/Jogo.tscn").instantiate()
	player = load("res://scenes/Tartaruga/Player.tscn").instantiate()
	lixo = load("res://scenes/Tartaruga/Lixo.tscn").instantiate()
	alga = load("res://scenes/Tartaruga/alga.tscn").instantiate()
	
	# Mock do Eat_canudo
	var eat_canudo_mock = AudioStreamPlayer.new()
	eat_canudo_mock.name = "Eat_canudo"
	player.add_child(eat_canudo_mock)


	add_child(jogo)
	jogo.add_child(player)
	jogo.add_child(lixo)
	jogo.add_child(alga)

	
func test_colisao_lixo_sem_casco():
	var vida_inicial = jogo.player_hp
	player.get_node("Area2D").emit_signal("area_entered", lixo.get_node("Area_Lixo"))
	var vida_final = jogo.player_hp
	assert_eq(vida_final, vida_inicial - 1, "A vida do jogador deveria ser reduzida em 1 após a colisão com o lixo.")

func test_colisao_lixo_com_casco():
	var vida_inicial = jogo.player_hp
	player.state = player.CONDITION.Invincible
	player.get_node("Area2D").emit_signal("area_entered", lixo.get_node("Area_Lixo"))
	var vida_final = jogo.player_hp
	assert_eq(vida_final, vida_inicial, "A vida do jogador deveria ser se manter após a colisão com o lixo.")

func test_colisao_alga_sem_casco():
	var vida_inicial = jogo.player_hp
	player.get_node("Area2D").emit_signal("area_entered", alga.get_node("Area_Alga"))
	var vida_final = jogo.player_hp
	assert_eq(vida_final, vida_inicial + 1, "A vida do jogador deveria ser aumentada em 1 após a colisão com a alga.")

func test_colisao_alga_com_casco():
	var vida_inicial = jogo.player_hp
	player.state = player.CONDITION.Invincible
	player.get_node("Area2D").emit_signal("area_entered", alga.get_node("Area_Alga"))
	var vida_final = jogo.player_hp
	assert_eq(vida_final, vida_inicial, "A vida do jogador deveria se manter após a colisão com a alga.")
