extends CharacterBody2D
@onready var atttimer = $Timer

func _ready():
	rotation = randi_range(0, 360)
	atttimer.start(2)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$".".rotate(0.05)


func _on_timer_timeout():
	queue_free()
