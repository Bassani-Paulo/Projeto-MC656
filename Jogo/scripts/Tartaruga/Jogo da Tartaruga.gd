extends Node2D

var scene_canudo = load("res://scenes/Tartaruga/Lixo.tscn")
var scene_alga = load("res://scenes/Tartaruga/alga.tscn")

const max_hp: int = 3
var player_hp: int = max_hp
var time: int = 0


signal life_changed(player_hearts)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect( "life_changed", Callable(get_node("HP/Life"),"on_player_life_changed") )
	emit_signal("life_changed", max_hp)
	player_hp = max_hp
	pass

# Function to handle taking damage
func take_damage(damage = 1):
	reduce_health(damage)

# Reduce the player's health
func reduce_health(damage: int) -> void:
	player_hp -= damage
	emit_signal("life_changed", player_hp)
	if player_hp < 0:
		player_hp = 0

# Check if the game is over
func check_game_over() -> void:
	if player_hp == 0:
		game_over()

# Update UI elements
func update_ui() -> void:
	update_score_label()

# Function to handle the game over condition
func game_over():
	if(time > Global.max_score):
		Global.max_score = time
	get_tree().change_scene_to_file("res://scenes/Tartaruga/GameOver.tscn")
	pass

# Utility function to update the HP Label (use signal or direct reference to HUD)
func update_score_label():
	time = time + 1
	$Score_label.text = "Score: " + str(time)

func spawn_canudo() -> void:
	var instance_canudo = scene_canudo.instantiate()
	add_child(instance_canudo)
	pass
	
func spawn_alga() -> void:
	var instance_alga = scene_alga.instantiate()
	add_child(instance_alga)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	update_ui()
	check_game_over()
	pass
