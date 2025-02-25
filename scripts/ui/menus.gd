extends Node2D

@export var target_scene: String

func play():
  Scenes.load_scene(target_scene)

func quit():
  get_tree().quit()