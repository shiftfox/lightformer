class_name Player extends CharacterBody2D

@onready var health = $Health
@export var speed: float
@export var lerp_speed: float
@export var jump_force: float
@export var jump_time: float
@export var coyote_time: float
@export var glide_gravity_multiplier: float
var coyote_timer: float
var jump_timer: float
var jumping: bool
var gravity: Vector2

func can_jump() -> bool:
	return coyote_timer < coyote_time or is_on_floor()

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += gravity * delta
		coyote_timer += delta
		if Input.is_action_pressed("glide") and !jumping:
			gravity = get_gravity() * glide_gravity_multiplier
		else:
			gravity = get_gravity()
	else:
		jumping = false
		jump_timer = 0
		coyote_timer = 0
	
	if Input.is_action_just_pressed("jump") and can_jump():
		jumping = true
	if Input.is_action_pressed("jump") and jumping and jump_timer < jump_time:
		jump_timer += delta
		velocity.y = -jump_force
	if velocity.y >= 0:
		jumping = false
	
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = lerp(velocity.x, 0.0, lerp_speed * delta)
	
	move_and_slide()

func on_health_death() -> void:
	queue_free()
	Scenes.refresh()
	Particles.spawn("death", self)
