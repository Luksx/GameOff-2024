class_name Bullet
extends Object


var position: Vector2
var velocity: Vector2
var acceleration: Vector2
var bullet_type: BulletType


func update() -> void:
	position += velocity
	velocity += acceleration
