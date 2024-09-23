class_name Health extends Node2D

signal damaged(amount: float)
signal death()

@export var health: float
@export var health_bar: Slider

func damage(amount: float) -> void:
	health -= amount
	if health <= 0:
		return death.emit()
	damaged.emit(amount)
	
