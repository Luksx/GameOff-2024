class_name SpriteHelpers
extends RefCounted


static func get_sprite_size(sprite: Sprite2D) -> Vector2:
	var tex_size: Vector2 = sprite.texture.get_size()
	return tex_size * sprite.scale
