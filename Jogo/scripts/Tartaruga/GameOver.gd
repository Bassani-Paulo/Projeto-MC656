extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Fim_de_jogo.play()
	#text = "Max Score: " + str(Global.max_score)
	get_node("ColorRect/VBoxContainer/Score").text = "Max Score: " + str(Global.max_score)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_jogar_novamente_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Tartaruga/Jogo.tscn")
	pass # Replace with function body.

func _on_voltar_ao_menu_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/ui/Main menu.tscn")
	pass # Replace with function body.
