extends Control

onready var retry_button: Button = $ColorRect/VBoxContainer/RetryButton

func _ready():
	retry_button.grab_focus()


func _on_RetryButton_pressed():
	get_tree().change_scene("res://scenes/MainJerry.tscn")
	self.queue_free()
