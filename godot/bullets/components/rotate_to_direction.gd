class_name RotateToDirection
extends Node


var bullet: Bullet
var bullet_spawned: bool = false


func _process(_delta: float) -> void:
	if bullet_spawned:
		bullet.rotation = bullet.velocity.angle()


func _on_bullet_spawned(ready_bullet: Bullet) -> void:
	bullet = ready_bullet
	bullet_spawned = true
