extends GutTest

const visible_rect_width = 800
var jogo
var player

func before_each():
	
	jogo = load("res://scenes/Tartaruga/Jogo.tscn").instantiate()
	player = jogo.get_node("Player")
	
	add_child(jogo)

func test_moves_left():
	# Simulates holding down the left arrow key for a couple of frames
	Input.action_press("move_left")
	await wait_seconds(0.2)
	Input.action_release("move_left")

	assert_lt(int(player.position.x), int(visible_rect_width/2), "Player should have moved left.")
	
func test_moves_right():
	# Simulates holding down the right arrow key for a couple of frames
	Input.action_press("move_right")
	await wait_seconds(0.2)
	Input.action_release("move_right")

	assert_gt(int(player.position.x), int(visible_rect_width/2), "Player should have moved right.")

func test_out_of_bounds_left():
	# Simulates holding down the left arrow key for a significant amount of frames
	Input.action_press("move_left")
	await wait_seconds(5)
	Input.action_release("move_left")

	assert_gt(int(player.position.x), int(0), "Player is out of bounds on the left side.")
	
func test_out_of_bounds_right():
	# Simulates holding down the right arrow key for a significant amount of frames
	Input.action_press("move_right")
	await wait_seconds(5)
	Input.action_release("move_right")

	assert_lt(int(player.position.x), int(visible_rect_width), "Player is out of bounds on the right side.")
