class_name AttachChainToWallAttack
extends Node2D


@onready var chain_line: Line2D = $ChainLine
@onready var collision_segment: SegmentShape2D = $Chain/Chain/CollisionShape2D.shape as SegmentShape2D
@onready var chain_timer: Timer = $ChainDuration


const RAY_DISTANCE := 1000


func _ready() -> void:
	randomize()
	chain_line.add_point(global_position)
	chain_line.add_point(global_position)


func shoot_chain() -> void:
	var pos := get_chain_shoot_pos()

	chain_line.set_point_position(1, pos)
	collision_segment.b = pos

	chain_timer.start()


func get_chain_shoot_pos() -> Vector2:
	var space_state = get_world_2d().direct_space_state

	for i in range(1000): # 1000 for the max limit
		var angle := randf_range(0, 2 * PI)
		var direction := Vector2(cos(angle), sin(angle))
		var params := PhysicsRayQueryParameters2D.new()
		params.from = global_position
		params.to = global_position + direction * RAY_DISTANCE
		var results := space_state.intersect_ray(params)

		if not results.is_empty():
			return results["position"]


	return global_position


# TODO: Logic for retracting the chain
func _on_chain_duration_timeout() -> void:
	chain_line.set_point_position(1, global_position)
	collision_segment.b = global_position;
