class_name Player
extends CharacterBody2D

@export var speed: int = 25000


@onready var sword_hitbox: HitboxComponent = $SwordHitbox
@onready var sword_animator: AnimationPlayer = $SwordAnimator
@onready var sword_cooldown: Timer = $SwordCooldown


var on_cooldown := false


func _process(delta):
	var input : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input != Vector2(0,0):
		velocity = input * speed * delta
#		print(velocity)
	else:
		velocity = Vector2(0, 0)
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action("attack"):
		_swing_sword()


func _swing_sword() -> void:
	if on_cooldown:
		return

	var direction: Vector2 = velocity.normalized()

	if direction == Vector2.ZERO:
		direction = Vector2.RIGHT

	sword_hitbox.rotation = direction.angle()
	sword_animator.play("swing")
	sword_cooldown.start()
	on_cooldown = true


func _on_sword_cooldown_timeout() -> void:
	on_cooldown = false
