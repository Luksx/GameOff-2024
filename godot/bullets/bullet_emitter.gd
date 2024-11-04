class_name BulletEmitter
extends Node2D


@export var bullet_type: PackedScene
@export_range(0, 360) var spread: float = 0.1
@export var amount: int = 1
@export var delay_between: float = 0.0
@export var min_speed: float = 750
@export var max_speed: float = 750


func _ready() -> void:
	randomize()
	emit_bullets()


func emit_bullets() -> void:
	var facing_dir := Vector2(cos(rotation), sin(rotation))

	for i in range(amount):
		var bullet = bullet_type.instantiate() as Bullet
		if bullet == null:
			print("Bullet type not set or is invalid.")
			return

		get_parent().add_child.call_deferred(bullet)

		var angle_variation = randf_range(-deg_to_rad(spread) / 2, deg_to_rad(spread) / 2)
		var direction = facing_dir.rotated(angle_variation)

		var speed = randf_range(min_speed, max_speed)

		bullet.position = global_position
		bullet.velocity = direction * speed

		if delay_between > 0 and i < amount - 1:
			await get_tree().create_timer(delay_between).timeout
