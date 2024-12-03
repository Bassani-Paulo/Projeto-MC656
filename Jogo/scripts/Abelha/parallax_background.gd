extends ParallaxBackground

const base_speed = 150
var speed_modifier = 1
var speed_to_modifier = {0:0.75, 1:1, 2:1.25, 3:1.5}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_base_offset += Vector2(-1, 0) * speed_modifier * base_speed * delta
	pass


func _on_jogo_game_state_changed(new_speed: Variant) -> void:
	speed_modifier = speed_to_modifier[new_speed]
	pass # Replace with function body.
