extends Node2D

var PauseMenu: String = "res://scenes/PauseMenu.tscn"
var paused: Object = null


func _ready() -> void:
	OS.center_window()

func _process(delta):
	if Input.is_mouse_button_pressed(BUTTON_LEFT):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	


func _on_PauseButton_pressed():
	if paused == null:
		paused = load(PauseMenu).instance()
		$GUI/PauseScreen.add_child(paused)
		paused.connect("nuller", self, "on_paused_quit")
		get_tree().paused = true

func on_paused_quit():
	paused = null
