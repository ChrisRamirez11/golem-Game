extends Control

var color:=Color(0,0,0,0)
var default_color:=Color.black

onready var timer: Timer = $Timer
onready var tween: Tween = $CanvasLayer/Tween
onready var fade_screen: Sprite = $CanvasLayer/FadeScreen
onready var story_tell: Sprite = $CanvasLayer/StoryTell


func _ready() -> void:
	OS.center_window()
	timer.start(8)
	tween.interpolate_property(fade_screen, "modulate", 
		default_color, color, 3,
		Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()


func _on_Timer_timeout() -> void:
	queue_free()


func _on_Tween_tween_all_completed() -> void:
	tween.interpolate_property(story_tell, "modulate", story_tell.modulate, color, 4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()
	yield(tween, "tween_all_completed")
	get_tree().change_scene("res://scenes/Level3.tscn")
