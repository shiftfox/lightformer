extends Camera2D

@export var target: Node2D
@export var t_offset: Vector2

func _process(delta: float) -> void:
	position = target.position + t_offset
