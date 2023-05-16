extends Control

onready var timer: Timer = $TextureRect/Timer

func _ready() -> void:
	timer.start()

func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://scenes/MainMenu.tscn")
