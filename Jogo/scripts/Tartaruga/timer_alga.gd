extends Timer

var visible_rect_y
var alga_speed
var total_time

var is_valido

func update_wait_time(alga: Node2D) -> void:
	visible_rect_y = get_parent().get_node("Player").get_viewport().get_visible_rect().size.y
	alga_speed = alga.speed
	
	#Teste Análise de valor limite da taxa de spawn da alga:
	if(wait_time < 0.5):
		is_valido = false
	elif(wait_time > 64):
		is_valido = false
	elif((wait_time <= 64 and wait_time >= 0.5)):
		is_valido = true
	
	total_time = visible_rect_y / alga_speed # Time taken for an alga to fall across the whole screen
	wait_time = 1.5 * total_time / Global.spawn_rate_alga # Time to be waited until the next alga is spawned
	wait_time = clamp(wait_time, 0.5, 64) # The sweet spot
	pass

func _on_timeout() -> void:
	get_parent().spawn_alga()
	pass
