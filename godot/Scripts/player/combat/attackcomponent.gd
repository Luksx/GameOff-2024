extends Node2D
var current_enemy : CharacterBody2D

func _physics_process(delta):
	if Input.is_action_just_pressed("melle_attack"):
		if current_enemy != null:
			current_enemy.get_damage(1)
func _on_attackhitbox_area_entered(area):
	current_enemy = area.get_parent()


func _on_attackhitbox_area_exited(area):
	current_enemy = null
