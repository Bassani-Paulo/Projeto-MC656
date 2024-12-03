extends Timer

var visible_rect_y
var lixo_speed

func update_wait_time(lixo: Node2D) -> void:
	visible_rect_y = get_parent().get_node("Lixo").get_viewport().get_visible_rect().size.y
	visible_rect_y -= get_parent().get_node("blue").offset.y
	lixo_speed = lixo.speed
	
	wait_time = visible_rect_y / lixo_speed
	wait_time = clamp(wait_time, 1.5, 10)
	pass

func _on_timeout() -> void:
	get_parent().spawn_lixo()
	pass # Replace with function body.
