extends Control

var path_tartaruga = "res://scenes/Tartaruga/Jogo.tscn"
var path_abelha = "res://scenes/Abelha/Jogo.tscn"
var path_reciclagem = "res://scenes/Reciclagem/Jogo.tscn"
var path_options = "res://scenes/ui/Options.tscn"

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file(path_tartaruga)
	pass # Replace with function body.


func _on_jogar_abelha_pressed() -> void:
	get_tree().change_scene_to_file(path_abelha)
	pass # Replace with function body.


func _on_jogar_reciclagem_pressed() -> void:
	get_tree().change_scene_to_file(path_reciclagem)
	pass # Replace with function body.


func _on_opções_pressed() -> void:
	get_tree().change_scene_to_file(path_options)
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
