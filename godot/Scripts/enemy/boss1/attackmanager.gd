extends Node
var attack1 = preload("res://Scenes/entities/attacks/attack1.1.tscn")
@onready var timer = $"../attacktimer"

func _ready():
	starttimer()
func starttimer():
	timer.start(3)


func _on_attacktimer_timeout():
	get_attack()
#	for i in get_children():
#		i.queue_free()
func get_attack():
	var currentattack = randi_range(1,1)
	print(currentattack)
	if currentattack == 0:
		chain_hook()
	if currentattack == 1:
		chain_rotate()
func chain_hook():
	starttimer()
func chain_rotate():
	var ch = attack1.instantiate()
	add_child(ch)
	starttimer()
