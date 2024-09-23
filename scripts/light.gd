extends Area2D

@export var speed: float
@export var kill_speed: float
var target: Vector2

func _ready() -> void:
	target = get_global_mouse_position()

func _process(delta: float) -> void:
	position = lerp(position, target, speed * delta)
	scale -= Vector2.ONE * kill_speed * delta
	if scale.x <= 0: queue_free()
