extends CharacterBody2D

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
