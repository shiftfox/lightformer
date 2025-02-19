class_name Light extends Area2D

@export var speed: float
@export var kill_speed: float
@export var bullet_prefab: PackedScene
@export var bullet_speed: float
@export var bullet_count: int
@export var min_scale: float
@export var radius: float
var target_scale: Vector2
var max_scale: Vector2

func _ready() -> void:
	target_scale = scale
	max_scale = scale

func _process(delta: float) -> void:
	position = lerp(position, get_global_mouse_position(), speed * delta)
	scale = lerp(scale, target_scale, kill_speed * delta)
	if scale.x <= min_scale: queue_free()
	if Input.is_action_just_pressed("destroy_light"):
		var angle_step = TAU / bullet_count
		for i in range(bullet_count):
			var angle = i * angle_step
			var pos = position + Vector2(cos(angle), sin(angle)) * radius
			var bullet = bullet_prefab.instantiate()
			bullet.position = pos
			bullet.rotation = angle
			call_deferred("add_sibling", bullet)
			bullet.fire(bullet_speed)
		target_scale = scale - Vector2.ONE * 0.25
