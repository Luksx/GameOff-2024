class_name Boss
extends CharacterBody2D


@onready var health_component: HealthComponent = $HealthComponent


func _ready() -> void:
	BossManager.instance.register_boss(self)


func kill() -> void:
	BossManager.instance.remove_boss(self)
	queue_free()
