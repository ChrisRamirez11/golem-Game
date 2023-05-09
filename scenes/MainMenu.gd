extends Control

func _ready():
	OS.center_window()


func _on_StartButton_pressed():
	get_tree().change_scene("res://scenes/Main.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()
