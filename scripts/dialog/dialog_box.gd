class_name DialogBox extends ColorRect

static var instance = self

@onready var text: Label = $Text
@export var char_time: float
@export var time_between: float
var char_timer: float

var dialog: Dialog
var character: int

func _ready():
	char_time = char_time / 1000
	instance = self

func _process(delta: float) -> void:
	if not dialog: return
	char_timer += delta
	if char_timer >= char_time and character <= dialog.text.length():
		character += 1
		char_timer = 0
		if character >= dialog.text.length():
			wait_until(dialog)
			return
		text.text = dialog.text.substr(0, character + 1)

func wait_until(source: Dialog):
	await get_tree().create_timer(time_between).timeout
	if source.next:
		run(source.next)
	else:
		hide()

func run(new: Dialog) -> void:
	dialog = new
	character = 0
	char_timer = 0
	text.text = ""
	show()

static func show_dialog(new: Dialog) -> void:
	instance.run(new)
