extends Node2D

# Array of obstacle scene paths
@export var obstacle_scenes: Array = [
	"res://scenes/Abelha/Tall_Flower.tscn", 
	"res://scenes/Abelha/Medium_Flower.tscn",
	"res://scenes/Abelha/Short_Flower.tscn",
	"res://scenes/Abelha/Spider_Web.tscn"
]

@export var min_spawn_interval: float = 1.0
@export var max_spawn_interval: float = 2.5

var speed_state = 1
var speed_to_modifier = {0:0.75, 1:1, 2:1.25, 3:1.5}


func _ready():
	spawn_obstacle()
	schedule_next_spawn()

func spawn_obstacle():
	var random_scene = obstacle_scenes[randi() % obstacle_scenes.size()]
	var obstacle = load(random_scene).instantiate()
	obstacle.speed_modifier = speed_to_modifier[speed_state]

	
	obstacle.position = Vector2(2000,0)
	get_parent().add_child(obstacle)

func schedule_next_spawn():
	var adjusted_min = min_spawn_interval / speed_to_modifier[speed_state]
	var adjusted_max = max_spawn_interval / speed_to_modifier[speed_state]
	var spawn_time = randf_range(adjusted_min, adjusted_max)
	
	$Timer.wait_time = spawn_time


func _on_timer_timeout() -> void:
	spawn_obstacle()
	schedule_next_spawn()
	pass


func _on_jogo_game_state_changed(new_speed: Variant) -> void:
	speed_state = new_speed
	pass
