extends Camera2D

@export var target: Node2D
@export var t_offset: Vector2

func _process(_delta: float) -> void:
	if is_instance_valid(target):
		position = target.position + t_offset
