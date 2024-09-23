extends Node2D

@export var bullet_prefab: PackedScene
@export var fire_rate: float
var shoot_timer: float

func _ready() -> void:
	shoot_timer = fire_rate

func _process(delta: float) -> void:
	look_at(get_global_mouse_position())
	shoot_timer += delta
	if Input.is_action_pressed("shoot") and shoot_timer >= fire_rate:
		var bullet = bullet_prefab.instantiate()
		bullet.position = $FirePoint.global_position
		get_tree().current_scene.add_child(bullet)
		shoot_timer = 0
