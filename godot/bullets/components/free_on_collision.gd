class_name FreeOnCollision
extends Node


func _on_bullet_collided(bullet: Bullet, _collision: KinematicCollision2D, _previous_velocity: Vector2) -> void:
	bullet.destroy()
