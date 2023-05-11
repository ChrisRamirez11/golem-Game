extends Node2D

var PauseMenu: String = "res://scenes/PauseMenu.tscn"
var paused: Object = null

func _ready() -> void:
	OS.center_window()
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	$GUI/StatusGUI/Label2.set_text(String ($GoldChest.get_child_count()))

func _process(delta):
	_on_PauseButton_pressed()
	


func _on_PauseButton_pressed():
	if Input.is_action_pressed("ui_cancel"):
		if paused == null:
			paused = load(PauseMenu).instance()
			$GUI/PauseScreen.add_child(paused)
			paused.connect("nuller", self, "on_paused_quit")
			get_tree().paused = true


func on_paused_quit():
	paused = null
