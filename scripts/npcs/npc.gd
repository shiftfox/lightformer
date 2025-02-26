extends Area2D

@export var dialog: Dialog
@onready var popup: Sprite2D = $Popup

func _process(_delta: float) -> void:
  if Input.is_action_just_pressed("interact") and popup.visible:
    DialogBox.show_dialog(dialog)

func _on_body_entered(body: Node2D):
  if body is Player:
    popup.show()

func _on_body_exited(body: Node2D) -> void:
  if body is Player:
    popup.hide()
