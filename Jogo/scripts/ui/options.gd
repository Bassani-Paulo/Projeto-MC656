extends Control

var Singleton = Global.get_instance()

func _on_return_pressed() -> void:
	Singleton.go_back()
	pass
