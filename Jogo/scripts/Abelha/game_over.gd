extends Control

var Singleton = Global.get_instance()

func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().paused = false
	Singleton.change_scene("res://scenes/ui/Main menu.tscn")
	pass # Replace with function body.
