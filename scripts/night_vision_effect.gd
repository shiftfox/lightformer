extends Effect

@onready var canvas_modulate: CanvasModulate = get_tree().current_scene.get_node("CanvasModulate")
var default: Color
var time = 0.5

func _on_applied():
	default = canvas_modulate.color
	canvas_modulate.color = Color.WHITE

func _on_removed():
	canvas_modulate.color = default
