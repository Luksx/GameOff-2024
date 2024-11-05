class_name LessThanHalfHealthCondition
extends ConditionLeaf


func tick(actor: Node, blackboard: Blackboard) -> int:
	if actor is not Boss:
		return FAILURE
	if actor.health_component.health < actor.health_component.max_health / 2:
		return SUCCESS
	return FAILURE
	
