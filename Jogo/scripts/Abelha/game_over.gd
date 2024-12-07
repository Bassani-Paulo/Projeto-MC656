extends Node

var Singleton = Global.get_instance()

func _ready() -> void:
	get_node("game_over").playing = true
	get_node("CanvasLayer2/CenterContainer/VBoxContainer/Score_Label").text = "Você perdeu
	Max Score: " + str(Global.max_score_abelha)
	pass
  
func _on_retry_pressed() -> void:
	Singleton.go_back()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	Singleton.change_scene("res://scenes/ui/Main menu.tscn")
	pass # Replace with function body.
