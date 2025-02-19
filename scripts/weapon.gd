extends Node2D

@onready var parent = $".."
@export var fire_rate: float
@export var inaccuracy: float
@export var bullet_speed: float
@export var bullet_prefab: PackedScene
var shoot_timer: float

func _process(delta: float) -> void:
	shoot_timer += delta
	if parent.target:
		look_at(parent.target.position)
		if shoot_timer >= fire_rate:
			Particles.spawn("hit", $FirePoint)
			shoot_timer = 0
			var bullet = bullet_prefab.instantiate()
			var rot = $FirePoint.global_rotation + randf_range(-inaccuracy, inaccuracy)
			bullet.rotation = rot
			bullet.position = $FirePoint.global_position
			bullet.side = Bullet.PlayerSide.ENEMIES
			bullet.fire(bullet_speed)
			get_tree().current_scene.add_child(bullet)
