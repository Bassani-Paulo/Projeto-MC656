# Classe da refatoração
extends Node
class_name Hazard

@export var scene_path: String
@export var background_scene: Node
@export var position: Vector2
@export var speed: float

# Construtor do objeto parâmetro
func _init(scene_path_: String, background_scene_: Node, position_: Vector2, speed_: float):
	self.scene_path = scene_path_
	self.background_scene = background_scene_
	self.position = position_
	self.speed = speed_
