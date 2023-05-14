extends Control

onready var start_button: Button = $VBoxContainer/StartButton

func _ready():
	OS.center_window()
	start_button.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
