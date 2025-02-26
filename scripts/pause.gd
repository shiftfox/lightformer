extends Control

@onready var menu: Control = $Menu
@onready var animation: AnimationPlayer = $Animation

func _process(_delta: float) -> void:
  if Input.is_action_just_pressed("pause"):
    toggle_pause()

func toggle_pause():
  get_tree().paused = !get_tree().paused
  if get_tree().paused:
    animation.play("scale")
  else:
    animation.play_backwards("scale")

func restart():
  Scenes.refresh()
  toggle_pause()

func quit():
  Scenes.load_scene("menus")
  toggle_pause()