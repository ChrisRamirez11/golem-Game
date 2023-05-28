extends Area2D

onready var sprite: Sprite = $Node2D/Sprite
onready var tween: Tween = $Node2D/Tween
onready var deafult_sprite_scale = Vector2(0,0)
onready var initial_comment: Sprite = $Node2D/InitialComment
#scene_tree references
onready var player: KinematicBody2D = $"../Player"

onready var timer := Timer.new()

var sprite_scale = Vector2(0,0)


func _ready() -> void:
	player.set_physics_process(false)
	tween.interpolate_property(initial_comment, "scale", sprite_scale, Vector2(1,1), 1, Tween.TRANS_LINEAR, Tween.EASE_OUT)
	tween.start()
	yield(tween, "tween_all_completed")
	self.add_child(timer)
	timer.set_one_shot(true)
	timer.start(2)
	yield(timer, "timeout")
	tween.interpolate_property(initial_comment, "scale", Vector2(1,1), sprite_scale, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_all_completed")
	initial_comment.queue_free()
	player.set_physics_process(true)

func _on_Alchemist_area_entered(area: Area2D) -> void:
	sprite.set_visible(true)
	tween.interpolate_property(sprite, "scale", sprite_scale, Vector2(1,1), 1, 6, Tween.EASE_IN_OUT)
	tween.start()


func _on_Alchemist_area_exited(area: Area2D) -> void:
	tween.interpolate_property(sprite, "scale", Vector2(1,1), deafult_sprite_scale, 1, 6, Tween.EASE_IN)
	tween.start()
	yield(tween, "tween_all_completed")
	sprite.set_visible(false)
