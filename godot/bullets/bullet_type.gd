class_name BulletType
extends Node2D


@export var collider: CollisionShape2D
@export var texture: Texture2D


var bullet_extensions: Array[BulletExtension] = []


func _ready() -> void:
	for child: Node in get_children():
		if child is BulletExtension:
			bullet_extensions.append(child)
