extends CharacterBody2D

@export var speed: int = 25000

func _process(delta): 
	var input : Vector2 = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if input != Vector2(0,0):
		velocity = input * speed * delta
		print(velocity)
	else:
		velocity = Vector2(0, 0)
	move_and_slide()
