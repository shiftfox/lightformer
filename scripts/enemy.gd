class_name Enemy extends CharacterBody2D

@onready var health = $Health
@export var max_distance: float
@export var speed: float
@export var gravity: Vector2
@export var target: Node2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += gravity * delta
	if target:
		var distance = position.distance_to(target.position)
		if distance > max_distance:
			var direction = position.direction_to(target.position)
			if !gravity: velocity = direction * speed
			else: velocity.x = direction.x * speed
		else:
			if !gravity: velocity = Vector2.ZERO
			else: velocity.x = 0
	else:
		if !gravity: velocity = Vector2.ZERO
		else: velocity.x = 0
	move_and_slide()

func hitbox_area_entered(area: Area2D):
	if area.get_parent() is Player:
		area.get_parent().health.damage(50)
		on_health_death()

func on_health_death() -> void:
	queue_free()

func on_detection_radius_entered(area: Area2D) -> void:
	if area.get_parent() is Player:
		target = area.get_parent()

func on_detection_radius_exited(area: Area2D) -> void:
	if area.get_parent() is Player:
		target = null
