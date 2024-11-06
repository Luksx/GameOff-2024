class_name Player
extends CharacterBody2D


@export var speed: int = 1000
@export var dash_speed: int = 5000


@onready var sword_hitbox: HitboxComponent = $SwordHitbox
@onready var sword_animator: AnimationPlayer = $SwordAnimator
@onready var sword_cooldown: Timer = $SwordCooldown
@onready var dash_cooldown: Timer = $DashCooldown
@onready var hurtbox: HurtboxComponent = $HurtboxComponent


var on_cooldown := false
var can_dash := false


func _ready() -> void:
	dash_cooldown.start(2)

func _process(_delta: float) -> void:
	var input : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input != Vector2(0,0):
		velocity = input * speed 
	else:
		velocity = Vector2(0, 0)
	move_and_slide()


func _input(event: InputEvent) -> void:
	if event.is_action("attack"):
		_swing_sword()
	if event.is_action("dash"):
		dash()

func _swing_sword() -> void:
	if on_cooldown:
		return

	var direction: Vector2 = get_direction()

	sword_hitbox.rotation = direction.angle()
	sword_animator.play("swing")
	sword_cooldown.start()
	on_cooldown = true


func _on_sword_cooldown_timeout() -> void:
	on_cooldown = false


func dash():
	if can_dash:
		dash_cooldown.start()
		hurtbox.monitoring = false
		can_dash = false
		
		var direction: Vector2 = get_direction()
		velocity = direction * dash_speed


func _on_dash_cooldown_timeout() -> void:
	can_dash = true
	hurtbox.monitoring = true
	velocity = Vector2(0,0)


func get_direction() -> Vector2:
	var direction: Vector2 = velocity.normalized()

	if direction == Vector2.ZERO:
		direction = Vector2.RIGHT
	
	return direction
	
