class_name Light extends Area2D

@export var speed: float
@export var kill_speed: float

func _ready():
	var scene = get_tree().current_scene
	if "kill_speed" in scene:
		kill_speed = scene.kill_speed

func _process(delta: float) -> void:
	position = lerp(position, get_global_mouse_position(), speed * delta)
	scale -= Vector2.ONE * kill_speed * delta
	if scale.x <= 0:
		Particles.spawn("death", self)
		queue_free()
