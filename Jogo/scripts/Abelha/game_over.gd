extends Control

var Singleton = Global.get_instance()
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_retry_pressed() -> void:
	get_tree().paused = false
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().paused = false
	Singleton.change_scene("res://scenes/ui/Main menu.tscn")
	pass # Replace with function body.
