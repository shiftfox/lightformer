extends CanvasLayer

@onready var animation = $Animation

func set_scene(packed: PackedScene) -> void:
	animation.play("slide")
	await animation.animation_finished
	get_tree().change_scene_to_packed.call_deferred(packed)
	animation.play_backwards("slide")

func load_scene(path: String) -> void:
	set_scene(load("res://scenes/%s.tscn" % path))

func refresh() -> void:
	animation.play("slide")
	await animation.animation_finished
	get_tree().reload_current_scene.call_deferred()
	animation.play_backwards("slide")
