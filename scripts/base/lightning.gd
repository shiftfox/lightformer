extends Timer

@onready var color_rect: ColorRect = $"../Camera/ColorRect"
@onready var modulate: CanvasModulate = $"../CanvasModulate"
@onready var default_rect = color_rect.color
@onready var default_modulate = modulate.color
@export var min_range: float
@export var max_range: float

func _ready():
	wait_time = randf_range(min_range, max_range)
	start()

func _on_timeout():
	color_rect.color = Color.WHITE
	modulate.color = Color.WHITE
	await get_tree().create_timer(0.1).timeout
	color_rect.color = default_rect
	modulate.color = default_modulate
	_ready()
