class_name HurtboxComponent
extends Area2D


signal hurt(hitbox: HitboxComponent)


func _ready() -> void:
	area_entered.connect(func(other: Area2D):
		if other is HurtboxComponent:
			hurt.emit(other))
