extends Node2D

var Singleton = Global.get_instance()

signal game_state_changed(new_speed)
var game_state = 1
const MAXSPEED = 3
var time = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	update_score_label()
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
		
# Utility function to update the HP Label (use signal or direct reference to HUD)
func update_score_label():
	time = time + 1
	$Score_label.text = "Score: " + str(time)

func game_over():
	Global.max_score_abelha = max(Global.max_score_abelha, time)
	Singleton.change_scene("res://scenes/Abelha/GameOver.tscn")
	pass
