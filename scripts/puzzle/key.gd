extends Area2D

@export var door: Door

func _on_area_entered(_area: Area2D) -> void:
	Particles.spawn("hit", self)
	queue_free()
	door.open()
