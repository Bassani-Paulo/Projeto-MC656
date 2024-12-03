extends Node2D
@export var speed = 50

var image_storage
var visible_rect_y

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	position.x = 400
	position.y = -80
	image_storage = get_node("Storage")
	select_random()	
	pass # Replace with function body.

func select_random() -> void:
	var index = randf_range(0, 11)
	get_node("Sprite2D").texture = image_storage.get_child(index).texture
	get_parent().get_node("Timer").update_wait_time(self)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity = Vector2.ZERO
	
	velocity.y += speed
	position += velocity * delta
	pass
