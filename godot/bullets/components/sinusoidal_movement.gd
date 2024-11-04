class_name SinusoidalMovement
extends Node

@export var oscillation_speed: float = 100
@export var amplitude: float = 10.0
@export var frequency: float = 1.0

var bullet: Bullet
var bullet_spawned: bool = false
var angle := 0.0

func _physics_process(delta: float) -> void:
	if not bullet_spawned:
		return

	# Increment the angle over time
	angle += oscillation_speed * delta

	var y_velocity = sin(angle * frequency) * amplitude

	bullet.velocity = Vector2(bullet.speed, y_velocity)
	var a = 10

	if angle >= 360:
		angle = 0


func _on_bullet_spawned(ready_bullet: Bullet) -> void:
	bullet = ready_bullet
	bullet_spawned = true
