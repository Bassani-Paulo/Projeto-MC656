extends GutTest

var jogo
var player

func before_each():
	
	jogo = load("res://scenes/Abelha/Jogo.tscn").instantiate()
	player = jogo.get_node("Player")
	
	add_child(jogo)

func test_move():
	if get_viewport().get_visible_rect().size != Vector2.ZERO:  #verifica se exite um display. relevante caso seja feito num servidor sem display, não funciona
		Input.warp_mouse(Vector2(409, 386))
		await wait_seconds(0.2)
		assert_eq(int(player.position.y), 386, "Player not following mouse")
	else:
		assert_true(true)

func test_out_of_bounds():
	if get_viewport().get_visible_rect().size != Vector2.ZERO:  #verifica se exite um display. relevante caso seja feito num servidor sem display, não funciona
		Input.warp_mouse(Vector2(742, -231))
		await wait_seconds(0.2)
		assert_gte(int(player.position.x), 0, "Player is out of bounds")
	else:
		assert_true(true)
