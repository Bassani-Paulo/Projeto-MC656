extends Control

var path_main_menu = "res://scenes/ui/Main menu.tscn"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fim_de_jogo.play()
	#text = "Max Score: " + str(Global.max_score)
	get_node("ColorRect/VBoxContainer/Score").text = "Max Score: " + str(Global.max_score)
	pass

func _on_jogar_novamente_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Tartaruga/Jogo.tscn")
	pass

func _on_voltar_ao_menu_pressed() -> void:
	get_tree().change_scene_to_file(path_main_menu)
	pass
