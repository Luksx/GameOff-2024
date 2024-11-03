extends CharacterBody2D
@onready var hplabel = $hplabel

@export var hp: int = 5
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	hplabel.text = str(hp)
func get_damage(damage):
	hp -= damage
