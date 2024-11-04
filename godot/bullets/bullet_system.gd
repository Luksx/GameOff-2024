class_name BulletSystem
extends Node


static var instance: BulletSystem # Singleton


@export var max_bullets_count: int = 1024


var bullet_pool: Array[Bullet] = []
var bullets_in_use: Array[Bullet] = []


func _enter_tree() -> void:
	instance = self


func _ready() -> void:
	bullet_pool.fill(max_bullets_count)


func _physics_process(delta: float) -> void:
	for bullet: Bullet in bullets_in_use:
		bullet.physics_update(delta)


func _process(delta: float) -> void:
	for bullet: Bullet in bullets_in_use:
		bullet.update(delta)


func create_bullets(bullet_type: BulletType, positions: Array[Vector2], velocities: Array[Vector2], accelerations: Array[Vector2], count: int) -> Array[Bullet]:
	var bullets: Array[Bullet] = []
	for i: int in range(count):
		if i >= positions.size() or i >= velocities.size() or i >= accelerations.size():
			printerr("positions/accelerations/velocities array was too small!")
			return bullets

		var position: Vector2 = positions[i]
		var velocity: Vector2 = velocities[i]
		var acceleration: Vector2 = accelerations[i]

		var bullet = create_bullet(bullet_type, position, velocity, acceleration)

		if bullet == null:
			return bullets

		bullets.append(bullet)

	return bullets


func create_bullet(bullet_type: BulletType, position: Vector2, velocity: Vector2, acceleration: Vector2) -> Bullet:
	var bullet: Bullet = _request_bullet()

	if bullet == null:
		printerr("Max bullet count reached, could not create bullet!")
		return null

	bullet.bullet_type = bullet_type
	bullet.position = position
	bullet.velocity = velocity
	bullet.acceleration = acceleration

	_init_area(bullet)

	return bullet


# Requests a bullet from the bullet pool, can return null if there are no bullets available
func _request_bullet() -> Bullet:
	if bullet_pool.is_empty():
		return null

	var bullet = bullet_pool.pop_back()
	bullets_in_use.append(bullet)
	return bullet


func _init_area(bullet: Bullet) -> void:
	var rid: RID = PhysicsServer2D.area_create()

	var shape_rid: RID = PhysicsServer2D.circle_shape_create()
	PhysicsServer2D.shape_set_data(shape_rid, {"radius": bullet.bullet_type.collider.radius})

	PhysicsServer2D.area_set_shape(rid, 0, shape_rid)
	PhysicsServer2D.area_set_collision_layer(rid, 4)

	var transform = Transform2D()
	transform.origin = bullet.position
	PhysicsServer2D.area_set_shape_transform(rid, 0, transform)
	PhysicsServer2D.area_set_monitorable(rid, true)
