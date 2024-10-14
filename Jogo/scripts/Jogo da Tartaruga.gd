extends Node2D

const max_hp: int = 3
var player_hp: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player_hp = 3
	update_hp_label()
	pass

# Function to handle taking damage
func take_damage(damage = 1):
	player_hp -= damage
	if player_hp <= 0:
		player_hp = 0
		game_over()
	update_hp_label()

# Function to handle the game over condition
func game_over():
	pass

# Utility function to update the HP label (use signal or direct reference to HUD)
func update_hp_label():
	$Hp_label.text = "HP: " + str(player_hp) + "/" + str(max_hp)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta) -> void:
	pass
