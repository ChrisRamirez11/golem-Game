extends Control

onready var retry_button: Button = $ColorRect/VBoxContainer/RetryButton

func _ready():
	retry_button.grab_focus()


func _on_RetryButton_pressed():
	get_tree().reload_current_scene()
	self.queue_free()
