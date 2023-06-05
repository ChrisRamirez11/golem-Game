extends Control

onready var start_button: Button = $VBoxContainer/StartButton
onready var focus_sound: AudioStreamPlayer2D = $focus_sound
onready var timer: Timer = $Timer

func _ready():
	OS.center_window()
	start_button.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)



func _on_StartButton_pressed():
	focus_sound.play()
	timer.start(0.3)



func _on_QuitButton_pressed():
	get_tree().quit()


func _on_StartButton_focus_exited() -> void:
	focus_sound.play()


func _on_QuitButton_focus_exited() -> void:
	focus_sound.play()


func _on_Timer_timeout() -> void:
	get_tree().change_scene("res://scenes/IntroFade.tscn")
