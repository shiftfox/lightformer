class_name Health extends Node2D

signal damaged(amount: float)
signal death()

@export var health: float
@export var health_bar: Slider

func _ready():
	if health_bar:
		health_bar.max_value = health
		health_bar.value = health

func damage(amount: float) -> void:
	health -= amount
	if health_bar: health_bar.value = health
	if health <= 0:
		death.emit()
		return
	damaged.emit(amount)
	
