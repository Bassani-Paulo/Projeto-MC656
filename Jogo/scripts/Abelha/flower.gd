extends Node2D

const SPEEED = 200
var height
var width

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	height = $Sprite2D.texture.get_height()
	width = $Sprite2D.texture.get_width()
	position = Vector2(800+width/2, 600-height/2)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= delta*SPEEED
	pass

func deactivate():
	$Hazard_Area.queue_free()
	$Flower_Area.queue_free()
	$Sprite2D.modulate.a = 0.5
