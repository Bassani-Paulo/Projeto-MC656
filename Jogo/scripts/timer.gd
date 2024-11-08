extends Timer

var visible_rect_y
var canudo_speed
var total_time

func update_wait_time(canudo: Node2D) -> void:
	visible_rect_y = get_parent().get_node("Player").get_viewport().get_visible_rect().size.y
	canudo_speed = canudo.speed
	
	total_time = visible_rect_y / canudo_speed # Time taken for a canudo to fall across the whole screen
	wait_time = 1.5 * total_time / Global.spawn_rate # Time to be waited until the next canudo is spawned
	wait_time = clamp(wait_time, 0.2, 9) # The sweet spot
	pass

func _on_timeout() -> void:
	get_parent().spawn_canudo()
	pass
