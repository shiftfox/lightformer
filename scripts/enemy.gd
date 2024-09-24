extends CharacterBody2D

@onready var health = $Health
@export var max_distance: float
@export var speed: float
@export var gravity: Vector2
@export var target: Node2D

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += gravity * delta
	var distance = position.distance_to(target.position)
	if distance > max_distance:
		var direction = position.direction_to(target.position)
		velocity = direction * speed
	move_and_slide()

func hitbox_area_entered(area: Area2D):
	if area.get_parent() is Player:
		area.get_parent().health.damage(50)
		on_health_death()

func on_health_death() -> void:
	queue_free()
