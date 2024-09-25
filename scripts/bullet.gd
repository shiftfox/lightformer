class_name Bullet extends RigidBody2D

enum PlayerSide {
	ENEMIES,
	PLAYER
}

@export var damage: float
@export var side: PlayerSide

func fire(speed):
	apply_impulse(Vector2(speed, 0).rotated(rotation))

func hitbox_area_entered(area: Area2D) -> void:
	if (area.get_parent() is Player and side == PlayerSide.ENEMIES) or\
		(area.get_parent() is Enemy and side == PlayerSide.PLAYER):
		area.get_parent().health.damage(damage)

func hitbox_body_entered(_body: Node2D) -> void:
	queue_free()
