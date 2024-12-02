extends Control

var path_tartaruga = "res://scenes/Tartaruga/Jogo.tscn"
var path_abelha = "res://scenes/Abelha/Jogo.tscn"
var path_reciclagem = "res://scenes/Reciclagem/Jogo.tscn"
var path_options = "res://scenes/ui/Options.tscn"

var Singleton = Global.get_instance()

func _on_button_pressed() -> void:
	Singleton.change_scene(path_tartaruga)
	pass # Replace with function body.


func _on_jogar_abelha_pressed() -> void:
	Singleton.change_scene(path_abelha)
	pass # Replace with function body.


func _on_jogar_reciclagem_pressed() -> void:
	Singleton.change_scene(path_reciclagem)
	pass # Replace with function body.


func _on_opções_pressed() -> void:
	Singleton.change_scene(path_options)
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	Singleton.exit_game()
	pass # Replace with function body.
