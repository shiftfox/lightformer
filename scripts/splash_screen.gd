extends ColorRect

@export var target_scene: String

func _process(_delta: float) -> void:
	if Input.is_key_pressed(KEY_ENTER):
		get_tree().change_scene_to_file("res://scenes/%s.tscn" % target_scene)

func _on_animation_finished(_anim_name: StringName) -> void:
	Scenes.load_scene(target_scene)
