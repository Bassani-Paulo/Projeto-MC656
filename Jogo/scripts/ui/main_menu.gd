extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass


func _on_button_pressed() -> void:
	SceneManager.change_scene("res://scenes/Tartaruga/Jogo.tscn")
	pass # Replace with function body.


func _on_jogar_abelha_pressed() -> void:
	SceneManager.change_scene("res://scenes/Abelha/Jogo.tscn")
	pass # Replace with function body.


func _on_jogar_reciclagem_pressed() -> void:
	SceneManager.change_scene("res://scenes/Reciclagem/Jogo.tscn")
	pass # Replace with function body.


func _on_opções_pressed() -> void:
	SceneManager.change_scene("res://scenes/ui/Options.tscn")
	pass # Replace with function body.


func _on_sair_pressed() -> void:
	SceneManager.exit_game()
	pass # Replace with function body.
