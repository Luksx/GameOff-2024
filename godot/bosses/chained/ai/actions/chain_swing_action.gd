class_name ChainSwingAction
extends ActionLeaf


@export var swing_min: int = 1
@export var swing_max: int = 2
@export var min_duration: float = 0.6
@export var max_duration: float = 1.0


var chain_swing: ChainSwingAttack


func _ready() -> void:
	randomize()


func tick(actor: Node, _blackboard: Blackboard) -> int:
	if not chain_swing:
		chain_swing = actor.get_node("ChainSwing") as ChainSwingAttack

	var swing_count := randi_range(swing_min, swing_max)
	var duration := randf_range(min_duration, max_duration)

	if randi_range(0, 100) >= 50:
		chain_swing.swing_alternating(duration, 10, swing_count)
	else:
		chain_swing.swing(duration, 10, swing_count)
	return SUCCESS
