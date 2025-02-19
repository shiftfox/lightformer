class_name Door extends Area2D

@export var target_scene: String
@onready var sprite = $Sprite
var opened = false

func open():
	opened = true
	sprite.hframes += 1

func _on_body_entered(body: Node2D) -> void:
	if body is Player and opened:
		Scenes.load_scene(target_scene)
