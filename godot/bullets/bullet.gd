class_name Bullet
extends RefCounted


var position: Vector2
var velocity: Vector2
var acceleration: Vector2
var bullet_type: BulletType


func ready() -> void:
	for extension: BulletExtension in bullet_type.bullet_extensions:
		extension.on_ready(self)


func hit(other: Node2D) -> void:
	for extension: BulletExtension in bullet_type.bullet_extensions:
		extension.on_hit(self, other)


func on_collide(other: Node2D) -> void:
	for extension: BulletExtension in bullet_type.bullet_extensions:
		extension.on_hit(self, other)


func update(delta: float) -> void:
	for extension in bullet_type.bullet_extensions:
		extension.on_update(self, delta)


func physics_update(delta: float) -> void:
	position += velocity * delta
	velocity += acceleration * delta

	for extension in bullet_type.bullet_extensions:
		extension.on_physics_update(self, delta)
