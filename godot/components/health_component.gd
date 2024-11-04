class_name HealthComponent
extends Node


signal health_changed(new_health: float, prev_health: float)
signal on_death(prev_health: float)


@export var max_health: float = 10


var health: float = max_health:
	set(value):
		if value <= 0:
			on_death.emit(health)

		health = value
		health_changed.emit(value, health)


func _on_hurtbox_component_hurt(hitbox: HitboxComponent) -> void:
	health -= hitbox.damage
