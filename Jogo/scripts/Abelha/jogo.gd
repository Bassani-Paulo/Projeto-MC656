extends Node2D

signal game_state_changed(new_speed)
var game_state = 1
const MAXSPEED = 3
var speed_to_modifier = {0:0.75, 1:1, 2:1.25, 3:1.5}
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func accelerate():
	if game_state<MAXSPEED:
		game_state+=1
		emit_signal("game_state_changed", game_state)
		get_tree().call_group("object", "update_speed_modifier", speed_to_modifier[game_state])
	
func decelerate():
	if game_state > 0:
		game_state-=1
		emit_signal("game_state_changed", game_state)
		get_tree().call_group("object", "update_speed_modifier", speed_to_modifier[game_state])
	else:
		game_over()
		
func game_over():
	$CanvasLayer2.visible = true
	get_tree().paused = true
	pass
