class_name ChainSwingAttack
extends Node2D

const LINK: PackedScene = preload("res://bosses/chained/attacks/chain_swing/chain_link.tscn")

func _ready() -> void:
	swing(1, 10)

func _spawn_links(link_count: int) -> void:
	for child in get_children():
		child.queue_free()

	var link_size: Vector2 = Vector2.ZERO
	for i in range(link_count):
		var link = LINK.instantiate()

		if link_size == Vector2.ZERO:
			link_size = SpriteHelpers.get_sprite_size(link.get_node("Sprite2D"))

		var target_pos := Vector2(link_size.x * i, 0)
		link.global_position = target_pos
		add_child(link)


func swing(swing_duration: float, link_count: int) -> void:
	_spawn_links(link_count)

	var tween := get_tree().create_tween().set_ease(Tween.EASE_IN_OUT).set_trans(Tween.TRANS_QUAD)
	tween.tween_property(self, "rotation", 2 * PI, swing_duration)
	await tween.finished

	for child in get_children():
		child.queue_free()
