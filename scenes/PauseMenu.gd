extends Control

signal nuller

onready var continue_b: Button = $ColorRect/VBoxContainer/Continue
onready var focus: AudioStreamPlayer2D = $focus


func _ready() -> void:
	continue_b.grab_focus()


func _on_Continue_pressed():
	get_tree().paused = false
	emit_signal("nuller")
	self.queue_free()


func _on_Quit_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")


func _on_Continue_focus_entered() -> void:
	focus.play()


func _on_Quit_focus_entered() -> void:
	focus.play()

