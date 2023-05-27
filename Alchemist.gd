extends Area2D

onready var sprite: Sprite = $Node2D/Sprite
onready var tween: Tween = $Node2D/Tween


func _on_Alchemist_area_entered(area: Area2D) -> void:
	sprite.set_visible(true)
	tween.interpolate_property(sprite, "scale", sprite.scale, Vector2(1,1), 1, 6, Tween.EASE_IN_OUT)
	tween.start()


func _on_Alchemist_area_exited(area: Area2D) -> void:
	tween.interpolate_property(sprite, "scale", sprite.scale, Vector2(0,0), 1, 6, Tween.EASE_IN_OUT)
	tween.start()
