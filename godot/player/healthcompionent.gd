extends Node2D

@export var health: float = 5.0
func get_damage(damage) -> void :
	if health > damage:
		health -= damage
	else:
		die()
func die() -> void:
	print("skill issue")
