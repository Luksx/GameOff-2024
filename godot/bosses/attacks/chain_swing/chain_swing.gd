class_name ChainSwingAttack
extends Node2D


@export var link_count: int = 10


const LINK: PackedScene = preload("res://bosses/attacks/chain_swing/chain_link.tscn")


func spawn_links() -> void:
	pass


func swing(speed: int) -> void:
	pass
	
