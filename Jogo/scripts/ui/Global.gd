extends Node

var spawn_rate = 1
var spawn_rate_alga = .5
var max_score = 0

var max_score_abelha = 0

var testing = 0

var streak = 0
var score_rec = 0
var max_score_reciclagem  = 0

# Inicialização do Singleton de modo global
func get_instance() -> Scene_Manager:
	if SceneManager.instance == null:
		SceneManager.instance = Scene_Manager.new()
	return SceneManager.instance