class_name BulletSystem
extends Node


@export var max_bullets_count: int = 1024


var bullet_pool: Array[Bullet] = []
var bullets_in_use: Array[Bullet] = []


func _ready() -> void:
	bullet_pool.fill(max_bullets_count)


# Requests a bullet from the bullet pool, can return null if there are no bullets available
func _request_bullet() -> Bullet:
	if bullet_pool.is_empty():
		return null

	var bullet = bullet_pool.pop_back()
	bullets_in_use.append(bullet)
	return bullet
