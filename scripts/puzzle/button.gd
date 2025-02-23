extends Area2D

@onready var sprite = $Sprite
@export var toggle: bool
@export var should_enable_target: bool
@export var target: Node2D
var active: bool

func _ready():
	if should_enable_target: disable_target()
	else: enable_target()

func enable_target():
	if is_instance_valid(target):
		target.show()
		target.process_mode = Node.PROCESS_MODE_INHERIT

func disable_target():
	if is_instance_valid(target):
		target.hide()
		target.process_mode = Node.PROCESS_MODE_DISABLED

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		if toggle: _on_toggle_button()
		else: _on_press_button()

func _on_body_exited(body: Node2D) -> void:
	if body is Player and not toggle:
		_on_step_off()

func _on_toggle_button():
	active = !active
	if active:
		if should_enable_target: enable_target()
		else: disable_target()
		sprite.frame = 1
	else:
		if should_enable_target: disable_target()
		else: enable_target()
		sprite.frame = 0

func _on_press_button():
	sprite.frame = 1
	if should_enable_target: enable_target()
	else: disable_target()

func _on_step_off():
	sprite.frame = 0
	if should_enable_target: disable_target()
	else: enable_target()
