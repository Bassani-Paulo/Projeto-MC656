extends Node2D

var Singleton = Global.get_instance()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func spawn_lixo() -> void:
	Singleton.add_scene("res://scenes/Reciclagem/Lixo.tscn", self)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
