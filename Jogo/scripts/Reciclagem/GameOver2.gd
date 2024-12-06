extends Control

var path_main_menu = "res://scenes/ui/Main menu.tscn"
var Singleton = Global.get_instance()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fim_de_jogo.play()
	#text = "Max Score: " + str(Global.max_score)
	get_node("ColorRect/VBoxContainer/Score").text = "Você perdeu
	Max Score: " + str(Global.max_score_reciclagem)
	pass

func _on_jogar_novamente_pressed() -> void:
	Singleton.go_back()
	pass

func _on_voltar_ao_menu_pressed() -> void:
	Singleton.change_scene(path_main_menu)
	pass
