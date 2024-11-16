extends GutTest

var jogo
var player

func before_each():
	
	jogo = load("res://scenes/Abelha/Jogo.tscn").instantiate()
	player = jogo.get_node("Player")
	
	add_child(jogo)

func test_move():
	var mouse_event = InputEventMouseMotion.new()
	mouse_event.global_position = Vector2(409, 386)
	print(mouse_event.global_position)
	Input.parse_input_event(mouse_event)
	await wait_seconds(0.2)
	assert_eq(int(player.position.y), 386, "Player not following mouse")

func test_out_of_bounds():
	var mouse_event = InputEventMouseMotion.new()
	mouse_event.global_position = Vector2(400, 300)
	mouse_event.relative = Vector2(342, -531)
	Input.parse_input_event(mouse_event)
	await wait_seconds(0.2)
	assert_gte(int(player.position.x), 0, "Player is out of bounds")
