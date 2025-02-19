extends ColorRect

@export var target_scene: String

func _on_animation_finished(_anim_name: StringName) -> void:
	Scenes.load_scene(target_scene)
