extends Node2D

@export var direction = 0
@export var speed = 50
var visible_rect
var cloud_width
var cloud_height = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	visible_rect = get_viewport().get_visible_rect().size
	select_random()
	random_position()
	cloud_width = get_node("Sprite2D").texture.get_width()
	cloud_height = get_node("Sprite2D").texture.get_height()
	get_node("Sprite2D").z_index = 1 # Cloud has priority on screen
	pass # Replace with function body.

func select_random() -> void:
	var index = randf_range(0, 5)
	get_node("Sprite2D").texture = get_node("Storage").get_child(index).texture

func random_position() -> void:
	var rand = randi_range(0, 1)
	direction = 2 * rand - 1
	position.x = (1 - rand) * visible_rect.x - direction * get_node("Sprite2D").texture.get_width() / 2
	position.y = randf_range(visible_rect.y/4, visible_rect.y/2) - cloud_height
	speed = randf_range(40, 60)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x += speed * direction * delta
	
	if position.x > visible_rect.x + cloud_width/2  and direction == 1:
		queue_free()
	elif  position.x < -cloud_width/2 and direction == -1:
		queue_free()
	pass
