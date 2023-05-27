extends Control

onready var timer: Timer = $Timer
onready var sprite: Sprite = $CanvasLayer/Sprite
onready var tween: Tween = $CanvasLayer/Sprite/Tween

var default_color = Color.black
var color = Color(0,0,0,0)

func _ready() -> void:
	timer()
	tween.interpolate_property(sprite, "modulate", default_color, color,  2,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()
	OS.center_window()


func timer():
	timer.start(5)


func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_Tween_tween_all_completed() -> void:
	tween.interpolate_property(sprite, "modulate", color, default_color,  3,2, Tween.EASE_IN_OUT)
	tween.start()
