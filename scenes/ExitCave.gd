extends StaticBody2D

onready var animated_sprite: AnimatedSprite = $AnimatedSprite
onready var collision_polygon_2d: CollisionPolygon2D = $CollisionPolygon2D



func _on_Player_monolith_activation() -> void:
	animated_sprite.play("opening")
	collision_polygon_2d.queue_free()
