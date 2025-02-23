extends Area2D

@export var duration: int
@export var effect_prefab: PackedScene

func _on_body_entered(body: Node2D) -> void:
	if body is not Player:
		return
	var effect = effect_prefab.instantiate()
	var player = body as Player
	player.apply_effect(effect, duration)
	Particles.spawn("collect", self)
	queue_free()
