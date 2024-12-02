extends Node2D

# Array of obstacle scene paths
@export var obstacle_scenes: Array = [
	"res://scenes/Abelha/Tall_Flower.tscn", 
	"res://scenes/Abelha/Medium_Flower.tscn",
	"res://scenes/Abelha/Short_Flower.tscn"
]

@export var min_spawn_interval: float = 1.0
@export var max_spawn_interval: float = 2.5


func _ready():
	spawn_obstacle()
	schedule_next_spawn()

func spawn_obstacle():
	var random_scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obstacle = load(random_scene).instantiate()

	
	obstacle.position = Vector2(2000,0)
	get_parent().add_child(obstacle)

func schedule_next_spawn():
	var adjusted_min = min_spawn_interval #/ game_speed * speed_multiplier
	var adjusted_max = max_spawn_interval #/ game_speed * speed_multiplier
	var spawn_time = randf_range(adjusted_min, adjusted_max)
	
	$Timer.wait_time = spawn_time


func _on_timer_timeout() -> void:
	spawn_obstacle()
	schedule_next_spawn()
	pass
