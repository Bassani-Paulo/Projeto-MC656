extends Timer

var visible_rect_y
var canudo_speed
var total_time

func update_wait_time(canudo: Node2D) -> void:
	visible_rect_y = get_parent().get_node("Player").get_viewport().get_visible_rect().size.y
	canudo_speed = canudo.speed
	
	#Teste Análise de valor limite da taxa de spawn do canudo:
	if(wait_time < 0.2):
		assert(false, "Tempo fora dos limites")
	elif(wait_time > 9 ):
		assert(false, "Tempo fora dos limites")
	elif((wait_time <= 9 and wait_time >= 0.2)):
		assert(true, "Tempo válido")
	
	total_time = visible_rect_y / canudo_speed # Time taken for a canudo to fall across the whole screen
	wait_time = 1 * total_time / Global.spawn_rate # Time to be waited until the next canudo is spawned
	wait_time = clamp(wait_time, 0.2, 5) # The sweet spot
	pass

func _on_timeout() -> void:
	get_parent().spawn_canudo()
	pass
