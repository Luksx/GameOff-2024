class_name BounceOnCollision
extends Node


@export var energy_loss: float = 0.1
@export var bounce_count: int = -1 # -1 if infinite bounces


var bounces: int = 0


func _ready() -> void:
	randomize()


func _on_bullet_collided(bullet: Bullet, collision: KinematicCollision2D, previous_velocity: Vector2) -> void:
	if bounces == bounce_count:
		bullet.destroy()
		return

	if previous_velocity == Vector2.ZERO:
		return

	bounces += 1
	var normal: Vector2 = collision.get_normal()
	var direction: Vector2 = previous_velocity.normalized()
	var reflected_dir: Vector2 = normal.reflect(direction)
	var length: float = previous_velocity.length()
	length *= 1.0 - energy_loss

	bullet.velocity = reflected_dir.normalized() * length
