extends GutTest

var JogoScene = preload("res://scenes/Tartaruga/Jogo.tscn") 
var jogo
var double_jogo

func before_each():
	# Create new instances of the Jogo scene before each test
	jogo = JogoScene.instantiate()
	double_jogo = partial_double(JogoScene).instantiate()
	
	add_child(jogo)
	add_child(double_jogo)

# Test if the player takes damage correctly
func test_player_takes_damage():
	# Call the take_damage function with 2 damage
	jogo.take_damage(2)
	
	# Assert that health decreased by 2
	assert_eq(jogo.player_hp, 1, "Player health should be 1.")
	
# Test if the player hp doesn't gets below zero when they die
func test_hp_not_below_zero():
	# Call the take_damage function with 8 damage
	jogo.take_damage(8)
	
	# Assert that health reseted to 0
	assert_eq(jogo.player_hp, 0, "Player health should be 0.")

# Test if the player dies when takes lethal damage
func test_player_dies():
	# Call the take_damage function with lethal damage
	double_jogo.take_damage(5)
	
	# Assert that the player dies
	assert_called(double_jogo, "game_over")
	
# Test if the HP label shows health correctly
func test_HP_label():
	# Call the take_damage function with 1 damage
	jogo.take_damage()
	
	# Assert that the player HP is showed correctly
	assert_eq(jogo.get_node("Hp_label").text, "HP: 2/3", "Player HP should be 2/3")
