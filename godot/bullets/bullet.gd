class_name Bullet
extends CharacterBody2D


signal collided(bullet: Bullet, collision: KinematicCollision2D, previous_velocity: Vector2)


@export var speed: float = 10


var direction: Vector2:
	get():
		if velocity == Vector2.ZERO:
			return Vector2.RIGHT
		return velocity.normalized()
	set(value):
		var length: float = velocity.length()
		if length == 0:
			velocity = value
		else:
			velocity = length * value


func _ready() -> void:
	velocity = speed * direction


func _physics_process(_delta: float) -> void:
	var previous_velocity: Vector2 = velocity
	move_and_slide()

	if get_slide_collision_count() > 0:
		collided.emit(self, get_last_slide_collision(), previous_velocity)


func destroy() -> void:
	queue_free()
