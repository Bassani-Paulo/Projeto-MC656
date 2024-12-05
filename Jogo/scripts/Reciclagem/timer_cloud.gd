extends Timer

func update_wait_time() -> void:
	var temp: float = Global.score_rec
	wait_time = 11 - temp/5
	wait_time = clamp(wait_time, 1, 11)

func _on_timeout() -> void:
	get_parent().spawn_cloud()
	pass # Replace with function body.
