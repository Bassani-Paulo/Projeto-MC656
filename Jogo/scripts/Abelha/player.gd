extends Node2D

const wing_ajustment = 36
var visible_rect_size = Vector2(800, 600)
var bee_height:float
var bee_width:float
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bee_height = get_node("Sprite2D").texture.get_height()
	bee_width = get_node("Sprite2D").texture.get_width()
	if get_viewport().get_visible_rect().size != Vector2.ZERO:
		visible_rect_size = get_viewport().get_visible_rect().size
	
	position.y = visible_rect_size.y/2
	position.x = bee_width
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.y = get_viewport().get_mouse_position().y
	position.y = clamp(position.y, bee_height/2 - wing_ajustment, visible_rect_size.y - bee_height/2)
	pass
